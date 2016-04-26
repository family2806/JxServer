IncludeLib("TONG")

Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\map\\map_management.lua")
Include("\\script\\global\\tonggetmasterpower.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\fenghuo_hero\\hero_event.lua")

--帮会周目标领奖
function tong_award(nTongID)
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		CreateTaskSay({"<dec><npc>你没有权利管理周目标，不能领奖!", "我知道了/tong_cancel"});
		return
	end
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>上周没有周目标，不能领奖!", "我知道了/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>贵帮为完成上周目标, 不能领奖!", "我知道了/tong_cancel"});
		return
	end
	local nWeek = TONG_GetWeek(nTongID);
	--必须加临时变量判断，否则会刷！因为帮会任务变量在服务端不是即时设上的！
	--由于领奖只能在自身帮会地图，因此基本不存在多个服务器同时领奖来刷的情况
	if (nWeek == TONG_GetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE) or 
		nWeek == TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK)) then
		CreateTaskSay({"<dec><npc>已经领奖了，还想领啊!", "我知道了/tong_cancel"});
		return
	end
	local nWeekGoalPriceTong = TONG_GetLWeekGoalPriceTong(nTongID)
	TONG_ApplyAddWarBuildFund(nTongID, nWeekGoalPriceTong);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWeekGoalPriceTong);
	--把领奖标志设为本周
	TONG_SetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE, nWeek);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK, nWeek);
	TONG_ApplyAddEventRecord(nTongID, "已领周目标奖励."..nWeekGoalPriceTong.." 万战备预算 ");	-- 帮会事件记录
	Msg2Player(format("获得周目标奖励: 战备预算 <color=gold>%d<color> 万", nWeekGoalPriceTong))
end

--个人周目标领奖
function WeekGoalPrice(nTongID)
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>上周贵帮没有周目标, 不能领奖!", "我知道了/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>未完成周目标, 不能领奖!", "我知道了/tong_cancel"});
		return
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nLWeekValue = TONGM_GetLWeekGoalOffer(nTongID, GetName())
	local nPlayerGoal = TONG_GetLWeekGoalPlayer(nTongID)
	--使用的是由服务端决定的成员变量
	local nState = GetTongMTask(TONGMTSK_WEEK_GOAL_PRICE)
	if (nState == nTongWeek) then --已领过奖，周数为本周
		CreateTaskSay({"<dec><npc>已领取上周目标奖励了, 需要继续为帮会做贡献, 下周再来 ", "我知道了/tong_cancel"});
		return
	end
	if (nLWeekValue == 0 or nPlayerGoal == 0) then
		CreateTaskSay({"<dec><npc>上周什么也没做，怎么能不劳而获呢？ ", "我知道了/tong_cancel"});
		return
	end
	if (nLWeekValue < nPlayerGoal) then
		CreateTaskSay({"<dec><npc>未完成上周目标, 不能领奖, 需要继续为帮会努力, 早晚都会有收获的.", "我知道了/tong_cancel"});
		return
	end	
	local nPrice = TONG_GetLWeekGoalPricePlayer(nTongID)
	AddContribution(nPrice)
	Msg2Player("<#>已经完成帮会周目标了, 获得贡献度奖励:"..nPrice.."点")
	Msg2Player("<#>已经完成帮会周目标了, 获得经验值奖励: "..(nPrice*10000).."点")
	AddOwnExp(nPrice*10000)
	SetTongMTask(TONGMTSK_WEEK_GOAL_PRICE, nTongWeek)
end

