-- �嶾 ·��NPC ����կկ������ 50������
-- by��Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if ((UTask_wu == 50*256+20) and (HaveItem(88) == 1)) then		-- ���������
			L40_prise()
		elseif ((UTask_wu == 50*256) and (GetLevel() >= 50)) then		--50������
			Talk(1,"L50_get","�ⷽԲ������ϰ��ն�Ҫ�򱾽̽��ɱ����ѡ����������һȺ��û������ɽ�񻪶����������ܣ������ϻ�ͷ�϶������ڱ��̵ĵ����Ϻ��һ�֣��ѱ���Т�����̵���ɺ��������ȥ�����ñ�������δ棡���ܷŹ�����!")
		else							-- ����Ի�
			Talk(1,"","ֻҪ�����书��������Ů��ԴԴ����")
		end
	else
		Talk(1,"","˵��Ů�������뵽�˴����ŵĹ����ѽ�����Ǻÿ����벻�����Ĺ�����ô�ÿ���ֻҪ�뵽�����еĻ�Ͱ��Ͳ�ס��")
	end
end;

function L50_get()
	Say("��ȥ��ѵ��ѵ������ܣ�Ҫ����֪�����̵�����!/L50_get_yes","����ͬ��̫�࣬����ֻ��/L50_get_no")
end;

function L50_get_yes()
	SetTask(10,50*256+10)
	AddNote("������ɽ�񻪶�������������û���ɺ����")
	Msg2Player("������ɽ�񻪶�������������û���ɺ����")
end;

function L50_get_no()
end;

function L40_prise()
	Talk(2,"","���ܶ�����Ѩ�������ɺ������Ȼ�е㱾�£���կ�������Ǹ�����֮�ģ�������Ϊ�ƶ����߰ɣ����������Ժ�Ҫ�ú��汾կ������","����!")
	SetTask(10,60*256)
	DelItem(88)
	SetRank(54)
--	AddMagic(72)
	add_wu(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("������ɺ��������������Ϊ�ƶ�����")
	Msg2Player("��ϲ�㣡�ѽ���Ϊ�ƶ����ߡ�ѧ�ᴩ�Ķ���")
end;
