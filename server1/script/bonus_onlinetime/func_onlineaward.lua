Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\baoruongthanbi\\head.lua");

--tbRandomTask =
--{
--	211,
--	212,
--	213,
--	214,
--	215,
--	216,
--	222,
--	224,
--	225,
--	226,
--	227,
--	228,
--}
--
--
--tbOnlineAwardExp =
--{
--	{szName = "积分", nExp_tl = 15000000},
--}
--
--tbOnlineAwardHuyenTinh =
--{
--	{szName="玄晶矿石", tbProp={6,1,147,2,0,0}, nCount=10},
--	{szName="玄晶矿石", tbProp={6,1,147,3,0,0}, nCount=10},
--	{szName="玄晶矿石", tbProp={6,1,147,4,0,0}, nCount=10},
--}
--
--function IsActiveGetHuyenTinh()
--	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
--	if (nCurDate <= 20101110) then
--		return 1
--	else
--		return 0
--	end
--end

function OnlineAward()

	 OnlineAward_ResetStillOnlineNewDay()
	
	local tbOpt = {};
		local szTitle = format("大侠，请选择奖励:");
		tbOpt = 
		{
			"选择Online时间奖励/OnlineAward_GetBonus",
			"检查Online时间奖励/OnlineAward_ShowTimeNow",
			"结束/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
end

function OnlineAward_GetBonus()
--	if CheckIPBonus() == 0 then
--		Say("目前大侠不能领奖励，稍候再试!",0)
--		return
--	end
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("目前大侠不能看信息，稍候再试!",0)
		return		
	end

	OnlineAward_SummaryOnlineTime()
	OnlineAward_StartTime()
	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	if nHour < 1 then
		Say("大侠在线不足一个小时!",0)
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(BNCQ_TASKID_GET_TIMES,6,"今天大侠已领奖品6次了。明天再来吧！","<") ~= 1) then
			return
	end
	
	if CalcFreeItemCellCount() < 1 then
		Say("大侠的装备里不足一个空位!",0)
		return
	end
	
	local tbOpt = {};
		local szTitle = format("大侠，请选择奖品:");
		tbOpt = 
		{
			"领特别粽子奖励/#OnlineAward_ConfirmBonus()",
--			"领2等奖品/#OnlineAward_ConfirmBonus(2)",
			"结束/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
	
	
--	if OnlineAward_PayTime(1*60*60) == 1 then	
--		PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--		for i = 1, 10 do AddLenhBaiBH() end
--		for i = 1, 10 do AddMocNhan() end
--		tbAwardTemplet:GiveAwardByList({szName = "玄天锤", tbProp={6,1,2348,1,0,0}, nExpiredTime = 10080, nBindState = -2, nCount = 2}, "Online领奖");
--	end
	
end


function OnlineAward_ConfirmBonus()
--	if (nType == 1) then
		if OnlineAward_PayTime(1*60*60) == 1 then	
			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			for i = 1, 10 do AddLenhBaiBH() end
--			for i = 1, 10 do AddMocNhan() end
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online领奖");
--			end
			local tbAward = {szName="粽子",tbProp={6,1,30086,1,0,0},nCount=10,nExpiredTime=20110220}
			tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][Lunar Year 2011][Online领奖]");
		end
--	else
--		if OnlineAward_PayTime(1*60*60) == 1 then	
--			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			tbAwardTemplet:GiveAwardByList(tbOnlineAwardExp[1], "Online 领奖");
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online 领奖");
--			end
--		end
--	end
end


function OnlineAward_ShowTimeNow()
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("目前大侠不能看信息，请稍候再试!",0)
		return		
	end
	OnlineAward_SummaryOnlineTime()	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	local strMsg = format("大侠在线时间为\n\t<color=yellow> %d <color> 小时<color=yellow> %d <color> 分<color=yellow> %d <color> 秒.",nHour, nMin, nSec)
	OnlineAward_StartTime()
	Talk(1,"Online 收奖",strMsg)
end

function AddLenhBaiBH()
do return end
	--local nRandomTaskID = createRandomTask();
	local nRandomIndex = random(1, getn(tbRandomTask))
	local nRandomTaskID = tbRandomTask[nRandomIndex]
	
	nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	nExpiredTime = BNCQ_OneDayTime
	ITEM_SetExpiredTime(nRandomItemIndex, nExpiredTime);
	SetItemBindState(nRandomItemIndex, -2);
	SyncItem(nRandomItemIndex);
	local strItem = GetItemName(nRandomItemIndex)
	Msg2Player("您收到"..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Online 收奖"..GetAccount().."\t"..GetName().."\t".." Online 领奖得到"..strItem)
end

function AddMocNhan()
do return end
		local ndx = AddItem(6,1,1085,1,0,0)
		SetSpecItemParam(ndx, 2, 9)
		nExpiredTime = BNCQ_OneDayTime
		ITEM_SetExpiredTime(ndx, nExpiredTime);
		SetItemBindState(ndx, -2);
		SyncItem(ndx)
		local strItem = GetItemName(ndx)
		Msg2Player("您收到 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." Online 收奖 "..GetAccount().."\t"..GetName().."\t".." Online 领奖"..strItem)
end

function Cancel()
end
