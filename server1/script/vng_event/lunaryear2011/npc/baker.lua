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
	tbMainDiag.szTitleMsg = "节日真是忙碌"
	tbMainDiag:AddOptEntry("介绍活动", tbBaker.introduction, {tbBaker})
	tbMainDiag:AddOptEntry("特别粽子", tbBaker.composeItem, {tbBaker})
	tbMainDiag:Show()
end
function tbBaker:introduction()
	local tbIntroDialog = tbNpcHead:createDialog()
	tbIntroDialog.szTitleMsg = "大家谁都忙于准备节日，为什么你站在这里？快去看主页了解详情"
	tbIntroDialog:AddOptEntry("返回", tbBaker.main, {tbBaker})
	tbIntroDialog:Show()
end
function tbBaker:composeItem()
	local tbComposeDialog = tbNpcHead:createDialog()
	tbComposeDialog.szTitleMsg = "如果有足够的原料，我将帮你做特别粽子]"
	tbComposeDialog:AddOptEntry("制作", tbBaker.doCompose, {tbBaker})
	tbComposeDialog:AddOptEntry("返回", tbBaker.main, {tbBaker})
	tbComposeDialog:Show()
end

function tbBaker:doCompose()
	local tbItemCompose = 
	{
		["特别粽子"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("做饼迎春活动\t 合成 %s", "特别粽子"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "粽子", tbProp = {6,1,30086,1,0,0}, nCount = 2},
								{szName = "包饼纸", tbProp = {6,1,30085,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "特别粽子", tbProp = {6,1,30089,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}
	local tbItem = tbItemCompose["特别粽子"]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("合成 [%s]", "特别粽子"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end
