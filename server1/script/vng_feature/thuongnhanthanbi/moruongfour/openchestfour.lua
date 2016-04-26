Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
tbChectfour = {};
tbChectfour.tbCompose = 
{
				["����֮��"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("��ԭ��\t �ϳ� %s", "����֮��"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "��ˮ��", tbProp = {4,239,1,1,0,0}, nCount = 1},
									{szName = "��ˮ��", tbProp = {4,240,1,1,0,0}, nCount = 1},
									{szName = "��ˮ��", tbProp = {4,238,1,1,0,0}, nCount = 1},
									{szName = "1������", tbProp = {6,1,147,1,-1,0}, nCount = 50},
									{szName = "2������", tbProp = {6,1,147,2,-1,0}, nCount = 50},
									{szName = "3������", tbProp = {6,1,147,3,-1,0}, nCount = 50},
									{szName = "������", tbProp = {6,1,30117,1,0,0}, nCount = 1},
									{szName = "��Ѫ��", tbProp = {6,1,2117,1,0,0}, nCount = 1},
									{szName = "ǧ������", tbProp = {6,1,2813,1,0,0}, nCount = 1},
									{szName = "������", tbProp = {6,1,2566,1,0,0}, nCount = 50},
									{szName = "���޺�", tbProp = {6,1,23,-1,-1,0}, nCount = 2},
								},
							tbProduct = {szName = "����֮��", tbProp = {6,1,30181,1,0,0}, nExpiredTime = 60*24*7},
						},
						pCompos = nil;
				},
				["����4"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("����Ʒ\t ����?%s", "����4"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "����֮��", tbProp = {6,1,30181,1,0,0}, nCount = 3},
									{szName = "����Կ��", tbProp = {6,1,30182,1,0,0}, nCount = 1},
								},
							pProductFun = function (self)
								OpenStoreBox(3)
								Msg2Player("���ô򿪴��������������")
							end,
							pLimitFun = function (self) 
								return %tbChectfour:LimitStoreBox()
							end,
						},
						pCompos = nil;
				},
}

function tbChectfour:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbChectfour:ComposeItem(strItemName)
	local tbItem = self.tbCompose[strItemName]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);			
		end
		tbItem.pCompos:ComposeDailog(0);
	end
end
--����֮��
function tbChectfour:main()
	local tbMainDialog = tbChectfour:CreateDialog()
	tbMainDialog.szTitleMsg = "�������ܰ���ʲô?"
	tbMainDialog:AddOptEntry("������֮��", tbChectfour.ComposeItem, {tbChectfour, "����֮��"})
	tbMainDialog:AddOptEntry("����Ʒ����4", tbChectfour.ComposeItem, {tbChectfour, "���� 4"})
	tbMainDialog:Show()
end	

function tbChectfour:CheckStoreBox()
	for i=1, 2 do
		if CheckStoreBoxState(i) == 0 then
			return i
		end 
	end
	return 0
end

function tbChectfour:LimitStoreBox()
		if tbChectfour:CheckStoreBox() > 0 then
			Msg2Player(format("������δ������%d",tbChectfour:CheckStoreBox() + 1))
			return 0
		end
		if CheckStoreBoxState(3) > 0 then
			Msg2Player("�����Ѵ�4�����ӣ����ܿ���")
			return 0
		end
		return 1
end