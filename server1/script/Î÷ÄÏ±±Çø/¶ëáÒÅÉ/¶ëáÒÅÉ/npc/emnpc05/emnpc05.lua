--description: ������л����
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 60) then		--��������
		Msg2Player("���������书���飬��ð�������")
		Say("��λʦ�㶼�Ѳ����㣬��ô'��'��һ��������ͨ���ˣ����ǻ�Ҫ��'��'�أ���һ���������ͨ��������ӭ���󣬲��ҵõ�<color=Red>��������<color>����Ҫ������", 2, "��/yes", "����/no")
	elseif (Uworld36 == 70) then
		if (HaveItem(17) == 0) then
			Talk(1,"","�õ�<color=Red>��������<color>�����ɽ�ϵĳ����뿪������")
		else
			Talk(1,"","��<color=Red>��������<color>����<color=Red>����<color>���Ϳ��Լ��뱾���ˡ�������<color=Red>����<color>��.")
		end
--	elseif ((UTask_em > 5*256) and (UTask_em < 5*256+60)) then 					--��δ���ǰ����
--		Talk(1,"","л���ܣ�Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬�㶼��������")
--	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","л���ܣ����Ѿ��Ǳ��ɵ��ӣ������ٴ��������ˡ�")
	elseif (UTask_em == 70*256) then   						--�ѳ�ʦ
		Talk(1,"","�пճ������������ǰ�!")
	else
		Talk(1,"","ͥǰ��ҹһ֦÷")
	end
end;

function yes()
--	SetPos(1766, 5136);				--����Ҵ������Թ�
	Uworld36 = SetByte(GetTask(36),1,70)
	SetTask(36,Uworld36)
	AddNote("������������Ҫ����л���ܵĿ��飬���������¶��߰�������")
	Msg2Player("������������Ҫ����л���ܵĿ��飬���������¶��߰�������")
end;

function no()
end;
