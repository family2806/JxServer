--description: �䵱�ɳ�ʦ���� �䵱ɽ����2
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","���䣺��� <color=Red>�ν���� <color> �����, <color=Red>����<color> ���أ��쵽<color=Red>����<color> �� <color=Red>���� <color> Ѱ����� ��.")
			Msg2Player("��������������, <color=Red>ʿ����������<color>, ��Ҫ��������������æ. ")
			SetTask(17, SetByte(GetTask(17),2,2))
			AddNote("������д�ţ�������������Ѱ�ҽ�������������İ취. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","���䣺����ȱ�� <color=Red>����<color>, �ν���������")
			Msg2Player("������������������ʱ����������ѱ���... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(70)
			Say("��ʱ�õ�������ǰ�߹ٱ�ս������ǿ���򿪱��䣬���һ��<color=Red>'�����澭<color>.", 0)
			Msg2Player("��Ҫ������������ս������ǿ���򿪱��䣬���һ�������澭. ")
			SetTask(17, SetByte(GetTask(17),2,10))
			AddNote("�򿪱��䣬�в������澭. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(70) == 0) then
				AddEventItem(70)
			else
				Talk(1,"","�����ѿ�")
			end
		end
	else
		Talk(1,"","δ�������㲻�ܴ򿪱���!")
	end
end;
