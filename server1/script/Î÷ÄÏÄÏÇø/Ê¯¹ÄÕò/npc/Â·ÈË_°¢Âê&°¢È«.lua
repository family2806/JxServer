--ʯ���� ·�� ����&��ȫ �������񣺻�Ǯ
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 0) and (GetLevel() >= 3) then		-- ��������
		Talk(3,"W23_get","��ȫ���㲻Ҫȥ��������壬ȥ���ﰡ?","���겻Ҫ���ң�����Ҳ�ȥժĢ����������Ǯ����ү����Ź����ǵ�!","����ʲô����?")
	elseif (UTask_world23 == 6) then
		Talk(2,"W23_prise","���Ѿ������ǻ�Ǯ��!","���Ǹ�л����!")
	else				-- ������Ի�
		if (random(0,1) == 0) then
			Talk(1,"","�����Աߵİ�����Ư���ֶ��£���Ҳ����һ����ֽ�����ǣ�������ô���Ƿ�˼�ծ����ô��Ǯ������.")
		else
			Talk(1,"","֮ǰ�ҵ�����ܺã���Ϊ��һ��ȥժ��ǣ�����ˮ���Ӵ�֮�󣬲���û���κù�")
		end
	end
end;

function W23_get()
	Say("��������Ƿ������ү��Ǯ�����ǰ�ȫ�����ܾ��ˣ�û��Ǯ������ү˵�����ǵķ������˻��ߵ�Ѻ�˻�Ǯ.",2,"���ü�������������. /W23_get_yes","��ȻǷծ�����Ҫ����Ŭ��. /W23_get_no")
end;

function W23_get_yes()
	SetTask(23,3)
	Talk(1,"","���ģ������Ұɣ�����������ҵ���Ϣ.")
	AddNote("������������갢ȫ������ѣ�����ү����ծ�� ")
	Msg2Player("������������갢ȫ������ѣ�����ү����ծ�� ")
end

function W23_get_no()
end

function W23_prise()
	Talk(1,"","����������ַ��Ƶ��·��������°�!")
	SetTask(23,10)
	AddNote("�Ͱ��갢ȫ˵�ѻ���ծ���������. ")
	Msg2Player("�Ͱ��갢ȫ˵�ѻ���ծ���������. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("�����·� ")
	else
		AddItem(0, 2, 10, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���ܽ���")
	end
	AddRepute(7)
	Msg2Player("�����������7��. ")
end;
