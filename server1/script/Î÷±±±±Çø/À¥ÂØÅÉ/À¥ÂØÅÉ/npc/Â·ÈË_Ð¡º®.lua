-- ���� ���� Ѿ�� 10������
-- by��Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 10*256+10) then		--10�����������
			if (HaveItem(112)==1) and (HaveItem(113)==1) and (HaveItem(114)==1) and (HaveItem(115)==1) and (HaveItem(116)==1) then
				L10_prise()
			else
				Talk(1,"","Thu�c �� ���c h�i �� ch�a?")
			end
		elseif ((UTask_kl == 10*256) and (GetLevel() >= 10)) then		--10������
			Say("���Ǽ�С�����������ಡ��ÿ�춼Ҫ��һ����֥�ٲݸ�ά���������ҩ�ĳ����ˣ�����רְ��ҩ��ҩͯ�������ز����������Ǻ�?",2,"������ҩ/L10_get_yes","�������� /L10_get_no")
		else
			Talk(1,"","С�����ʻ���ô��������ô��?")
		end
	else
		Talk(1,"","��������ɾ��ĵط������Ҽ�С��ķ���!")
	end
end;

function L10_get_yes()
	Talk(3,"L10_get_talk","������ż����һ�ȥ�����ҩ�ɻ���!","������ǿ�̫����!","��֪��Ҫ��Щҩ��?")
end

function L10_get_talk()
	Talk(1,"","��Ҫ�ɵ�ҩ���У�����ޣ���ؽ��ݡ���ݡ������ݺ���֥�����������Ѳɵ�����֥����������ʮ��ϡ�٣����������ĵط�ͨ������������ػ������Ҫ���С�ģ����Ǽ�ҩͯƽʱ����ȥ�����򶫱���ҩ���Ȳ�ҩ����˵�����ҩ��ͦ���!")
	SetTask(9,10*256+10)
	AddNote("�������򶫱ߵ�ҩ���Ȳ�����ޣ���ؽ��ݡ���ݡ������ݺ���֥5��ҩ. ")
	Msg2Player("�������򶫱ߵ�ҩ���Ȳ�����ޣ���ؽ��ݡ���ݡ������ݺ���֥5��ҩ. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","����ã��Ҹ���С�������")
	DelItem(112)
	DelItem(113)
	DelItem(114)
	DelItem(115)
	DelItem(116)
	SetTask(9,20*256)
	SetRank(20)
--	AddMagic(167)
--	AddMagic(168)
--	AddMagic(392)
--	AddMagic(171)
	add_kl(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㣡�ѳ�Ϊ���صķ���ӣ�ѧ�����ص��������ؽ�������������. ")
	AddNote("��ҩ����������С�������������ɷ����")
end;
