Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

tbEnterPosConfigPath = {
	[1] = "\\settings\\maps\\tianchimijing\\floor1\\enter1.txt",
	[2] = "\\settings\\maps\\tianchimijing\\floor1\\enter2.txt",
	[3] = "\\settings\\maps\\tianchimijing\\floor1\\enter3.txt",
	[4] = "\\settings\\maps\\tianchimijing\\floor1\\enter4.txt",
	[5] = "\\settings\\maps\\tianchimijing\\floor1\\enter5.txt",
	[6] = "\\settings\\maps\\tianchimijing\\floor1\\enter6.txt",
  [7] = "\\settings\\maps\\tianchimijing\\floor1\\enter7.txt",
	[8] = "\\settings\\maps\\tianchimijing\\floor1\\enter8.txt",
	[9] = "\\settings\\maps\\tianchimijing\\floor1\\enter9.txt"							
	}

function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>��λС�����ҷ��������ˮ̶����һ���ܵ������ܵ��в����źܶ�������壬��Ҫ��ϰ�Ṧ���ܹ�ȥ����˵�ܵ����һ���кܶ౦�ء�"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"�������˽�һ��", Realize})
		tinsert(tbDailog, {"�����Ի�"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = "<#><npc>����ܵ�����û�о�ͷ���������ȥ���ˣ�û��һ���ܳ�������˵����ܵ����кܶ���ˣ����Ǻܲ��̣�������������Ҽ�����һ����롣."
	tinsert(tbOpt, {"�����ܵ�", ReadyGo})
	--Check team member condition - Modified By DinhHQ - 20120405
	if GetTeamSize() >= 2 then
		tinsert(tbOpt, {"����������", VnCheckTeamCondition, {1, 1}})
	end
	tinsert(tbOpt, {"Ҫ�����˰�"})
	CreateNewSayEx(szTitle, tbOpt)
end

function ReadyGo()
	if GetTeamSize() <= 1 then
		SingleEnter()
	else
		TeamEnter()
	end
end

function SingleEnter()
	local tbOpt = {}
	local szTitle = "<#><npc> ������ȷ��һ���˴�Խ�ܵ�?"
	tinsert(tbOpt, {"��.",SingleEnterSure})
	tinsert(tbOpt, {"��������"})
	CreateNewSayEx(szTitle, tbOpt)
end

function TeamEnter()
	if IsCaptain() ~= 1 then
		DealWithNotCaption()
	else
		DealWithIsCaption()
	end
end

function DealWithNotCaption()
	local tbOpt = {}
	local szTitle = "<#><npc> �����㲻�Ƕӳ���Ҫ����ӳ��������"
	tinsert(tbOpt, {"����."})
	CreateNewSayEx(szTitle, tbOpt)
end

function DealWithIsCaption()
	local nTeamSize = GetTeamSize()
	local szTitle = ""
	local _, _, nMapId = GetPos()
	local tbOpt = {}
	local bInSameMap = 1
	for i = 1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i);
		local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
		--Check enter pass - Modified By DinhHQ - 20120405
		local nHavePass = DynamicExecuteByPlayer(nPlayerIndex, "", "CalcItemCount", 3, 6, 1, 30194, -1)
		if nTempMapId ~= nMapId or not nHavePass then
			bInSameMap = 0
			break
		end
	end
	if bInSameMap ~= 0 then
		TeamEnterSure()
	else	
		szTitle = "<#><npc> ��Ķ����ﻹ����ʿû��װ���ã����ټ������˵����������ܽ���."
		tinsert(tbOpt, {"�ã��������ټ������� "})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function SingleEnterSure()
	--Check enter pass - Modified By DinhHQ - 20120405
	if not VnCheckPass(PlayerIndex) or not VnConsumePass(PlayerIndex) then
		Talk(1, "", "ֻ��Ҫ����һ��<color=red>�������<color> �ҽ�ֻ�������.")
		return
	end
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	local nRowId = random(2, nTotalRow)
	local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
	local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
	NewWorld(935, nPosX/32, nPosY/32)
end

function TeamEnterSure()
	--Last time check team enter pass- Modified By DinhHQ - 20120405
	if not VnCheckTeamCondition(1) then
		return
	end
	local nTeamSize = GetTeamSize()
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	for i = 1, nTeamSize do 
		local nPlayerIndex = GetTeamMember(i)		
		if VnConsumePass(nPlayerIndex) then
			local nRowId = random(2, nTotalRow)
			local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
			local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
			DynamicExecuteByPlayer(nPlayerIndex, "", "NewWorld", 935, nPosX/32, nPosY/32)			
		end		
	end
end

--Check enter pass - Modified By DinhHQ - 20120404
function VnCheckPass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if CalcItemCount(3, 6, 1, 30194, -1) < 1 then		
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnConsumePass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if ConsumeItem(3, 1, 6, 1, 30194, -1) ~= 1 then
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnCheckTeamCondition(bShowDialog1, bShowDialog2)
	if IsCaptain() ~= 1 then
		Talk(1, "", "�㲻�Ƕӳ�������ִ�иò�������жӳ�����!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()	
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do		
		--Check enter pass
		PlayerIndex = GetTeamMember(i)
		if not VnCheckPass(PlayerIndex) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "û���������"))
		end	
	end
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then		
		if bShowDialog1 then
			local strTittle = "���Ŀǰ���ܽ�������ؾ�:"
			for i = 1, getn(tbDialog) do
				strTittle = strTittle.."\n"..tbDialog[i]
			end
			Describe(strTittle, 1, "�ر�/OnCancel")
		end
		return nil
	else
		if bShowDialog2 then
			local strTittle = "���Ŀǰ���Խ�������ؾ�"
			Describe(strTittle, 1, "�ر�/OnCancel")
		end
		return 1
	end
end
