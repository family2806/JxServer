--description: ���ִ�_ҩ���ϰ�
--author: wangzg	
--date: 2003/7/18
--modify wangzg 2003/7/21 17:00
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

Include("\\script\\global\\timerhead.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	UTask_world38 = GetTask(66)
	if (UTask_world38 == 1) then		--�ѽ�����
  		Say("С����үү����ͣ�����Ҫ���㻢�Ǹ࣬750��һƿ�����������ͻ��ǣ��ҽ������.", 4, "ֱ����/buy", "��ԭ��/source", "������ҩ/yes","��������!/no")
	elseif (UTask_world38==2) then
		if (HaveItem(185) == 1) and (HaveItem(142) == 1) then
			if (GetTimerId() > 0) then		-- ���м�ʱ����������
				Talk(1,"","�����������������?")
				return
			end
			SetTimer(0.5 * CTime * FramePerSec, 6)									--������ʱ�������ʱ�� * ʱ���� * ֡��
			Talk(2, "", "�ϰ壬���Ѿ��ҵ����Ǻ�������.", "����ҩ���У����Сʱ�����ȡ!")
			SetTask(66,3)
			DelItem(185)
			DelItem(142)
			AddNote("�ҹ�ԭ�Ϻ󣬵Ȱ��Сʱ��������.")
			Msg2Player("�ҹ�ԭ�Ϻ󣬵Ȱ��Сʱ��������.")
		else
  			Say("���������ͻ��ǣ��ҽ������.", 3, "ֱ�������㻢�Ǹ�!/buy","����/yes", "������/no")
		end
	elseif (UTask_world38 == 3) then				-- Ϊ��ʱ���ݴ�����ֶ���ʱ����
		i = GetRestSec(6)
		if (i > 0) then
			Say("<#> ʱ�䲻����ҩδ���꣬��Ҫ���."..i.."<#> ��.", 3, "�Ҳ�����ˣ�ֱ������!/buy","���뽻��/yes", "�����ˮi/no")
		else
			StopTimer()						--������ʱ
			W66_getitem()
		end
	elseif (UTask_world38 == 4) then		-- ��ʱ���ѵ�ʱ
		W66_getitem()
	else
		Say("���Ѿ����������������ͷʹ�Ź֣���������ȻС�����ǣ���ȱʲô��������ҩ��?", 3, "����/yes","�����ӳ�������/yboss", "������/no")
	end
end;

function buy()
  	if (GetCash() < 750) then
  		Talk(1,"","û��Ǯ�Ͳ�����ҩ.")
  	else
  		Pay(750)
  		AddEventItem(186)
  		Msg2Player("������㻢�Ǹ�.")
  		SetTask(66,5)
  		AddNote("�����㻢�Ǹ�.")
  		Msg2Player("�����㻢�Ǹ�.")
		if (GetTimerId() == 6) then			-- ���ں�ҩ��ʱ��
			StopTimer()
		end
  	end
end

function source()
-- Say("ҩ���ϰ壺�������Ū������ͻ�������ԭ�ϣ���Ҳ������Ѱ����ҩ��", 0)		--�������ظ��ˡ�
SetTask(66,2)
AddNote("��Ҫ����ԭ�ϣ�����ͻ�������ҩ.")
end

function W66_getitem()
	AddEventItem(186)
	Msg2Player("������㻢�Ǹ�.")
	SetTask(66,5)
--	StopTimer()
	AddNote("������㻢�Ǹ�.")
end

function yes()
Sale(91);   			--�������׿�
end;

function no()
end;
