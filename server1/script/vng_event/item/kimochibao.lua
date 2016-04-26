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
	tb.tbLog={"金乌之宝","使用金乌之宝"}
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
		[1] = "金乌项链 - 自选派系",
		[2] = "金乌发冠 - 自选派系",		
		[3] = "金乌上戒指 - 自选派系",
		[4] = "金乌护腕 - 自选派系",
		[5] = "金乌腰带- 自选派系",
		[6] = "金乌金铠 - 自选派系",
		[7] = "进去器械 - 自选派系",
		[8] = "金乌鞋 - 自选派系",
		[9] = "金乌佩 - 自选派系",
		[10] = "金乌下戒指-自选派系",
		[11] = "金乌装备 - 自选派系",
		[12] = "金乌项链 (Max Option) - 自选派系",
		[13] = "金乌发冠 (Max Option) - 自选派系",		
		[14] = "金乌上戒指 (Max Option) - 自选派系",
		[15] = "金乌护腕 (Max Option) - 自选派系",
		[16] = "金乌腰带(Max Option) - 自选派系",
		[17] = "金乌金铠 (Max Option - 自选派系)",
		[18] = "金乌器械 (Max Option) - 自选派系",
		[19] = "金乌鞋 (Max Option) - 自选派系",
		[20] = "金乌玉佩 (Max Option) - 自选派系",
		[21] = "金乌下戒指 (Max Option) - 自选派系",
		[22] = "金乌装备 (  Max Option) - 自选派系",
	}
	szDesc = szDesc..format("<color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end