function main()
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (GetProductRegion() == "cn_ib") then
		-- 帮会地图模板中的祭酒则直接进入地图管理
		if (aDynMapCopyName[nSubWorldId] ~= nil) then
			tongmap_management();
			return
		end
	end;
	local _Name, nTongID = GetTongName();
	-- 玩家没有帮会则不出现功能列表
	if (nTongID == 0) then
		CreateTaskSay({"<dec><npc>想了解新帮会系统信息!", "协助帮会/#tong_help()", "放弃 /tong_cancel"});
		return
	end
	local param = "("..nTongID..")";
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (nSubWorldId > DYNMAP_ID_BASE and nSubWorldId ~= TONG_GetTongMap(nTongID)) then
		Say("这不是贵帮领地, 想来参加啊?", 2, "协助帮会/#tong_help()", "顺便路过而已/tong_cancel");
		return
	end
	local figure = TONGM_GetFigure(nTongID, GetName());
	local aryDescribe = 
	{
				"<dec><npc>你找我有什么事吗?",
				"个人周目标奖励 /#WeekGoalPrice"..param,
				"领取每日贡献度奖励/#GetDayPrice"..param,
--				"建设等级提升奖励/LUP_HelpInfo",
				-- 越南帮会不出
--				"仿制安邦套装/enter_anbang",
				"自己进行帮会职务 #tong_mastercompetition"..param,
--				"帮会帮助信息/#tong_help()",
	};
	--如果是长老和帮主
	if (figure == TONG_MASTER or figure == TONG_ELDER) then
		tinsert(aryDescribe, "设立周目标难度/#tong_levelchoose"..param);
		tinsert(aryDescribe, "帮会周目标奖励/#tong_award"..param);
	end
	tinsert(aryDescribe, "协助帮会/#tong_help()");
	tinsert(aryDescribe, "放弃/tong_cancel");
	CreateTaskSay(aryDescribe);
end

function tong_help()
	OpenHelp(80)
end

function GetDayPrice(nTongID)
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_RETIRE) then
		Say("正处于退隐状态, 不能领奖", 0);	
		return
	end	
	if (TONGM_GetJoinDay(nTongID, GetName() ) == TONG_GetDay(nTongID)) then
		Say("<#>需要进上述帮会一天才能领!", 0)
		return
	end

	if (TONG_GetBuildLevel(nTongID) <= 0) then
		Say("<#>帮会达到1级才能领贡献度", 0)
		return
	end
	--祭坛奖励不累加到周累积贡献度
	if (TONG_GetPauseState(nTongID) ~= 0) then
		Say("<#>帮会正处于暂停状态，不能领", 0)
		return
	end
	local nTongDay = TONG_GetDay(nTongID)
	if (GetTongMTask(TONGMTSK_DAILY_PRICE) == nTongDay) then
		Say("<#>已领今日奖励", 0)
		return
	end
	local nPrice = DAILY_PRICE
	if (nPrice > 0)then
		AddContribution(nPrice)
		Msg2Player("获得<color=gold>"..nPrice.."<color> 贡献度")
	end
	SetTongMTask(TONGMTSK_DAILY_PRICE, nTongDay)
end

function unchain_pause_state(nTongID)
	local nConsume = TONG_GetMaintainFund(nTongID)	
	local nCurFund = TONG_GetWarBuildFund(nTongID)
	if (nCurFund < nConsume*7) then
		Say("<#>战备预算低于允许的保持战备预算, 不能启动作坊!", 0)
	else	
		TONG_ApplySetPauseState(nTongID, 0)
		Msg2Tong(nTongID, "帮会作坊恢复运行!")
	end
end

function tong_levelchoose(nTongID)
	if nTongID == 0 then return end;
	local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
	Say("<#>帮会周目标难度级别为<color=yellow>"..nLevel.."<color>,\n\n 设立周目标难度将在下周发生作用,想射了周目标难度吗?", 3, "难度级别1/#select_level(1)", "难度级别2/#select_level(2)", "不需要/tong_cancel")
end

function select_level(nLevel)
	local _Name, nTongID = GetTongName()
	if nTongID == 0 then return end;
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		Say("<#>你无权管理周目标, 快叫帮主来!", 0)
		return
	end
	TONG_ApplySetCurWeekGoalLevel(nTongID, nLevel)
	Say("<#>目前周目标难度为 <color=yellow>"..nLevel.."级", 0)
