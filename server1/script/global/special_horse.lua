-- special_horse.lua ��������(80����)��NPC�ű�
-- By Dan_Deng(2003-11-10)

function main()
	UWorld97 = GetTask(97)
	if (UWorld97 == 10) then		-- �Ѿ����
		Talk(1,"","��ԣ���һ��Ҫ�úöԴ������ÿ��Ҫ����ϴ�裬��������Ҫ���Ͼ���......")
	elseif (UWorld97 == 1) and (IsTongMaster() == 1) then			-- ��������
		Talk(4,"sele_color","��ԣ���λӢ����������","��ң���̨��ʲô�£�","�Ӿԣ�������ԣ�������һƥǧ�����Գ��ã�����λӢ������������ǿ������ɵĴ���ʦ�����µı�������û��Ӣ����ͷ��","��ң��ҿ�����ġ�����......")
	else
		Talk(1,"","��ԣ�ǧ�����У������ֲ����С�ͽ�����κΣ�")
	end
end

function sele_color()
	Say("��ԣ�Ӣ���뿴��",6,"�ⲻ������̤ѩô��/buy_black","�ⲻ�ǳ��ñ���ô��/buy_red","�ⲻ�Ǿ�Ӱô��/buy_cyan","�ⲻ�ǵ�¬ô��/buy_yellow","�ⲻ����ҹ��ʨ��ô��/buy_white","����ʲô��ˡ������׾��ʶ��/buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","��ԣ�һ��֮������ʦ�������᲻ʶ��˱������ԣ���Ǹ�������������ϴ����ˡ�")
end

function the_buy(i)
	SetTaskTemp(49,i)
	Say("��ԣ�����Ӣ�۹�Ȼʶ�ã����±�Ҳ�᲻�þʹ����������������¼���300�������ӣ���Ӣ�����沮�֣���ʹ�����Ӣ��ǧ������ƴ�������",2,"û���⣬��һ�������������/buy_yes","��һʱ����������ȥ�����Ǯ�أ�/buy_no")
end

function buy_yes()
	if (GetCash() >= 3000000) then
		i = GetTaskTemp(49)
		Pay(3000000)
		AddItem(0,10,5,i,0,0,0)
		SetTask(97,100+i)			-- ������ֵ�����Ҽ�ס�����ʲô��ɫ��
		Talk(1,"","��ԣ����ѽ����������͸�����λӢ���ˣ�һ��Ҫ�ԹԵ�ѽ��")
	else
		Talk(1,"","��ң������������������ò����������Դ���")
	end
end

function buy_no()
	Talk(1,"","��ԣ���������Ҫһ��Ǯ�ѵ�Ӣ�ۺ���")
end
