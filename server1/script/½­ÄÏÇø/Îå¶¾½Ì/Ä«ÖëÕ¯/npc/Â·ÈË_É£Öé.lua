-- �嶾 ·��NPC ī��կ��ɣ�� 10������
-- by��Dan_Deng(2003-08-05)

-- �޸ĺ���а��������ص�ɣ��ű�
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

		
	if (myTaskValue==150) then
		task_level30_14();
		return
	end


-- ������ϵͳ��а��������صĽű� --


	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 10*256+10) then		--10�����������
			i = GetItemCount(86)
			if (i >= 10) and (HaveItem(220) == 1) then
				Talk(1,"L10_prise","ɣկ����������Ҫ��֩�����˪")
			else
				Talk(1,"","���ﻹ��������ô��ô�������!")
			end
		elseif ((UTask_wu == 10*256) and (GetLevel() >= 10)) then		--10������
			Say("�����������ϲ����ˣ��㵽�㵴ɽ�ϸ���ץʮֻ֩�룬��ȥ��10����˪��",2,"����!/L10_get_yes","���»���������!/L10_get_no")
		else							-- ����Ի�
			Talk(1,"","�� ץ���Ҷ��ӵ��龰��������Ŀ������ץ������Ҫ�������Ĺǣ�֮����������������֩�붾����Ҫ����ʹ�࣬�������ܣ���������!")
		end
	else
		Talk(1,"","��֪�Ҷ���������ô���ˣ��Ƿ�ƽ�����¡�")
	end

end;

function L10_get_yes()
	Talk(1, "", "��ȥ��أ��ҵ���Ҫ!")
	SetTask(10,10*256+10)
	AddNote("����ɣ���ҵ�10ֻ֩���100����˪.")
	Msg2Player("����ɣ���ҵ�10ֻ֩���100����˪.")
end;

function L10_get_no()
	Talk(1,"","���ǵ�! ���ǲ�����!")
end;

function L10_prise()
	Talk(1,"","�ܺ�! ����ȥ!��Ҫ����������!")
	DelItem(220)
	for i = 1, GetItemCount(86) do DelItem(86) end
	SetTask(10,20*256)
	SetRank(50)
--	AddMagic(62)
--	AddMagic(60)
--	AddMagic(67)
	add_wu(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ��! �����Ϊ���ɢ��! ѧ���书���嶾�������嶾�������嶾�Ʒ����������.")
	AddNote("����ɣ���ҵ�֩�����˪.����Ϊ���ɢ�ˡ�")
end;
