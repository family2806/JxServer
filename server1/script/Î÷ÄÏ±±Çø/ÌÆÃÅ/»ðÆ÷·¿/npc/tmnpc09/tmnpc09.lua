--description: �������� 30������ 
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 1)) then		--30������
			L30_prise()
		elseif (UTask_tm >= 40*256) and (GetFaction() == "tangmen") then					--�Ѿ����30��������δ��ʦ
			Talk(1,"","����ұ��˴����˵����Ҫʲô����ȫ������!")
		else								--û�����30������ȱʡ�Ի���
			Talk(1,"","С�����ҿ����ĺ��ӡ����˳�˺ޣ�һ�첻�����������Ŀ!")
		end
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","������թ�������һ�����߽�����Ҫ���С��! ")
	else
		Talk(1,"","��ƽ�����ɱ�����ٵ�����!")
	end
end;

function L30_prise()
	Talk(2, "", "����ʦ�壬���Ѿ��ҵ���Щ��ˣ����㱨�˳����Ƕ�صġ������ס���ֻҪ������������ţ��Ͳ�����������!", "������ȵ���һ���ˣ���˵����Ҫʲô����ȫ������!")
	DelItem(42)
	SetRank(28)
	SetTask(2, 40*256)
--	AddMagic(50)
--	AddMagic(54)
--	AddMagic(47)
--	AddMagic(343)
	add_tm(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ����Ϊ���Ž�ǰ������ѧ��׷�ļ������컨����Ĵ�. ")
	AddNote("�ص����������������׸����ƣ���ɻ�����������Ϊ��ǰ����")
end;
