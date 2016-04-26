IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINAEQ_GOLDEQ ={
--[�׽�ID] = {�׽�ID, �ƽ�ID,װ��������ֵ��ϵ��,װ����};
--[1] = {1, 1, 4, "����֮����ɮñ"},
}

function LoadPlatinaEquipSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def.txt", "PlatinaData")
	if b1~=1 then
		print("���������׽�װ����Ϣʧ��!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaData", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaData", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaData", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaData", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaData", y, "EQUIPNAME");
		
		TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
	end	
end;

LoadPlatinaEquipSetting()

--�׽�װ�����ȼ������ļ�ֵ��
PLATINAEQ_UPGRADERATE_BASIC = 10000;
TB_PLATINAEQ_UPGRADERATE = {
	[0] = 2000*PLATINAEQ_UPGRADERATE_BASIC,
	[1] = 4000*PLATINAEQ_UPGRADERATE_BASIC,
	[2] = 6000*PLATINAEQ_UPGRADERATE_BASIC,
	[3] = 8000*PLATINAEQ_UPGRADERATE_BASIC,
	[4] = 10000*PLATINAEQ_UPGRADERATE_BASIC,
	[5] = 15000*PLATINAEQ_UPGRADERATE_BASIC,
	[6] = 30000*PLATINAEQ_UPGRADERATE_BASIC,
	[7] = 50000*PLATINAEQ_UPGRADERATE_BASIC,
	[8] = 80000*PLATINAEQ_UPGRADERATE_BASIC,
	[9] = 120000*PLATINAEQ_UPGRADERATE_BASIC,
};

-- �׽������ı���Ĳ���
tb_upgrade_material	=
{
	--[����ID] = {����������ֵ��������Level���������������������׽�}
	["6,1,1308"] 	= {szName = "����ʯ��Ƭ��С��", nValue = 20000000},
	["6,1,1309"] 	= {szName = "����ʯ��Ƭ���У�", nValue = 100000000},
	["6,1,1310"]	= {szName = "����ʯ��Ƭ����", nValue = 1000000000},
	["6,1,2127"]	= {szName = "���������� (��һƪ)", nValue = 0, nCount = 1, nUpgradeLevel = 6},
	["6,1,2160"]	= {szName = "�����������������", nValue = 0, nCount = 1, nUpgradeLevel = 7},
	["6,1,2161"]	= {szName = "������������������", nValue = 0, nCount = 1, nUpgradeLevel = 8},
	["6,1,2162"]	= {szName = "���������������ģ�", nValue = 0, nCount = 1, nUpgradeLevel = 9},
};

tb_gold2planita_material =
{
	["6,1,398"] 	= {szName = "���ؿ�ʯ", nCount = 1},
	["6,1,147"] 	= {szName = "�˼�������ʯ", nItemLevel = 8, nCount = 1},
	["6,1,1309"]	= {szName = "����ʯ��Ƭ���У�", nCount = 1},
};

tbUpGradeProcess = {
[1] = {
				tbUpItemList = tb_gold2planita_material,
				szErrorMsg = "<dec><npc>����<color=yellow>�׽�װ��<color>, �һ���<color=yellow>���ؿ�ʯ<color>, color=yellow>�˼�������ʯ<color> ��<color=yellow>����ʯ��Ƭ���У�<color>, ��������������.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = tb_upgradematerial,
				szErrorMsg = "<dec><npc>����<color=yellow>�׽�װ��<color>, �һ���  <color=yellow>����ʯ��Ƭ<color> ��������������.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
}
