--������ ������ ��ͥ����ͷ����2�Ի�
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)
Say("�����׻�˵�ĺã���ɽ��ɽ����ˮ��ˮ����˰��ﶴͥ�������������������ʳ��ĸ����Ҫ������", 2, "ȥ������/yes", "����/no");
end;

function yes()
if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	if (GetFaction() == "tianwang") then				--����������������ӣ���������Ǯ
		Say("����ԭ������������ֵܣ���˵�����ҵĴ�����Ǯ�������ˣ�", 1, "��л��/ok1")
	else	
		Say("������������Ѱ���˿ɿ������ã�Ҫȥ�Ļ�����ö��Щ���ӡ�", 1, "�ð�/ok2")
	end
else		
	Say("���򣺶Բ���û���弶�����ֲ����������塣", 0)
end
end;

function no()
end;


function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)								--ת��Ϊ��ս��״̬
end;


function ok2()
if (GetCash() >= 100) then							--�ο�ֵ
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--ת��Ϊ��ս��״̬	
else
	Say("������ȥ��������û�����ӿɲ��С�", 0)		
end
end;