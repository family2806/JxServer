IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

TB_PLATINAEQ_GOLDEQ ={
--[�׽�ID] = {�ƽ�ID,װ��������ֵ��ϵ��,װ����, �Ƿ���Ҫ���綦};
--[1] = {1, 1, 4, "����֮����ɮñ",bhunduding},
}

function LoadPlatinaEquipSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataTmp")
	if b1~=1 then
		print("���������׽�װ����Ϣʧ��!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaDataTmp", y, "EQUIPNAME");
		local bhundunding = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "HUNDUNDING"));
		
		if (bhundunding ~= nil and bhundunding == 1) then
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name, bhundunding};
		else
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
		end
	end	
end;

LoadPlatinaEquipSettingTmp()

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

--����ʯ��Ƭ�ļ�ֵ��
TB_UPGRADEITEM_VALUE ={
	["6,1,1308"] = {20000000, "����ʯ(С)", -1},
	["6,1,1309"] = {100000000, "����ʯ(��)", -1},
	["6,1,1310"] = {1000000000, "����ʯ(��)", -1},
	["6,1,1380"] = {3333333333, "����ʯ(��)", -1},
	["6,1,2127"] = {1, "����������(��1)", -1, 6},
	["6,1,2160"] = {1, "����������(��2)", -1, 7},
	["6,1,2161"] = {1, "����������(��3)", -1, 8},
	["6,1,2162"] = {1, "����������(��4)", -1, 9},
}

TB_GOLD2PLANITA_ITEM = {
	["6,1,1473"] = {1, "�����m", -1},
}
TB_GOLD2PLANITA_ITEM_SP1	= {
	["6,1,1473"] = {1, "�����m", -1},
	["6,1,1740"] = {1, "���綦", -1},
}

tbUpGradeProcess = {
[1] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM,
				szErrorMsg = "<dec><npc>��<color=yellow>�ƽ�װ��֮��<color>, ֻ��<color=yellow>�����m<color>��������Ҫ����Ʒ����ѱ����Ʒ����!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = TB_UPGRADEITEM_VALUE,
				szErrorMsg = "<dec><npc>����<color=yellow>�׽�װ��֮��<color>, ���ǻ���Ҫ<color=yellow>����ʯ��Ƭ<color> ����ѱ�Ķ�����.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
[4] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM_SP1,
				szErrorMsg = "<dec><npc>��<color=yellow>�ƽ�װ��֮��<color>, ֻ��<color=yellow>�����m<color>��������Ҫ����Ʒ����ѱ����Ʒ����!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
}

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;
