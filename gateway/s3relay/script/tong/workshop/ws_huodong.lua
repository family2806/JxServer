Include("\\script\\tong\\workshop\\workshop_head.lua")

HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};

TK_GUANGHUAN = 2349;--记录玩家帮会光环的编号
TK_SHIJIAN = 2350;--记录玩家帮会光环的有效时间
TK_ISCANCEL = 1757;--记录是否已经取消了光环

aLevelCoef = {}
aLevelLingPaiPrice = {}
aLevelDiziCoef = {}
aLevelDiziDouble = {}
aLevelNianshouCoef = {}
aLevelNianshouDouble = {}
aLevelAuraPrice = {}

SEC_OF_DAY = 86400;


function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\huodong_level_data.txt", "huodongLevelData")
	if b1~=1 then
		print("加载活动作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("huodongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("huodongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "OUTPUT_COEF"))
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "LINGPAI_PRICE"))
		aLevelDiziCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_DZLIM"))
		aLevelDiziDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_DZDOU"))
		aLevelNianshouCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_NSLIM"))
		aLevelNianshouDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_NSDOU"))
		aLevelAuraPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_AURA"))
	end
	--TabFile_UnLoad("huodongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------

function ws_main(nTongID, nWorkshopID)
	-- TODO: liaozhishan 
	-- 11/7 此处流程需要修改，现在Relay只能处理CallBoss令牌，导致活动报名会产生扣建设基金的异常现象。需要改为能处理多种情况。
	if SVR_CheckUse(nTongID, nWorkshopID, "活动坊总管") ~= 1 then
		return 0
	end
	local aryszContent = {
		"帮会特产/#use_g_4_ok("..nTongID..","..nWorkshopID..")", 
		"招募弟子活动/#use_g_2_ok("..nTongID..","..nWorkshopID..")", 
		"帮会打年兽活动/#use_g_3_ok("..nTongID..","..nWorkshopID..")", 
			--"帮会收集物品活动/#use_g_5_ok("..nTongID..","..nWorkshopID..")", 	
			};
			
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "领令牌叫Boss/#use_g_1_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "不需要/cancel");
	
	Say("<#>活动坊总管：我负责所有帮会的总活动，振奋帮内客气和精神，大家一起参加活动吧!",
		getn(aryszContent),
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化可领取任务数
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLinPaiLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLinPaiLeft < 100) then
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		return 0
	end
	if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) == 1) then
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
		return 1
	end
	return 0	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>活动坊总管：Boss召唤符需帮会建设等级到<color=red>2<color>级才能生产出来，现在还是先安心发展帮会吧！", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>活动坊总管：你没有作坊管理权限，不能领取Boss召唤符！", 0)
		return
	end
	_dbgMsg("剩余领取次数*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>活动坊总管：今天的Boss召唤符已分发完毕，请明天再来吧！", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>活动坊总管：你需要花费<color=water>"..aLevelLingPaiPrice[nLevel].."<color>万帮会建设基金获得一个Boss召唤符，确定吗？", 2,
		"换取/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "取消/cancel")
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>活动坊总管：对不起，帮会建设基金不足，不能领取！", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function use_g_2_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 2)
end

function use_g_3_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 3)
end

function use_g_4_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 4)
end

function use_g_5_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 5)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." 消耗了"..aLevelLingPaiPrice[nLevel].."万帮会建设基金，换取一个"..nLevel.."级Boss召唤符！"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	elseif (nUse == 2)then	
		Sel_ZhaoDizhi(nTongID, nWorkshopID)	--招募弟子
	elseif (nUse == 3)then
		Sel_DaNianShou(nTongID, nWorkshopID)	--打年兽
	elseif (nUse == 4)then
		Sel_techan(nTongID, nWorkshopID)		--特产
	elseif (nUse == 5) then
		Sel_shoujiwupin(nTongID, nWorkshopID);	--收集物品
	end	
end

function cancel()
end

