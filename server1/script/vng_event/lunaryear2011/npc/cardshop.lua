Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")
if not tbCardShop then
	tbCardShop = {}
end
tbCardShop.composeList =
	{
		["春帖1"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("做饼迎春活动\t 合成 %s", "春帖1"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "蓝水晶", tbProp = {4,238,1,1,0,0}, nCount = 1}, --lam thuy tinh
								{szName = "晶红宝石", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "福缘露 (大)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "春帖", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["春帖2"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("做饼迎春活动 \t 合成 %s", "春帖2"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "紫水晶", tbProp = {4,239,1,1,0,0}, nCount = 1}, --tu thuy tinh
								{szName = "晶红宝石", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "福缘露(大)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "春帖 ", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["春帖3"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("做饼迎春活动\t 合成 %s", "春帖3"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "绿水晶", tbProp = {4,240,1,1,0,0}, nCount = 1}, --luc thuy tinh
								{szName = "晶红宝石", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "福缘露(大)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "春帖", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}

function main()
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	tbMainDialog.szTitleMsg = "以<color=red>1 <color>晶红宝石,<color=red>1 <color>福缘露(大 )  瓶和<color=red>1 <color>其中一种水晶你将马上获得一张漂亮的春帖."
	tbMainDialog:AddOptEntry("用蓝水晶买卡", tbCardShop.buyCard, {tbCardShop,"春帖1"})
	tbMainDialog:AddOptEntry("用紫水晶卡", tbCardShop.buyCard, {tbCardShop, "春帖2"})
	tbMainDialog:AddOptEntry("用绿水晶卡", tbCardShop.buyCard, {tbCardShop, "春帖3"})
	tbMainDialog:Show()
end

function tbCardShop:buyCard(strCard)	
	local tbItem = self.composeList[strCard]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("[VNG][Lunar Year 2011] [Mua %s]", "春帖"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end