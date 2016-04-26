Include("\\script\\item\\techan_zijingao.lua")
Include("\\script\\item\\techan_dahuandan.lua")

----烽火英雄令活动 入口
function enter_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	local tbDescribe = {"<dec>烽火英雄令活动从 <color=yellow>01-12-2006<color>开始到<color=yellow>24h00 01-01-2007<color>. 使用烽火英雄令购买物品和兑换Boss召唤符可以延续到<color=yellow>08-01-2007<color>. 详细内容看主页.<enter>目前你的英雄令的数量是:<color=yellow>"..nCount.." c竔<color>.<enter>你想参加哪个活动?", 
	"兑换烽火英雄令/change_contribution_heroling", 
	"以烽火英雄令购买物品/saleby_heroling", 
	"用烽火英雄令兑换Boss召唤符/change_heroling_bosscharm", 
	"用密件交换荣誉令牌/change_letter_honour",
	"离开/tong_cancel"};
	
	CreateTaskSay(tbDescribe);
end;

-----以烽火英雄令购买特殊物品 Start
function saleby_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	CreateTaskSay({"<dec><color=yellow>烽火英雄令<color>用于购买特殊物品. 特殊物品还要消耗<color=yellow>个人贡献点<color> 来交换. 购买物品要从可以记录的令牌数中扣除<color=yellow>帮会令牌数量被消耗<color>. 这个消耗量将决定一周帮会可以获得的Boss召唤符数量, 帮会有权决定是否参加密件活动."
	.."<enter>现在可以使用的烽火英雄令的数量是: <color=yellow>"..nCount.." 个<color>."
	.."<enter>现在可以使用的总贡献点是: <color=yellow>"..GetContribution().." 点<color>."
	.."<enter>你想要买什么物品?", 
	"紫金镐/saleby_heroling_enter",
	"修理包/saleby_heroling_enter",
	"木人/saleby_heroling_enter",
	"暗影光环/saleby_heroling_enter",
	"香蕉光环/saleby_heroling_enter",
	"苍鹰光环/saleby_heroling_enter",
	"伪装面具/saleby_heroling_enter",
	"大还丹/saleby_heroling_enter",
	"返回/enter_heroling",
	"离开/tong_cancel"});
end;

function check_salebyheroling(nTongID, nPrice)
	if (nTongID == 0) then
		return 0;
	end;
	local nContribution = GetContribution();
	local nHeroling = GetTask(TASKID_HEROLING_COUNT);
	if (nHeroling < 1) then
		CreateTaskSay({"<dec>贡献点不够, 先努力寻找贡献点.", "结束对话/tong_cancel"});
	elseif (nContribution < nPrice) then
		CreateTaskSay({"<dec>现在没有烽火英雄令, 在积累了贡献点之后才可以去领取烽火英雄令.", "结束对话/tong_cancel"});
	else
		return 1
	end;
	return 0;
end;


-----**大还丹**
function sale_heroling_dahuandan(nCount, nPrice)
		local nRestH, nRestM = adddahuandan_main(10, nCount);	--1.6倍需要 10级作坊
		Msg2Player("<#>你买到1粒"..nCount.."大还丹,现在使用大黄丹的时间是"..nRestH.."时 "..nRestM.."分.")
end;
-----**大还丹 end


-----**伪装面具**
function sale_heroling_weizhuang(nCount, nPrice)
	for i = 1, nCount do
		AddItem(0,11,366,1,0,0);
	end;
		Msg2Player("你达到"..nCount.." 24时, 伪装面具可以使用10次")
end;
-----**伪装面具 end


-----**苍鹰光环**
function sale_heroling_cangying(nCount, nPrice)
	delguanghuan()
	AddSkillState(728, 1, 1, 10886400 * nCount, 1);--7天
	Msg2Player("得到1个苍鹰名号环，剩余时间为 "..(7*nCount).."天");
end;
-----**苍鹰光环 end


-----**香蕉光环**
function sale_heroling_xiangjiao(nCount, nPrice)	
	delguanghuan()
	AddSkillState(727, 1, 1, 10886400 * nCount,1);--7天
	Msg2Player("得到1个香蕉名号环，剩余时间为 "..(7*nCount).."天");
end;
-----**香蕉光环 end


-----**暗影光环**
function sale_heroling_anying(nCount, nPrice)
	delguanghuan()
	AddSkillState(730, 1, 1, 10886400 * nCount, 1);--7天
	Msg2Player("得到1个暗影名号环，剩余时间为 "..(7*nCount).."天");
end;
-----**暗影光环 end

function delguanghuan()
	for i = 726, 731 do
		AddSkillState(i, 1, 1, 0);
	end;