end

-- 用户点击帮主自荐
function tong_mastercompetition() 
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --如果帮主存在
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --帮主离开少于30天,而且现在不在线
				Say("帮主未离开30天, 不能举行帮主职位自荐", 1, "确认/tong_cancel");
			return
		end
	end
	
	local param = "("..nTongID..")";
	
	-- 执行到此处表明帮主离开30天了
	if (CheckTongMasterPower() ~= 1) then --不符合当帮主的资格
		Say("统帅值和名望值不足以担任帮主职位", 1, "确认/tong_cancel")
		return
	end

	--执行到这里表明开启帮主的条件达到，根据是否开启竞选来开启或参与
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then --若没有开启
		Say("帮主已离开30天了，你可以进行帮主职位自荐了，2周后可以参加竞选帮主活动",
			2, "开始/#_tong_startup_compete"..param, "放弃/tong_cancel");
	elseif (TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE) == 0) then --还没有进行2240任务,不是帮主候选人
		Say("想争夺帮主职位，需要在2周内为帮会做很多贡献：参加各种活动，达到2240个人贡献度(贡献度藏有帮会奖励，祭坛贡献度，从周目标的贡献度将不计算)", 2, "参加/_foretask", "放弃/tong_cancel");
	else  --已经是候选人了，即参加了2240任务
		local nIniContribution = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS);--获得刚参与2240任务时的贡献度
		local nEarnContributiveness =  GetCumulateOffer() - nIniContribution;--相减得到增加的手工贡献度
		if(nEarnContributiveness < FORETASKVALUE ) then --贡献点还不够2240
			Say("已有 "..tostring(nEarnContributiveness).." 贡献度"..", 还差"..tostring(FORETASKVALUE - nEarnContributiveness).." 贡献度.", 0);
			return
		end
		local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);
		if (nLastContributiveness == 0) then
			Say("恭喜! 你找到了最少为2240 贡献度所以可以参加帮主职位的争夺，请输入数字比赛，数字最高的将得到20倍的个人贡献度，要注意的是，每次选择，将扣除5% 手续费.", 2, "确认/inputcontributiveness", "放弃/tong_cancel");
		else
			Say("比赛分数为 "..tostring(nLastContributiveness)..", 你想增加吗?", 2, "+/inputcontributiveness", "放弃/tong_cancel");
		end
	end
end 

--启动帮主自荐
function _tong_startup_compete(nTongID)
	local _Name, nCurTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (nCurTongID == 0 or nTongID ~= nCurTongID) then
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --如果帮主存在
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --帮主离开少于30天,而且现在不在线
			return
		end
	end
	
	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, dwCurrDateTime); --竞选开始日期
	--帮聊，帮会事件中记录
	Msg2Tong(nTongID, "帮主自荐活动已开始");
	TONG_ApplyAddEventRecord(nTongID, "帮主自荐活动已开始");
	--遍历清空
	local tbMsg = {
		startmemberid	 = GetTongMemberID(),
		startupdate      = FormatTime2String(dwCurrDateTime)
		}
		cTongLog:WriteInfTB("TONG", "master_compete_date", nTongID, tbMsg)

		Say("帮主竞选活动已开始，想争夺帮主职位，需要在2周内为帮会做很多贡献：参加各种活动，达到2240个人贡献度(贡献度藏有帮会奖励，祭坛贡献度，从周目标的贡献度将不计算)", 2, "参加/_foretask", "放弃/tong_cancel");
end

--设置为候选人,并安排先决任务,为帮会贡献2240点贡献度
function _foretask()
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 1);--设为帮主候选人
	Say("恭喜, 你已成为被提名的人，快去领取2240 贡献度.", 1, "确认/tong_cancel");
	local tbMsg = {
		mastercandidat	 = GetTongMemberID()
		};
	cTongLog:WriteInfTB("TONG", "master_candidat", nTongID, tbMsg);
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, GetCumulateOffer()); --记录当前手工贡献度,作为2240任务的起始标志
end

