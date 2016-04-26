--2¿ÅÐÇºì±¦Ê¯+2¿ÅÂÌË®¾§+2¿Å×ÏË®¾§+2¿ÅÀ¶Ë®¾§+1¸öÌúÅ£ÀÉÑÀÅå
Include ("\\script\\lib\\common.lua")
jiefang_0804_BossDrop = 
{
	{szName="ÐÇºì±¦Ê¯", tbProp={4, 353, 1, 1, 0, 0}, nCount = 2},
	{szName="ÂÌË®¾§", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
	{szName="×ÏË®¾§", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
	{szName="À¶Ë®¾§", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
	{szName="ÌúÅ£ÀÉÑÀÅå", tbProp={6, 1, 1733, 1, 0, 0}},

}

function jiefang_0804_NpcDropItem(nNpcIndex, tbItemList, szActName)
	local tbItemProp	= tbItemList.tbProp
	local szItemName	= tbItemList.szName
	local nCount 		= tbItemList.nCount or 1
	for i = 1, nCount do
		if tbItemProp and szItemName then
			
			local nItemIndex = 0;
			local nPropCount = getn(tbItemProp)
			if nPropCount == 6 then
				local nX, nY, nSubWorldIdx = GetNpcPos( nNpcIndex );
				nItemIndex = DropItem(nSubWorldIdx,nX,nY,PlayerIndex,unpack(tbItemProp))
			end
			
			if tbItemList.nExpiredTime then
				ITEM_SetExpiredTime(nItemIndex, tbItemList.nExpiredTime)
				SyncItem(nItemIndex)
			end
					
			if tbItemList.nBindState then
				SetItemBindState(nItemIndex, tbItemList.nBindState)--ÓÀ¾Ã
			end
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tdrop a item %s.",szActName,GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
		end
	end
end

function OnDeath(nNpcIndex)
	for i = 1, getn(jiefang_0804_BossDrop) do
		jiefang_0804_NpcDropItem(nNpcIndex, jiefang_0804_BossDrop[i], "ÌúÅ£´óÍõµÄÎïÆ·")
	end
end