end;

-----**修炼木人**
function sale_heroling_xiulianmuren(nCount, nPrice)
	for i = 1, nCount do
		local nItemIndex = AddItem(6,1,1085,1,1,0)
		SetSpecItemParam(nItemIndex, 1, nTongID)
		SetSpecItemParam(nItemIndex, 2, 10)
		SyncItem(nItemIndex)
	end;
	Msg2Player("得到"..nCount.."1个木人.")
end;
-----**修炼木人 end

-----**修理包**
function sale_heroling_xiulibao(nCount, nPrice)
	for i =1, nCount do
		local nItemIndex = AddItem(6,1,1084,1,1,0)
		SetSpecItemParam(nItemIndex, 2, GetLocalDate("%y%m%d"))
		SyncItem(nItemIndex)
	end;
		Msg2Player("得到"..nCount.." 修理包, 剩余时间是7天")
end;
-----**修理包 end

-----**紫金镐**
function sale_heroling_zijingao(nCount, nPrice)
		local nRestH, nRestM = addzijingao_main(nCount);
		Msg2Player("得到1个紫金镐，剩余时间是"..nRestH.." 时, "..nRestM.."分")
end;
-----**紫金镐 end

function saleby_heroling_enter(nSel)
	nSel = nSel + 1
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	if (nCount < 1) then
		CreateTaskSay({"<dec>没有烽火英雄令就不能买物品.", "结束对话/tong_cancel"});
		return 0
	end;
	local arySalebyHeroling = {
						{"<dec>可以使用<color=yellow>紫金镐<color>  在桃花岛挖矿, 要注意的是紫金镐不能与别的寻常开矿工具一同使用. 如果一同使用的话之前将会占用紫金镐的使用时间, 之后将会是另一种功效. <enter>领取紫金镐会消耗:<color=yellow>200点<color> ", "要领1个/#saleby_heroling_confirm(1,200,'sale_heroling_zijingao')", "要领2个/#saleby_heroling_confirm(2,400,'sale_heroling_zijingao')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec><color=yellow>修理包<color> 是可以放入背包的道具, 它可以帮助你不必回城就修理装备,当然要付相应的费用. 修理包的使用期限是1周.<enter>领取1个修理包消耗的贡献点是: <color=yellow>50 点<color>", "换取1个修理包/#saleby_heroling_confirm(50,'sale_heroling_xiulibao')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>点鼠标右键召唤木人. 打败木人后将有经验值.<enter>领取1个木人要消耗的贡献点是: <color=yellow>100点<color>", "换取1个木人/#saleby_heroling_confirm(100,'sale_heroling_xiulianmuren')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>名号光环给人深邃虚幻的感觉, 使用期限是1周.<enter>换取名号光环需要贡献值: <color=yellow>30 点<color>", "获得1个暗影光环/#saleby_heroling_confirm(30,'sale_heroling_anying')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>这是一个有南方色彩的光环. 获取香蕉光环需要贡献点 <color=yellow>30 点<color>. 贡献值, 使用期限是1周.", "领取1个香蕉光环/#saleby_heroling_confirm(30,'sale_heroling_xiangjiao')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>你喜欢飞行吗? 这个光环给你带来鹰击长空的感觉? 接着，使用期限是1周.<enter>想要得到这个名号光环要用的贡献点是: <color=yellow>30 点<color>", "领取1个苍鹰光环/#saleby_heroling_confirm(30,'sale_heroling_cangying')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>伪装面具是可以伪装10次，伪装时长24小时的面具.用完10次将不能再使用伪装功能.<enter>伪装面具所需的贡献值为：<color=yellow>300 点<color>", "换取1个伪装面具/#saleby_heroling_confirm(300,'sale_heroling_weizhuang')", "返回/enter_heroling", "离开/tong_cancel"},
						{"<dec>当离线托管时这类有神力的丹药可以增加1.6倍经验值，每粒可以使用6个小时<enter>可以交换1颗大还丹的贡献值是: <color=yellow>30 点<color>", "兑换1颗大还丹/#saleby_heroling_confirm(1,30,'sale_heroling_dahuandan')", "兑换2颗大还丹/#saleby_heroling_confirm(2,60,'sale_heroling_dahuandan')", "兑换5颗大还丹/#saleby_heroling_confirm(5,150,'sale_heroling_dahuandan')", "兑换10颗大还丹/#saleby_heroling_confirm(10,300,'sale_heroling_dahuandan')", "返回/enter_heroling", "离开/tong_cancel"},
																	};
	if (arySalebyHeroling[nSel]) then
		if (nSel == 8) then
			nRestH, nRestM = GetMinAndSec(GetTask(TASKID_TECHAN_HUANDAN_TIME));
			arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>大还丹的使用时间还有: <color=yellow>"..nRestH.."时"..nRestM.."分<color>"
		end;
		arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>现在可以使用烽火英雄令的数量是: <color=yellow>"..nCount.." c竔<color><enter>现在可以使用的总贡献值是: <color=yellow>"..GetContribution().." 点<color><enter>你同意换吗?"
		CreateTaskSay(arySalebyHeroling[nSel]);
	end;
