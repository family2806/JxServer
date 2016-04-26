Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\killmonster.lua");
Include("\\script\\task\\task_addplayerexp.lua");
tbQuest=
{
	tbQuest2=
	{
		{szQuestName = "��ս�ν�", nId = 1},
		{szQuestName = "Ѱ��ˮ��", nId = 2},
		{szQuestName = "�������", nId = 3},
		{szQuestName = "������", nId = 4}
	},
	tbQuest3=
	{
		{szQuestName = "�ռ�����", nId = 1},
		{szQuestName = "�ռ���ͼ", nId = 2},
		{szQuestName = "�ռ���Ե", nId = 3},
		{szQuestName = "�ռ���ս��", nId = 4}
	}
};
function AcceptFirstQuest()
	SetTask(Task_IsQuest, 1)
	tbAnBangHKL:AcceptTask(1, 21)
end

function FinishFirstQuest()
	if (tbAnBangHKL:CheckTaskComplete() ~= 1) then
		return
	end
	 tbAnBangHKL:CompleteTask()
	 SetTask(Task_IsFinishQuest, 1)
end

function GetSecondQuest()
	SetTask(Task_IsQuest, 2)
	local nTskRandom = random(1, getn(tbQuest.tbQuest2))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest2[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestTongKim()
	elseif (nTskID == 2) then
		QuestThuyTac()
	elseif (nTskID == 3) then
		QuestDanhVong()
	elseif (nTskID == 4) then
		QuestDaoYeu()
	end
end
function QuestTongKim()
	SetTask(Task_lag_TskID, 1)
	local nCurScoreTK = GetTask(747)
	SetTask(Task_SCore,nCurScoreTK)
	Msg2Player("����������ν����1000��")
end
function QuestThuyTac()
	SetTask(Task_lag_TskID, 2)
	SetTask(Task_KillNPC, 0)
	Msg2Player("���������ˮ��ͷ��")
end
function QuestDanhVong()
	SetTask(Task_lag_TskID, 3)
	SetTask(Task_SCore, GetRepute())
	Msg2Player("���������50������ֵ")
end
function QuestDaoYeu()
	SetTask(Task_lag_TskID, 4)
	SetTask(Task_KillNPC, 0)
	Msg2Player("����������������ڵ�4������")
end

function FinishSecondQuest()
		if (GetTask(Task_lag_TskID) == 1) then --����ν�����
			if (GetTask(747) >= GetTask(Task_SCore) + 1000) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("��ϲ��������ɵڶ��������񣬴������Լ����ӵ�����������")
			else
				Talk(1, "", "����δ������� !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 2) then  --���ˮ������
			if (GetTask(Task_KillNPC) == 1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("��ϲ��������ɵڶ��������񣬴������Լ����ӵ�����������")
			else
				Talk(1, "", "����δ�������!");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 3) then
			if (GetRepute() >= GetTask(Task_SCore)+50) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("��ϲ��������ɵڶ��������񣬴������Լ����ӵ�����������")
			else
				Talk(1, "", "����δ�������!");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 4) then
			if (GetTask(Task_KillNPC) >= 4) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("��ϲ��������ɵڶ��������񣬴������Լ����ӵ�����������")
			else
				Talk(1, "", "����δ�������!");
				return
			end
		end
		
end

function GetThirdQuest()
	SetTask(Task_IsQuest, 3)
	local nTskRandom = random(1, getn(tbQuest.tbQuest3))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest3[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestHuyenTinh()
	elseif (nTskID == 2) then
		QuestMatDo()
	elseif (nTskID == 3) then
		QuestPhucDuyen()
	elseif (nTskID == 4) then
		QuestKCL()
	end
end

function QuestHuyenTinh()
		SetTask(Task_lag_TskID, 1)
		Msg2Player("������Ͻ�һ��5������")
end
function QuestMatDo()
		SetTask(Task_lag_TskID, 2)
		Msg2Player("������Ͻ�10�����ؾ���")
end
function QuestPhucDuyen()
		SetTask(Task_lag_TskID, 3)
		Msg2Player("������Ͻ�1����Ե¶����)")
end
function QuestKCL()
		SetTask(Task_lag_TskID, 4)
		Msg2Player("������Ͻ�2����ս��")
end

function FinishThirdQuest()
		--check cue Exp
		local curexp = GetExp()
		if (curexp < 0) then
			Talk(1, "", "���������ھ���ֵ��ֵ�������콱!.");
			return
		end
		GiveItemUI( "����Ʒ����", "��Ҫ�Ķ������ҵ�����", "yestask", "no" );
end
function yestask(nCount)
		if (GetTask(Task_lag_TskID)==1) then
			if (CheckIQuestItem(nCount,6,1,147,5,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("��ϲ��������ɽ������������! ���»��2000000000����ֵ")
				--Bonus 20�ڿɵ��Ӿ���ֵ
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���������2000000000����ֵ")
			end
		end
		if (GetTask(Task_lag_TskID)==2) then
			if (CheckIQuestItem(nCount,6,1,196,0,10)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("��ϲ��������ɽ������������! ���»��2000000000����ֵ")
				--Bonus 20�ڿɵ��Ӿ���ֵ
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���������2000000000����ֵ")
			end
		end
		if (GetTask(Task_lag_TskID)==3) then
			if (CheckIQuestItem(nCount,6,1,124,0,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("��ϲ��������ɽ������������! ���»��2000000000����ֵ")
				--Bonus 20�ڿɵ��Ӿ���ֵ
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���������2000000000����ֵ")
			end
		end
		if (GetTask(Task_lag_TskID)==4) then
			if (CheckIQuestItem(nCount,6,1,1499,0,2)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("��ϲ��������ɽ������������! ���»��2000000000����ֵ")
				--Bonus 20�ڿɵ��Ӿ���ֵ
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���������2000000000����ֵ")
			end
		end
			
end
function CheckIQuestItem(nCount,nG,nD,nP,nLevel,nItemNeedCount)
		local nItemCount =0
		for i=1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
			if (itemgenre ~= nG or detailtype ~= nD or parttype ~= nP or GetItemLevel(nItemIdx) < nLevel) then	
				Talk(1, "", "�������ȷ�Ͻ�����Ҫ����Ʒ!");
				return 0
			end--if
			nItemCount = nItemCount + GetItemStackCount(nItemIdx)
		end --for
		if (nItemCount ~= nItemNeedCount) then
			Talk(1, "", "�������ȷ�Ͻ�����Ҫ����Ʒ����!");
			return 0
		end
		for i = 1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			RemoveItemByIndex(nItemIdx)
		end
		return 1
end

function ReviewCurQuest()
	local IsQ, _ = GetCurQuest()
	if (IsQ == 1) then
		 tbAnBangHKL:ReviewCurKillMonsterTask()
	elseif (IsQ == 2) then
		ReviewQuest2()
	elseif (IsQ == 3) then
		ReviewQuest3()
	else
	
	end
end

function ReviewQuest2()
	local nTskID = tbQuest.tbQuest2[GetTask(Task_lag_TskID)].nId
	local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow = "����������ν����1000��"
		elseif (nTskID == 2) then
			szShow = "���������ˮ��ͷ��"
		elseif (nTskID == 3) then
			szShow = "���������50������ֵ"
		elseif (nTskID == 4) then
			szShow = "����������������ڵ�4������"
		end
		Talk(1, "", szShow);
end

function ReviewQuest3()
	local nTskID = tbQuest.tbQuest3[GetTask(Task_lag_TskID)].nId
		local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow ="������Ͻ�һ��5������"
		elseif (nTskID == 2) then
			szShow = "������Ͻ�10�����ؾ���"
		elseif (nTskID == 3) then
			szShow = "������Ͻ�1����Ե¶����)"
		elseif (nTskID == 4) then
			szShow = "������Ͻ�2����ս��"
		end
		Talk(1, "", szShow);
end

function no()
end
