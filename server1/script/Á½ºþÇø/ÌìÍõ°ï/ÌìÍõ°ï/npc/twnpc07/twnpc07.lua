--description: ������ˮ��
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 1) then
			Talk(3, "", "�����±�����ˣ������Ҽ�̫����𼦵�", "С���ѣ��������������������͸����", "�ã��ǵ�Ҫ��ŵ�԰���")
			AddNote("ͬ��Ѽ�����ˮ����ˮ����æץ��")
			Msg2Player("ͬ��Ѽ�����ˮ����ˮ����æץ��")
			SetTask(14, 3)
		elseif (UTask_tw40sub == 7) and (HaveItem(149) == 1) then	-- ���������
			Talk(3, "", "���Ѿ�ץ������ˣ����Ը��Ҽ�������", "С���ѣ���3����������!", "��л���!������5�����!")
			DelItem(149)
			AddEventItem(150)
			Msg2Player("�õ�5����� ")
			SetTask(14, 9)
			AddNote("��ˮ�������õ�5�����")
		elseif (UTask_tw40sub == 0) then
			Talk(1, "", "�����±�����ˣ������Ҽ�̫����𼦵�")
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 0) then
			AddEventItem(150)
			Talk(2,"","С���ѣ��Ҳ�С��Ū������򾣬���ܲ��ܰ�����ץ��ֻ?","���ã��ҵÿ���ץ��5ֻ��򾣬�͸���!")
		elseif (UTask_tw40sub >= 9) then
			Talk(1, "", "лл�����Ҽ���")
		else
			Talk(1,"","�����м��������͸��Ҽ�����������?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","�ҳ������Ժ�ҲҪ�������塢�������������������˾��صĴ�Ӣ��")
		else
			Talk(1,"","����������������ҹ��򣬿�����˵�һ�С����ʲôʱ����ܳ�����?")
		end
	end
end;