end;

function saleby_heroling_confirm(nCount, nPrice, szfunc)
	if (not szfunc) then
		szfunc = nPrice;
		nPrice = nCount;
		nCount = 1;
	end;
	local _, nTongID = GetTongName();
	if (check_salebyheroling(nTongID, nPrice) == 1) then
		local nHeroling = GetTask(TASKID_HEROLING_COUNT);
		SetTask(TASKID_HEROLING_COUNT, nHeroling - 1);
		AddContribution(-nPrice);
		heroling_applyaddtask(nTongID, 1);	--增加帮会累积烽火英雄令的总数
		dostring(szfunc.."("..nCount..","..nPrice..")");
	end;
end;
-----以烽火英雄令购买特殊物品 End

-----兑换烽火英雄令 Start
function change_contribution_heroling()
	if (tonumber(GetLocalDate("%Y%m%d")) > 20070101) then
		CreateTaskSay({"<dec>烽火英雄令活动将于01-01-2007结束. 08-01-2007之前, 玩家可以继续用烽火英雄令换取奖励.", "结束对话/tong_cancel"});
		return 0;
	end;
	local nWeekOffer = GetWeeklyOffer();--获得周累积贡献度
	local nUsedOffer = GetTask(TASKID_CONTRIBUTE_USED);
	local nMyCount = GetTask(TASKID_LASTHERO_TAKED);
	local nLastTime = GetTask(TASKID_LASTHERO_DATE);
	local nLastDate = mod(nLastTime , 1000);
	local nLastWeek = floor(nLastTime / 1000);
	local nDate = tonumber(GetLocalDate("%j"));
	local nWeek = tonumber(GetLocalDate("%W"));
	
	if (nWeek ~= nLastWeek) then
		nLastWeek = nWeek;
		SetTask(TASKID_CONTRIBUTE_USED, 0);
		nUsedOffer = 0;
	end;
	if (nDate ~= nLastDate) then
		nLastDate = nDate;
		SetTask(TASKID_LASTHERO_TAKED, 0);
		nMyCount = 0;
	end;
	
	SetTask(TASKID_LASTHERO_DATE, nLastWeek * 1000 + nLastDate);
	local nHeroCount = floor((nWeekOffer - nUsedOffer)/100);
	
	if (nHeroCount > 3 - nMyCount) then
		nHeroCount = 3 - nMyCount;
	end;
	if (nHeroCount > 0) then
		CreateTaskSay({"<dec>可以在活动中赚取贡献度. 贡献度由系统自动记录积累，每积累到 <color=yellow>100个贡献度<color>则帮会成员可以到紫檀帮会领取1个烽火英雄令，每日领取数量不得超过 <color=yellow>3 个<color>, 每周将会清零."
	.."<enter>积累的贡献度是：<color=yellow>"..nWeekOffer.." 点<color>."
	.."<enter>现在可以换取烽火英雄令: <color=yellow>"..nHeroCount.." 个<color>.",
	"我要换取烽火英雄令/#sure_contribution_heroling("..nHeroCount..")", "返回/enter_heroling", "离开/tong_cancel"});
	else
		CreateTaskSay({"<dec>可以在活动中赚取贡献度. 贡献度由系统自动记录积累，每积累到 <color=yellow>100 个贡献度<color> 则帮会成员可以到紫檀帮会领取1个烽火英雄令，每日领取数量不得超过 <color=yellow>3个<color>, 每周将会清零."
	.."<enter>积累的贡献度是：<color=yellow>"..nWeekOffer.." 点<color>."
	.."<enter>现在可以换取烽火英雄令：<color=yellow>"..nHeroCount.." 个<color>.",
	"返回/enter_heroling", "离开/tong_cancel"});
	end;
end;

function sure_contribution_heroling(ncount)
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	SetTask(TASKID_HEROLING_COUNT, GetTask(TASKID_HEROLING_COUNT) + ncount);	--增加烽火英雄令的总数
	SetTask(TASKID_CONTRIBUTE_USED, GetTask(TASKID_CONTRIBUTE_USED) + ncount * 100);	--增加兑换消耗的贡献度
	SetTask(TASKID_LASTHERO_TAKED, GetTask(TASKID_LASTHERO_TAKED) + ncount);		--增加本日领取的总数
	Msg2Player("你得到"..ncount.." 个烽火英雄令.");
