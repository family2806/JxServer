-- �н����˽ű�
-- 2005-12-07 for newyear gift

function main()

	Say("�͹���Ҫ�����ﾡ�ܴ�<color=yellow>�����<color> ѡ����С��Ϸ������ڿ�����Ϣ��!", 0);
	return

--	Say("�н����ˣ���λ�͹٣��������׼������ǰɣ�������½���һ�����<color=yellow>������Ũ��������<color>������ʵ�ݣ����״��ѻ��������Լ��ö����ʰ�����㿴���ɣ�", 
--	6,
--			"����Ԫ���������/buy_yuandan",
--			"����ͬ��������/buy_partnermask",
--			"��������������/buy_randomtask",
--			"����ͬ�鼼�������/buy_skillbook",
--			"����׾������/buy_baijuwan",
--			"�Ҿ��ǿ���/OnCancel")
end

function OnCancel()
end

function buy_partnermask()
	Sale(132, 3)
end

function buy_randomtask()
	Sale(133, 3)
end

function buy_skillbook()
	Sale(134, 3)
end

function buy_baijuwan()
	Sale(135, 3)
end

function buy_yuandan()
	Sale(137, 3)
end