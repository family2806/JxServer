--description: ������ͨ���� �񺣵ڶ���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(9) == 1 then
		allbrother_0801_FindNpcTaskDialog(9)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 20) then					--��������
		if (HaveItem(33) == 1) then
			Talk(1,"enroll_V2_Q1","������ȶ��ˣ����ڻش�һ������!")
		else
			Talk(1,"","���<color=Red>��ɫ����<color> ����������!")
		end
	elseif (Uworld37 >= 60) and (Uworld37 < 127) then						--�Ѿ�������һ��
		if (HaveItem(34) == 1) then
			Talk(1,"","Ҫ��˳�����أ�����������������ȣ�Ȼ�󽻸����ڵ���.")
		else
			AddEventItem(34)
			Talk(1,"","Ϊʲô�����������������һ������������Ҫ��������! ")
		end
	else
		Talk(1,"","�����ﳤʱ���֪����ԭ�������Ҳ������.")
	end
end;

function enroll_V2_Q1()
	Say("�Ź����оŸ����ӣ�����ÿ�����������ʵ������֣����ܹ�ʹ�������ݺ�б�ǣ�ÿ����������Ӷ���ʮ�壬��֪����ô���𣿵�һ��", 3, "4, 9, 2 /False1", "2, 4, 9 /False1", "2, 9, 4 /enroll_V2_Q2")
end;

function False1()
	Talk(1,"","���ԣ������ܵ�<color=Red>������Ұ��<color>�ɱ�������������Ƕ�֪����!")
end;

function enroll_V2_Q2()
	Say("����ˣ��ǵڶ�����?", 3, "7, 5, 3 /enroll_V2_Q3", "5, 3, 7 /False2", "5, 7, 3 /False2")
end;

function False2()
	Talk(1,"","���ԣ�����ȥ���������ܵ�<color=Red>������Ұ��<color>��! ")
end;

function enroll_V2_Q3()
	Say("���������һ�и���ô��:", 3, "6, 8, 1 /False3", "8, 1, 6 /False3", "6, 1, 8 /enroll_V2_prise")
end;

function False3()
	Talk(1,"","���ԣ�Ϊʲô��ȥ���������ܵ�<color=Red>������Ұ��<color>��")
end;

function enroll_V2_prise()
	Talk(1,"","�ܺã���ȫ������ˡ���ɫ���ȸ��㣬�ɱ�Ū���ˣ�ȥ����������һ��ׯ����<color=Red>��ɫ����<color>��!")
	AddEventItem(34)
	Msg2Player("�ڵڶ��ػش�����׳���Ź������⣬��ð�ɫ����. ")
	Uworld37 = SetByte(GetTask(37),1,60)
	SetTask(37,Uworld37)
	AddNote("�ڵڶ��ػش�����׳���Ź������⣬��ð�ɫ����. ")
end;
