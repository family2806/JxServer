--description: ���̵̽��ӡ��������������̼�����������
--author: yuanlan	
--date: 2003/5/17
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tr = GetTask(4)
	UTask_gb = GetTask(8)
	UTask_world30 = GetByte(GetTask(30),1)
	if (UTask_world30 == 0) and (GetLevel() >= 10) and (GetFaction() ~= "tianren") then		-- ����������Ҫ��10�����ϣ�
--		DelItem(50)						--��ֹ�ؽ��������Ҽ����������
		Say("�� <color=Red>��ɽ��<color> ����һ��<color=Red>������<color>, ˭�õ���ѽ���������!", 2, "�iȥ�ý�/get_yes", "��ϲ��!/get_no")
	elseif ((UTask_world30 == 5) and (HaveItem(50) == 1)) then					--��������
		world30_prise()
	elseif ((UTask_world30 > 0) and (UTask_world30 < 10)) then
		Talk(1,"","<color=Red>������<color> ������<color=Red>��ɽ<color>, ��ȥ��ɽ·;ңԶ��·������������ҪС��!")
	elseif (UTask_world30 == 10) then		-- ��ǰ����������ת������ֵ
		Utask_world30 = SetByte(GetTask(30),1,127)
		SetTask(30,Uworld30)
		if (GetFaction() == "tianren") then
			Talk(1,"","���ҵ��������Ĺ��ͣ����̽���ǵã����������!")
		else
			Talk(1,"","�������汾�̶�ñ����ķ��ϣ���������� ")
		end
	elseif (UTask_tr == 70*256) and (GetFaction() ~= "tianren") then							--�Ѿ���ʦ
		Talk(1,"","����ȥ�Ϸ���������ԭ���������������������ȥ.")
	else
		Talk(1,"","��֪���𣿷��������ǵ�����ʵ۵��߹���������Ư�����书���ܸ�.")
	end
end;

function get_yes()
	Talk(1,"","��ȥ��ɽ·;ңԶ��·���������أ�����Ե�<color=Red>�꾩<color>����ȥ��ɽ������<color=Red>����<color>Ҳ�����뱾�̵�<color=Red>����̳���ں���<color> ������ǰ��.")
	SetTask(30, SetByte(GetTask(30),1,5))
	AddNote("������ȥ��ɽ��������. ")
	Msg2Player("������ȥ��ɽ��������. ")
end;

function get_no()
	Talk(1,"","ʲôʱ�������������������������.")
end;

function world30_prise()
	DelItem(50)
	i = ReturnRepute(15,19,6)		-- ȱʡ����15���������ĵȼ�19����ÿ���ݼ�6%
	Uworld30 = SetByte(GetTask(30),1,127)
	AddRepute(i)
	SetTask(30,Uworld30)
	Earn(500)
	Talk(1,"","�������汾�̶�ñ����ķ��ϣ����������")
	AddNote("�������̣̽�����������������ʿ�ӣ���Ϊ���ӣ����500������. ")
	Msg2Player("�������̣̽�����������������ʿ�ӣ�������񡣳�Ϊ���̵̽��ӣ����500��������������. "..i.."��.")
end;

function enroll_prise()
	SetFaction("tianren")    				--��Ҽ������̽�
	SetCamp(2)
	SetCurCamp(2)
	AddMagic(135)
	SetRank(55)						--���óƺ�
	SetRevPos(49, 28)  					--����������
	SetTask(4, 10*256)
	Msg2Player("��ӭ�������̣̽���Ϊɱ�֣�ѧ��������Ѫ. ")
	AddNote("�������̣̽���Ϊɱ�֣�ѧ��������Ѫ. ")
end;

function enroll_no()
end;