--光环的表
tc_detail = {[5] = {"苍蝇光环", "活动坊总管：想体验被苍蝇围绕的感觉吗？以前只有丐帮子弟能体会得到哦。购买苍蝇光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"},
			[6] = {"香蕉光环", "活动坊总管：对南蛮来的水果感兴趣么？这是一个能让你体验到南国风情的光环。购买香蕉光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"},
			[7] = {"苍鹰光环", "活动坊总管：你喜欢大鸟么？这个光环可以让一只苍鹰跟在你后面。购买苍鹰光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"},
			[8] = {"火焰光环", "活动坊总管：传说有一些武林高手运功时全身会冒火光，而这个光环就能让你体验做传说中的高手的感觉。购买火焰光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"},
			[9] = {"暗影光环", "活动坊总管：你知道什么叫“深不可测”么？这个光环能让你有深不可测的感觉。购买暗影光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"},
			[10] = {"七剑光环", "活动坊总管：想体验被七把绝世神兵围绕的该觉吗？这个光环就是顶级帮会身份的象征。购买七剑光环需要花费<color=yellow>30<color>点贡献度，光环效果持续一周。"}
};

function Sel_techan(nTongID, nWorkshopID)--帮会特产功能
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	
	Say("活动坊特产<color=yellow>帮会光环<color>，这是独一无二的哦，你要了解吗？", 2,
	"帮会特产光环/#enter_guanghuan("..nLevel..")",
	"结束对话/oncancel");
end;


function enter_guanghuan(nLevel)
	if (nLevel < 5) then
		Say("贵帮活动坊还没有达到<color=yellow>5<color>级呢，等达到5级的时候再来吧。", 0);
		return
	end;
	local tab_gh_content = {};
	tinsert(tab_gh_content, "关于特产光环/tong_gh_about");
	tinsert(tab_gh_content, "领取已有光环/#tong_gh_getagain(0, 1)");
	for i = 5, nLevel do
		tinsert(tab_gh_content, "我要购买"..tc_detail[i][1].."/#tong_gh_get("..i..")");
	end;
	tinsert(tab_gh_content, "取消特产光环/#delguanghuan( 1 )");
	tinsert(tab_gh_content, "我知道了/oncancel");
	Say("活动坊有特产光环奉送，你想要做点什么？", getn(tab_gh_content), tab_gh_content);
end;

function delguanghuan(IsWantCancel)--去掉光环效果
	if (IsWantCancel == 1) then	--如果想取消光环，如果想取消光环则设上取消的任务变量
		SetTask(TK_ISCANCEL, 1);
	end;
	
	for i = 726, 731 do
		AddSkillState(i, 1, 0, 0);
	end;
end;

function tong_gh_getagain(bExchangeIn, bPlayer)	--得到原有的光环；
	local nRemainSec = getremaintime();
	if (nRemainSec == 0) then
		if (bPlayer == 1 and bExchangeIn ~= 1) then	--是否要提示
			Say("你没有可使用的光环。", 0);
			Msg2Player("你没有可使用的光环。");
		end;
		return
	end;
	
	if (bPlayer == 1 or GetTask(TK_ISCANCEL) ~= 1) then
		local nSkillID = GetTask(TK_GUANGHUAN);
		AddSkillState(nSkillID, 1, 0, nRemainSec * 18);
		SetTask(TK_ISCANCEL, 0);
	end;
end;


