--description: �䵱�ɵ�˼�ϡ��䵱50������
--author: yuanlan
--date: 2003/5/16
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wd = GetTask(5)
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
		if (UTask_wd == 50*256) and (GetLevel() >= 50) then		-- 50����������
			Say("���ɵ����������������£���Ϊ�䵱���ӣ���Ӧ����һ�ơ������<color=Red>���Ķ�<color> ����һȺ���ˣ�Ϊ�׵Ľ�<color=Red>����<color>.����ר����������������", 2, "�岻�ݴ� /L50_get_yes", "���º��ѽ�����/L50_get_no")
		elseif (UTask_wd == 50*256+80) then 			-- 50���������
			Talk(2, "L50_prise", "�����ѽ����õ�����Ҫȫ����������ǵ�����ϰ���.", "���úܺã�����Ϊ���ɵ���! ")
		elseif (UTask_wd > 50*256) and (UTask_wd < 50*256+50) then					--50�������һ�ڣ���δ���
			Talk(1,"","���˵Ĳ���֮����<color=Red>���Ķ�<color>, Ϊ�׵Ľ�<color=Red>����<color>. �ǵô�ȫ��<color=Red>����<color> ���������<color=Red>����<color>. ")
		elseif (UTask_wd >= 50*256+50) and (UTask_wd < 60*256) then					--50������ڶ��ڣ���δ���
			AddNote("�ص��䵱ɽ��ȥ�������ҵ�˼�ϣ�֪��Ҫ�ѵ��˴�����ȫ�����������͸����������������ס�ڳǱ��ĵ˼�ɩ��. ")
			Msg2Player("�ѵ��˴�����ȫ�����������͸����������������ס�ڳǱ��ĵ˼�ɩ��. ")
			Talk(1,"","��˵�� <color=Red>����<color> ���������<color=Red>�˼�ɩ��<color>, ��� <color=Red>ȫ������<color> �͸���.")
		else					--�Ѿ����50��������δ��ʦ
			Talk(1,"","��ƽ��ϲ��������������֮�ˣ���ү����������������.")
		end
	elseif (UTask_wd >= 70) then									--�Ѿ���ʦ
		Talk(1,"","��������̫�˸У�����֮����������֮����ϣ���㱣��! ")
	else
		Talk(1,"","���·��ң����Ǻ�Ⱥ���������䣬����ѧ��֮�ˣ����������Թۣ����������������֡�")
	end
end;

function L50_get_yes()
	Talk(1,"","�ܺã����ǣ���Ҫ���ǰ� <color=Red>����<color> �������İ���<color=Red>����<color>.")
	SetTask(5, 50*256+20)
	AddNote("�������������˼�ϣ�����������ȥ���ķ�ţɽΪ�����. ")
	Msg2Player("�������������˼�ϣ�����������ȥ���ķ�ţɽΪ�����. ")
end;

function L50_get_no()
	Talk(1,"","Ϊ�������ѧ��֮�˵����Σ�Ϊʲô���ƴǣ�")
end;

function L50_prise()
	SetRank(12)
	SetTask(5, 60*256)
--	AddMagic(157)
	add_wd(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�����Ϊ�ƾ����ˣ�ѧ����������. ")
	AddNote("�ص��䵱�������������˼�ϣ��������һ�����񣬳�Ϊ�ƾ�����")
end;
