-- ؤ�� ִ�������ϲ��� 20������
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_gb = GetTask(8);
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 20*256+20) then			--����20������
			Talk(2,"L20_prise","�ҸղŽ�ѵ����Զ�ţ��������Ժ�׼���۸������ֵܣ���������������ϳ�����!","�����úܶԣ�������ƽ��̫���������ֶ�ӣ�����ܸ���һ����ѵ�ܺá����ǷǷ������ܹ�����ִ�ԣ��Ҳ���������㣬��Ҫ����Ϊ��ʮ������!")
		else
			Talk(1,"","��ԶԽ��Խ������������ƽ��̫������")
		end
	else
		Talk(1,"","����ؤ������Ϊ�У�����������Ƿ������ȫ��ɱ��ؤ�����.")
	end
end;

function L20_prise()
	SetTask(8,30*256)
	SetRank(39)
--	AddMagic(129)
	add_gb(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㣬�Ѿ���Ϊ��ִ�����ӡ�ѧ������Ϊ��")
	AddNote("��ϲ�㣬�Ѿ���Ϊ��ִ�����ӡ�ѧ������Ϊ�� ")
end
