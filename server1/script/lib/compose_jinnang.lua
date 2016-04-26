Include("\\script\\lib\\composelistclass.lua")

if not tbComposeListForJinNang then
	tbComposeListForJinNang = tbComposeListClass:new("tbComposeListForJinNang")
end

function tbComposeListForJinNang:MakeOptByProductName(szPreMsg, nItemIndex, szDescLink)
	local tbOpt = {}
	for i=1, getn( self.tbComposeList) do
		local tbCompose = self.tbComposeList[i]
		local szOpt = format("%s/#%s:ComposeByListId(%d, %d, [[%s]])", szPreMsg..tbCompose:GetProductName(), self.szClassName, i, nItemIndex, szDescLink)
		tinsert(tbOpt, szOpt)
	end
	return tbOpt;
end

function tbComposeListForJinNang:MakeOptBytbMaterialList(szPreMsg, nItemIndex, szDescLink)
	local tbOpt = {}
	for i=1, getn( self.tbComposeList) do
		local tbCompose = self.tbComposeList[i]
		local szOpt = format("%s/#%s:ComposeByListId(%d, %d, [[%s]])", szPreMsg..tbCompose:GetFormulaByString(), self.szClassName, i, nItemIndex, szDescLink)
		tinsert(tbOpt, szOpt)
	end
	return tbOpt;
	
end



function tbComposeListForJinNang:ConfirmCompose(nId, nItemIndex)
	
	nItemIndex = nItemIndex or -1
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return
		end
	end
	local tbCompose = self.tbComposeList[nId]	
	
	if tbCompose:Compose() == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return
	end
	
	return
end

function tbComposeListForJinNang:ComposeByListId(nId, nItemIndex, szDescLink) 
	
	local tbCompose = self.tbComposeList[nId]
	if not tbCompose then
		return print("error for Compose ", nId, " is nil")
	end
	
	local tbFormula = tbCompose.tbFormula
	local tbMaterial = tbFormula.tbMaterial
	local tbProduct = tbFormula.tbProduct
	local szComposeTitle = tbFormula.szComposeTitle or format("фi %s", tbProduct.szName)
	local szMsg = format("<dec>%s%s 需要: <enter>%s", szDescLink, szComposeTitle ,tbCompose:GetMaterialList(tbMaterial))
	local szFunFormat = format("#%s:ConfirmCompose(%d,%d)", self.szClassName, nId, nItemIndex)
	local tbSay = 
	{
		szMsg,
		format("确认/%s", szFunFormat),
		"放弃/OnCancel"
	}
	CreateTaskSay(tbSay)
end

