Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\task\\random\\task_head.lua");

function LevelUp(nLevel) -- process level up
	local nCurLevel = GetLevel()
	local nLV = nLevel - nCurLevel
	for i=1,nLV do AddOwnExp(2000000000) end
end
function IsNewAccount()
	local nValuePoint	= GetExtPoint(NWP_EXTPOINT_CheckGetItem)
	local nBit = GetBit(nValuePoint, NWP_E6_BIT_NewAccount)
	
	if (nBit < 1) then
		return 0
	end
	if (nBit > 0) then
		return 1
	end
end

function CheckGetItem(numExtpoint, numBit)
	local nValuePoint	= GetExtPoint(numExtpoint)
	local nBit = GetBit(nValuePoint, numBit)
	
	if (nBit < 1) then
		return 1
	end
	if (nBit > 0) then
		return 0
	end
end
function SetBit2GetItem(numExtpoint, numBit, numValue)
	local nValuePoint	= GetExtPoint(numExtpoint);
	local nBit = SetBit(nValuePoint, numBit, numValue);
	local nBitTemp = nBit - nValuePoint;
	AddExtPoint(numExtpoint, nBitTemp);
end
function IsCode()
		local nValuePoint	= GetExtPoint(NWP_EXTPOINT);
		local nBit = GetBit(nValuePoint, NWP_E5_IsCode_BIT);
		if (nBit == 1) then
			return 1
		else
			return 0
		end
end

function CheckObject()
	local nlevel = GetLevel()
	local nValuePoint	= GetExtPoint(NWP_EXTPOINT);
	local nBit = GetBit(nValuePoint, NWP_E5_IsCode_BIT);
	
	if nBit ==1 and ST_GetTransLifeCount() == 1 and nlevel <= 120  then -- group player of obj 1
		return 1
	elseif nBit == 1 and ST_GetTransLifeCount() ==0 and nlevel >=165 and nlevel <= 179 then --  group player of obj 2
		return 2
	elseif nBit ==1 and ST_GetTransLifeCount()==0 and nlevel < 165 then -- group player of obj 3
		return 3
	else -- outof range
		return 0
	end
end

function CheckDayOfWeek()
		local nDay = tonumber(date("%w"))
		if (nDay >= 1and nDay <= 4) then
			return 1
		else
			return 2
		end
end

function AddLenhBaiBH()
	local nRandomTaskID = createRandomTask();
	nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	nExpiredTime = OneDayTime * 3
	ITEM_SetExpiredTime(nRandomItemIndex, nExpiredTime);
	SetItemBindState(nRandomItemIndex, -2);
	SyncItem(nRandomItemIndex);
	local strItem = GetItemName(nRandomItemIndex)
	Msg2Player("���� "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�쵽ÿ�ս���"..strItem)
end

function CheckCondition2GetBonusFirstWeek14()
	if (GetTask(Task_Total_BonusFirstWeek14) >= 20) then
		Talk(1, "", "0h-14h�������ֻ����20��.");
		return 0
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusFirstWeek14) ~= 1) then
		Talk(1, "", "0h-14h����ÿ��ֻ����ȡ1��!");
		return 0
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return 0
	end
	return 1
end
function CheckCondition2GetBonusFirstWeek24()
	if (GetTask(Task_Total_BonusFirstWeek24) >= 20) then
		Talk(1, "", "14h - 24h�Ľ������ֻ����20��.");
		return 0
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusFirstWeek24) ~= 1) then
		Talk(1, "", "14h - 24h�Ľ���ÿ��ֻ����һ�� !");
		return 0
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return 0
	end
	return 1
end

function CheckCondition2GetBonusEndWeek14()
	if (GetTask(Task_Total_BonusEndWeek14) >= 15) then
		Talk(1, "", "��ĩ3���0h - 14h���ֻ����15��.");
		return 0
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusEndWeek14) ~= 1) then
		Talk(1, "", "��ĩ3���0h - 14hÿ��ֻ����һ�� !");
		return 0
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return 0
	end
	return 1
end
function CheckCondition2GetBonusEndWeek24()
	if (GetTask(Task_Total_BonusEndWeek24) >= 15) then
		Talk(1, "", "��ĩ3��14h - 24h ���ֻ����15��.");
		return 0
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetBonusEndWeek24) ~= 1) then
		Talk(1, "", "��ĩ3��14h - 24h ÿ��ֻ����һ�� !");
		return 0
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return 0
	end
	return 1
end

function GetCurQuest()
	local IsQ = GetTask(Task_IsQuest)
	local IsFQ = GetTask(Task_IsFinishQuest)
	return IsQ, IsFQ
end

function Cancel()
end
