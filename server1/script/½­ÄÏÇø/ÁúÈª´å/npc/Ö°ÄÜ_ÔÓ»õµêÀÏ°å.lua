--��Ȫ�� ְ�� �ӻ����ϰ�
--��Ȫ���������񣺺���ò��á�������ѩ��
-- By: Dan_Deng(2003-09-03)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\global_zahuodian.lua");


function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 0) then 		--������ò��á���������
		Talk(4,"W18_get","��! �浹ù!","�����������ĵ�������?","˵����Ҳ�涪�ˣ��Һ�һ��Ů�Ľ��һ���ˣ����Ǹļ޵ģ�����һ�����ӡ����������ǲ�֪��С������ʲô��ֻ֪������������ ","��������Ϊ��̫�����ˣ�ֱ��������Ҫʲô�᲻���һ��")
	elseif (UTask_world18 == 6) then		-- ������ò��á��������
		Talk(1,"W18_prise","���Ѿ��ʹ��Ǹ�С���ˣ�������û�������㣬����İ�!")
	elseif (GetTask(20) == 5) and (HaveItem(231) == 0) then		-- ��������ѩ������������в���û�д˵���
		if (UTask_world18 == 10) then			-- ����ɡ�����ò��á�����
			Talk(1,"","������֥��������֥���ں��ټ��ˡ����������ﻹ��һ�㡣�����һ��æ�ҾͰ���֥ȫ���͸���")
			AddEventItem(231)
			AddNote("�õ��ӻ��ϰ��͵�������֥")
			Msg2Player("�õ��ӻ��ϰ��͵�������֥")
		else
			local buttons = store_sel_village_extend();
			tinsert(buttons, 1, "��������֥/W20_buy");
			Say("������֥��������֥���ں��ټ��ˡ����������ﻹ��һ�㡣ֻҪ500������",getn(buttons),buttons);
		end
	else
		local buttons = store_sel_village_extend();
		Say("��֮ǰԭ��һ�����ˣ��ύ�˺ܶ����ѡ�֮����ң����ﶼ����ս���������ֻ�ð�������",getn(buttons),buttons)
	end
end;

function W18_get()
	local buttons = store_sel_village_extend();
	tinsert(buttons, 1, "���������Ұ�������/W18_get_yes");
	Say("����.�����һ���ʧ��! ֻ��һ��С��Ҳ�ò���������",getn(buttons),buttons)
end

function W18_get_yes()
	SetTask(18,3)
	Talk(1,"","���̫���ˣ��ҽ��������ĺ���Ϣ��")
	AddNote("�����񣺰����ϰ�ȥ�ʿ���������")
	Msg2Player("�����񣺰����ϰ�ȥ�ʿ���������")
end

function W18_prise()
	Talk(1,"","������̫���ˣ����̫��л���ˣ�����һ�����⣡��������")
	SetTask(18,10)
	AddNote("���ӻ��ϰ�˵�������뷨���������")
	Msg2Player("���ӻ��ϰ�˵�������뷨���������")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("�õ�һ���ֲ���")
	else
		AddItem(0, 2, 13, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("�õ�����ȹ.")
	end
	AddRepute(5)
	Msg2Player("�������������5��")
end

function W20_buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(231)
		AddNote("��������֥.")
		Msg2Player("��������֥.")
		Talk(2,"","�����֥���ǹ�","һ��Ǯһ�ֻ����㲻��Կ���!")
	else
		Talk(1,"","���������������ô��Ǯ��")
	end
end

function yes()
	Sale(29)
end;

function no()
end;
