Include("\\script\\vng_feature\\getgoldequip.lua")
tbParam2EquipType = {
	[1] = 0,
	[2] = 1,	
	[3] = 2,
	[4] = 3,
	[5] = 4,
	[6] = 5,
	[7] = 6,
	[8] = 7,
	[9] = 8,
	[10] = 9,
	[11] = 10,
	[12] = 0,
	[13] = 1,
	[14] = 2,
	[15] = 3,
	[16] = 4,
	[17] = 5,
	[18] = 6,
	[19] = 7,
	[20] = 8,
	[21] = 9,
	[22] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}
	tb.tbLog={"����֮��","ʹ�ý���֮��"}
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(6,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(8,tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "�������� - ��ѡ��ϵ",
		[2] = "���ڷ��� - ��ѡ��ϵ",		
		[3] = "�����Ͻ�ָ - ��ѡ��ϵ",
		[4] = "���ڻ��� - ��ѡ��ϵ",
		[5] = "��������- ��ѡ��ϵ",
		[6] = "���ڽ��� - ��ѡ��ϵ",
		[7] = "��ȥ��е - ��ѡ��ϵ",
		[8] = "����Ь - ��ѡ��ϵ",
		[9] = "������ - ��ѡ��ϵ",
		[10] = "�����½�ָ-��ѡ��ϵ",
		[11] = "����װ�� - ��ѡ��ϵ",
		[12] = "�������� (Max Option) - ��ѡ��ϵ",
		[13] = "���ڷ��� (Max Option) - ��ѡ��ϵ",		
		[14] = "�����Ͻ�ָ (Max Option) - ��ѡ��ϵ",
		[15] = "���ڻ��� (Max Option) - ��ѡ��ϵ",
		[16] = "��������(Max Option) - ��ѡ��ϵ",
		[17] = "���ڽ��� (Max Option - ��ѡ��ϵ)",
		[18] = "������е (Max Option) - ��ѡ��ϵ",
		[19] = "����Ь (Max Option) - ��ѡ��ϵ",
		[20] = "�������� (Max Option) - ��ѡ��ϵ",
		[21] = "�����½�ָ (Max Option) - ��ѡ��ϵ",
		[22] = "����װ�� (  Max Option) - ��ѡ��ϵ",
	}
	szDesc = szDesc..format("<color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end