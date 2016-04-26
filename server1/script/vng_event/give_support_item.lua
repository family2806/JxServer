Include("\\script\\vng_lib\\bittask_lib.lua")

GiveSupportItem = {}

GiveSupportItem.TASK_COUNT_ITEM_1 = 2764

GiveSupportItem.TASK_COUNT_ITEM_2 = 2765

GiveSupportItem.TASK_COUNT_ITEM_3 = 2766

GiveSupportItem.TASK_COUNT_ITEM_4 = 2767

GiveSupportItem.TASK_COUNT_ITEM_5 = 2768

GiveSupportItem.TASK_COUNT_ITEM_6 = 2769

GiveSupportItem.TASK_COUNT_ITEM_7 = 2729

GiveSupportItem.tbResetTask = 
	{
		nTaskID = 2754,
		nStartBit = 28,
		nBitCount = 1,
		nMaxValue = 1
	}

GiveSupportItem.START_DATE = 201205280000
GiveSupportItem.END_DATE = 201206032400

GiveSupportItem.tbListItem = 
{
	--{szName="", nG=, nD=, nP=, nStack=, nType=}
--	{szName="乾坤造化丹 (大) ", nG=6, nD=1, nP=215, nType=1},
--	{szName="乾坤造化丹 (中) ", nG=6, nD=1, nP=216, nType=1},
--	{szName="乾坤造化丹 (小) ", nG=6, nD=1, nP=217, nType=1},
--	{szName="宋金普防丸", nG=6, nD=1, nP=190, nType=1},
--	{szName="战鼓 ", nG=6, nD=1, nP=156, nType=2},
--	{szName="抗丹之觉 ", nG=6, nD=1, nP=214, nType=2},
--	{szName="令牌", nG=6, nD=1, nP=157, nType=2},
--	{szName="专用于宋金毒防丸", nG=6, nD=1, nP=195, nType=3},
--	{szName="专用于宋金雷防丸", nG=6, nD=1, nP=193, nType=3},
--	{szName="专用于宋金火防丸", nG=6, nD=1, nP=194, nType=3},
--	{szName="宋金冰防丸", nG=6, nD=1, nP=192, nType=3},
--	{szName="宋金普防丸", nG=6, nD=1, nP=191, nType=3},
--	{szName="宋金长命丸", nG=6, nD=1, nP=186, nType=3},
--	{szName="宋金高中丸", nG=6, nD=1, nP=189, nType=3},
--	{szName="宋金高闪丸", nG=6, nD=1, nP=188, nType=3},
--	{szName="宋金加袍丸", nG=6, nD=1, nP=187, nType=3},
--	{szName="宋金长命丸", nG=6, nD=1, nP=186, nType=3},
--	{szName="宋金内雷丸", nG=6, nD=1, nP=185, nType=3},
--	{szName="宋金内冰丸", nG=6, nD=1, nP=183, nType=3},
--	{szName="宋金内毒丸", nG=6, nD=1, nP=182, nType=3},
--	{szName="宋金内火丸", nG=6, nD=1, nP=184, nType=3},
--	{szName="宋金内普丸", nG=6, nD=1, nP=181, nType=3},
--	{szName="宋金外冰丸", nG=6, nD=1, nP=180, nType=3},
--	{szName="宋金外毒丸", nG=6, nD=1, nP=179, nType=3},
--	{szName="宋金外普丸", nG=6, nD=1, nP=178, nType=3},

	{szName="乾坤造化丹 (大) ", nG=6, nD=1, nP=215, nType=1},
	{szName="乾坤造化丹 (中) ", nG=6, nD=1, nP=216, nType=2},
	{szName="乾坤造化丹 (小) ", nG=6, nD=1, nP=217, nType=3},
	{szName="宋金普防丸", nG=6, nD=1, nP=190, nType=4},
	{szName="战鼓", nG=6, nD=1, nP=156, nType=5},
	{szName="抗丹之觉 ", nG=6, nD=1, nP=214, nType=5},
	{szName="令牌", nG=6, nD=1, nP=157, nType=5},
	{szName="专用于宋金毒防丸", nG=6, nD=1, nP=195, nType=6},
	{szName="专用于宋金雷防丸", nG=6, nD=1, nP=193, nType=6},
	{szName="专用于宋金火防丸", nG=6, nD=1, nP=194, nType=6},
	{szName="宋金冰防丸", nG=6, nD=1, nP=192, nType=6},
	{szName="宋金普防丸", nG=6, nD=1, nP=191, nType=6},
	{szName="宋金长命丸", nG=6, nD=1, nP=186, nType=6},
	{szName="宋金高中丸", nG=6, nD=1, nP=189, nType=6},
	{szName="宋金高闪丸", nG=6, nD=1, nP=188, nType=6},
	{szName="宋金加袍丸", nG=6, nD=1, nP=187, nType=6},
	{szName="宋金长命丸", nG=6, nD=1, nP=186, nType=6},
	{szName="宋金内雷丸", nG=6, nD=1, nP=185, nType=6},
	{szName="宋金内冰丸", nG=6, nD=1, nP=183, nType=6},
	{szName="宋金内毒丸", nG=6, nD=1, nP=182, nType=6},
	{szName="宋金内火丸", nG=6, nD=1, nP=184, nType=6},
	{szName="宋金内普丸", nG=6, nD=1, nP=181, nType=6},
	{szName="宋金外冰丸", nG=6, nD=1, nP=180, nType=6},
	{szName="宋金外毒丸", nG=6, nD=1, nP=179, nType=6},
	{szName="宋金外普丸", nG=6, nD=1, nP=178, nType=6},
	--THDNB9
	{szName="回天再造礼包", nG=6, nD=1, nP=2527, nType=7},
	--{szName="回天再造锦囊", nG=6, nD=1, nP=1781, nType=7},
}