--让用户输入要投的钱数
function inputcontributiveness()
	AskClientForNumber("tong_masterbidding", 1, 500000000, "请输入数字 ");
end

-- 竞投，注意保存每个人的竞投日期,已便并列的时候进行排列
function tong_masterbidding(nContributiveness )
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrsecond = GetCurServerTime();

	--计算将要扣除贡献度
	local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);--上次投过的
	local nCurrTotalOffer = nLastContributiveness + nContributiveness; --总共投过的
	local nDeductContributiveness = ceil((nContributiveness/ 20));--要扣除的贡献度
	local nNewcontrvalue = GetContribution() - nDeductContributiveness;
	
	if (nNewcontrvalue < 0) then
		Say("贡献度小于 5% 已输入数字，不能参加.", 0);
		return
	end
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, nCurrTotalOffer)
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, dwCurrsecond)--记录竞投时间,当贡献度相同的时候，先来者优先
	
	Say("操作成功:"..tostring(nCurrTotalOffer), 0);
	AddContribution((-nDeductContributiveness));

	local tbMsg = {
		contribution     = nCurrTotalOffer,
		selfcommend_time = FormatTime2String(dwCurrsecond)
		}
	cTongLog:WriteInfTB("TONG", "master_bidding", nTongID, tbMsg)
end

---仿制定国安绑---------------------------------------------------------------------------
--仿制定国安绑的表
ab_detail = {
			[1] = {"安邦田黄石玉佩", "活动坊总管: 买 <color=yellow>[仿制] 安邦田黄石玉佩<color> 需要<color=yellow>200<color> 贡献度, 你同意吗?", 200, 218},
			[2] = {"安邦菊花石指环", "活动坊总管: 买 <color=yellow>[仿制] 安邦菊花石指环 <color> 需要<color=yellow>500<color> 贡献度, 你同意吗?", 500, 217},
			[3] = {"安邦鸡血石戒指", "活动坊总管: 买 <color=yellow>[仿制] 安邦鸡血石戒指color> 需要<color=yellow>500<color> 贡献度, 你同意吗?", 500, 219},
			[4] = {"安邦冰晶石项链", "活动坊总管: 买 <color=yellow>[仿制] 安邦冰晶石项链<color> 需要<color=yellow>1000<color> 贡献度, 你同意吗?", 1000, 216}
};
function enter_anbang()
	--安邦的选项
	local tab_ab_content = {};
	local nLoop = 4;

	tinsert(tab_ab_content, "了解仿制安邦/tong_ab_about");
	for i = 1, nLoop do
		tinsert(tab_ab_content, "我想买 "..ab_detail[i][1].." ("..ab_detail[i][3].." 贡献度) /#tong_ab_get("..i..")");
	end;
	tinsert(tab_ab_content, "离开/tong_cancel");
	Say("祭坛：哈哈哈！最近，帮会仿制了安邦装备，虽然只是模仿，但是它的效果也不比真的安邦差，此外，当与真的安邦一起使用时，也可以激活。你想买吗？",
	getn(tab_ab_content), tab_ab_content);
end;

function tong_ab_about()
	Say("：祭坛：这是仿制安邦，虽然性能与真的有差别，但是制作原料便宜很多。你可以买 <color=yellow>[仿制] 安邦菊花石指环<color>, <color=yellow>[仿制] 安邦鸡血石戒指color>, <color=yellow>[仿制] 安邦田黄石玉佩<color>, <color=yellow>[仿制] 安邦冰晶石项链<color>.", 0);
end;

