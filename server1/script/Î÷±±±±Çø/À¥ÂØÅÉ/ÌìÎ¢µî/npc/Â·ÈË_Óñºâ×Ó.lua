-- ���� ���� ����� 50������
-- by��Dan_Deng(2003-07-31)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (HaveItem(10) == 1)) then		--50���������
			L50_prise()
		elseif ((UTask_kl == 50*256) and (GetLevel() >= 50)) then		--50������
			Say("���غ�ɽ��һ����Ѩ�������й��ˣ�������˿ڿ�����˵Ҫ��ƽ���أ���������Ŵ�ܣ����ڶ��������һ���涨��Ҫ��Ϊ50�����ӱ���ȥ��������õ�����һ��ͷ��֤��",2,"�õ���ȥ���Կ�/L50_get_yes","�������ղ��������²��ܴ�Ӯ /L50_get_no")
		else
			Talk(1,"","��Ҫ������ĳ��������Ӧ��!")
		end
	else
		Talk(1,"","����ص������飬�ʴȵ������޵С�������!")
	end
end;

function L50_get_yes()
	Talk(1,"","��־�������Ҿ͸����������!")
	SetTask(9,50*256+64)
	AddNote("��������50�����񣺴�ܱ�ѩ���ˣ�ͬʱ�õ�����һ��ͷ��֤��. ")
	Msg2Player("��������50�����񣺴�ܱ�ѩ���ˣ�ͬʱ�õ�����һ��ͷ��֤��. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(2,"","��������������û��ɥ��!","���ˣ�����Խ���Ϊ�ڷ��콫��Ҫ��ס��ֻҪ����Ч�Ҳ���������ĺô��ġ�")
	DelItem(10)
	SetTask(9,60*256)
	SetRank(24)
--	AddMagic(176)
--	AddMagic(90)
	add_kl(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ϊ�ڷ��콫��ѧ������硢���ٻ�Ӱ��")
	AddNote("�õ���ѩ���˵�ͷ�������������50�����񡣱���Ϊ�ڷ��콫. ")
end;
