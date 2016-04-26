Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
PhongVanLenhBai2011 = {}
PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES1 = 3090
PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES2 = 3091
PhongVanLenhBai2011.TASK_DAILY_WEEKEND_AWARD = 3092
PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES1 = 3093
PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES2 = 3094
PhongVanLenhBai2011.TASK_COUNT_WEEKEND_AWARD = 3095
PhongVanLenhBai2011.tbAwardDaily1 = 
{
	[1]  =
	{
		{szName = "杀手锏( 90级)", tbProp = {6, 1, 400, 90,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "英雄帖", tbProp = {6, 1, 1604,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "天龙令", tbProp = {6, 1, 2256,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "辉煌果(高) ", tbProp = {6, 1, 906,1,0,0}, nCount = 3, nExpiredTime = 10080, nBindState = -2},
		{szName = "宋金飞速丸", tbProp = {6, 1, 190,1,0,0}, nCount = 50, nExpiredTime = 43200, nBindState = -2},
		{szName = "令牌", tbProp = {6, 1, 157,1,0,0}, nCount = 50, nExpiredTime = 43200, nBindState = -2},
	},
	[2] =
	{
		{szName = "银两", nJxb =1000000, nRate = 34, nCount = 1},
		{szName = "银两", nJxb =2000000, nRate = 33, nCount = 1},
		{szName = "银两", nJxb =3000000, nRate = 33, nCount = 1},
	},
	[3] =
	{
		{szName = "仙草露", tbProp = {6,1,71,1,0,0}, nCount = 5, nRate = 50, nBindState = -2},
		{szName = "特别仙草露", tbProp = {6,1,1181,1,0,0}, nCount = 5, nRate = 50, nBindState = -2},
	},
	[4] =
	{
		{szName = "百年珍露", tbProp = {6,1,2266,1,0,0}, nCount = 1, nRate =34, nExpiredTime = 10080, nBindState = -2},
		{szName = "千年珍露", tbProp = {6,1,2267,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 10080, nBindState = -2},
		{szName = "万年珍露",tbProp = {6,1,2268,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 10080, nBindState = -2},
	},
}

PhongVanLenhBai2011.tbAwardDaily2 =
{
	[1] =
	{
		{szName = "富贵锦囊", tbProp = {6, 1, 2402,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "玉罐", tbProp = {6, 1, 2311,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "令牌", tbProp = {6, 2, 1020,1,0,0}, nCount = 40, nExpiredTime = 10080, nBindState = -2, CallBack = function (nItemIndex) SetItemMagicLevel(nItemIndex, 1, random(211,216)) end},
		{szName = "木人令牌", tbProp = {6, 1, 2969,1,0,0}, nCount = 40, nExpiredTime = 10080, nBindState = -2},
	},
	[2] =
	{
		{szName = "龙血丸", tbProp = {6,1,2117,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "海龙珠子", tbProp = {6,1,2115,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "水贼令牌", tbProp = {6,1,2745,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "天宝库令", tbProp = {6,1,2813,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "炎帝令", tbProp = {6,1,1617,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
	},
}

PhongVanLenhBai2011.tbWeekendAward = 
{
	[1] =
	{
		{szName = "黄金印3级 (强化)", tbProp = {0,3207}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "黄金印4级 (强化)", tbProp = {0,3208}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "黄金印5级 (强化)", tbProp = {0,3209}, nRate = 16, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "黄金印3级(弱化)", tbProp = {0,3217}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "黄金印4级(弱化)", tbProp = {0,3218}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "黄金印5级(弱化)", tbProp = {0,3219}, nRate = 16, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[2] =
	{
		{szName = "黄金之果", tbProp = {6, 1,907,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "混元灵露", tbProp = {6, 1,2312,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "山河社稷地图(1000块)", tbProp = {6, 1,2514,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "元帅面具", tbProp = {0, 11,447,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[3] =
	{
		{szName = "白驹丸", tbProp = {6, 1, 74, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 34, nBindState = -2},
		{szName = "大白驹丸", tbProp = {6, 1, 130, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 33, nBindState = -2},
		{szName = "特别白驹丸", tbProp = {6, 1, 1157, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 33, nBindState = -2},
	},
	[4] =
	{
		{szName = "白驹丸技能", tbProp = {6, 1, 1372,1,0,0}, nRate = 34, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "大白驹丸(技能) ", tbProp = {6, 1, 977,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "白驹丸特别技能", tbProp = {6, 1, 1182,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[5] =
	{
		{szName = "四海逍遥丹礼盒", tbProp = {6, 1, 2398,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
		{szName = "九天云游丹礼盒", tbProp = {6, 1, 2400,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
		{szName = "五洲凌空丹礼盒", tbProp = {6, 1, 2399,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
	},
	[6] =
	{
		{szName = "百年辉煌果",tbProp = {6, 1, 2269,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
		{szName = "千年辉煌果", tbProp = {6, 1, 2270,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
		{szName = "万能辉煌果", tbProp = {6, 1, 2271,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},

	},
} 

function PhongVanLenhBai2011:ShowDialogDaily()
	--检查输入风云令牌code码 
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "阁下不足条件参加活动.")
		return
	end
	local nDay = tonumber(date("%w"))
	local nTime =tonumber(GetLocalDate("%H%M"))
	local szTitle = "每日奖励"
	local tbOpt = {}
	
	if (nTime >= 0 and nTime <= 1400) then
		tinsert(tbOpt,  "每日奖励/#PhongVanLenhBai2011:GetDailyAwardTimes1()")
	else
		tinsert(tbOpt,  "每日奖励/#PhongVanLenhBai2011:GetDailyAwardTimes2()")
	end
	
	if (nDay == 5 or nDay == 6 or nDay == 0) then
		tinsert(tbOpt,  "周末领奖励/#PhongVanLenhBai2011:GetWeekendAward()")
	end
	tinsert(tbOpt,  "不需要什么/#PhongVanLenhBai2011:Cancel()")
	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function PhongVanLenhBai2011:GetDailyAwardTimes1()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"需要是第二次转生人物才能获得该奖励","==") ~= 1) then
		return
	end
	
	 if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_AWARD_TIMES1, 1, "今天大侠已经领该奖了，明天再来吧", "<") ~= 1)then
	 	return
	 end
	 
	local nGetAwardTimes = GetTask(self.TASK_COUNT_DAILY_AWARD_TIMES1)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "该奖励最多只能领取60次!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "大侠的装备不足59个空位!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_AWARD_TIMES1, 1)
	SetTask(self.TASK_COUNT_DAILY_AWARD_TIMES1, nGetAwardTimes + 1)
	tbAwardTemplet:Give(self.tbAwardDaily1, 1, {"PhongVanLenhBai2011", "领第一次每日奖励"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "领第一次每日奖励", "N/A", 1)
end

function PhongVanLenhBai2011:GetDailyAwardTimes2()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"需要是第二次转生人物才能获得该奖励","==") ~= 1) then
		return
	end
	
	 if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_AWARD_TIMES2, 1, "今天大侠已经领该奖了，明天再来吧", "<") ~= 1)then
	 	return
	 end
	 
	local nGetAwardTimes = GetTask(self.TASK_COUNT_DAILY_AWARD_TIMES2)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "该奖励最多只能领取60次!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "大侠的装备不足59个空位!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_AWARD_TIMES2, 1)
	SetTask(self.TASK_COUNT_DAILY_AWARD_TIMES2, nGetAwardTimes + 1)
	
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(2000)
		Msg2Player("您获得2000帮会贡献点")
--		WriteLog(date("%Y%m%d %H%M%S").."\t".."PhongVanLenhBai2011"..GetAccount().."\t"..GetName().."\t".."获得2000帮会贡献点")
		tbLog:PlayerActionLog("PhongVanLenhBai", "每日领奖第二次", "2000帮会贡献点")
	end
	
	tbAwardTemplet:Give(self.tbAwardDaily2, 1, {"PhongVanLenhBai2011", "NhanThuongHangNgayLan2"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "每日领奖第二次", "N/A", 1)
end

function PhongVanLenhBai2011:GetWeekendAward()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"需要是第二次转生人物才能获得该奖励","==") ~= 1) then
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_WEEKEND_AWARD, 1, "今天大侠已经领该奖了，明天再来吧", "<") ~= 1)then
	 	return
	 end
	
	local nGetAwardTimes = GetTask(self.TASK_COUNT_WEEKEND_AWARD)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "该奖励最多只能领取60次!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "大侠的装备不足59个空位!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_WEEKEND_AWARD, 1)
	SetTask(self.TASK_COUNT_WEEKEND_AWARD, nGetAwardTimes + 1)
	tbAwardTemplet:Give(self.tbWeekendAward, 1, {"PhongVanLenhBai", "领取周末奖励"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "领取周末奖励", "N/A", 1)
end

