--description: ����������졡������������
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 0) and (GetFaction() ~= "tianwang") and (GetLevel() >= 10) then			-- ����������������
		Say("��Ҫ��Ϊ�������ʽ����Ҫһͬ���ο��𣬱�����Ȼ��������ӭ��ֻ��Ҫ�����һ���Ƹ����ֵܺȹ�ͬ��ף�Ϳ��Կ������Ѿ�������", 2, "��������/Uworld38_get_yes", "����/no")
	elseif (Uworld38 == 80) and (HaveItem(90) == 1) then					-- �����������������
		Uworld38_prise()
--	elseif (UTask_tw == 5*256+80) then		-- Ϊ�����������������ı��ݴ�
--		if (GetSeries() == 0) and (GetFaction() == "tianwang") then	-- ������������ˣ�����Ϊ������������
--			SetTask(3,10*256)
--		else
--			SetTask(3,0)
--		end
	elseif (Uworld38 >= 20) and (Uworld38 < 127) then		-- �������������
		Talk(1,"","ÿ��ֻҪ�뵽Ҫ���������Ƹ���Ⱥ�ƹ��Ҿ�����")
	elseif (GetFaction() == "tianwang") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","���ֵܣ��п�����һ���һ��!")
	elseif (UTask_tw ==70*256) then 					--���ų�ʦ����������״̬
		Talk(2,"","û��ϵ��ÿ���˶���","�Ҹ��,,, ������Ǻ����˻����ϴεľƻ�û���Ѱ�? ")
	else
		Talk(1,"","��˵�ƹ���<color=Red>������<color>����һ�ֽ�<color=Red>������<color>,������Ǻþƣ�ֻ�����ھͺ�!")
	end
end

function Uworld38_get_yes()
	Talk(1,"","��˵�ƹ���<color=Red>������<color>����һ�ֽ�<color=Red>������<color>,������Ǻþƣ�ֻ�����ھͺ�!")
	Uworld38 = SetByte(GetTask(38),1,20)
	SetTask(38,Uworld38)
	AddNote("���ϱߵ�ˮկ�ſڼ���˼��<color=red>�ӵ��Ӽ�������<color>, ������������������'. ")
	Msg2Player("���ϱߵ�ˮկ�ſڼ���˼��ӵ��Ӽ������񵽰���������������'. ")
end;

function Uworld38_prise()
	Talk(1,"","�������������Ǻþƣ��Ŵ򿪾��ŵ�������ζ������Ҳ�������ǵ��ˣ�ÿ���˶����佭��!")
	DelItem(90)
	Uworld38 = SetByte(GetTask(38),1,127)
	SetTask(38,Uworld38)
	i = ReturnRepute(15,19,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	AddNote("�ص������������������������������ɼ�����������")
	Msg2Player("�ص������������������������������ɼ����������������������. "..i.."��.")
end;

function no()
end;
