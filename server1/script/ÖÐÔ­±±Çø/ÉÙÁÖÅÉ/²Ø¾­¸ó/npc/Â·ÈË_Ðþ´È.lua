-- ���� ·��NPC ���� 50������
-- by��Dan_Deng(2003-08-04)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if ((UTask_sl == 50*256+30) and (HaveItem(28) == 1)) then		-- 50�����������
			L50_prise()
		elseif ((UTask_sl == 50*256) and (GetLevel() >= 50)) then		--50����������
			Talk(2,"L50_get","�������׹Ǿ��������׽���͡�ϴ�辭�����ơ��������������ഫΪ��Ħ��ʦ�����������˱��ɵ���ѧ���⡣���������£�Ϊ�����ֱ���������֣�����֮�У������ĵ��ӳ�Զ�������������º�������ս���У���ԶΪ�˱����ؾ���������º��ڵ�����������ֻ�ҵ��ˡ��׽���͡�ϴ�辭���������׹Ǿ���ȴ��ôҲ�Ҳ�����.")
--		elseif (UTask_sl == 70*256+10) then			-- �ط������������
--			Say("���ȣ�ʮ��ɮñ���ռ�������",2,"�Ѿ�׼������/return_completed","���ٵ�һ��ʱ��/return_sele_no")
--		elseif (UTask_sl == 70) then			-- �ط���������
--			Talk(1,"return_sele","��ң�ʦ�����ҳ�ʦ�˻����Խ��Ĳؾ����е��鼮��")
		else							-- ����Ի�
			Talk(1,"","���±���ż��ܶ࣬��������Ѿ� .")
		end
	else
		Talk(1,"","�ؾ����Ƿ��ã��Ǹ�ɮ˵�������ĵط����ؾ����кܶ�𾭣��ܶ������Ʒ.")
	end
end;

function L50_get()
	Say("����׹Ǿ���ı����ǵ���Ū�������Ƕ��� ",2,"����/L50_get_yes","�Ҳ����� !/L50_get_no")
end

function L50_get_yes()
	SetTask(7,50*256+10)
	AddNote("������Ѱ�������ҵ��������׹Ǿ�. ")
	Msg2Player("������Ѱ�������ҵ��������׹Ǿ�. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","��������׹Ǿ�������̫����....")
	SetTask(7,60*256)
	DelItem(28)
	SetRank(6)
--	AddMagic(271)
--	AddMagic(11)
--	AddMagic(19)
	add_sl(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("�ҵ��׹Ǿ��������������Ϊ��ħ����. ")
	Msg2Player("��ϲ������Ϊ��ħ������ѧ����צ��צ���̺ϣ�Ī������. ")
end;
