Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")

if not tbBaker then
	tbBaker = {}
end
function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	tbBaker:main()
end
function tbBaker:main()
	local tbMainDiag = tbNpcHead:createDialog()
	tbMainDiag.szTitleMsg = "��������æµ"
	tbMainDiag:AddOptEntry("���ܻ", tbBaker.introduction, {tbBaker})
	tbMainDiag:AddOptEntry("�ر�����", tbBaker.composeItem, {tbBaker})
	tbMainDiag:Show()
end
function tbBaker:introduction()
	local tbIntroDialog = tbNpcHead:createDialog()
	tbIntroDialog.szTitleMsg = "���˭��æ��׼�����գ�Ϊʲô��վ�������ȥ����ҳ�˽�����"
	tbIntroDialog:AddOptEntry("����", tbBaker.main, {tbBaker})
	tbIntroDialog:Show()
end
function tbBaker:composeItem()
	local tbComposeDialog = tbNpcHead:createDialog()
	tbComposeDialog.szTitleMsg = "������㹻��ԭ�ϣ��ҽ��������ر�����]"
	tbComposeDialog:AddOptEntry("����", tbBaker.doCompose, {tbBaker})
	tbComposeDialog:AddOptEntry("����", tbBaker.main, {tbBaker})
	tbComposeDialog:Show()
end

function tbBaker:doCompose()
	local tbItemCompose = 
	{
		["�ر�����"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("����ӭ���\t �ϳ� %s", "�ر�����"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "����", tbProp = {6,1,30086,1,0,0}, nCount = 2},
								{szName = "����ֽ", tbProp = {6,1,30085,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "�ر�����", tbProp = {6,1,30089,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}
	local tbItem = tbItemCompose["�ر�����"]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("�ϳ� [%s]", "�ر�����"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end
