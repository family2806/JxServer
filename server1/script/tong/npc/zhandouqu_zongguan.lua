function main()
	Say("<#>ս�������ܹܣ�Ϊ���ڲ����������������䣬�ҿ��԰����Ǹı���ɣ����ǣ����뿪ս�����򣬾Ͳ��ָܻ�ԭ���������ˣ�������ʱ����������" ,5, "����/camp1", "���ɷ�/camp2", "������/camp3", "�ָ��ɿ�ʼ�ɷ�/retorecamp", "�һ����뻻./cancel");
end

function camp1()
	SetCurCamp(1);
	Msg2Player("��ʱ��������.");
end

function camp2()
	SetCurCamp(2);
	Msg2Player("��ʱ��������.");
end

function camp3()
	SetCurCamp(3);
	Msg2Player("��ʱ��������.");
end

function retorecamp()
	SetCurCamp(GetCamp())
end

function cancel()
end

