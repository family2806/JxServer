-- ���� ·��NPC ���� 30������
-- by��Dan_Deng(2003-08-01)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 30*256+20) and (HaveItem(27) == 1) then		--30���������
			Talk(2,"L30_prise","ʦ�壬���ֵ���Щ����ԭ���ǽ����צ��������͵͵�����˱��ŵġ����������۶��ľ��������������Ѿ��Ѿ��������ˣ���ʦ���Ŀ.","�����ӷ��ҿ��㼰ʱ���������ǵ���ı����ؾ��飬�������������룬��������˴󹦣�����������Ϊ��ʮ�����Ӱ�!")
		elseif ((UTask_sl == 30*256) and (GetLevel() >= 30)) then		--30������
			Say("�ղ�����ɮ�����棬˵�������ָ���������һЩ���ٹ��ص��ˣ���֪�кβ�����ͼ����Ը��ȥ���ֿ�����?",2,"Ը�� /L30_get_yes","�һ���������. /L30_get_no")
		else							-- ����Ի�
			Talk(1,"","������������ǿ������ж����������������ֵ���.")
		end
	else
		Talk(1,"","���������书�Թž������������ȱ�Ϊ��.")
	end
end;

function L30_get_yes()
	Talk(1,"","̫�������ˣ�ҪС��!")
	SetTask(7,30*256+10)
	AddNote("�i ȥ���ֵ������֮��. ")
	Msg2Player("�i ȥ���ֵ������֮��. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","��лʦ��!")
	DelItem(27)
	SetTask(7,40*256)
	SetRank(4)
--	AddMagic(16)
	add_sl(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("�õ����������۶��ľ�����Ϊ�����޺�. ")
	Msg2Player("��ϲ����Ϊ�����޺���ѧ���޺���. ")
end;
