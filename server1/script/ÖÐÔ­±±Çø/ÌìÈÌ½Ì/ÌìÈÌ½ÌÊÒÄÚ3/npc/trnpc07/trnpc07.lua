--description: ���̽��һ���Ү�ɱ��롡����40������
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 40*256) and (GetLevel() >= 40) then		-- 40����������
			Say("�����ű�����͢�س�̫ξ<color=Red>���� color> ԭ�������ù��ļ�ϸ����Ȼ���Ѿ����ϻ��磬�����������������뿪������ݿɿ���Ϣ�����缰�����׼��ȡ��<color=Red>����<color> ���Ĵ��������㼴�̶���ǰȥ��������һ��Ҫ�ý��������Ϊ��������֮��!", 2, "��������/L40_get_yes", "���¿��²��ܵ�������/L40_get_no")
		elseif (UTask_tr == 40*256+20) and (HaveItem(159) == 1) then
			Talk(1,"L40_prise", "�����������������ҵ�������")
		elseif (UTask_tr >= 10*256) and (UTask_tr < 40*256) then					--��δ��40������
			Talk(1,"","����ǧ�գ��ñ�һʱ��ֻ��Ҫȫ��ȫ����񱾽̣����̲��������!")
		elseif (UTask_tr > 40*256) and (UTask_tr < 50*256) then					--�Ѿ��ӵ�40��������δ���
			Talk(1,"","�ű�<color=Red>���� color>�ѵ�<color=Red>������������ƶ�<color> ����һ�����θ��ӣ�����Ի���Ǯ�� <color=Red>��̳��color> ����ȥ����ȥ�ٻ�!")
		else							--�Ѿ����40��������δ��ʦ
			Talk(1,"","���ѱ��̵��ˣ��Ҿ���������������!")
		end
	elseif (UTask_tr >= 70) then							--�Ѿ���ʦ
		Talk(1,"","��������������������������ԭ��")
	else
		Talk(1,"","����˭���ѵ�������ԭ���?")
	end
end;

function L40_get_yes()
	Talk(1,"","�ű�<color=Red>���� color>�ѵ�<color=Red>������������ƶ�<color> ����һ�����θ��ӣ�����Ի���Ǯ�� <color=Red>��̳��<color> ����ȥ����ȥ�ٻ�!")
	SetTask(4, 40*256+20)
	AddNote("�����̵̽�������һ���Ү�ɱ��룬�������д̣������ƶ���ɱ���� ")
	Msg2Player("�����̵̽�������һ���Ү�ɱ��룬�������д̣������ƶ���ɱ����")
end;

function L40_get_no()
	Talk(1,"","���С��Ҳ�����ã�������������ʲô?")
end;

function L40_prise()
	Talk(1, "", "���úã���������ˣ���һ���������˵��ĺû�")
	SetRank(59)
	DelItem(159)
	SetTask(4, 50*256)
--	AddMagic(364)
--	AddMagic(146)				-- ������
	add_tr(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㱻��Ϊ�������̣�ѧ���������. ")
	AddNote("��ȥ���̣̽������Ž����һ���Ү�ɱ��룬����д���������Ϊ������")
end;
