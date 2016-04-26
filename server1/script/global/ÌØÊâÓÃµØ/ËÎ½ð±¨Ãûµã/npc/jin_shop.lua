
-- 宋金报名点	金军军需官
-- lixin 2004-12-13
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\global\\特殊用地\\宋金报名点\\npc\\head.lua")
Include("\\script\\global\\特殊用地\\宋金报名点\\npc\\songjin_shophead.lua")

Include("\\script\\global\\global_tiejiang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\battles\\vngbattlesign.lua")

--调整换取积分时的经验值限制- Modified by DinhHQ - 20110810
--Limit_Exp = 550000
--Limit_Exp = 700000
tbLimit_Exp = {
						[0] = 700000,
						[3] = 800000,
						[4] = 1000000, 
					};
YUEWANGHUN_STONECOUNT = 100
nState = 0;

function main(sel)
	local nWorld, _, _ = GetWorldPos()
	if nWorld ~= 162 then
		Talk(1, "", "功能已关.")
		return
	end
	nOldSW = SubWorld
	SubWorld = SubWorldID2Idx(325)
	if (nState == 0) then
		bt_setnormaltask2type()
		nState = 1;
	end
	battlemapid = BT_GetGameData(GAME_MAPID);
	
	--当前没有任何战役打响
	if (battlemapid <= 0) then
			maintalk()
			return 
	end
	SyncTaskValue(747);--同步玩家的总积分给客户端，用于积分购买功能
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Msg2Player("error"..battlemap)
		return
	end
	
	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	
	if (state == 0 or state == 1) then
		maintalk()
		SubWorld = tempSubWorld;
		return
	else
		Talk(1,"","军需官：前方战场正在激烈战斗，各位需要暂时躲避一下!")
		SubWorld = tempSubWorld;
		return
	end;
	SubWorld = nOldSW;	
end;

function no()
end;

function jinshop_sell()
		Sale(98, 4);			
end;

--str1 = "金军军需官：金国的勇士们，你既然响应吾主号召，参加我金国灭宋大军，便可以在我这里用宋金积分<color=yellow>换取经验、岳王魂之石<color>，还可以购买<color=yellow>宋金专用道具<color>。"
--str2 = "如果，你有岳王魂之石的话，还能在我这里炼造岳王剑哦！"
function maintalk()
	--Say(str1..str2.."你有<color=yellow>"..nt_getTask(747).."<color>总积分，有什么需要吗？", 8,"我要购买宋金道具/jinshop_sell","我要用宋金积分换取经验/exp_exchange","看看宋金评价称号-特殊形象/person_change","看看宋金评价称号-特效光环/effect_aura","用岳王魂之石炼造岳王剑/yuewang_want","购买黄金图谱/goldenitem_menu","购买玄晶矿石和属性矿石/ore","我再考虑考虑/no");	
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--弹出对话框
	
	tbDailog.szTitleMsg = "军需官：你需要我帮什么?"
	tbDailog:AddOptEntry("我想买道具", jinshop_sell)
	tbDailog:AddOptEntry("我想换取经验值", exp_exchange)	
	tbDailog:AddOptEntry("使用岳王魂之石炼岳王剑", yuewang_want)	
	tbDailog:AddOptEntry("无双猛将战场",wushuangmengjiang)--无双猛将	
	tbDailog:AddOptEntry("精炼石商店", energy_sale);
	tbDailog:AddOptEntry("换取秘宝", duihuangmibao)
	--暂时关闭剑冢迷宫 - Modified by DinhHQ - 20110810
	--tbDailog:AddOptEntry("用岳王魂之石换取玉龙英雄帖", talk_yulongtie)

	tbDailog:Show()
end

function xunzhang_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "军需官：只有50级以上玩家才能领取勋章");
		return 0
	elseif ( GetExtPoint(0)==0 ) then
		Talk( 1, "", "军需官：只有已充值玩家才能领取勋章");
		return 0
	elseif ( CalcFreeItemCellCount() < 1 ) then
		Talk( 1, "", "请准备一个空位来放1个勋章");
		return 0;
	else
		Say("军需官：你想用500积分换取勋章吗?", 2,"换取勋章/xunzhang_do", "目前不想换取/no");
	end
end

