Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

STONG_TAKEOUT_LIMIT = 46000

function BaoxiangCompose(nItemIdx)
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local tbSay = {};
	tbSay[1] = format("Hi�n t�i h�n th�ch ch�a: <color=green>%d<color> tinh l�c", nCount);
	if(nBind == 0) then
		tbSay[1] = tbSay[1] .. format("Hi�n t�i c�c h� c� th� r�t ���c <color=green>%d<color> tinh l�c t� h�n th�ch", max(nCount-STONG_TAKEOUT_LIMIT, 0));
	end
	
	tinsert(tbSay, format("Ch�a %s/#PutIn('%s', %d)","Tinh l�c","Tinh l�c", nItemIdx));
--	if (nBind == 0 and max(nCount-STONG_TAKEOUT_LIMIT, 0) > 0) then
--		tinsert(tbSay, format("��ȡ%s/#TakeOut('%s', %d)","Tinh l�c","Tinh l�c", nItemIdx));
--	end
	
	tinsert(tbSay, "�� ta suy ngh� k� l�i xem/OnExit");
	CreateTaskSay(tbSay);
	return 1;
end

function PutIn(szItem, nItemIdx)
	local tbItemList = 
	{
		["Tinh l�c"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("H�n th�ch \t ch�a %s", "Tinh l�c"),
				szFailMsg = "���Tinh l�c���� ��!",
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "Tinh l�c", 
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
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("H�n th�ch ch�a [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function TakeOut(szItem, nItemIdx)
	local tbItemList = 
	{
		["Tinh l�c"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("H�n th�ch\tR�t %s", "Tinh l�c"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "����ȡ����Tinh l�c����", 
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
											Talk(1, "", "Tinh l�cֵ�ѳ������ޣ�������ȡ��");
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
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("T� h�n th�ch r�t ���c [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function OnExit()

end
