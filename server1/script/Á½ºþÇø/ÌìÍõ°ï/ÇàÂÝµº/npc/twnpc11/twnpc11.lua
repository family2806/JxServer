--description: ���ݵ���ͷ����
--author: yuanlan	
--date: 2003/4/28


function main()

if (GetFaction() == "tianwang") then					--����������������ӣ���������Ǯ
	Say("����������ĵ����������", 2, "����!/yes", "�� /no")
else	
	Say("����ʮ��Σ�գ�����͹���ȥ�Ļ�Ҫ��һ��Ǯ!", 2, "��/yes1", "����/no")
--	Talk(1,"","�������ڣ��㲻�Ǳ�����ӣ���ô�쵽����������ģ���")
end;

end;


function yes()
NewWorld(59, 1425, 3472)						--��������
SetFightState(0)							--ת��Ϊ��ս��״̬
end;


function yes1()
if (GetCash() >= 500) then						--�ο�ֵ
	Pay(500)
	NewWorld(59, 1425, 3472)					--��������
	SetFightState(0)						--ת��Ϊ��ս��״̬
else
	Say("ûǮ�͸Ͽ���!", 0)		
end;
end;


function no()
end;
