Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

STONG_TAKEOUT_LIMIT = 46000

function BaoxiangCompose(nItemIdx)
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local tbSay = {};
	tbSay[1] = format("Ŀǰ�������䴢����: <color=green>%d<color> ����ʯ", nCount);
	if(nBind == 0) then
		tbSay[1] = tbSay[1] .. format("Ŀǰ�����ȡ <color=green>%d<color> �������侫��ʯ", max(nCount-STONG_TAKEOUT_LIMIT, 0));
	end
	
	tinsert(tbSay, format("���� %s/#PutIn('%s', %d)","����ʯ","����ʯ", nItemIdx));
--	if (nBind == 0 and max(nCount-STONG_TAKEOUT_LIMIT, 0) > 0) then
--		tinsert(tbSay, format("��ȡ%s/#TakeOut('%s', %d)","����ʯ","����ʯ", nItemIdx));
--	end
	
	tinsert(tbSay, "������ϸ����/OnExit");
	CreateTaskSay(tbSay);
	return 1;
end

function PutIn(szItem, nItemIdx)
	local tbItemList = 
	{
		["����ʯ"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("�������� \t ���� %s", "����ʯ"),
				szFailMsg = "��ľ���ʯ���� ��!",
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "����ʯ", 
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
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("����������� [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function TakeOut(szItem, nItemIdx)
	local tbItemList = 
	{
		["����ʯ"] =  
		{
			tbFormula = 
			{
				
				szComposeTitle = format("��������\tȡ %s", "����ʯ"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0,
				tbMaterial = 
				{
					{
						szName = "����ȡ���ľ���ʯ����", 
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
											Talk(1, "", "����ʯֵ�ѳ������ޣ�������ȡ��");
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
		local tbComPos = tbActivityCompose:new(tbItem.tbFormula, format("�Ӿ�������ȡ�� [%s]", szItem));
		tbComPos:ComposeDailog(1);
	end
end

function OnExit()

end
