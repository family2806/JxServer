Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")

function IpBonus()
	local nPromotionSay = {	}
	
	tinsert(nPromotionSay,"���뿴����ʱ��/ShowTimeNow")
	tinsert(nPromotionSay,"��ȡ�����н���/GetBonusGreenItem")	
	tinsert(nPromotionSay,"��ȡ�Ʊ��н���/GetBonusYellowItem")	
	--tinsert(nPromotionSay,"��ȡ˫�����齱��/GetBonusExp")	
	tinsert(nPromotionSay,"��ȡ�ν�1.5������/GetTongKimBonus")	
	tinsert(nPromotionSay,"����ֻ��·��!/OnCancel")
	
	Say("���գ�ֻ��Ҫ��������4Сʱ������CSM�����<color=red>1 ������<color>. �������ߡ�ί�����߻���ί�����ߵ���������㡣���⣬����������1Сʱ��ȡ˫������",getn(nPromotionSay),nPromotionSay)
end;

function ShowTimeNow()
	if CheckIPBonus() == 0 then
		Say("Ŀǰ�������ܿ���Ϣ�����Ժ�����!",0)
		return
	end
	IpBonus_Close()	
	local nHour, nMin, nSec = ShowTime()
	local nHour2, nMin2, nSec2 = ShowTimeYellowBox()
	local strMsg = format("��������CSM����ת�������е�ʱ��Ϊ%dСʱ%d����%d��.<enter>�ܵ�����ʱ�䣺%d Сʱ%d ��%d ��",nHour, nMin, nSec,nHour2, nMin2, nSec2)
	IpBonus_Start()
	Talk(1,"IpBonus",strMsg)
end

function GetBonusGreenItem()
	if CheckIPBonus() == 0 then
		Say("Ŀǰ���������콱�����Ժ�����!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
		
	if GetTask(TASKID_GET_TIMES) >= 6 then
		Say("������������6�ν����ˣ�����������",0)
		return
	end	
	
	local nHour, nMin, nSec = ShowTime()
	if nHour < 4 then
		Say("��������4��Сʱ������ʱ��!",0)
		return
	end	
	
	if CalcFreeItemCellCount() < 2 then
		Say("������װ������2��λ!",0)
		return
	end
	
	if IpBonus_Minus(4*60*60) == 1 then	
		SetTask(TASKID_GET_TIMES,GetTask(TASKID_GET_TIMES) + 1);
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30000,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);	
		SetItemBindState(nItemIndex, -2);
		Say("��ϲ�������1������.");
		Msg2Player("����1������.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","��ȡ������",GetAccount(),GetName()))		
	end
end;

function GetBonusYellowItem()
	if CheckIPBonus() == 0 then
		Say("Ŀǰ���������콱�����Ժ�����!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 0 then
		Talk(1, "", "��������ý�.")
		return
	end
	if IsCharged() == 0 then
		Talk(1, "", "���ֵ�����콱.")
		return
	end
	
	if GetLevel() < 130 and  ST_IsTransLife() < 1 then
		Talk(1, "", "δ������Ҫ130�������콱.")
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Say("������װ������2��λ!",0)
		return
	end
	
	if IpBonus_Minus_Yellow_Box(50*60*60) == 1 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX, 1)
		if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 1 then		
			return
		end
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30001,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);
		SetItemBindState(nItemIndex, -2);
		Say("��ϲ�������1���Ʊ���.");
		Msg2Player("�����һ���Ʊ���.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","��ȡ�Ʊ���",GetAccount(),GetName()))
	else
		Say("���������콱����!",0)
		return
	end
end;

function GetBonusExp()
	if CheckIPBonus() == 0 then
		Say("Ŀǰ���������콱�����Ժ�����!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
		Say("�ý���ֻ����ÿ�����塢���������ջ�ã�!" ,1,"���ǲ�����˼/OnCancel")
		return
	end

	if GetSkillState(451) > 0 then
		Say("�㲻���Ѿ��������?" ,1,"���ǲ�����˼/OnCancel")
		return
	end	
		
	AddSkillState(451, 20, 1, 18*60*60);
	Say("��ϲ�������˫������!");
	Msg2Player("����60�����ڻ��˫������Ч��.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","˫������",GetAccount(),GetName()))
end

function GetTongKimBonus()
	if CheckIPBonus() == 0 then
		Say("Ŀǰ���������콱�����Ժ�����!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	
--	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
--		Say("�ý���ֻ����ÿ�����塢���������ջ�ã�!" ,1,"���ǲ�����˼/OnCancel")
--		return
--	end
	
	if (PlayerFunLib:CheckTaskDaily(TASKID_DAILY_X2TONGKIM,3,"����������콱3���ˡ�����������","<") ~= 1) then
			return
	end
	
	if (GetTask(TASKID_COUNT_X2TONGKIM) ~= 0) then
		Talk(1,"","�������������𣿿�ȥ�μ��ν�ս��!!!!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(TASKID_DAILY_X2TONGKIM,1)
	SetTask(TASKID_COUNT_X2TONGKIM,1)
	Say("��ϲ�������1.5�����ν���!");
	Msg2Player("�����ν�˫������.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","�ν�˫������",GetAccount(),GetName()))
	
end


function OnCancel()
end;
