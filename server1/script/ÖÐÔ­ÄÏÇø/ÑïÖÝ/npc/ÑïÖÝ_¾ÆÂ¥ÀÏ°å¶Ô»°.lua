--��ԭ���� ���ݸ� ��¥�ϰ�Ի���ؤ��10������ؤ��90��������ȭ����������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+10) then		--10��������
		SetTask(8,10*256+20)
		Talk(4,"L10_buy","�ϰ壬��Ҫ���!","��������û�У����Ǿƶ࣬��Ҫ��ʲô��?","��Ȫ�ơ����괺���ٻ�����¶��˫������.","��Ӵ�����ɣ���Ȫ�Ƹո����꣬���һ̳�����������ľƹ�����ɡ��������ˡ������������Ƕ��ȵû��ء��������־Ƶ��Ƕ��У�������Ϊ�������ƣ����Լ�Ǯ�ɲ�����Ŷ!")
	elseif (UTask_gb >= 10*256+20) and (UTask_gb < 20*256) then		--�����߶�ʧ����
		if (HaveItem(77) == 0) then
			Say("���괺����������, ֻҪ400����������!",2,"��/L10_buy_yes1","����/L10_buy_no")
		elseif (HaveItem(78) == 0) then
			Say("�ٻ�����ζŨ��, ֻҪ400����������!",2,"��/L10_buy_yes2","����/L10_buy_no")
		elseif (HaveItem(79) == 0) then
			Say("��¶��ζ�˱�, ֻҪ400����������!",2,"��/L10_buy_yes3","����/L10_buy_no")
		elseif (HaveItem(80) == 0) then
			Say("˫��������ζŨ��, ֻҪ400����������!",2,"��/L10_buy_yes4","����/L10_buy_no")
		else
			Talk(1,"","�������ƣ���Ʈ�����������!")
		end
	elseif (GetTask(128) == 10) and (HaveItem(76) == 0) then			-- ؤ��90��������
		Say("Ȫ����Ũ��ֻҪ1000����������!",2,"��/U128_10","����/L10_buy_no")
	elseif (GetTask(75) == 10) and (GetTask(55) == 10) and (HaveItem(77) == 0) then			-- ȭ����������
		Say("���괺��Ũ��ֻҪ800����������!",2,"��/U75_10","����/L10_buy_no")
	else
		Talk(1,"","��¥�ϰ壺������ؽ磬������������Ů����ô��û�����ƣ��͹�Ҫ�ȵ�ʲô�ƣ�")
	end
end;

function U75_10()
	if (GetCash() >= 800) then
		Pay(800)
		AddEventItem(77)
		Msg2Player("�н��괺")
	else
		L10_buy_noMoney()
	end
end

function U128_10()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(76)
		Msg2Player("�л�Ȫ�� ")
	else
		L10_buy_noMoney()
	end
end

function L10_buy()
	Say("����4�־ƣ��ƿ͹�1200 ��! ������?",2,"��/L10_buy_yes","����/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1200) then
		Pay(1200)
		AddEventItem(77)
		AddEventItem(78)
		AddEventItem(79)
		AddEventItem(80)
		AddNote("��4�־ƣ���Ȫ�ơ����괺���ٻ�����¶��˫������ ")
		Msg2Player("��4�־ƣ���Ȫ�ơ����괺���ٻ�����¶��˫������ ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_no()
	Talk(1,"","����Ц�����ٰ������򣬾��Բ���!")
end;

function L10_buy_yes1()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(77)
		Msg2Player("�н��괺 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes2()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(78)
		Msg2Player("�аٻ��� ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes3()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(79)
		Msg2Player("����¶")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes4()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(80)
		Msg2Player("��˫������ ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_noMoney()
	Talk(1,"","û��Ǯ���ǲ���!")
end;
