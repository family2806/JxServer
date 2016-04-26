Include("\\script\\activitysys\\config\\1008\\head.lua")
Include("\\script\\activitysys\\config\\1008\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1008\\give_rose_toplist.lua")
Include("\\script\\activitysys\\config\\1008\\award_ext.lua")

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1446,3255,},		
	}
	local tbNpc = {	
			szName = "月儿", 
			nLevel = 95,
			nNpcId = 1849,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:PlayerOnLogin()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)	
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0	
	if nDate ~= nNowDate then
		nCurrentOnLineTime = GetGameTime()		
		SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		SetTask(%TSK_LAST_ONLINEDATA,nNowDate)		
	end
end

function pActivity:GiveRedCandle()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then
		nLastOnLineTime = GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()	
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS		
	end
	nCount = nHour	
	if nCount <= 0 then
		Msg2Player("上次领取间隔，你的上网时间不足一小时，不能领")
		return 
	end
	local nMaxCount = 3 -  PlayerFunLib:GetTaskDailyCount(%TSK_ONLINE_AWARD_DAILY_LIMIT)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("今天你不能领取了，明天再来吧.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
		
	SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	SetTask(%TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(%ITEM_RED_CANDLE,nMaxCount, EVENT_LOG_TITLE, "Online领红蜡烛")
	PlayerFunLib:AddTaskDaily(%TSK_ONLINE_AWARD_DAILY_LIMIT, nMaxCount)
end

function pActivity:UseCoolTea()
	local tbAward = {
		[1] = {nExp=6000000,},
		[2] = {
			{szName = "玫瑰", tbProp = {6,1,30172,1,0,0}, nCount = 1, nRate = 50, nExpiredTime = 20120301},
		}
	}
	local tbExtAward = {
		[100] = {nExp = 10e6},
		[200] = {nExp = 10e6},
		[300] = {nExp = 10e6},
		[400] = {nExp = 10e6},
		[500] = {nExp = 20e6},
		[600] = {nExp = 20e6},
		[700] = {nExp = 20e6},
		[800] = {nExp = 20e6},
		[900] = {nExp = 20e6},
		[1000] = {nExp = 30e6},
		[1100] = {nExp = 30e6},
		[1200] = {nExp = 30e6},
		[1300] = {nExp = 40e6},
		[1400] = {nExp = 50e6},
		[1500] = {szName="金乌令",tbProp = {6,1,2349,1,0,0}, nCount=1},
	}
	local tbExtLog = {
		[100] = {"使用解热茶100次"},
		[200] = {"使用解热茶200次"},
		[300] = {"使用解热茶300次"},
		[400] = {"使用解热茶400次"},
		[500] = {"使用解热茶500次"},
		[600] = {"使用解热茶600次"},
		[700] = {"使用解热茶700次"},
		[800] = {"使用解热茶800次"},
		[900] = {"使用解热茶900次"},
		[1000] = {"使用解热茶1000次"},
		[1100] = {"使用解热茶1100次"},
		[1200] = {"使用解热茶1200次"},
		[1300] = {"使用解热茶1300次"},
		[1400] = {"使用解热茶1400次"},
		[1500] = {"使用解热茶1500次"},
	}
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_TEA_USING,1)
	local nUsedCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_TEA_USING)
	if tbExtAward[nUsedCount] then
		tbAwardTemplet:Give(tbExtAward[nUsedCount], 1 , {%EVENT_LOG_TITLE, tbExtLog[nUsedCount]})
	end
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "SuDungTraGiaiNhiet"})
	local tbItemAward = %tbAward_Ext["CoolTea"]
	if tbItemAward then
		tbAwardTemplet:Give(tbItemAward, 1 , {%EVENT_LOG_TITLE, "使用解热茶"})
	end
end

function pActivity:CastSkillOnUsingBlueGift()
	local nSkillId = 688
	local _,nX32,nY32 = GetWorldPos()
	CastSkill(nSkillId, 1, nX32*32, nY32*32)
end

