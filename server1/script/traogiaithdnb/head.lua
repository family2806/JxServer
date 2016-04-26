THDNB7_EXTPOINT = 3
nBit_GetHuyenCD1 = 1
nBit_GetHuyenCD2 = 2
nBit_GetHoangCD1 = 3
nBit_GetHoangCD2 = 4
nBit_GetHBAK1 = 5
nBit_GetHBAK2 = 6
nBit_GetBDLKT1 = 7
nBit_GetBDLKT2 = 8
nBit_GetCLBHB1 = 9
nBit_GetCLBHB2 =10
nBit_GetTinhLuc = 11

function CheckGetBonusTHDNB7(numExtpoint, numBit)
	local nValuePoint	= GetExtPoint(numExtpoint)
	local nBit = GetBit(nValuePoint, numBit)
	
	if (nBit < 1) then
		return 1
	end
	if (nBit > 0) then
		return 0
	end
end

function SetBit2GetBonusTHDNB7(numExtpoint, numBit, numValue)
	local nValuePoint	= GetExtPoint(numExtpoint);
	local nBit = SetBit(nValuePoint, numBit, numValue);
	local nBitTemp = nBit - nValuePoint;
	AddExtPoint(numExtpoint, nBitTemp);
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function GetBonusHuyenCD(nCount, nTime)
	if (nTime==1) then--check neu user nhan lan thu 1
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHuyenCD1)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if (nTime==2) then--check neu user nhan lan thu 2
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHuyenCD2)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	--set bit khi user get item
	if (nTime==1) then--check neu user nhan lan thu 1
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHuyenCD1,1)
	else--check neu user nhan lan thu 2
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHuyenCD2,1)
	end
	for i=1, nCount do
		local nIndex = AddItem(6,1,1678,1,0,0)
		SetSpecItemParam(nIndex,1,1500000000)
		SyncItem(nIndex)
	end
	Msg2Player(format("大侠刚刚获得 %d 玄真丹", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取玄真丹奖励数量"..nCount)
end

function GetBonusHoangCD(nCount, nTime)
	if (nTime==1) then--check neu user nhan lan thu 1
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHoangCD1)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if (nTime==2) then--check neu user nhan lan thu 2
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHoangCD2)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	--set bit khi user get item
	if (nTime==1) then--check neu user nhan lan thu 1
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHoangCD1,1)
	else--check neu user nhan lan thu 2
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHoangCD2,1)
	end
	for i=1, nCount do
		local nIndex = AddItem(6,1,2264,1,0,0)
		SetSpecItemParam(nIndex,1,2000000000)
		SyncItem(nIndex)
	end
	Msg2Player(format("大侠刚刚获得 %d 黄真丹", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取黄真丹奖励数量"..nCount)
end

function GetBonusHBAK(nCount, nTime)
	if (nTime==1) then--check neu user nhan lan thu 1
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHBAK1)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if (nTime==2) then--check neu user nhan lan thu 2
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetHBAK2)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	--set bit khi user get item
	if (nTime==1) then--check neu user nhan lan thu 1
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHBAK1,1)
	else--check neu user nhan lan thu 2
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetHBAK2,1)
	end
	for i=1, nCount do
		local nIndex = AddItem(6,1,2105,1,0,0)
		SyncItem(nIndex)
	end
	Msg2Player(format("大侠刚刚获得 %d 安康红包", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取安康红包奖励数量"..nCount)
end

function GetBonusBDLKT(nCount, nTime)
	if (nTime==1) then--check neu user nhan lan thu 1
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetBDLKT1)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if (nTime==2) then--check neu user nhan lan thu 2
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetBDLKT2)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	--set bit khi user get item
	if (nTime==1) then--check neu user nhan lan thu 1
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetBDLKT1,1)
	else--check neu user nhan lan thu 2
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetBDLKT2,1)
	end
	for i=1, nCount do
		local nIndex = AddItem(6,1,2127,1,0,0)
		SyncItem(nIndex)
	end
	Msg2Player(format("大侠刚刚获得 %d 北斗炼金术", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取北斗炼金术奖励数量"..nCount)
end

function GetBonusCLBHB(nCount, nTime)
	if (nTime==1) then--check neu user nhan lan thu 1
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetCLBHB1)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if (nTime==2) then--check neu user nhan lan thu 2
		if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetCLBHB2)~= 1) then
			Talk(1, "", "大侠已领该奖了 !");
			return
		end
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	--set bit khi user get item
	if (nTime==1) then--check neu user nhan lan thu 1
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetCLBHB1,1)
	else--check neu user nhan lan thu 2
		SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetCLBHB2,1)
	end
	for i=1, nCount do
		local nIndex = AddItem(6,1,30032,1,0,0)
		ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("大侠刚刚获得 %d 红包俱乐部", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取红包俱乐部奖励数量"..nCount)
end

function GetBonusTinhLuc(nCount)

	if (CheckGetBonusTHDNB7(THDNB7_EXTPOINT, nBit_GetTinhLuc)~= 1) then
		Talk(1, "", "大侠已领该奖了 !");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "装备不足5空位.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusTHDNB7(THDNB7_EXTPOINT,nBit_GetTinhLuc,1)
	AddEnergy(nCount)
	Msg2Player(format("大侠刚刚获得 %d 精炼石值", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus THDNB7"..GetAccount().."\t"..GetName().."\t".."领取精炼石值奖励数量"..nCount)
end
