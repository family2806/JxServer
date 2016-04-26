Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

STONG_TAKEOUT_LIMIT = 46000

function BaoxiangCompose(nItemIdx)
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local tbSay = {};
	tbSay[1] = format("目前精炼宝箱储存有: <color=green>%d<color> 精炼石", nCount);
	if(nBind == 0) then
		tbSay[1] = tbSay[1] .. format("目前你可以取 <color=green>%d<color> 精炼宝箱精炼石", max(nCount-STONG_TAKEOUT_LIMIT, 0));
	end
	
	tinsert(tbSay, format("储存 %s/#PutIn('%s', %d)","精炼石","精炼石", nItemIdx));
--	if (nBind == 0 and max(nCount-STONG_TAKEOUT_LIMIT, 0) > 0) then
--		tinsert(tbSay, format("吸取%s/#TakeOut('%s', %d)","精炼石","精炼石", nItemIdx));
--	end
	
	tinsert(tbSay, "让我仔细想想/OnExit");
	CreateTaskSay(tbSay);
	return 1;
end

function PutIn(szItem, nItemIdx)
	local tbItemList = 
	{
		["精炼石"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("精炼宝箱 \t 存有 %s", "精炼石"),
				szFailMsg = "你的精炼石不足 !",
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "精炼石", 
						pGetCount = function () 
										return GetEnergy() 
									end, 
						nCount = 1,
						pConsume = function (self, nConsumeCount)
										return ReduceEnergy(nConsumeCount)
								   end,
					},
				},
				nItemIndex = 0,
				pProductFun =  function (self, nCount)
								if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0) then
									local nBind = GetItemBindState(self.nItemIndex);
									local nCurCount = GetItemMagicLevel(self.nItemIndex, 1);
									nCurCount = nCurCount + nCount;
									SetItemMagicLevel(self.nItemIndex, 1, nCurCount);
									SyncItem(self.nItemIndex)
									SetItemBindState(self.nItemIndex, nBind)
								end
							end
				
			},
		},
	}
	
	local tbItem = tbItemList[szItem];
	if (tbItem) then
		tbItem.tbFormula.nItemIndex = nItemIdx;
		tbItem.tbFormula.tbMaterial[1].nItemIndex = nItemIdx;
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("精炼宝箱存有 [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function TakeOut(szItem, nItemIdx)
	local tbItemList = 
	{
		["精炼石"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("精炼宝箱\t取 %s", "精炼石"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "可以取出的精炼石数量", 
						pGetCount = function (self) 
										if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0) then
											local nBind = GetItemBindState(self.nItemIndex);
											if (nBind == 0) then
												return max(GetItemMagicLevel(self.nItemIndex, 1) - STONG_TAKEOUT_LIMIT,0);
											end
										end
										return 0;
									end, 
						nCount = 1,
						pConsume = function (self, nConsumeCount)
										if ((GetEnergy()+nConsumeCount)>2000000000) then
											Talk(1, "", "精炼石值已超过上限，不能再取了");
											return nil;
										end
										if (self.nItemIndex ~= nil and type(self.nItemIndex) == "number" and self.nItemIndex > 0 and AddEnergy(nConsumeCount) == 1) then
											local nBind = GetItemBindState(self.nItemIndex);
											local nCurCount = GetItemMagicLevel(self.nItemIndex, 1);
											nCurCount = nCurCount - nConsumeCount;
											SetItemMagicLevel(self.nItemIndex, 1, nCurCount);
											SyncItem(self.nItemIndex)
											SetItemBindState(self.nItemIndex, nBind)
											return 1;
										end
										return nil;
								   end,
					},
				},
				nItemIndex = 0,
				pProductFun =  function (self, nCount)
							
						end
				
			},
		},
	}
	
	local tbItem = tbItemList[szItem];
	if (tbItem) then
		tbItem.tbFormula.nItemIndex = nItemIdx;
		tbItem.tbFormula.tbMaterial[1].nItemIndex = nItemIdx;
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("从精炼宝箱取得 [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function OnExit()

end