function xunzhang_do()
	if nt_getTask(747) < 500 then
		Say("积分不足500，不能领取勋章",0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - 500));
	local nidx = AddItem(6,1,1412,1,0,0) --获得宋金勋章
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s Del:500SongJinJiFen\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	Say("已经成功领取一个勋章",0);
end

function exp_exchange()
	--Say("本功能暂不开放，敬请期待！", 0 )
	if( GetLevel() < 40 ) then
		Talk( 1, "", "军需官：你没有达到40级，不能参加风云论剑，怎么可以用积分换取经验值?");
	else
		if (GetTiredDegree() == 2) then
			Say("军需官：正处于劳累状态，不能换取经验值.",0);
		else
			local tbOpt = 
			{
				"500 积分/#wantpay(500)", 
				"1000 积分/#wantpay(1000)",
				 "2000 积分/#wantpay(2000)",
				  "5000 积分/#wantpay(5000)",
				   "所有积分/#wantpay(9999)",
				   "现在不想换取/no"
			}
			local nDate = tonumber(GetLocalDate("%Y%m%d"))
			local nHM	= tonumber(GetLocalDate("%%H%M"))
			
			
			if  20090925 <= nDate and  nDate <= 20091101 then
			--	tinsert(tbOpt, 5, format("%d点积分/#wantpayex(%d,%d)",80000,80000,0))
			end
			--活动期间(2009/09/25至2009/11/01)从12h30 至 23h30
			
			Say("军需官：你想消耗多少积分来领取经验值?", getn(tbOpt), tbOpt);
		end;
	end
end;


