Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
Include("\\script\\lib\\composeex.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
	if GetFightState() == 1 then
		DealWithFightPlayer()
	else
		DealWithUnFightPlayer()
	end	
end

function DealWithFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc> ��·���ˣ�ֻ���Ṧ���ܹ�ȥ�����������Ṧ����������Ҫȥ���Ҵ����ⶪʧ�ĵ���ǹ��������Щ�����ڵ����ϵı��������ڡ�."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"��л���ҵ���", ThrowPlayer})
	tinsert(tbDailog, {"��������"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function ThrowPlayer()
	local tbOpt = {}
	local szTitle = ""
	local tbFormula =
	{
		szFailMsg = "�n�������ˣ�������Ķ����Ҳ���Ҫ�Ķ���������ƭ����?",
		nFreeItemCellLimit = 0,
		szComposeTitle = "",
		tbMaterial = 
		{
			{szName = "��", tbProp = {6, 1, 2592}, nCount = 1},
			{szName = "ǹ", tbProp = {6, 1, 2593}, nCount = 1},
			{szName = "��", tbProp = {6, 1, 2594}, nCount = 1},
		},
		tbProduct = 
		{
			szName = nil,
			pFun = function (self, nItemCount, szLogTitle)
			end	
		},
		pLimitFun = function (self, nItemCount)
			return 1
		end
	}
	local pCompose = tbActivityCompose:new()
	pCompose:_init(tbFormula, "������ؾ��ĵ�ǹ����ȡ�Ṧ.")
	local nRetCode = pCompose:Compose(1)
	if nRetCode == 1 then
		--Bonus award - Modified By DinhHQ - 20120405
		tbVnExtAward:SetAwardFlag(1)
		SetAForbitSkill(210, 0)
		szTitle = "<#><npc> �������ã��á���Ȼ���ҵı����������ˣ��Ṧ��������ʹ�á��������ʹ���Ṧ�ˣ� )"
		tinsert(tbOpt, {"��л����"})
		CreateNewSayEx(szTitle, tbOpt)
	else
	end
end

function DealWithUnFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>С�������ѵ�������ˣ�����Ҫ�Ҵ����ȥ�����𣿽����˾Ͳ��ܳ�����Ŷ"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"��л����ҽ���", TransPlayer})
	tinsert(tbDailog, {"��������"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end


function TransPlayer()
	--Bonus award - Modified By DinhHQ - 20120405
	tbVnExtAward:SetAwardFlag(1)
	GameFloor1:MoveToTrap("�������˵Ĵ��͵�")
end