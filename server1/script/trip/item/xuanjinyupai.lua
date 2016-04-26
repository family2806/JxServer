--��������Ӧ���� �������
--��Ӧ�úͿ���ν��йأ���˷�������
--���ļ�������йؿ���ν���Ӧת������\mission\battle



Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\battle\\manager.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\battle\\npc\\point2exp.lua")
function main()
	dialog_menu()
	return 1
end

function dialog_menu()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return 1
	end
	local tbOpt =
	{
		{"���ӷ�����", across_server},
		{"������ӷ���������", show_across_server_money},
		{"���ӷ��������׶�", tbTripBattlePoint2Exp.DialogMain, {tbTripBattlePoint2Exp}},
		{"�����Ի�"},
	}
	CreateNewSayEx("��������", tbOpt)
end

function across_server()
	local tbOpt = {}
	local nCount = TripC_GetServerCount()
	for i=1, nCount do
		local szServerName = TripC_GetServerName(i)
		tinsert(tbOpt, {szServerName, sign_up, {i}})
	end
	tinsert(tbOpt, {"����", dialog_menu})
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx("����ȥ����?", tbOpt)
end

function show_across_server_money()
	local tbOpt =
	{
		{"����", dialog_menu},
		{"�����Ի�"},
	}
	local szTitle = format("<color=yellow>%s<color>���� <color=yellow>%d<color> ���ӷ���������, <color=yellow> ��������������Դ�Դͷ������������������������ɵĲ��ǹ���������������������������������������Ե�������������顣 <color>", GetName(), GetTask(TSK_TRIP_MONEY))
	CreateNewSayEx(szTitle, tbOpt)
end

function sign_up(nServerId)
	local _, nValue = GetRoleEquipValue()
	local szTitle = format("��Ŀǰ�ı�����ֵΪ%d, ����ȥ�ν����ӷ��������ĸ�����? <enter>", nValue)
	local tbOpt = {}
	for i=1, getn(BattleManagerDef) do
		local nMapId = BattleManagerDef[i][2]
		local pManager = BattleManagerList[nMapId]
		if pManager then
			if pManager.nMinEqValue and pManager.nMaxEqValue then
				szTitle = szTitle..format("%s Ҫ����׼�ֵ (%d~%d)<enter>", pManager.szName, pManager.nMinEqValue, pManager.nMaxEqValue)
			elseif pManager.nMinEqValue and not pManager.nMaxEqValue then
				szTitle = szTitle..format("%s Ҫ����׼�ֵ %d ���� <enter>", pManager.szName, pManager.nMinEqValue)
			elseif pManager.nMaxEqValue and not pManager.nMinEqValue then
				szTitle = szTitle..format("%s Ҫ����׼�ֵ%d ���� <enter>", pManager.szName, pManager.nMaxEqValue)
			else
				szTitle = szTitle..format("%s kh�ng Ҫ����׼�ֵ", pManager.szName)
			end
			tinsert(tbOpt, {pManager.szName, select_mamager, {nMapId, nServerId}})
		end
	end
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx(szTitle, tbOpt)
end

function select_mamager(nMapId, nServerId)
	local pManager = BattleManagerList[nMapId]
	if not pManager then
		return
	end
	local _, nValue = GetRoleEquipValue()
	if (not pManager.nMinEqValue or nValue >= pManager.nMinEqValue) and
		(not pManager.nMaxEqValue or nValue <= pManager.nMaxEqValue) then
		local szServerName = TripC_GetServerName(nServerId)
		local nIfCanOffLine = check_if_can_offline()
		if szServerName and nIfCanOffLine == nil then
			TripC_Apply(szServerName, 0, pManager.nMapId, 1541, 3178)
		end
	else
		return  Talk(1, "", format("��ı��׼�ֵ(%d)������Ҫ��", nValue))
	end
end

function get_item()
	tbAwardTemplet:Give({szName="��������",tbProp={6,1,3035,1,0,0},}, 1, {"TRIP", "get item"})
end

--EventSys:GetType("AddNpcOption"):Reg("��������","������ȡ��������", get_item)
