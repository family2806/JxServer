--description: �䵱�ɳ�ʦ���� �䵱ɽ����1
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","���䣺Ŀǰ�η�ǰ�� <color=Red>>����<color> �ӳ�����ȥ<color=Red>>����<color> ��<color=Red>>ҩ���ϰ�<color> �Ұ�����")
			Msg2Player("����ξ���Ӫ�������ӣ���Ҫ��������ҩ���ϰ��Ұ���. ")
			SetTask(17, SetByte(GetTask(17),1,2))
			AddNote("��������д�ţ���������ҩ���ϰ�����������İ취. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","���� <color=Red>>����<color> ������.....")
			Msg2Player("����������... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(69)
			Say("<color=Red>����<color>�ѳ����򿪱��䣬����һ��<color=Red>>�����澭<color>.", 0)
			Msg2Player("���鱻�������б������澭. ")
			SetTask(17, SetByte(GetTask(17),1,10))
			AddNote("�򿪱����������澭. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(69) == 0) then
				AddEventItem(69)
			else
				Talk(1,"","�����ѿ�")
			end
		end
	else
		Talk(1,"","δ�������㲻�ܴ򿪱���!")
	end
end;