function pActivity:GiveRose(nCount)	
	local nLastCount = GetTask(%TSK_GIVE_ROSE_COUNT)
	local nCurCount = nLastCount + nCount
	SetTask(%TSK_GIVE_ROSE_COUNT, nCurCount)
	local nWhiteGiftCount = floor(nCurCount/10) - floor(nLastCount/10)
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "目前已过了玫瑰活动排名统计时间，交玫瑰不能算入排名.")
	else
		%tbTop10:GiveRose(GetName(), GetAccount(), nCurCount)
	end
	if nWhiteGiftCount > 0 then
		local tbAward = {szName = "白色礼盒", tbProp = {6,1,30175,1,0,0}, nCount = nWhiteGiftCount, nExpiredTime = 20120301}
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "交10枝玫瑰的奖励"})
	end	
end

function pActivity:GiveRoseCheckTime()
	if %tbTop10:CheckTime() == 1 then
		Talk(1, "", "系统正进行排名，请稍候再来.")		
		return nil
	end
	
	return 1
end

function pActivity:ShowTopList()
	%tbTop10:ShowTopList()
end

function pActivity:TopListAwardCheckTime()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "目前不是领奖时间，请大侠不要着急.")
		return nil
	end
	return 1
end

function pActivity:GetTopListAward(nRank)
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "目前不是领奖时间，请大侠不要着急.")
		return nil
	end
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	if ncurrank ~= nRank then
		Talk(1, "", "阁下没有该奖励，请坚持一下.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD) ~= 0 then
		Talk(1, "", "阁下已领该奖了.")
		return nil
	end
	if %tbTop10:CheckCanGetAward(nRank) == 1 then
		Talk(1, "", "奖励已有主人了")
		return nil
	end
	
	tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD, 1)
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD) ~= 1 then
		Talk(1, "", "不能更新资料，请联系管理处解决.")
		return nil
	end
	%tbTop10:GiveAward(nRank)
	local tbAward = {
		[1] = {tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}},
		[2] = {szName="面具-英雄战场",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=86400,nUsageTime=-1},
		[3] = {nExp_tl = 2e9},
	}
	tbAwardTemplet:Give(tbAward[nRank], 1, {%EVENT_LOG_TITLE, "排名奖励"..nRank})
end

function pActivity:BlueGiftAddTask()
	tbLog = {
		[500] = "使用500次绿色果",
		[1000] = "使用1000次绿色果",
	}
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_BLUE_GIFT_USING,1)
	local val = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_BLUE_GIFT_USING)
	if tbLog[val] then
		tbLog:PlayerActionLog(%EVENT_LOG_TITLE,tbLog[val])
	end
end

function pActivity:WhiteGiftAddTask()
	PlayerFunLib:AddTaskDaily(%TSK_USE_WHITE_GIFT_DAILY_LIMIT, 1)	
	local val = PlayerFunLib:GetTaskDailyCount(%TSK_USE_WHITE_GIFT_DAILY_LIMIT)
	if val == 3 then
		tbLog:PlayerActionLog(%EVENT_LOG_TITLE,"使用3次白色果")
	end
end

function pActivity:UpdateRoseNumber()
	if tbVNG_BitTask_Lib:IsMaxValue(%tbBITTSK_ROSE_ACTIVITY_UPDATE_ROSE_COUNT) then
		Talk(1, "", "您已更新了.")
		return
	end
	local nLastCount = GetTask(%TSK_GIVE_ROSE_COUNT)
	if nLastCount <= 0 then
		Talk(1, "", "阁下未交给我如何玫瑰.")
		return
	end	
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "目前已过了玫瑰活动排名统计时间，交玫瑰不能算入排名.")
	else
		%tbTop10:GiveRose(GetName(), GetAccount(), nLastCount)
		Msg2Player(format("更新成功。到目前为止，玫瑰数量已交<color=green>%d<color>", nLastCount))
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ROSE_ACTIVITY_UPDATE_ROSE_COUNT, 1)
	end	
end