function GiveSupportItem:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (now >= self.START_DATE) and (now <= self.END_DATE) then
		return 1;
	end
	return 0;
end

function GiveSupportItem:ShowDialog()
	local tbOpt = {}
	local str = "交物品支持宋金"

	tinsert(tbOpt, "我想交工具支持宋金/#GiveSupportItem:OpenUI()")
	tinsert(tbOpt, "<#>退出/OnCancel")
	if ( getn( tbOpt ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpt ), tbOpt )	
end

function GiveSupportItem:OpenUI()
	--THDNB9 Reset 已使用的task在THDNB8 - Modified by DinhHQ
	if tbVNG_BitTask_Lib:getBitTask(self.tbResetTask) == 0 then
		for i = 2764, 2769 do
			SetTask(i, 0)
		end		
		SetTask(2729, 0)
		tbVNG_BitTask_Lib:setBitTask(self.tbResetTask, 1)
	end
	
	GiveItemUI("交物品支持宋金", "交物品支持宋金", "ConfirmSupportItem", "OnCancel");
end

function ConfirmSupportItem(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		
		--THDNB9检查回天再造礼包和回天再造锦囊的价值 - Modified by DinhHQ - 20110517
		if (itemgenre == 6 and detailtype == 1 and parttype == 1781) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue < 60 then
				Talk(1, "", "<color=yellow>回天再造锦囊<color> 需要剩余的价值为60才能接受!");
				return
			end
		end
		if (itemgenre == 6 and detailtype == 1 and parttype == 2527) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue ~= 0 then
				Talk(1, "", "<color=yellow>回天再造礼包 <color>需要剩余的价值为60才能接受!");
				return
			end
		end
		
		
		if (GiveSupportItem:CheckItem(itemgenre, detailtype, parttype) <= 0) then
			Talk(1, "", "请大侠放入正确的物品!");
			return
		end
	end
	GiveSupportItem:ProcessGiveItem(nCount)
end

function GiveSupportItem:ProcessGiveItem(nCount)
	local nCount_1, nCount_2, nCount_3, nCount_4, nCount_5, nCount_6, nCount_7 = 0, 0, 0, 0, 0, 0, 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)	
		local nIndexList = self:CheckItem(itemgenre, detailtype, parttype)
		if (self.tbListItem[nIndexList].nType == 1) then
			nCount_1 = nCount_1 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 2) then
			nCount_2 = nCount_2 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 3) then
			nCount_3 = nCount_3 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 4) then
			nCount_4 = nCount_4 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 5) then
			nCount_5 = nCount_5 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 6) then
			nCount_6 = nCount_6 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 7) then
			nCount_7 = nCount_7 + GetItemStackCount(nItemIndex)
		end
	end
	--Msg2Player(nCount_1.." - " .. nCount_2.." - " .. nCount_3.." - " .. nCount_4.." - " .. nCount_5.." - " .. nCount_6)
	
	local nTotal_1 = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1
	local nTotal_2 = GetTask(self.TASK_COUNT_ITEM_2) + nCount_2
	local nTotal_3 = GetTask(self.TASK_COUNT_ITEM_3) + nCount_3	
	local nTotal_4 = GetTask(self.TASK_COUNT_ITEM_4) + nCount_4
	local nTotal_5 = GetTask(self.TASK_COUNT_ITEM_5) + nCount_5	
	local nTotal_6 = GetTask(self.TASK_COUNT_ITEM_6) + nCount_6
	local nTotal_7 = GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	local nMod = 0
	if mod(nTotal_1, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_2, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_3, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_4, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_5, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_6, 50) > 0 then
		nMod = nMod + 1
	end
	
	local nSum = floor(nTotal_1/10) +  floor(nTotal_2/10) +  floor(nTotal_3/10) +  floor(nTotal_4/50) + floor(nTotal_5/50) + floor(nTotal_6/50) + nMod + nTotal_7
	--Msg2Player(nSum .. "..................")
	if (nSum > 300) then
		Talk(1, "", "上交物品数量超过允许范围!");
		return
	end
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nItemIndex) ~= 1) then
			Talk(1, "", "物品有问题 !");
			return
		end
	end
	
	local nTotalAll = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1 +  GetTask(self.TASK_COUNT_ITEM_2) + nCount_2 + GetTask(self.TASK_COUNT_ITEM_3) + nCount_3 + GetTask(self.TASK_COUNT_ITEM_4) + nCount_4 + GetTask(self.TASK_COUNT_ITEM_5) + nCount_5 + GetTask(self.TASK_COUNT_ITEM_6) + nCount_6 + GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	if (nCount_1 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_1)
		SetTask(self.TASK_COUNT_ITEM_1, nTotal + nCount_1)
		Msg2Player("大侠已交 <color=yellow>" .. nCount_1 .. " <color>物品类别1 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_1 .. " 类别1 - 总数" .. nTotalAll)
	end
	
	if (nCount_2 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_2)
		SetTask(self.TASK_COUNT_ITEM_2, nTotal + nCount_2)
		Msg2Player("大侠已交 <color=yellow>" .. nCount_2 .. " <color>物品类别2 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_2 .. " 类别2 - 总数" .. nTotalAll)
	end
	
	if (nCount_3 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_3)
		SetTask(self.TASK_COUNT_ITEM_3, nTotal + nCount_3)
		Msg2Player("大侠已交 <color=yellow>" .. nCount_3 .. " <color>物品类别3 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_3 .. " 类别3 - 总数" .. nTotalAll)
	end
	
	if (nCount_4 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_4)
		SetTask(self.TASK_COUNT_ITEM_4, nTotal + nCount_4)		
		Msg2Player("大侠已交 <color=yellow>" .. nCount_4 .. " <color>物品类别4 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_4 .. " 类别4 - 总数" .. nTotalAll)
	end
	
	if (nCount_5 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_5)
		SetTask(self.TASK_COUNT_ITEM_5, nTotal + nCount_5)
		Msg2Player("大侠已交 <color=yellow>" .. nCount_5 .. " <color>5类物品- 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_5 .. " 5类- 总数" .. nTotalAll)
	end
	
	if (nCount_6 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_6)
		SetTask(self.TASK_COUNT_ITEM_6, nTotal + nCount_6)
		Msg2Player("大侠已交 <color=yellow>" .. nCount_6 .. " <color>6类物品 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_6 .. " 类别6 - 总数" .. nTotalAll)
	end
	
	if (nCount_7 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_7)
		SetTask(self.TASK_COUNT_ITEM_7, nTotal + nCount_7)		
		Msg2Player("大侠已交 <color=yellow>" .. nCount_7 .. " <color>7类物品 - 已交总物品数为<color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."交物品支持宋金"..GetAccount().."\t"..GetName().."\t".."交" .. nCount_7 .. " 类别7 - 总数" .. nTotalAll)
	end
end

function GiveSupportItem:CheckItem(nG, nD, nP)
	local nCount = 0
	for i=1, getn(self.tbListItem) do
		local tbTemp = self.tbListItem[i]
		if (nG== tbTemp.nG and nD== tbTemp.nD and nP== tbTemp.nP) then
			nCount = i
		end
	end
	
	if (nCount > 0) then
		return nCount
	else
		return 0
	end
end

function onCancel()

end