tab_Level = {[5] = 5, [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10}
function tong_gh_get(nLevel)
	Say(tc_detail[nLevel][2], 2, "我要购买/#tong_gh_buy("..tab_Level[nLevel]..")", "离开/oncancel");
end;

function tong_gh_buy(nLevel)
	local nPrice = aLevelAuraPrice[nLevel];
	if (GetContribution() < nPrice) then
		Say("你的贡献度不足<color=yellow>"..nPrice.."<color>点，不能购买特产光环。");
		Msg2Player("你的贡献度不足。");
		return
	end;
	SetTask(TK_ISCANCEL, 0);
	AddContribution(-1 * nPrice);--减少贡献度。
	Msg2Player(format("你用<color=yellow>%d<color>点贡献度购买了一个<color=yellow>%s<color>.", nPrice, tc_detail[nLevel][1]));

	local nSkillID = nLevel + 726 - 5;
	SetTask(TK_GUANGHUAN, nSkillID);
	local nLimitDate = GetCurrentTime() + SEC_OF_DAY * 7;--光环时间为7天
	SetTask(TK_SHIJIAN, nLimitDate)

	delguanghuan();
	AddSkillState(726 + nLevel - 5, 1, 0, SEC_OF_DAY * 7 * 18);
end;

function getremaintime()	--得到光环还剩多少时间,返回还有多少个小时
	local nRemainTime = GetTask(TK_SHIJIAN) - GetCurrentTime();
	if (nRemainTime < 0) then
		nRemainTime = 0;
	end;
	return nRemainTime;
end;

function tong_gh_about()
	Say("<#>活动坊总管：帮会活动坊从五级开始每一级都会出售一种新的光环（<color=green>五级：苍蝇光环，六级：香蕉光环，七级：苍鹰光环，八级：火焰光环，九级：暗影光环，十级：七剑光环<color>），光环在购买后持续一周，在一周内如果因为死亡或其他原因令光环消失了的话可以随时回来免费领取，想让自己更个性吗？快来试试吧。", 0);
end;

if (MODEL_GAMESERVER == 1) then --如果是GameServer
---------------一下由小山加------------------------
Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include([[\script\missions\tong\tong_disciple\dis_gmscript.lua]]);
Include([[\script\missions\tong\tong_disciple\award.lua]]);
Include([[\script\missions\tong\tong_springfestival\head.lua]]);
Include([[\script\missions\tong\tong_springfestival\sf_gmscript.lua]]);
Include([[\script\missions\tong\tong_springfestival\award.lua]]);

Include([[\script\missions\tong\collectgoods\head.lua]]);
Include([[\script\missions\tong\collectgoods\collg_gmscript.lua]]);
Include([[\script\missions\tong\collectgoods\award.lua]]);
end

--招蓦弟子
function Sel_ZhaoDizhi(nTongID, nWorkshopID)
	Say("<#>活动坊总管：帮会招募弟子活动在0点、3、6……21点正点、15分，30分，45分开始报名。咱们帮是否需要些后生力量来充实呢？", 4, "参加帮会招募弟子活动/#wantjoin_disciple("..nTongID..","..nWorkshopID..")",
--		 "开启帮会招募弟子活动/#tong_opendisciple(821)", 
		 "领取奖赏/#disciple_aword("..nTongID..","..nWorkshopID..")",
		  "关于帮会招募弟子活动/disciple_about", "随便逛逛/festival06_Cancal");
end;

function wantjoin_disciple(nTongID, nWorkshopID)
	Say("活动坊总管：参加帮会招募弟子活动需要消耗<color=yellow>800<color>点帮会贡献度，你是否要参加？", 2, 
	"参加帮会招募弟子活动/#joindisciple("..nTongID..","..nWorkshopID..")",
	"我再想想/festival06_Cancal");
end;

function disciple_about()
	Say("活动坊总管：招募弟子活动一场为<color=yellow>15<color>分钟，其中有<color=yellow>5<color>分钟准备时间，"..
		"在报名参加后你会被带到准备地图，活动开始后你会被带到弟子云集的地方，"..
			"如果你在那里见到<color=yellow>弟子<color>的话只要用鼠标<color=yellow>"..
			"左键点击<color>他就可以了，当然你或许会受到其他玩家的阻挠，"..
			"这时候你可以用活动道具来应付这些情况，只要你找到足够多的<color=yellow>"..
			"帮会弟子<color>那么活动坊总管会给你不错的礼物哦。", 1,
			"我看看。/oncancel");
end;

--打年兽
function Sel_DaNianShou(nTongID, nWorkshopID)
	Say("<#>活动坊总管：帮会打年兽活动在1点、4、7……22点正点、15分，30分，45分开始报名。唉，这年日竟然也有年兽出来作乱。", 4, 
		"参加帮会打年兽活动/#wantjoin_springfestival("..nTongID.. ","..nWorkshopID..")",
--		"开启帮会打年兽活动/#tong_openspringfestival(823)", 
		"领取奖赏/#springfestival_aword("..nTongID..","..nWorkshopID..")", 
		"关于帮会打年兽活动/springfestival_about", "随便逛逛/festival06_Cancal");
end;

function wantjoin_springfestival(nTongID, nWorkshopID)
	Say("正月早过，害人的年兽被活捉关押在衙门里一段时日了，曾不幸被年兽附身的人们也逐渐好转和忘却。然而，他们身上依然附有年兽仍未散去的邪念，只是一直潜伏着罢了。某日，一位曾被附身的少妇回到除夕年兽出没之地，为了悼念在那场恶战中死去的丈夫和失踪的儿子……正是感伤不堪时，发现了凌乱的年兽脚印组成的一个奇异图案，那仿佛是个邪", 2, "然后呢/#wantjoin_springfestival_next("..nTongID..","..nWorkshopID..")",
	"不想再提那段往事/festival06_Cancal");
end;

function wantjoin_springfestival_next(nTongID, nWorkshopID)
	Say("念的符咒。趁那妇女信念动摇、情绪脆弱之际，符咒使其体内年兽的邪念涌动了……在衙门总管拜倒在她鲜红的肚兜之下酣睡时，一只复仇的玉手伸向了年兽地牢的钥匙……翌日的傍晚，几个在城门外玩耍的小孩不明消失了，空留几丝纠缠的断线和不复旋转的陀螺，以及，那孩童的梦。<enter>参加帮会打年兽活动需要<color=yellow>300<color>点帮会贡献度，你是否要参加？", 2, "参加帮会打年兽活动/#joinspringfestival("..nTongID..","..nWorkshopID..")",
	"我再想想/festival06_Cancal");
end;

function springfestival_about()
	Say("活动坊总管：打年兽活动一场为<color=yellow>15<color>分钟，其中有<color=yellow>5<color>分钟准备时间，"..
		"在报名参加后你会被带到准备地图。活动开始后你会被带到曾经年兽出没的地方，"..
		"在活动开始<color=yellow>15<color>秒后在参加活动的玩家当中便会有1~2名玩家被年兽附身，"..
		"变成年兽的玩家需要去抓地图中出现的“<color=yellow>走丢的孩子<color>”。", 2, 
		"下一页/festival06_next", "结束对话。/festival06_Cancal");
end;

function festival06_next()
    Say("活动坊总管：而其他玩家需要用“<color=yellow>鞭炮<color>”驱赶年兽，"..
    	"并阻止年兽把孩子抓走，一场活动结束后“<color=yellow>活动坊总管<color>”"..
    	"会按玩家用<color=yellow>鞭炮<color>击中年兽的名次来颁发奖励。", 1,  
    	"我知道了。/festival06_Cancal");
end

function Sel_shoujiwupin(nTongID, nWorkshopID)	--帮会收集物品活动
	local tab_gh_content = {
			"参加帮会收集物品活动/#wantjoin_collection("..nTongID..","..nWorkshopID..")",
--			"开启帮会收集物品活动/#collg_opencellectgoods( 827 )", 
			"领取奖赏/#collg_aword("..nTongID..","..nWorkshopID..")",
			"关于帮会收集物品活动/collg_about",
			"随便逛逛/festival06_Cancal"
	};

	Say("<#>活动坊总管：帮会收集物品活动在2点、5、8……22点正点、15分，30分，45分开始报名。咱们帮是否需要些后生力量来充实呢？", getn(tab_gh_content), tab_gh_content);
end;

function wantjoin_collection(nTongID, nWorkshopID)
	Say("活动坊总管：你肯帮忙真是太好了，但我在那些幸存的商人处打听到禁地里有一种奇异的机关，像是把一个巨大的鞭炮绑在一只蛊虫身上，它会粘在人身上不放，除非你把它扔给其他人，否则它就会一直粘着你直到爆炸，请务必小心。", 2, 
	"我会小心的，请送我到货物遗失的地方吧。/#collg_joindisciple("..nTongID..","..nWorkshopID..")", 
	"既然这样那我需要去准备准备，先等我一下。/OnCancel");
end;

else
-----------------如果是客户端---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>没有帮会"	
	end
	local bOpen	--是否开启
	local bPause --是否暂停
	local nCurLevel --当前等级
	local nUseLevel --当前使用等级
	local nOpenFund --当前开启消耗
	local nMaintainFund --当前维护消耗
	local nPrice  --当前换取boss召唤符的建设基金
	local dTokenCount	--当前每日boss召唤符产出总量提高
	local nDoubleOdds  --当前召唤出2个黄金Boss的几率
	local dDiziCount	--当前每日参加招募弟子活动人次提高
	local nDiziDoubleOdds	--当前招募弟子活动给与双倍奖励的几率
	local dNianshouCount	--当前每日参加帮会打年兽活动人次提高
	local nNianshouDoubleOdds		--当前帮会打年兽活动给与双倍奖励的几率
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then		
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
			dDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel] / aLevelDiziCoef[1])	
			nDiziDoubleOdds = floor(aLevelDiziDouble[nUseLevel] * 100)
			dNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel] / aLevelNianshouCoef[1])	
			nNianshouDoubleOdds = floor(aLevelNianshouDouble[nUseLevel] * 100)
		else
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
			dDiziCount = "--"
			nDiziDoubleOdds = "--"
			dNianshouCount = "--"
			nNianshouDoubleOdds = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount,nNextDoubleOdds,dNextDiziCount,nNextDiziDoubleOdds,dNextNianshouCount,nNextNianshouDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --下级换取boss召唤符的建设基金
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --下级每日boss召唤符产出总量提高
		nNextDoubleOdds = 160 - nCurLevel * 10 --下级召唤出2个黄金Boss的几率
		dNextDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel + 1] / aLevelDiziCoef[1])	
		nNextDiziDoubleOdds = format(aLevelDiziDouble[nUseLevel + 1] * 100)
		dNextNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel + 1] / aLevelNianshouCoef[1])	
		nNextNianshouDoubleOdds = format(aLevelNianshouDouble[nUseLevel + 1] * 100)
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
		dNextDiziCount = "--"
		nNextDiziDoubleOdds = "--"
		dNextNianshouCount = "--"
		nNextNianshouDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			--"Boss召唤符日产量上限提高：<color=gold>"..dTokenCount.."<color>倍\n"..	
			--"召唤符召出第2个Boss的几率：<color=gold>1/"..nDoubleOdds.."<color>\n"..		
			--"换取Boss召唤符所需建设基金：<color=gold>"..nPrice.."万<color>\n"..
			"每日参加帮会活动人次提高：<color=gold>"..dDiziCount.."<color>倍\n"..
			"帮会活动获得双倍奖励的几率：<color=gold>"..nDiziDoubleOdds.."%<color>\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			--"<color=water>Boss召唤符日产量上限提高：<color=Violet>"..dNextTokenCount.."<color>倍\n"..
			--"召唤符召出第2个Boss的几率：<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			--"换取Boss召唤符所需建设基金：<color=Violet>"..nNextPrice.."万<color>\n"..
			"每日参加帮会活动人次提高：<color=Violet>"..dNextDiziCount.."<color>倍\n"..
			"帮会活动获得双倍奖励的几率：<color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"

		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			---"<color=water>Boss召唤符日产量上限提高：<color=Violet>"..dNextTokenCount.."<color>倍\n"..
			---"召唤符召出第2个Boss的几率：<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			---"换取Boss召唤符所需建设基金：<color=Violet>"..nNextPrice.."万<color>\n"..
			"每日参加帮会活动人次提高：<color=Violet>"..dNextDiziCount.."<color>倍\n"..
			"帮会活动获得双倍奖励的几率：<color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end
----------------------------------------------
end