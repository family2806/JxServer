-- 华山擂台对话
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\huashanqunzhan\\high_grade\\ready\\readyclass.lua")
Include("\\script\\missions\\huashanqunzhan\\mid_grade\\ready\\readyclass.lua")
Include("\\script\\lib\\awardtemplet.lua")
function huashanqunzhan_SignUpMain(nStep)
	local tbSay = nil
	local nPlayerLevel = GetLevel()
	
	local tbReadyMission = nil
	if nPlayerLevel < 50 then
		tbReadyMission = nil
	elseif nPlayerLevel < 120 then
		tbReadyMission = huashanqunzhan_tbReady_M
	else
		tbReadyMission = huashanqunzhan_tbReady_H
	end
	
	local nState = tbReadyMission and tbReadyMission:CheckMathState() or nil
	if nStep == 1 then
		if nState == 1 then
			tbSay = 
			{
				format("<dec><npc>%s 已开始报名，报名费为10万两，大侠同意吗?",tbReadyMission.tbRef.szMatchName),
				 "报名参加/#huashanqunzhan_SignUpMain(2)",
			}
		elseif nState == 0 or nState == -1 then
			local tbWorld = 
			{
				{"-","-","-"},
				{"日", "场数", "时间"},
				{"-","-","-"},
				{"星期一到星期五", "2", "10:00 - 10:45"},
				{"","", "22:00 - 22:45"},
				{"-","-","-"},
				{"","","10:00 - 10:45"},
				{"周六和周日", "3", "15:00 - 15:45"},
				{"","","22:00 - 22:45"},
				{"-","-","-"},
			}
			local szMsg = nState == 0 and "比赛还未开始." or "比赛正在进行."
			tbSay = 
			{
				"<dec><npc>"..szMsg.."比赛时间如下:<enter>"..huashanqunzhan_drawtable(tbWorld),
			}
		elseif nState == -2 then
			local tbMacthMission	= tbReadyMission.tbRef
			
			local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
			local szMsg				= (szWinerName and szWinerName ~= "")  and format("取胜者: <color=yellow>%s<color>", szWinerName) or "本场没有取胜者"
			
			tbSay = 
			{
				format("<dec><npc>场 %s 已分胜负, %s", tbMacthMission.szMatchName, szMsg),
				
			}
		elseif nState == nil then
			tbSay = 
			{
				"<dec><npc>50级以上充值玩家才能参加华山大战。从50到119级可以参加中级华山大战，120级以上可以参加高级华山大战。你不够等级参加.",
			}
		end		
	elseif nStep == 2 then
		if GetCash() < tbReadyMission.nMoney then
			return Say(format("报名费为%d 两，你身上的银两不够.", tbReadyMission.nMoney), 0)
		end
		
		
		if tbReadyMission == nil then
			return Say("等级不够50，不能参加报名.", 0)
		else
			return huashanqunzhan_SignUpStep(tbReadyMission)
		end
	end
	
	if  huashanqunzhan_CheckGetAward(tbReadyMission.tbRef) then
		tinsert(tbSay,2,"给取胜者的奖励./huashanqunzhan_GetAward")
	end
	
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay)
end


function huashanqunzhan_SignUpStep(tbMission)
	local nState = tbMission:CheckMathState()
	if nState == 1 then
		tbMission:GotoReadyPlace()
	elseif nState == 0 then
		Say("比赛还未开始.", 0)
	elseif nState == -1 then
		Say("比赛还未开始.", 0)
	elseif nState == -2 then
		
		local tbMacthMission	= tbMission.tbRef
		local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
		local szMsg				= szWinerName and format("取胜者: <color=yellow>%s<color>", szWinerName) or "本场没有取胜者"
		local tbSay = 
		{
			format("<dec><npc>场 %s 已分胜负, %s", tbMacthMission.szMatchName, szMsg),
			"结束对话/OnCancel"
		}
		CreateTaskSay(tbSay)
	end
	
end

function huashanqunzhan_GetAward()
	if CalcFreeItemCellCount() < 20 then
		return Say("装备袋已满，请整理装备确保物品安全.",0)
	end
	local tbAward = 
	{
		{szName="蓝水晶", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
		{szName="绿水晶", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
		{szName="紫水晶", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
		{szName="猩红宝石", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
		{szName="武林秘籍", tbProp={6, 1, 26, 1, 0, 0}},
		{szName="洗髓经", tbProp={6, 1, 22, 1, 0, 0}},
	}
	local nCount = GetTask(huashanqunzhan.TSK_Winer)
	
	tinsert(tbAward, { nJxb = 90000 * nCount})
	
	tbAwardTemplet:GiveAwardByList(tbAward, "华山擂台大战")
	SetTask(huashanqunzhan.TSK_Winer, 0)
end


function huashanqunzhan_CheckGetAward(tbMission)
	local nState = tbMission:GetMissionState()
	local nPlayerMathId = GetTask(tbMission.TSK_MatchId)
	local nMathId = tbMission:GetMissionV(tbMission.tbMissionV.MATCH_ID)
	if nPlayerMathId == nMathId and nState == 2 and GetTask(tbMission.TSK_Winer) > 0 then
		
		return 1
	end
	return nil
end

function OnCancel()
	
end




function huashanqunzhan_drawtable(tbWord)
	local nLen = 0
	local str = ""
	for _, tb2 in tbWord do
		for _, sz in tb2 do
			if sz and nLen < strlen(sz) then
				nLen = strlen(sz)
			end
		end
	end
	for _, tb2 in tbWord do
		local str_space
		for j, sz in tb2 do
			if sz ~= "-" or ( sz == "-" and j==1 )then
				str = str.."|"
			else
				str = str.."-"
			end
			 str_space = sz == "-" and "-" or " "
			str = str..strfill_center(sz,nLen, str_space)
		end
		str = str.."|"
	
		str = str.."<enter>"
	end
	return str
end
