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
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(7,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:GetGoldEquip(7, random(1,23), tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "白虎项链 - 自选派系",
		[2] = "白虎发冠 - 自选派系",		
		[3] = "白虎上戒指 - 自选派系",
		[4] = "白虎护腕 - 自选派系",
		[5] = "白虎腰带 - 自选派系",
		[6] = "白虎金铠 - 自选派系",
		[7] = "白虎器械 - 自选派系",
		[8] = "白虎鞋 - 自选派系",
		[9] = "白虎玉佩 - 自选派系",
		[10] = "白虎下戒指 - 自选派系",
		[11] = "白虎装备 - 自选派系",
		[12] = "白虎项链 - 随机派系",
		[13] = "白虎发冠 - 随机派系",		
		[14] = "白虎上戒指- 随机派系",
		[15] = "白虎护腕 - 随机派系",
		[16] = "白虎腰带 - 随机派系",
		[17] = "白虎金铠 - 随机派系",
		[18] = "白虎器械 - 随机派系",
		[19] = "白虎鞋 - 随机派系",
		[20] = "白虎玉佩 - 随机派系",
		[21] = "白虎下戒指- 随机派系",
		[22] = "白虎装备- 随机派系",
	}
	szDesc = szDesc..format("<color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end