function tong_ab_get(nIndex)
	if (nIndex < 1 or nIndex > 4) then
		return
	end;
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	if (GetContribution() < ab_detail[nIndex][3]) then
		Say("祭坛:  个人贡献度不够 <color=yellow>"..ab_detail[nIndex][3].."<color> 点, 不能买该物品, 请先努力找贡献度.", 0);
		Msg2Player("个人贡献度不够, 不能使用该功能.");
		SetTaskTemp(193, 0);
		return
	end;
	
	AddGoldItem(0, ab_detail[nIndex][4]);
	AddContribution(-ab_detail[nIndex][3]);
	Msg2Player("使用 <color=yellow>"..ab_detail[nIndex][3].." 贡献度<color>  买 1<color=yellow>"..ab_detail[nIndex][1].."<color>.")
	SetTaskTemp(193, 0);
end;

-------------------------------帮会升级奖励---------------------------------------
aTongLevelUpPrice = {
	[2] = {	--2级时：boss符，武神之印，高级辉煌之果
		{20, 100, 200},
		{10, 100, 50},
		{8, 100, 50},
		{6, 100, 50},
		{4, 100, 50},
		{2, 100, 50},
		{1, 100, 50},
	},
	[4] = {	--4级时：boss符，武神之印，高级辉煌之果
		{30, 200, 200},
		{20, 200, 100},
		{15, 200, 100},
		{10, 200, 100},
		{8, 200, 100},
		{6, 200, 100},
		{4, 200, 100},
	}									}

function LUP_HelpInfo()
	Say("只需要其中一个 <color=red>7<color> 带头帮会的建设等级达到级别<color=yellow>2<color> 或者<color=yellow>4<color>, "..
	 	"将由帮主到我这领奖，奖品可能是召唤boss令牌，武神印及高级辉煌果，等级越高，奖励越多.",
	 	3, "我的帮会够条件了，想领奖/LUP_GetPrice", "我想看奖品内容级的奖励/#LUP_PriceInfo(nil)", "知道了/tong_cancel")	
end

function LUP_PriceInfo(nLevel, nOrder)
	if (nLevel == nil) then		
		Say("请选择", 4, "当建设等级达到2级的奖励级的奖励/#LUP_PriceInfo(2)", "当建设等级达到4级的奖励/#LUP_PriceInfo(4)",
			 "返回/LUP_HelpInfo", "离开/tong_cancel")
	elseif nOrder == nil then
		local S = {i = 0, l = nLevel}
		function S:GenParam()
			self.i = self.i+1
			return "等级 "..self.i.."奖励/#LUP_PriceInfo("..self.l..","..self.i..")"
		end
		Say("请选择", 9, S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(),
			"返回/#LUP_PriceInfo(nil)", "离开/tong_cancel")
	else
		Say("帮会可以获得<color=yellow>召唤boss令牌10级<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][1].." <color>级, <color=yellow>武神印<color>(Sau khi 使用, 2小时内贡献度获得将为双倍)<color=green> "..aTongLevelUpPrice[nLevel][nOrder][2].." <color> 级, <color=yellow>高级辉煌果<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][3].." <color> 个",2,
			"返回/#LUP_PriceInfo("..nLevel..",nil)", "离开/tong_cancel")
	end
end

function LUP_PriceInfo2()
	Say("", 4, "当建设等级达到2级时的奖励/LUP_PriceInfo2", "当建设等级达到2级时的奖励/LUP_PriceInfo4",
		 "返回/LUP_HelpInfo", "离开/tong_cancel")
end

