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
		{"Li�n server", across_server},
		{"���Li�n server����", show_across_server_money},
		{"Li�n server���׶�", tbTripBattlePoint2Exp.DialogMain, {tbTripBattlePoint2Exp}},
		{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx("Huy�n Kim Ng�c B�i", tbOpt)
end

function across_server()
	local tbOpt = {}
	local nCount = TripC_GetServerCount()
	for i=1, nCount do
		local szServerName = TripC_GetServerName(i)
		tinsert(tbOpt, {szServerName, sign_up, {i}})
	end
	tinsert(tbOpt, {"Tr� v�", dialog_menu})
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	CreateNewSayEx("Ng��i mu�n �i t�i n�i n�o?", tbOpt)
end

function show_across_server_money()
	local tbOpt =
	{
		{"Tr� v�", dialog_menu},
		{"K�t th�c ��i tho�i"},
	}
	local szTitle = format("<color=yellow>%s<color>���� <color=yellow>%d<color> Li�n server����, <color=yellow> ��������������Դ�Դͷ������������������������ɵĲ��ǹ���������������������������������������Ե�������������顣 <color>", GetName(), GetTask(TSK_TRIP_MONEY))
	CreateNewSayEx(szTitle, tbOpt)
end

function sign_up(nServerId)
	local _, nValue = GetRoleEquipValue()
	local szTitle = format("��Ŀǰ�ı�����ֵΪ%d, ����ȥ�ν�Li�n server���ĸ�����? <enter>", nValue)
	local tbOpt = {}
	for i=1, getn(BattleManagerDef) do
		local nMapId = BattleManagerDef[i][2]
		local pManager = BattleManagerList[nMapId]
		if pManager then
			if pManager.nMinEqValue and pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y�u c�u gi� tr� binh gi�p(%d~%d)<enter>", pManager.szName, pManager.nMinEqValue, pManager.nMaxEqValue)
			elseif pManager.nMinEqValue and not pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y�u c�u gi� tr� binh gi�p %d tr� l�n<enter>", pManager.szName, pManager.nMinEqValue)
			elseif pManager.nMaxEqValue and not pManager.nMinEqValue then
				szTitle = szTitle..format("%s y�u c�u gi� tr� binh gi�p%d tr� xu�ng<enter>", pManager.szName, pManager.nMaxEqValue)
			else
				szTitle = szTitle..format("%s kh�ng y�u c�u gi� tr� binh gi�p", pManager.szName)
			end
			tinsert(tbOpt, {pManager.szName, select_mamager, {nMapId, nServerId}})
		end
	end
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
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
		return  Talk(1, "", format("Gi� tr� binh gi�p c�a ng��i(%d)kh�ng ph� h�p y�u c�u", nValue))
	end
end

function get_item()
	tbAwardTemplet:Give({szName="Huy�n Kim Ng�c B�i",tbProp={6,1,3035,1,0,0},}, 1, {"TRIP", "get item"})
end

--EventSys:GetType("AddNpcOption"):Reg("V� binh th�nh m�n","������ȡHuy�n Kim Ng�c B�i", get_item)