end;

-----兑换烽火英雄令 End
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;

-----兑换Boss召唤符
--AddItem(6, 1, 1022, 10, 0, 0, 0);
function change_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	CreateTaskSay({"<dec>帮会要带着烽火英雄令兑换Boss召唤符. 积累方式是：当帮众用烽火英雄令购买物品时，物品将会被计入帮会的令牌数. 当得到 <color=yellow>63个烽火英雄令<color> 则帮主或长老可以兑换1个Boss召唤符.烽火英雄令积累的最大数量是每周<color=yellow>900个<color>. 进入新的一周则烽火英雄令将会从头计数.<enter>一周帮会烽火英雄令积累的数量是："..nTongHeroling.." 个.<enter>可用于兑换Boss召唤符的帮会烽火英雄令的数量是："..(nTongHeroling-nUseHeroling).." 个<enter>, 可以领取到的Boss召唤符的数量是："..floor((nTongHeroling-nUseHeroling)/63).."个", "兑换Boss召唤符/sure_heroling_bosscharm", "返回/enter_heroling", "离开/tong_cancel"});
end;


function sure_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>只有帮主或长老才可以使用烽火英雄令兑换Boss召唤符.", "结束对话/tong_cancel"});
		return 0;
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	local nCount = floor((nTongHeroling-nUseHeroling) / 63);
	if (nCount < 1) then
		CreateTaskSay({"<dec>帮会可以用烽火英雄令兑换1个Boss召唤符. 烽火英雄令的积累每个人要更加努力.", "结束对话/tong_cancel"});
		return 0;
	end;
	if (CalcFreeItemCellCount() < nCount * 2) then
		CreateTaskSay({"<dec>背包空间不足. 可能会领取到 "..nCount.." Boss召唤符请先整理背包.", "结束对话/tong_cancel"});
		return 0;
	end;
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_USEHEROLING, nCount*63);
	for i=1, nCount do
		AddItem(6, 1, 1022, 10, 0, 0, 0);
	end;
	Msg2Player("你得到 "..nCount.." Boss召唤符.");
end;
-----兑换Boss召唤符 end


-----兑换敌国密件
function change_letter_honour()
	CreateTaskSay({"<dec>当烽火英雄令有<color=yellow>120个<color> 则每周5，周6可以参加活动<color=yellow>追踪密件color>. 周5，周6在新手村的外面出现<color=yellow>稻草人<color> 带着密件. 所有人要找到这些稻草人身上的密件. 稻草人出现的时间是7h30, 7h40, 7h50, 可以寻找密信的时间是 <color=yellow>7h35, 7h45, 7h55<color>. 你取得密件的时间是1分钟，之后要亲自上交到朝廷. 朝廷将给予你赏赐<color=yellow>25块黑铁荣誉令牌<color>. 稻草人的坐标是：<enter>"
	.."巴陵县: 220/200     江津村: 438/396<enter>"
	.."永乐镇: 197/188     稻香村: 215/185<enter>"
	.."龙门镇: 233/287     石鼓镇: 214/205<enter>"
	.."龙泉村: 216/199",
	"我们进入着找到密件!/sure_letter_honour", "回到之前的操作/enter_heroling", "离开/tong_cancel"});
end;

function sure_letter_honour()
	local _, nTongID = GetTongName();
	
	local count = CalcEquiproomItemCount(4,1121,1,-1);
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>最好是由帮主或长老交给我.", "知道了/tong_cancel"});
	elseif (count < 1) then
		CreateTaskSay({"<dec>我怎么没看到密件在哪?", "结束对话/tong_cancel"});
	elseif (CalcFreeItemCellCount() < 25) then
		CreateTaskSay({"<dec>背包空间不足, 不能交黑铁令.", "等我先整理下背包./tong_cancel"});
	else
		ConsumeEquiproomItem(1,4,1121,1,-1);
		for i = 1, 25 do
			AddItem(6,1,1257,1,1,1); 
		end;
		Msg2Player("得到25个黑铁荣誉令牌");
	end;
end;

--增加帮会累积烽火英雄令
function heroling_applyaddtask(nTongID, nValue)
	local ntask = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	if (ntask < 900) then
		ntask = ntask + nValue;
		if (ntask + nValue > 900) then
			nValue = 900 - ntask;
		end;
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_HEROLING, nValue);
	end;
end;