function LUP_GetPrice()
	local _,nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	--如果不是帮主
	if (figure ~= TONG_MASTER) then
		Say("真是遗憾，只有帮主才能领奖.", 0)
		return
	end
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("不行了, 不会不是其中1个 <color=red>7<color> 第一个达到等级的帮会"..nLevel..", 不能领奖.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "贵帮是第 <color=red>"..nOrder.."<color> 升级到<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", 奖励已经领完了.", 0)
		return
	elseif (nPrice < 0) then --没领过奖
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	local tbSel = {}
	if (nBossFu > 0)then
		tinsert(tbSel, "提前领取 "..nBossFu.." 等级为10级的召唤boss令牌/#LUP_GivePrice(1,"..nBossFu..")")
	end
	if (nContributionPie >= 1 and nContributionPie < 20)then
		tinsert(tbSel, "领取"..nContributionPie.." 个武神印/#LUP_GivePrice(2,"..nContributionPie..")")
	elseif (nContributionPie >= 20)then
		tinsert(tbSel, "提前领取 20 个武神印/#LUP_GivePrice(2, 20)")
		if (nContributionPie >= 40)then
			tinsert(tbSel, "提前领取 40 个武神印/#LUP_GivePrice(2, 40)")
			if (nContributionPie >= 60)then
				tinsert(tbSel, "提前领取 60 个武神印/#LUP_GivePrice(2, 60)")
			end	
		end
	end
	if (nFruit >= 1 and nFruit < 20)then
		tinsert(tbSel, "领取"..nFruit.." 个高级辉煌果/#LUP_GivePrice(3,"..nFruit..")")
	elseif (nFruit >= 20)then
		tinsert(tbSel, "提前领取 20 个高级辉煌果/#LUP_GivePrice(3, 20)")
		if (nFruit >= 40)then
			tinsert(tbSel, "提前领取 40 个高级辉煌果/#LUP_GivePrice(3, 40)")
			if (nFruit >= 60)then
				tinsert(tbSel, "提前领取 60 个高级辉煌果/#LUP_GivePrice(3, 60)")
			end	
		end
	end	
	tinsert(tbSel, "暂时不拿/tong_cancel")
	Say(szOrder..", 目前有 <color=yellow>"..nBossFu.."<color> 个<color=yellow>10级召唤boss令牌<color>, <color=yellow>"..nContributionPie.."<color> 个<color=yellow>武神印<color> v?<color=yellow> "..nFruit.."<color> <color=yellow>高级辉煌之果<color>可以领取，请决定此次领取物品及数量多少。", 
		getn(tbSel), tbSel)
end

function LUP_GivePrice(nWhich, num)
	local aName = {"10级召唤boss令牌", "武神印", "辉煌果(高级) "}
	Say("Х 提前领取 <color=yellow>"..num.."<color> <color=yellow>"..aName[nWhich].."<color>, 请确保装备够空位, 如果有东西掉落下来被他人捡走，不要怪我没有提醒你。", 
		2, "我知道了!级的奖励/#LUP_GivePrice_OK("..nWhich..","..num..")", "让我看看装备先./tong_cancel")
end

function LUP_GivePrice_OK(nWhich, num)
	local _,nTongID = GetTongName();	
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("真是遗憾，贵帮不属于7个最前列的帮会，级别达到"..nLevel..", 不能领奖.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "贵帮是第<color=red>"..nOrder.."<color> 升级到<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", 奖励已经领完了.", 0)
		return
	elseif (nPrice < 0) then --没领过奖
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	if nWhich == 1 then
		if (nBossFu < num)then
			return
		end
		nBossFu = nBossFu - num
		--奖励召唤符
		for i = 1,num do
			AddItem(6,1,1022,10,0,0,0)
		end
		local szMsg = GetName().."领取帮会升级奖励: 10级召唤boss令牌"..num.."个"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	elseif nWhich == 2 then
		if (nContributionPie < num)then
			return
		end
		nContributionPie = nContributionPie - num
		--奖励武神之印(一个月有效)
		local ntime = GetCurServerTime() + 7 * 24 * 3600;
		local nTimeParam = tonumber(FormatTime2String("%y%m%d",ntime))	
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,1264,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
			SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
			SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."领取帮会升级奖励: 武神印"..num.."个"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)		
	elseif nWhich == 3 then
		if nFruit < num then
			return
		end
		nFruit = nFruit - num
		local ntime = tonumber(date("%y%m%d"));
		--奖励高级辉煌之果
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,906,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."领取帮会升级奖励: 辉煌果高级 级"..num.."个"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	end	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, 1000 * 1000 * nFruit + 1000 * nContributionPie + nBossFu)
end

function tong_cancel()
end

