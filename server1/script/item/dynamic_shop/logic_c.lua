
if MODEL_GAMECLIENT ~= 1 then
	return
end

Include("\\script\\script_protocol\\protocol_def_c.lua")


Include("\\script\\second_hand_store\\itemdef.lua")

DynamicShop = {}

function DynamicShop:SendToServer(nHandle)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM", nHandle)
end

function DynamicShop:RecvItem(nDynamicShopID, nRequestPage, tbItem)
	
	local nCount = getn(tbItem)
	
	if nCount > 0 then
		ClearDynamicSellItemInfo()
		
		local nCount = getn(tbItem)
		for i=1, getn(tbItem) do
			SecondHandItem:CreateDynamicGoods(tbItem[i])
		
		end
	
		CoreDataChanged(136, nRequestPage, nCount);
	else
		Talk(1, "", "最后一页了")
	end

end




function DynamicShop:RequestItem(nPage)	
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nPage)
	self:SendToServer(nHandle)
	OB_Release(nHandle)
	
end