function wantpayex(mark, nStep)
	
	if GetLevel() < 120 then
		Talk(1, "", format("要求需要%d级以上才能换取.", 120))
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(2645, 1, "该奖励每天只能领取一次.", "<") ~= 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
				
	if gb_GetTask("songjin butianshi2009", 1) ~= nDate then
		gb_SetTask("songjin butianshi2009", 1, nDate)
		gb_SetTask("songjin butianshi2009", 2, 0)
	end
	
	if gb_GetTask("songjin butianshi2009", 2) >= 10 then
		Talk(1, "", "每天每个服务器，最快的十人才能换取该奖励.")
		return 
	end
	
	if( mark > nt_getTask(747) ) then
		Say("军需官：您的积分不足，想获得经验值.", 1, "关闭/no");
	elseif (mark == 0) then
		Say("军需官：没有经验值还想换取经验值啊，真是荒唐.", 1, "关闭/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		
		local tbItem = {szName="补天石碎片(中)", tbProp={6, 1, 1309, 1, 0, 0}}
		if nStep == 1 then
			if (expchange_limit(mark) == 1) then
				nt_setTask(747, floor(nt_getTask(747) - mark))
				AddOwnExp( bonus);
				Add120SkillExp(bonus);
				
				tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetItemFromSongjin")
				gb_AppendTask("songjin butianshi2009", 2, 1)
				PlayerFunLib:AddTaskDaily(2645, 1)	
				Msg2Player("<#>您已消耗"..mark.."<#>积分, 换取"..bonus .."<#>经验值.");
				WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:已消耗"..mark.."积分, 换取"..bonus.."经验值.");
			end
			
			
			
		elseif nStep == 0 then
			Say("军需官：您可以换取"..bonus.."经验值，确定换取是吗?", 2, "对，我要换/#wantpayex("..mark..",1"..")", "嗯，让我再想想!/no")	
		end
		
	end	
end

function wantpay(mark)
	if (mark == 9999) then		--换取所有积分
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("军需官：您的积分不足，想获得经验值", 1, "关闭/no");
	elseif (mark == 0) then
		Say("军需官：没有积分还想换经验值啊，真是荒唐.", 1, "关闭/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		Say("军需官：您可以换得"..bonus.."经验值，确定换取吗?", 2, "对，我需要换取/#paymark("..mark..")", "嗯，让我再想想!/no")
	end	
end

function paymark(mark)
	if (mark == 9999) then		--换取所有积分
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("军需官：您的积分不够，想获得经验值", 1, "关闭/no");
	elseif (mark == 0) then
		Say("军需官：没有积分还想换经验值啊，真是荒唐.", 1, "关闭/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		if (expchange_limit(mark) == 1) then
			nt_setTask(747, floor(nt_getTask(747) - mark))
			AddOwnExp( bonus);
			Add120SkillExp(bonus);
			Msg2Player("<#>您已消耗"..mark.."<#>积分,换得"..bonus .."<#>经验值.");
			WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 已消耗"..mark.."积分, 换得"..bonus.."经验值.");
		end
	end
end


function expchange_limit(cost)
	--local ww = tonumber(date("%W"))
	--local yy = tonumber(date("%Y")) - 2000
	local nNumber = tbVNG2011_ChangeSign:GetTransLife()	
	local Limit_Exp = tbLimit_Exp[nNumber]
	if ( (nt_getTask(1017) + cost) <= Limit_Exp) then
		nt_setTask(1017, nt_getTask(1017) + cost)
		return 1
	else
		Say("军需官：不要这么贪婪，一周内不能换取超过<color=red>"..Limit_Exp.."<color>积分的经验值", 0)
		return -1
	end
end

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function person_change()
	Say("军需官：在<color=yellow> 排名评论榜上 <color>排名<color=yellow> 5 名字<color> 第一个玩家将获得特别称号和威风形象", 3, "看宋金男人物形象/title_male","看宋金女人物形象/title_female","不想看!/no" )
end;

function title_male()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy208\\enemy208_at.spr>宋金男人物形象<link>在排名榜上有5个名字的男人物评论将获得相应的形象", 1, "关闭/no" );
end

function title_female()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy207\\enemy207_at.spr>宋金女人物形象<link>在排名榜上有5个名字的女人物评论将获得相应的形象", 1, "关闭/no" );
end

function effect_aura()
	Say("军需官：在<color=yellow> 排名评论榜上 <color>排名<color=yellow>5 名字<color> 第一个人物奖获得特别圆圈特效", 6, "看定国元帅特效/aura_dingguo","看安邦大将军特效/aura_anbang","看飘旗将军特效/aura_biaoji","看武林中郎特效/aura_yulin","看昭武校尉特效/aura_zhaowu","不想看!/no" );
end

function aura_dingguo()
	Describe("<link=image:\\spr\\skill\\others\\title_dg.spr>定国元帅特效<link>人物评论排名第一讲获得圆圈特效", 1, "关闭/no" );
end

function aura_anbang()
	Describe("<link=image:\\spr\\skill\\others\\title_ab.spr>安邦大将军特效<link>人物评论排名第二将获得圆圈特效", 1, "关闭/no" );
end

function aura_biaoji()
	Describe("<link=image:\\spr\\skill\\others\\title_bj.spr>飘旗将军特效<link>人物评论排名第三讲获得圆圈特效", 1, "关闭/no" );
end

function aura_yulin()
	Describe("<link=image:\\spr\\skill\\others\\title_yl.spr>武林中郎特效<link>人物评论排名第四讲获得圆圈特效", 1, "关闭/no" );
end

function aura_zhaowu()
	Describe("<link=image:\\spr\\skill\\others\\title_zw.spr>昭武校尉特效<link>人物评论排名第五讲获得圆圈特效", 1, "关闭/no" );
end

function yuewang_want()
	Say("军需官：从岳王魂之石中的精华制造出岳王剑，需要消耗"..YUEWANGHUN_STONECOUNT.."该岳王魂之石确定要换是吗?", 2, "想/yuewang_change", "我再看看/no")
end

function yuewang_change()
	Say("军需官：岳王剑占用装备的空间为<color=yellow>6 (2 X 3)<color>空位，你确定装备里还有空位吗", 2, "想/yuewang_sure", "让我先安排一下装备/no")
end

function yuewang_sure()
	if (CalcEquiproomItemCount(4, 507, 1, -1) >= YUEWANGHUN_STONECOUNT) then
		ConsumeEquiproomItem(YUEWANGHUN_STONECOUNT, 4, 507, 1, -1)
		AddEventItem(195)
		Say("军需官：这个岳王剑很珍贵，你要懂用好它哦!", 0)
		Msg2Player("我获得岳王剑")
	else
		Say("军需官：你没有很多岳王魂之石，快检查一下！岳王剑不是谁都能有的.", 0)
	end
end

function ore()
	Sale( 102, 4);
end

function goldenitem_menu()
	Sale( 103, 4);
end

