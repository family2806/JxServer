-- ���� ·��NPC ֪��ɮ ��������
-- by��Dan_Deng(2003-08-01)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld38 = GetByte(GetTask(38),2)
	if (Uworld38 == 20) and (HaveItem(219) == 1) then		-- �������(֤������)
		Talk(1,"enroll_prise","ԭ������������ֽ�ţ�Ҳ��.")
	elseif (Uworld38 == 0) and (GetLevel() >=10) and (GetFaction() ~= "shaolin") then		--��������
		Say("���ŵ�����Ҫ�����ĸ��������ֱ��ǣ�Ӣ�´󵨣���Ȼ���������Ͳ��κ���˽���ҡ����������ɼ������ӣ���Ҫ����Щ����������ܿ�����?",2,"����!/enroll_get_yes","������ֻ����. /enroll_get_no")
	elseif (GetFaction() == "shaolin") then
		Talk(1,"","ʦ��Ҫ�����ñ��µ�ׯ�ϣ���Ҫ���ܣ���������.")
	else							-- ����Ի�
		if (GetSex() == 0) then
			Talk(1,"","ʩ����Ҫ��������ȥ")
		else
			Talk(1,"","Ů�Ͳ��ܽ������� ")
		end
	end
end;

function enroll_get_yes()
	Talk(1, "", "���飬����ɽ���棬����4���������ٻ������������˵.")
	Uworld38 = SetByte(GetTask(38),2,10)
	SetTask(38,Uworld38)
	AddNote("֤����֪��ɮ�и���Ʒ�ʣ��൨���ģ���Ȼ���������Ͳ��κ���˽����")
	Msg2Player("֤����֪��ɮ�и���Ʒ�ʣ��൨���ģ���Ȼ���������Ͳ��κ���˽����")
end;

function enroll_get_no()
end;

function enroll_prise()
	Talk(1,"","���������Ѿ��������ĸ�Ʒ�ʣ���ϲ�㣬�ӽ��������Ϊ���ż���������!")
	DelItem(219)
	i = ReturnRepute(12,29,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld38 = SetByte(GetTask(38),2,127)
	SetTask(38,Uworld38)
	Msg2Player("��������ɼ����������񣬳�Ϊ���ֵ��� ,��������. "..i.."��.")
	AddNote("��������ɼ����������񣬳�Ϊ���ֵ���. ")
end;
