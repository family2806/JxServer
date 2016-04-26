-- ��ɽ��̨�Ի�
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
				format("<dec><npc>%s �ѿ�ʼ������������Ϊ10����������ͬ����?",tbReadyMission.tbRef.szMatchName),
				 "�����μ�/#huashanqunzhan_SignUpMain(2)",
			}
		elseif nState == 0 or nState == -1 then
			local tbWorld = 
			{
				{"-","-","-"},
				{"��", "����", "ʱ��"},
				{"-","-","-"},
				{"����һ��������", "2", "10:00 - 10:45"},
				{"","", "22:00 - 22:45"},
				{"-","-","-"},
				{"","","10:00 - 10:45"},
				{"����������", "3", "15:00 - 15:45"},
				{"","","22:00 - 22:45"},
				{"-","-","-"},
			}
			local szMsg = nState == 0 and "������δ��ʼ." or "�������ڽ���."
			tbSay = 
			{
				"<dec><npc>"..szMsg.."����ʱ������:<enter>"..huashanqunzhan_drawtable(tbWorld),
			}
		elseif nState == -2 then
			local tbMacthMission	= tbReadyMission.tbRef
			
			local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
			local szMsg				= (szWinerName and szWinerName ~= "")  and format("ȡʤ��: <color=yellow>%s<color>", szWinerName) or "����û��ȡʤ��"
			
			tbSay = 
			{
				format("<dec><npc>�� %s ���ѷ�ʤ��, %s", tbMacthMission.szMatchName, szMsg),
				
			}
		elseif nState == nil then
			tbSay = 
			{
				"<dec><npc>50�����ϳ�ֵ��Ҳ��ܲμӻ�ɽ��ս����50��119�����Բμ��м���ɽ��ս��120�����Ͽ��ԲμӸ߼���ɽ��ս���㲻���ȼ��μ�.",
			}
		end		
	elseif nStep == 2 then
		if GetCash() < tbReadyMission.nMoney then
			return Say(format("������Ϊ%d ���������ϵ�����������.", tbReadyMission.nMoney), 0)
		end
		
		
		if tbReadyMission == nil then
			return Say("�ȼ�����50�����ܲμӱ���.", 0)
		else
			return huashanqunzhan_SignUpStep(tbReadyMission)
		end
	end
	
	if  huashanqunzhan_CheckGetAward(tbReadyMission.tbRef) then
		tinsert(tbSay,2,"��ȡʤ�ߵĽ���./huashanqunzhan_GetAward")
	end
	
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay)
end


function huashanqunzhan_SignUpStep(tbMission)
	local nState = tbMission:CheckMathState()
	if nState == 1 then
		tbMission:GotoReadyPlace()
	elseif nState == 0 then
		Say("������δ��ʼ.", 0)
	elseif nState == -1 then
		Say("������δ��ʼ.", 0)
	elseif nState == -2 then
		
		local tbMacthMission	= tbMission.tbRef
		local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
		local szMsg				= szWinerName and format("ȡʤ��: <color=yellow>%s<color>", szWinerName) or "����û��ȡʤ��"
		local tbSay = 
		{
			format("<dec><npc>�� %s ���ѷ�ʤ��, %s", tbMacthMission.szMatchName, szMsg),
			"�����Ի�/OnCancel"
		}
		CreateTaskSay(tbSay)
	end
	
end

function huashanqunzhan_GetAward()
	if CalcFreeItemCellCount() < 20 then
		return Say("װ����������������װ��ȷ����Ʒ��ȫ.",0)
	end
	local tbAward = 
	{
		{szName="��ˮ��", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
		{szName="��ˮ��", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
		{szName="��ˮ��", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
		{szName="�ɺ챦ʯ", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
		{szName="�����ؼ�", tbProp={6, 1, 26, 1, 0, 0}},
		{szName="ϴ�辭", tbProp={6, 1, 22, 1, 0, 0}},
	}
	local nCount = GetTask(huashanqunzhan.TSK_Winer)
	
	tinsert(tbAward, { nJxb = 90000 * nCount})
	
	tbAwardTemplet:GiveAwardByList(tbAward, "��ɽ��̨��ս")
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
