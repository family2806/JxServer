-- ������ �����ŵ���2 ��������
-- by��Dan_Deng(2003-07-25)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--��������
		if (HaveItem(106) == 1) then
			enroll_prise()
		else
			Say("û�� <color=Red>�黨<color>, ���ܹ������󡣽����������?",2,"�����û��׼����/U36_uncompleted","�Ҽ�������/no")
		end
	elseif (GetFaction() == "cuiyan") then			-- ���ŵ���
		Say("ʦ���ڻ���������?���뿪��������",2,"�ã���л���/U36_leave","����Ҫ���һ�Ҫ��������/no")
	elseif (UTask_cy == 70*256) then			-- �ѳ�ʦ
		Talk(1,"","ԭ����ʦ�㣬�þò���!")
	else
		Talk(1,"","��ӭ��������.")
	end
end;

function enroll_prise()
	Talk(1,"U36_leave","��ϲ���Ѿ�����������ս�����������Ǻ�ʦ����! ")
	DelItem(106)			-- �黨
	i = ReturnRepute(20,29,5)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld36 = SetByte(GetTask(36),2,127)
	SetTask(36,Uworld36)
	AddNote("��ɻ��������񣬳�Ϊ<color=Red>�������� color> ")
	Msg2Player("��ɻ��������񣬳�Ϊ�������� ")
end;

function U36_uncompleted()
	Talk(1,"U36_leave","��ӭʦ�����κ�ʱ��������!")
end

function U36_leave()
--	SetPos(304,1498)
	SetPos(340,1456)
end

function no()
end
