--��Ȫ�� ְ�� ����
--��Ȫ�����������޵�
-- By: Dan_Deng(2003-09-03)
Include("\\script\\global\\global_tiejiang.lua")
Include("\\Script\\Global\\TimerHead.lua")

TIEJIANG_DIALOG = "<dec><npc>����ʲô����? ��������������������ŵĻ������ȥ������Ȫ�ʼҵ���������!"

function main(sel)
	UTask_world19 = GetTask(19)
	if(UTask_world19 == 2) then
		if (HaveItem(229) == 1) then
			tiejiang_village("<dec><npc>��ѵ���ٵú����أ�Ҫ������Ǯ��������.Ҫ120��", "���޵�Ǯ/W19_repair")
		else
			Talk(2,"","Ҫ�޵���? �������ҿ�����","����! �ҵĵ�������Ŵ���! �һ�����õ�")
		end
	elseif (UTask_world19 == 4) then
		tiejiang_village("<dec><npc>�����ĵ�������, �����"..GetRestSec(7).."<#>һ��������.")
	elseif (UTask_world19 == 6) then
		Talk(2,"","��ĵ��Ѿ��޺���","���! лл!")
		SetTask(19,8)
		AddEventItem(230)
		AddNote("�ñ����������.")
		Msg2Player("�ñ����������.")
	elseif (UTask_world19 == 8) and (HaveItem(230) == 0) then
		Talk(1,"","��ѵ�������������")
		AddEventItem(230)
		Msg2Player("�����������������ĵ�.")
	else
		tiejiang_village();
	end
end;

function W19_repair()
	if (GetTimerId() > 0) then		-- ���м�ʱ����������
		Talk(1,"","�����ڽ����������������񣬻�����?")
	else
		if (GetCash() < 120) then
			Talk(1,"","��Ǯû����")
		else
			Talk(1,"","����!��2Сʱ������")
			Pay(120)
			SetTask(19,4)
			DelItem(229)
			SetTimer(2 * CTime * FramePerSec, 7)
			AddNote("�ѱ���������������, 2Сʱ֮������.")
			Msg2Player("�ѱ���������������, 2Сʱ֮������.")
		end
	end
end;

function yes()
Sale(28);  				--�������׿�
end;
