-- �嶾 ·��NPC �嶾����2 ����������ɣ�
-- by��Dan_Deng(2003-08-05)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- �����������
		if (HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(224) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) then
			enroll_prise()
		else
			Talk(1,"","����ʱ�䲻��������ô������?")
		end
	else							-- ����Ի�
		Talk(1,"","�嶾�����Σ�գ��㲻Ҫ����")
	end
end;

function enroll_prise()
	Talk(1,"","�����ȸë�Ѿ�����. ̫����!������ʽ��Ϊ���ż�������")
	DelItem(227)
	DelItem(223)
	DelItem(224)
	DelItem(225)
	DelItem(226)
	i = ReturnRepute(25,29,5)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld37 = SetByte(GetTask(37),2,127)
	SetTask(37,Uworld37)
	AddNote("����嶾������������ʽ��Ϊ<color=red>��������<color>����. ")
	Msg2Player("����嶾����������, ��ʽ��Ϊ���ż�������. ")
end;
