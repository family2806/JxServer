--���ϱ��� �ɶ��� ·��14ѦС�öԻ�  ������40������
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
-- �޸�Dan_Deng �Ĵ���QBJ(2003-10-3)

function main(sel)
	UTask_em = GetTask(1)
	UTask_emsub01 = GetByte(GetTask(29),1)
	if (UTask_em == 40*256+50) then		-- 40��������
		if (UTask_emsub01 == 0) then
		Talk(5, "", "ѦС�ã���λ��㣬���ϸ�ס�ң���ɶ�����", "������˼����Ϊ������������һ���������ζ�����ԡ���", "ѦС�ã�����������ŵ��������õ����������ң���������Ͽ��Ǵ����򴫹������أ�", "ԭ�����������ң��ѹ���ô�㣡���ӣ���ɲ����԰�����������������ң����м��á�", "ѦС�ã����ǲ����ģ���������˵������ӻ����������һ���¿������������һ֧���������һ��ɣ�")
			SetTask(29,SetByte(UTask_emsub01,1,1))			-- ����task(29)��1���ֽ�Ϊ1
--			SetTask(29, 2)	
			AddNote("����ѦС��(383, 315) �ҵ��������ң�����Ҫ����������. ")
			Msg2Player("ѦС�ý�������������������")
		elseif ((UTask_emsub01 == 1) and (HaveItem(63) == 1)) then
			Say("ѦС�ã���Ư����������������Ҿ��͸���ɣ�", 1, "�õ���������/get")
			DelItem(63)
			AddEventItem(166)
			SetTask(29,SetByte(UTask_emsub01,1,10))
--			SetTask(29, 2)
			AddNote("�õ��������ҡ�")
			Msg2Player("�õ��������ҡ�")
		elseif (UTask_emsub01 == 10) and (HaveItem(166) == 0) then
			AddEventItem(166)
			Talk(1,"","ѦС�ã�����������")
		else
			Talk(1,"","ѦС�ã���û�����������ˣ��㻹��ɶ���£�")
		end
	else
		Talk(1,"","ѦС�ã����ϸ�ס�ң��������ɶ���")
	end
end;

function get()
end;
