Include("\\script\\activitysys\\config\\37\\head.lua")
Include("\\script\\activitysys\\config\\37\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")


function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1566,2944,},
		[2] = {78,1572,3232,},
		[3] = {162,1588,3145,},
	}
	local tbNpc = {	
			szName = "圣诞老人", 
			nLevel = 95,
			nNpcId = 1880,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:YDBZ_GiveStar(YDBZ_mission_match, nTeam)
	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_mission_match, idx, nTeam )
		if pidx > 0 then
			PlayerIndex = pidx
			if PlayerFunLib:CheckTotalLevel(150, "", ">=") == 1 then
				nPlayerCount = nPlayerCount + 1
				tbPlayer[nPlayerCount] = {pidx, 1}
			end
		end
		
		if idx == 0 then
			break;
		end
	end 
	
	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, ITEM_XMAS_STAR, 1, EVENT_LOG_TITLE, "YDBZ_GiveStar")
	end	
end

-- 上线领取裤子
function pActivity:GiveXmasTrousers()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- 最近一次记录的时间和领取时间是同一天
		nLastOnLineTime = self:GetTask(TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()
		-- 根据时间差可获得的圣诞裤子的个数
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else -- 最近一次记录时间和领取的时候不是同一天
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS
	end
	
	nCount = nHour * 10
	if nCount <= 0 then
		Msg2Player("与上次领取相隔时间,你的上网时间不足1小时，不能领取")
		return 
	end
	local nMaxCount = 50 -  self:GetTaskDaily(TSK_XMAS_TROUSERS_DAILY)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("今天你不能再领取了，明天再来吧.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	
	-- 更新领取的时间
	self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(ITEM_XMAS_TROUSERS,nMaxCount, EVENT_LOG_TITLE, "GiveXmasTrousers")
	--活动3 - modified by DinhHQ - 20111215
	local tbPumpkinPie = {szName="南瓜饼",tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,}
	PlayerFunLib:GetItem(tbPumpkinPie,floor(nMaxCount/10)*40, EVENT_LOG_TITLE, "GivePumpkinPie")
	self:AddTaskDaily(TSK_XMAS_TROUSERS_DAILY, nMaxCount)
end


function pActivity:CheckRandom(nSuccess, szFailLog)
	local rcur=random(1,100)
	if rcur <= nSuccess then
		return 1
	else
		Msg2Player("真遗憾,此次合成失败了，请再试一次!")
		szFailLog = szFailLog or ""
		%tbLog:PlayerActionLog(szFailLog, EVENT_LOG_TITLE)
		return 0
	end
end

-- 合成圣诞礼盒
function pActivity:ComposeXmasGift(nCount)
	for i=1,nCount do
		local nSuccess = 70
		if self:CheckRandom(nSuccess,"GhepHopQuaNoelThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "圣诞礼盒", tbProp={6,1,3080,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "成功合成圣诞礼盒")
		end
	end
end

-- 合成圣诞老人（小）
function pActivity:ComposeXmasPerson_S(nCount)
	for i=1,nCount do
	--Change request Event Noel - Modified by DinhHQ - 20111129
		local nSuccess = 70
		if self:CheckRandom(nSuccess, "合成雪人（小）失败") == 1 then
			PlayerFunLib:GetItem({szName = "圣诞老人（小）", tbProp={6,1,3077,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "合成雪人（小）成功")
		end
	end
end

function pActivity:GiveItemAward(tbAward, tbComposeLog, szLogAction, nTaskId)
	tbAwardTemplet:Give(tbAward, 1 , {EVENT_LOG_TITLE, szLogAction})
	local nCount = self:GetTask(nTaskId) + 1
	self:SetTask(nTaskId, nCount)
	if tbComposeLog[nCount] then
		tbLog:PlayerActionLog(tbComposeLog[nCount], EVENT_LOG_TITLE)
	end
end

function pActivity:UseXmasPerson_S()
	local tbAward = 
	{
		[1]={nExp=2000000,},
	}
	local tbUseLog = {
		[500] = "使用500次雪人（小）",
		[1000] = "使用1000次雪人（小）",
		}

	self:GiveItemAward(tbAward, tbUseLog, "UseXmasPerson_S", TSK_XMAS_PERSON_S_LIMIT)
end

function pActivity:UseXmasPerson_M()
	local tbAward = 
	{
		[1]={szName="玄晶矿石",tbProp={6,1,147,1,0,0},},
		[2]={nExp_tl=1,},
	}
	local tbUseLog = {
		[50] = "使用50次雪人(中)",
		[100] = "使用100次雪人(中)",
		[150] = "使用150次雪人(中)",
		[200] = "使用200次雪人(中)",
		}
	
	self:GiveItemAward(tbAward, tbUseLog,"使用雪人(中)领取物品", TSK_XMAS_PERSON_M_LIMIT)
end

function pActivity:UseXmasPerson_L()
	local tbAward = 
	{
		[1]={nExp=10e6,},
		[2]={
			{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.04},
			{szName="金乌金牌",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
			{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
			{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
			{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
			{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.02},
			{szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
			{szName="呈祥红包",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
			{szName="宋金招兵令",tbProp={6,1,30083,1,0,0},nCount=2,nRate=2},
			{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},
			{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2},
			{szName="黄金印(强)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="黄金印 (弱)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="杀手锏礼包",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
			{szName="乾坤造化丹(大) ",tbProp={6,1,215,1,0,0},nCount=5,nRate=3},
			{szName="紫莽之宝(帽子)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={1,0,0,0,0,0}},
			{szName="紫莽之宝(衣服)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={5,0,0,0,0,0}},
			{szName="紫莽之宝(项链)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={0,0,0,0,0,0}},
			{szName="紫莽之宝(玉佩)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={8,0,0,0,0,0}},
			{szName="紫莽之宝(鞋)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={7,0,0,0,0,0}},
			{szName="紫莽之宝(手套)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={3,0,0,0,0,0}},
			{szName="紫莽之宝(上戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},
			{szName="紫莽之宝(下戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},
			{szName="紫莽之宝(腰带)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={4,0,0,0,0,0}},
			{szName="紫莽之宝(武器)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={6,0,0,0,0,0}},
			{szName = "经验值", nExp=8000000,nRate=35},
			{szName = "经验值", nExp=10000000,nRate=16},
			{szName = "经验值", nExp=15000000,nRate=6},
			{szName = "经验值", nExp=20000000,nRate=1.37},
			{szName = "经验值", nExp=50000000,nRate=0.5},
			{szName = "经验值", nExp=100000000,nRate=0.5},
			{szName = "经验值", nExp=200000000,nRate=0.01},
		},		
	}
	local tbUseLog = {
		[50] = "使用g50次雪人(大)",
		[100] = "使用100次雪人(大)",
		[200] = "使用200次雪人(大)",
		[300] = "使用300次雪人(大)",
		[400] = "使用400次雪人(大)",
		[500] = "使用500次雪人(大)",
		[600] = "使用600次雪人(大)",
		[700] = "使用700次雪人(大)",
		[800] = "使用800次雪人(大)",	
		}
	local tbExtAward = {
		[50] = {nExp=20000000,},
		[100] = {nExp=20000000,},
		[200] = {nExp=20000000,},
		[300] = {nExp=20000000,},
		[400] = {nExp=30000000,},
		[500] = {nExp=40000000,},
		[600] = {nExp=50000000,},
		[700] = {nExp=60000000,},
		[800] = {nExp=100000000,},
	}
	--补充大雪人使用达标奖励- Modified By DinhHQ - 20111129
	local nCount = self:GetTask(TSK_XMAS_PERSON_L_LIMIT) + 1
	if tbExtAward[nCount] then
		tbAwardTemplet:Give(tbExtAward[nCount], 1 , {EVENT_LOG_TITLE, tbUseLog[nCount]})
	end
	self:GiveItemAward(tbAward, {}, "SuDungNguoiTuyet(lon)NhanVatPham", TSK_XMAS_PERSON_L_LIMIT)	
end

function pActivity:UseXmasGift()
	local tbAward = 
	{
		[1]={nExp=1e6,},		
	}
	local tbUseLog = {
		[1000] = "SuDung1000HopQuaNoel",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasGift", TSK_XMAS_GIFT_LIMIT)	
end

function pActivity:UseXmasCake()
	local tbAward = 
	{
		nExp=500000,
	}
	local tbUseLog = {
		[1000] = "使用1000圣诞饼",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasCake", TSK_XMAS_CAKE_LIMIT)	
end

function pActivity:PlayerOnLogin()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- 与最近记录不是同一天
		nCurrentOnLineTime = GetGameTime()
		self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	end
end

function pActivity:CheckTimeGetCompensation()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112020900 or nNowDate >= 201112040000 then
		Talk(1, "", "请原谅，目前已过领奖时间")
		return nil
	end
	return 1
end
--Ho箃 ng th?3 - Modified By DinhHQ - 20111215
function pActivity:CheckTimeGetFreeExp()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112240000 or nNowDate >= 201112252400 then
		Talk(1, "", "请原谅，目前已过领奖时间")
		return nil
	end
	return 1
end

function pActivity:UseXmasPerson_Pink()
	local nUsedCount = GetTask(2916)
	local nCurCount = nUsedCount + 1
	if nCurCount > 1500 then
		Talk(1, "", "使用物品达到上限，不能再使用了.")
		return nil
	end
	SetTask(2916, nCurCount)	
	if GetTask(2916) ~= nCurCount then
		return nil
	end
	local tbExpAward = {
		[1] = {szName = "经验值", nExp = 6e6},
		[2] = {{szName="Ng玦 Sao",tbProp={6,1,3081,1,0,0},nCount=1,nRate=40, nExpiredTime = 20120101},},
	}
	tbAwardTemplet:Give(tbExpAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	local tbBonusAward = {
		[100] = {{szName = "不叠加经验值", nExp = 5e6}, "使用100O个圣诞老人奖励"},
		[200] = {{szName = "不叠加经验值", nExp = 10e6}, "使用200O个圣诞老人奖励"},
		[300] = {{szName = "不叠加经验值", nExp = 10e6}, "使用300O个圣诞老人奖励"},
		[400] = {{szName = "不叠加经验值", nExp = 20e6}, "使用400O个圣诞老人奖励"},
		[500] = {{szName = "不叠加经验值", nExp = 20e6}, "使用500O个圣诞老人奖励"},
		[600] = {{szName = "不叠加经验值", nExp = 20e6}, "使用600O个圣诞老人奖励"},
		[700] = {{szName = "不叠加经验值", nExp = 20e6}, "使用700O个圣诞老人奖励"},
		[800] = {{szName = "不叠加经验值", nExp = 30e6}, "使用800O个圣诞老人奖励"},
		[900] = {{szName = "不叠加经验值", nExp = 30e6}, "使用900O个圣诞老人奖励"},
		[1000] = {{szName = "王者面具", tbProp = {0,11,561,1,0,0}, nExpiredTime = 20160, nCount=1}, "使用1000O个圣诞老人奖励"},
		[1100] = {{szName = "不叠加经验值", nExp = 40e6}, "使用1100O个圣诞老人奖励"},
		[1200] = {{szName = "不叠加经验值", nExp = 40e6}, "使用1200O个圣诞老人奖励"},
		[1300] = {{szName = "不叠加经验值", nExp = 40e6}, "使用1300O个圣诞老人奖励"},
		[1400] = {{szName = "不叠加经验值", nExp = 50e6}, "使用1400O个圣诞老人奖励"},
		[1500] = {{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1}, "使用1500O个圣诞老人奖励"},
	}
	if tbBonusAward[nCurCount] then
		tbAwardTemplet:Give(tbBonusAward[nCurCount][1], 1 , {EVENT_LOG_TITLE, tbBonusAward[nCurCount][2]})
		Msg2Player(format("祝贺阁下使用到%d圣诞老人物品，活动奖励%s", nCurCount, tbBonusAward[nCurCount][1].szName))
	end
	local tbItemAward = {
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌金牌",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
		{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.03},
		{szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="特别白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="积功助力丸",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1.2},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1.5},
		{szName="翻羽",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=259200},
		{szName="翻羽",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=129600},
		{szName="阴阳活血丹",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1.2},
		{szName="回天再造礼盒",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.6},
		{szName="黄金印(强化)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="黄金印 (弱化)",tbProp={0,3221},nCount=1,nRate=0.11,nQuality = 1,nExpiredTime=10080,},
		{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "经验值", nExp=5000000,nRate=40},
		{szName = "经验值", nExp=8000000,nRate=13},
		{szName = "经验值", nExp=10000000,nRate=10},
		{szName = "经验值", nExp=15000000,nRate=5},
		{szName = "经验值", nExp=20000000,nRate=1},
		{szName = "经验值", nExp=50000000,nRate=0.5},
		{szName = "经验值", nExp=100000000,nRate=0.01},
	}
	tbAwardTemplet:Give(tbItemAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	
end

pActivity.nPak = curpack()
