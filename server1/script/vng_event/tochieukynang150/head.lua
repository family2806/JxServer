
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING");

if (not tbTrainSkill150) then
	tbTrainSkill150 = {};
end

tbTrainSkill150.tbBIT_MIJI19 = {nTaskID = 3081,nStartBit = 1, nBitCount = 2, nMaxValue = 2};    --150�����ؼ� 19��
tbTrainSkill150.tbBIT_MIJI20 = {nTaskID = 3081,nStartBit = 3, nBitCount = 2, nMaxValue = 2};    --150�����ؼ� 20��

tbTrainSkill150.tbBIT_TCVA = {nTaskID = 3082,nStartBit = 1, nBitCount = 2, nMaxValue = 2};    --Task ����������������
tbTrainSkill150.tbBIT_TCVD = {nTaskID = 3082,nStartBit = 3, nBitCount = 2, nMaxValue = 2};    --Task �����׵۴����������� �� 
tbTrainSkill150.tbBIT_TCTTMC = {nTaskID = 3082,nStartBit = 5, nBitCount = 2, nMaxValue = 2};	    --Task ��������ؾ������������� 
tbTrainSkill150.tbBIT_BCH_USE = {nTaskID = 3082,nStartBit = 7, nBitCount = 6, nMaxValue = 20};			-- Task �׾��輼��itemʹ�ô���
tbTrainSkill150.tbBIT_Free_Use = {nTaskID = 2902,nStartBit = 1, nBitCount = 6, nMaxValue = 60};			-- Task �����������ʹ�ô���
tbTrainSkill150.tbBIT_Fee_Use = {nTaskID = 2902,nStartBit = 7, nBitCount = 6, nMaxValue = 60};			-- Task �����������ʹ�ô���
--tbTrainSkill150.TSK_CHANGE_DAY = 3083;     --Task �������reset
tbTrainSkill150.TSK_DAILY_CHANGE = 3082;  --Task reset����
tbTrainSkill150.TSK_DAILY_USE = 2902		--Task reset ����
tbTrainSkill150.TSK_CHANGE_DAY = 2903;     --Task �������reset

tbTrainSkill150.tbFactionList_150 = {
	[0] = {1055, 1056, 1057},
	[1] = {1058, 1059, 1060},
	[2] = {1069, 1070, 1071, 1110},
	[3] = {1066, 1067},
	[4] = {1061, 1062, 1114},
	[5] = {1063, 1065},
	[6] = {1073, 1074},
	[7] = {1075, 1076},
	[8] = {1078, 1079},
	[9] = {1080, 1081},
}

function tbTrainSkill150:ResetDailyTask()
	local nDay = GetTask(self.TSK_CHANGE_DAY)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if nDay ~= nCurDate then
		SetTask(self.TSK_CHANGE_DAY, nCurDate)
		SetTask(self.TSK_DAILY_CHANGE, 0)
		SetTask(self.TSK_DAILY_USE, 0)
	end
end

--���level skill > 17 ��
function tbTrainSkill150:checkLevelSkill(nSkillId)
	if (GetCurrentMagicLevel(nSkillId, 0) > 17) then
		return 1
	end
	return 0
end

function tbTrainSkill150:GetMaxTask(nSkillId)
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVA) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVD) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCTTMC)
	if self:checkLevelSkill(nSkillId) == 1 then  --Levelskill  > 17	
			return tbVNG_BitTask_Lib:getBitTask(self.tbBIT_BCH_USE), 1
	end -- ���Levelskill < 17	
	return nNextTskVal* 5 + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_BCH_USE), 0
end

function tbTrainSkill150:GetValueMaxTask(nSkillId)
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVA) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVD) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCTTMC)
	return nNextTskVal* 5
end

--����task vng
function tbTrainSkill150:addDailyTask_Fee(nValue)
	self:ResetDailyTask()
	tbVNG_BitTask_Lib:addTask(self.tbBIT_Fee_Use, nValue)
end

function tbTrainSkill150:CheckValueTask()
	if (tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVA) ~= 1 or tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVD) ~= 1 or tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCTTMC) ~= 1) then
			return 0;
	end
	return 1;
end

function tbTrainSkill150:GetValueTask(nNumber)
	if(nNumber == 30162 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVA) ~= 1) then
			return self.tbBIT_TCVA
	end
	if(nNumber == 30163 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVD) ~= 1) then
			return self.tbBIT_TCVD
	end
	if(nNumber == 30164 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCTTMC) ~= 1) then
			return self.tbBIT_TCTTMC
	end
	return 0
end

--����������
function tbTrainSkill150:CheckTS()
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife == 3) then
		return 19
	end
	if (nTransLife == 2) then
		return 18
	end
	return 0
end

--������ʹ��item
function tbTrainSkill150:Check_UseItem(nSkillId)
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife == 2) and (GetCurrentMagicLevel(nSkillId, 0) == 18) then
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_MIJI19) == 1 then
			return 1
		end
	end

	if (nTransLife <= 3) and (GetCurrentMagicLevel(nSkillId, 0) == 19) then
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_MIJI20) == 1 then
			return 1
		end
	end
	
	return 0
end


function tbTrainSkill150:LoadItem()
	GiveItemUI("��������ƷҪ��","Ҫ��ÿ��ֻ��3���е�һ����Ʒ\�����ؾ�(����)\�����ؾ�(����ؾ�)" , "confirm_LoadItem", "onCancel", 1)
end

function confirm_LoadItem(nCount)
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "������Ʒ���ԣ�����")
		Msg2Player("������Ʒ���ԣ�����")
		return
	end
	
	if tbTrainSkill150:CheckValueTask() == 1 then
			Talk(1, "", "������Ĵ��������꣬����������")
			Msg2Player("������Ĵ��������꣬����������")
			return
	end
	
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)

	if nG ~= 6 or nD ~= 1 or (nP ~= 30162 and nP ~= 30163 and nP ~= 30164) then
			Talk(1, "", "������Ʒ���ԣ�����")
			Msg2Player("������Ʒ���ԣ�����")
			return
	end
	
	local nRet = tbTrainSkill150:GetValueTask(nP);
	if  nRet == 0 then
		Talk(1, "", "������Ĵ��������꣬����������")
		Msg2Player("������Ĵ��������꣬����������")
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(nRet, 1)
	Msg2Player("��ϲ���ѳɹ��������5��150������18�����»�����ֵ")
end