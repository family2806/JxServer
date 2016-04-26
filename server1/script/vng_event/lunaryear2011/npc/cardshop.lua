Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")
if not tbCardShop then
	tbCardShop = {}
end
tbCardShop.composeList =
	{
		["����1"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("����ӭ���\t �ϳ� %s", "����1"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "��ˮ��", tbProp = {4,238,1,1,0,0}, nCount = 1}, --lam thuy tinh
								{szName = "���챦ʯ", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "��Ե¶ (��)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "����", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["����2"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("����ӭ��� \t �ϳ� %s", "����2"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "��ˮ��", tbProp = {4,239,1,1,0,0}, nCount = 1}, --tu thuy tinh
								{szName = "���챦ʯ", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "��Ե¶(��)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "���� ", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["����3"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("����ӭ���\t �ϳ� %s", "����3"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "��ˮ��", tbProp = {4,240,1,1,0,0}, nCount = 1}, --luc thuy tinh
								{szName = "���챦ʯ", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "��Ե¶(��)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "����", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}

function main()
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	tbMainDialog.szTitleMsg = "��<color=red>1 <color>���챦ʯ,<color=red>1 <color>��Ե¶(�� )  ƿ��<color=red>1 <color>����һ��ˮ���㽫���ϻ��һ��Ư���Ĵ���."
	tbMainDialog:AddOptEntry("����ˮ����", tbCardShop.buyCard, {tbCardShop,"����1"})
	tbMainDialog:AddOptEntry("����ˮ����", tbCardShop.buyCard, {tbCardShop, "����2"})
	tbMainDialog:AddOptEntry("����ˮ����", tbCardShop.buyCard, {tbCardShop, "����3"})
	tbMainDialog:Show()
end

function tbCardShop:buyCard(strCard)	
	local tbItem = self.composeList[strCard]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("[VNG][Lunar Year 2011] [Mua %s]", "����"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end