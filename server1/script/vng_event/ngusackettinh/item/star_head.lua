Include("\\script\\lib\\awardtemplet.lua")

tbNSKT_Item_Star = {}
tbNSKT_Item_Star.nTaskID = 2762
tbNSKT_Item_Star.nStartBit = 2
tbNSKT_Item_Star.nEndBit = 9
tbNSKT_Item_Star.nMaxItemUse = 200

-- ���ʹ�� item, 1: ʹ�õ���, 0: ��ʣʱ��
function tbNSKT_Item_Star:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end

--���ʹ����Ʒ����
function tbNSKT_Item_Star:checkCondition()	
	if( GetExtPoint(0) >= 1 and GetLevel()>= 50) then		
		return 1;
	else
		return 0
	end;	
end

-- ��鿴�Ѿ����� max 3��������, 1: �Ѿ��� max, 0: û��max
function tbNSKT_Item_Star:isMaxItemUse()
	if (GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit) >= 200) then
		return 1;
	else return 0;
	end
end
-- ����Ʒ������ʹ�õ�1�����浽task
function tbNSKT_Item_Star:setUseCount()
	local nValue = GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit)
	nValue = nValue + 1
	if (nValue >= self.nMaxItemUse) then
		nValue = self.nMaxItemUse
	end
	return SetBitTask(self.nTaskID, self.nStartBit, self.nEndBit, nValue)
end

-- ʹ��item��Ʒ����
function tbNSKT_Item_Star:giveAward(tbItem, szLogTittle)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTittle)
end