-- ���� ���� ͯϦ�� ��������
-- by��Dan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 1) then
			Talk(2,"Uworld31_get_Monkey","С�ӣ������˿��ÿɰ����͸��Ұ�!","���������������ˣ��Ǻǣ��ÿɰ����������׿���!")
		else
			Talk(1,"","ץ����������?")
		end
	elseif (Uworld31 == 0) and (GetFaction() ~= "kunlun") and (GetLevel() >= 10) then		--��������
		Say("�Ҵ�С����û���뿪�����أ�����˵������˺ܻ�����׼�Һ����Ӵ������������ˣ���˵������кܶ���ӣ�Ҫ����һֻ��˿��������鲻֪�ж����!�����ץһֻ������?","û������!/enroll_get_yes","��û��ʱ��ȥץ����/enroll_get_no")
	elseif (Uworld31 >= 20) then
		Talk(1,"","��˿��̫�ɰ��ˣ���̫ϲ����")
	else
		Talk(1,"","�������������ô����?")
	end
end;

function Uworld31_get_Monkey()
	DelItem(8)
	Uworld31 = SetByte(GetTask(31),2,20)
	SetTask(31,Uworld31)
	Msg2Player("ͯϦ�պ�ϲ����׽�ĺ���. ")
	AddNote("ͯϦ�պ�ϲ����׽�ĺ���. ")
end

function enroll_get_yes()
	Talk(1,"","׽ֻ������ʲô�ѵģ������ھ�ȥץ����!")
	Uworld31 = SetByte(GetTask(31),2,10)
	SetTask(31,Uworld31)
	Msg2Player("�����񣺰�ͯϦ�յ������׽1ֻ��˿��")
	AddNote("�����񣺰�ͯϦ�յ������׽1ֻ��˿��")
end;

function enroll_get_no()
end;
