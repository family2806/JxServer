--description: �䵱��Ҧʯ�š��䵱20�������ط���������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�


-- �޸ĺ���а��������ص��䵱��Ҧʯ����ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue==170) then -- �����䵱�ɺ���Ҧʯ�ŵĶԻ�
		task_level40_01();
		return
	elseif (myTaskValue==209) then -- ��ҵȼ����� 40 �����ٴλ���ʱ
		task_level40_02();
		return
	elseif (myTaskValue==210) then 
		Say("ϣ�����ܰ�������������.",0);
		return
	elseif (myTaskValue==220) then
		task_level40_06();
		return 
	end
		
	
-- ������ϵͳ��а��������صĽű� --



	UTask_wd = GetTask(5);
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
--		Ϊ��ʱ������򲹶�������ֵΪ35��ѧ�����䵱����(151)��δѧ�����ķ�(156)�ģ�Ҳ���Խ�20��������ȡ����
--		if ((UTask_wd == 20*256) or (((UTask_wd == 35) or (UTask_wd >= 30*256)) and (HaveMagic(151) >= 0) and (HaveMagic(156) == -1))) and (GetLevel() >= 20) then
		if (UTask_wd == 20*256) and (GetLevel() >= 20) then
			Say("�����ױ�ʦ��������ʦ�����ҳ��ˣ������书�����Ҷ�����ɽ���ٹ����վ���ʦ���İ�ʮ�������һ���ȫ��������<color=Red>��ϵ���<color> �������������͸�ʦ��������", 2, "����Ѱ��/L20_get_yes", "��æ/L20_get_no")
		elseif (UTask_wd == 20*256+20) then
			if (HaveItem(66) == 1) then
				SetTask(5, 20*256+40)
				AddNote("���ظ�ĸ�֪�����Ե��������ӻ����ϰ�������.")
				Msg2Player("���������ӻ����ϰ�������.")
				Talk(2, "", "���ǵ�ù�����۱����Ǹ�ҧ���ˣ�����ô��?", "�����������ӻ�����ģ���ȥ<color=Red>����<color> �� <color=Red>�ӻ����ϰ�<color> ��취.")
			else
				Talk(1,"","�Ҽǵ�<color=Red>��ϵ���<color> ��ʧ�� <color=Red>���Ƕ�<color>.")
			end
		elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 1) then
			L20_prise()
		elseif (UTask_wd == 20*256+40) and (HaveItem(66) == 0) then		-- ��������Ʒ��ʧ���ݴ���
			AddEventItem(66)
			Msg2Player("T�ҵ���ҧ�õ���ϵ�����.")
			Talk(1,"","��˵ȥ���ӻ����ϰ�õ��ۣ�Ϊʲô��������ȥ?")
		elseif (UTask_wd >= 20*256+40) and (UTask_wd < 30*256) then					--�Ѿ��ӵ�20��������δ���
			Talk(2,"","û����ϵ��ۣ�����ʲô��ʦ��ף��","�ҵ��������ӻ����ϰ���취.")
		else
			Talk(1,"","�Ҿ���ʦ�����书����Ѳ⣬��һ��������ѧ��.")
		end
	elseif (UTask_wd >= 70) then								--�Ѿ���ʦ
		Talk(1,"","ʦ����˵�����ɰٴ��������˴󣬱������̣�������գ���������仰����!")
	else
		Talk(1,"","ʦ�����Ҷ�����ɽ�����Ҹ�ĸһ������!")
	end
end;

function L20_get_yes()
	Talk(1,"","�ܺã���л���Ҽǵ�<color=Red>��ϵ���<color> ���� <color=Red>���Ƕ�<color>.")
	SetTask(5, 20*256+20)
	AddNote("��Ҧʯ�ţ��ӵ�������ȥ���Ƕ�����ϵ���.")
	Msg2Player("��Ҧʯ�ţ��ӵ�������ȥ���Ƕ�����ϵ���.")
end;

function L20_get_no()
	Talk(1,"","��һ����ȥ��!.")
end;

function L20_prise()
	Talk(1,"","��Ȼ�޺��ˣ�̫���ˣ���л!")
	DelItem(68)
	SetRank(9)
	SetTask(5, 30*256)
--	AddMagic(159)
	add_wd(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㣬����Ϊ���޵��ˣ�ѧ���߾���!")
	AddNote("���ظ�ĸ�����ϵ��۸�Ҧʯ�ţ���ɵ������񣬱���Ϊ���޵���.")
end;
