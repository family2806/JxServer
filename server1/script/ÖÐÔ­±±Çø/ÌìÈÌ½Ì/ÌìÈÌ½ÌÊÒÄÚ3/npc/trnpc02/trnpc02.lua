--description: ���̻̽�������
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4);
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 10*256) and (GetLevel() >= 10) then
			Say("���̵ڶ����<color=Red>��ɱ��<color>���Ѻ��<color=Red>�߸�����<color>�����Ƕ��Ǳ��̵���ͽ��������ܹ�������߸��һ�õ�<color=Red>�߿���ɱ���Ƶ���Ƭ<color>���Ϳ��Խ���Ϊ���̵���Ӱɱ�֣�����û�е���ȥ����ɱ������", 2, "����ɱ�� /L10_get_yes", "��ʱ����/L10_get_no")
--		elseif (UTask_tr == 10*256+50) and (HaveItem(51) == 1) and  HaveItem(52) == 1 and HaveItem(53) == 1 and HaveItem(54) == 1 and HaveItem(55) == 1 and HaveItem(56) == 1 and (HaveItem(57) == 1) then
		elseif (UTask_tr == 10*256+50) then		-- �޸��������������2003-09-27��
			i = check_token()
			if (i >= 3) then
				Talk(1,"L10_prise","�ܺã�����ɱ���¹��������ܳ�������֮������ʲô�¾��Լ�����")
			else
				Talk(1,"","��ô����һ��СС�Ŀ���Ҳ��������?")
			end
		elseif (UTask_tr < 20*256) then								--��δ��10������
			Talk(1,"","��Ҫ��Ϊ���뱾�̾Ͱ����ˣ����̲��ո�ԣ����!")
		else
			Talk(1,"","��ոռ�����ӣ�ǿ������ǿ���֣���ҪС��!")
		end
	else
		Talk(1,"","ֻ��ǿ�߲�������������ǿ��ʤ���ߣ�δ���õ��˽����������𣬶����Լ���ѡ�񣬲�Ҫ������.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>��ɱ����<color> һ�����߿飬����<color=Red>7���������� color>, ��ֻ���õ�3�����.")
	SetTask(4, 10*256+50)
	AddNote("����ɱ�����񣺽�����ɱ���õ�3����ɱ������ɱ����. ")
	Msg2Player("����ɱ�����񣺽�����ɱ���õ�3����ɱ������ɱ����. ")
end;

function L10_get_no()
	Talk(1,"","������������!")
end;

function L10_prise()
	SetTask(4, 20*256)
	SetRank(56)
--	AddMagic(132)
--	AddMagic(131)
--	AddMagic(136)
	add_tr(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("�㱻��Ϊ��Ӱɱ�֣�ѧ������ì�������̵������������. ")
	AddNote("����ɱ���ƴ��������������ɱ����������Ϊ��Ӱɱ��")
end;

function check_token()
	i = 0
	if (HaveItem(51) == 1) then
		i = i + 1
		DelItem(51)
	end
	if (HaveItem(52) == 1) then
		i = i + 1
		DelItem(52)
	end
	if (HaveItem(53) == 1) then
		i = i + 1
		DelItem(53)
	end
	if (HaveItem(54) == 1) then
		i = i + 1
		DelItem(54)
	end
	if (HaveItem(55) == 1) then
		i = i + 1
		DelItem(55)
	end
	if (HaveItem(56) == 1) then
		i = i + 1
		DelItem(56)
	end
	if (HaveItem(57) == 1) then
		i = i + 1
		DelItem(57)
	end
	return i
end;
