--description: ������ͨ���� �񺣵�����
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(10) == 1 then
		allbrother_0801_FindNpcTaskDialog(10)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then					--��������
		if (HaveItem(33) == 0) then
			Talk(1,"","�õ���ɫ���Ⱥ�������!")
		elseif (HaveItem(34) == 0) then
			Talk(1,"","�õ���ɫ���Ⱥ�������!")
		else
			Talk(1,"enroll_V3_Q1","����ҵ����ԣ��Ϳ��Եõ�<color=Red>��ɫ����<color>���������:")
		end
	elseif (Uworld37 == 80) then						--�Ѿ���������
		if (HaveItem(35) == 1) then
			Talk(1,"","Ҫ��˳�����أ�����������������ȣ�Ȼ�󽻸����ڵ���.")
		else
			AddEventItem(35)
			Talk(1,"","Ϊʲô������������������Ұ�����������Ҫ��������! ")
		end
	elseif (GetFaction() == "tangmen") then
		Talk(1,"","��Ҷ���ͬ���ֵܣ��㲻�ó��������! ")
	else
		Talk(1,"","��Ҫ���ܣ�С�ı�����ҧ!")
	end
end;

function enroll_V3_Q1()
	Say("��һ���ǡ�����������:", 3, "�һ���� /enroll_V3_Q2", "ˮ���� /False1", "ɿ����/False1")
end;

function False1()
	Talk(1,"","��һ�Ծʹ���ˣ�Ҳ����Щ�����ǻ������.")
end;

function enroll_V3_Q2()
	Say("���ˣ����ã��ڶ����ǡ�����������':", 3, "ɽ��ˮ�� /False2", "����ˮ�� /enroll_V3_Q3", "�������� /False2")
end;

function False2()
	Talk(1,"","���ԣ�Ϊʲô��ȥ������Щ������?")
end;

function enroll_V3_Q3()
	Say("�������һ���ǡ����������ϡ���", 3, "����ˮ�� /False3", "������� /enroll_V3_prise", "ɽ��ˮ�� /False3")
end;	

function False3()
	Talk(1,"","���ˣ�����Ϊ��һ���Ⱥ��Ӵ�����˵�������Ǳ���֪���û�����! ")
end;

function enroll_V3_prise()
	Talk(1,"","������ȫ������ˣ�������Ҫ����ɫ���ȡ�������������ȶ������룬�Ϳ���ȥ�������ڵ��ˣ�˳��������.")
	AddEventItem(35)
	Msg2Player("�ڵ����ػش�����׳��8�����⣬���������. ")
	Uworld37 = SetByte(GetTask(37),1,80)
	SetTask(37,Uworld37)
	AddNote("�ڵ����ػش�����׳��8�����⣬���������. ")
end;	
