-- ���� ���� ��ȱ 30������
-- by��Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 30*256+10) and (GetItemCount(111) >= 3) then		--30���������
			L30_prise()
		elseif ((UTask_kl == 30*256) and (GetLevel() >= 30)) then		--30����������
			Say("����ʦ�𽻴�ȥ������ҹ������������С�¾ͽ�����ȥ���. ",2,"��........ /L30_get_yes","���������ޣ�ֻ�²��а�. /L30_get_no")
		else
			Talk(1,"","��һֱ�벻����Ϊʲô��ʦ��������̾���������˻������ϡ�����˵�޶����ɷ򣬲�ɱ�����񡭡�������͵��ʲô! ")
		end
	else
		Talk(1,"","������Ҫ��ͺ͸���������ԭ��λƽ�ȣ�һ��Ҫ��Щ�书���ڣ����������Ȩ�ſ���!")
	end
end;

function L30_get_yes()
	Talk(1,"","��˵�����и�ѩ����������������ֵ���ǵ�ҹ���顣���ȥ������������!")
	SetTask(9,30*256+10)
	AddNote("��30�����񣺽�ѩ�����û�3��ҹ����")
	Msg2Player("��30�����񣺽�ѩ�����û�3��ҹ����")
end;

function L30_get_no()
	Talk(1,"","ʦ�ַԸ�Ҳ�Ҳ�������Ǵ�!")
end;

function L30_prise()
	Talk(1,"","�ţ�����������ã���������̫΢�������Ժ�úø��Ұ�����Ȼ�ٲ�����ĺô�!")
	i = GetItemCount(111)
	for j = 1, i do DelItem(111) end
	SetTask(9,40*256)
	SetRank(22)
--	AddMagic(178)
--	AddMagic(172)
--	AddMagic(393)
--	AddMagic(173)
--	AddMagic(177)			-- �ٴ��ɺ�
	add_kl(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㣡����������̫΢������ѧ���书һ�����壬������ǣ��ٴ��㺣")
	AddNote("�ҵ�3��ҹ���飬�������30��������Ϊ̫΢����")
end;
