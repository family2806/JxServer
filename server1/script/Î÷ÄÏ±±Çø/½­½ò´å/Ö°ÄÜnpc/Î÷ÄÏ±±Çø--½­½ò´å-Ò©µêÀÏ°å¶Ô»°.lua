--���ϱ��� ����� ҩ���ϰ�Ի�������������������ϵ���ҩ��
--suyu
-- Update: Dan_Deng(2003-08-11)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	UTask_world21 = GetTask(49);
	Uworld1000 = nt_getTask(1000)	
	if ((UTask_world21 == 1) and (HaveItem(179) == 0)) then
		Say("�����ϵ���������ҩ��ô������͸���׼�����ˣ�ʮ�Ŵ�����һ����������������ȥ����ү��˵����ע������ѽ!",3,"�򴨱���/buy","��һЩ����ҩ/yes","����/no")
	else
		Say("ҩ���ϰ壺�˳����������˭û��ͷ�����ȣ��������С�����Ǿ����ٲ��ˣ���Ҫ���ʲôҩ��", 3, "����/yes", "��������������/yboss","������/no");
	end
end;

function buy()
	if(GetCash() >= 200)then
		Pay(200)
		AddEventItem(179) --�õ�ҩ
		Msg2Player("��õ�ʮ�Ŵ����衣")
		AddNote("��õ�ʮ�Ŵ����衣")
	else
		Talk(1,"","ҩ���ϰ壺ҩ�Ҹ������ţ���Ǯ�չ����ٹ���ȡҩ�ɡ�")
	end
end;

function yes()
	Sale(24)						--�������׿�
end;

function no()
end;
