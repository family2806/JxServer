--description: ������������
--author: yuanlan
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40������
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 0) then		-- ����������
			Talk(4,"","���˼ң��������������ë����?","�ǰ������������ˣ���ɲ�������������������!","������Ҫ������ҩ�����أ�����԰���������?","�������������񲻹�����Ҫ�Ǹ����Ҽ�������ҾͰ�������!")
			AddNote("������򾻻��ë������")
			Msg2Player("�Ҽ�ֻ��ë���ȥ�������̾Ϳ��Ի�����ë��")
			SetTask(14,1)
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 1) then
			Talk(3, "", "��Σ����������", "���˼ң��㿴��Щ����?", "�ܺã���ë���͸�����!")
			DelItem(150)
			AddEventItem(94)
			Msg2Player("�ҵ���ë��")
			SetTask(14,10)
			AddNote("��������͸������̻�����ë��")
		elseif (UTask_tw40sub >= 10) then
			if (HaveItem(94) == 0) then
				AddEventItem(94)
				Talk(2,"","���˼ң����͸��ҵ���ë����Ū����!","��������ô��ô�����أ��Ҹոյ���һֻ����Ͽ���ȥ����!")
			else
				Talk(1,"","�Ϻ���ÿ�춼������㣬������㶼֪����")
			end
		else
			if (UTask_tw40sub ~= 0) and (UTask_tw40sub ~= 1) and (UTask_tw40sub ~= 3) and (UTask_tw40sub ~= 5) and (UTask_tw40sub ~= 7) and (UTask_tw40sub ~= 9) and (UTask_tw40sub ~= 10) then
				SetTask(14,0)
				Talk(1,"","С�ӣ�������ɫ���Ǻܺã���������Ϣһ�£���ʲô����˵. ")
			else
				Talk(1,"","�����Ҽ�������ҾͰ���ë���͸���. ")
			end
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","��㣬��Ҫ�������ҵ���! ")
		else
			Talk(1,"","�Ϻ���ÿ�춼������㣬������㶼֪����")
		end
	end
end;
