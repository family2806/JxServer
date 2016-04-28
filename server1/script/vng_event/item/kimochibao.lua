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
	tb.tbLog={"KimOChiBao"," π”√KimOChiBao"}
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
		[1] = "Kim § Hπng Li™n - T˘ ch‰n h÷ ph∏i",
		[2] = "Kim § Ph∏t Qu∏n - T˘ ch‰n h÷ ph∏i",		
		[3] = "Kim § Th≠Óng GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",
		[4] = "Kim § HÈ Uy”n - T˘ ch‰n h÷ ph∏i",
		[5] = "Kim § Y™u ß∏i - T˘ ch‰n h÷ ph∏i",
		[6] = "Kim § Kim Kh∂i - T˘ ch‰n h÷ ph∏i",
		[7] = "Kim § Kh› GiÌi - T˘ ch‰n h÷ ph∏i",
		[8] = "Kim § Hµi - T˘ ch‰n h÷ ph∏i",
		[9] = "Kim § Ng‰c BÈi - T˘ ch‰n h÷ ph∏i",
		[10] = "Kim § Hπ GiÌi Chÿ - T˘ ch‰n h÷ ph∏i",
		[11] = "BÈ trang bﬁ Kim § - T˘ ch‰n h÷ ph∏i",
		[12] = "Kim § Hπng Li™n (Max Option) - T˘ ch‰n h÷ ph∏i",
		[13] = "Kim § Ph∏t Qu∏n (Max Option) - T˘ ch‰n h÷ ph∏i",		
		[14] = "Kim § Th≠Óng GiÌi Chÿ (Max Option) - T˘ ch‰n h÷ ph∏i",
		[15] = "Kim § HÈ Uy”n (Max Option) - T˘ ch‰n h÷ ph∏i",
		[16] = "Kim § Y™u ß∏i (Max Option) - T˘ ch‰n h÷ ph∏i",
		[17] = "Kim § Kim Kh∂i (Max Option - T˘ ch‰n h÷ ph∏i)",
		[18] = "Kim § Kh› GiÌi (Max Option) - T˘ ch‰n h÷ ph∏i",
		[19] = "Kim § Hµi (Max Option) - T˘ ch‰n h÷ ph∏i",
		[20] = "Kim § Ng‰c BÈi (Max Option) - T˘ ch‰n h÷ ph∏i",
		[21] = "Kim § Hπ GiÌi Chÿ (Max Option) - T˘ ch‰n h÷ ph∏i",
		[22] = "BÈ trang bﬁ Kim § (Max Option) - T˘ ch‰n h÷ ph∏i",
	}
	szDesc = szDesc..format("<color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end