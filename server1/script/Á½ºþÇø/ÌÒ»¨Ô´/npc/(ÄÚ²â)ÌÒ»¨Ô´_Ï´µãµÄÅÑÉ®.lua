--ϴ���ܵ����ɮ�����ڲ�ר�ð棩
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2003-12-10)

function main()
	Say("����ϴ����!���ԣ��ȸ��Ҵ�������֪����ô����?",2,"����10���������ʦ���� /pay_yes","���˰�/rollback_no")
end;

function pay_yes()
	if (GetCash() >= 100000) then
		Pay(100000)
		i = HaveMagic(210)		-- �Ṧ�������
		j = HaveMagic(400)		-- ���ٸ���ƶ���������
		n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
		x = 0
		if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
		if (j ~= -1) then x = x + j end
		rollback_point = n - x			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
		AddMagicPoint(rollback_point)
		if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
		if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
		if (GetTask(13) > 256) then		-- ���ñ�ʯϴ�ĵ�
			Msg2Player("��3��ˮ��ϴ���ܵ㡣��Ӧ�ûؼ���Ϣһ��!")
			Say("��3��ˮ��ϴ���ܵ�. ���Ǽ�Ҫ����3�����ܵ�.��Ӧ�ûؼ���Ϣһ��.",1,"�õ� /KickOutSelf")
		else
			Msg2Player("��3��ˮ��ϴ���ܵ�. ���Ǽ�Ҫ����3�����ܵ�.��Ӧ�ûؼ���Ϣһ��!")
			Say("��3��ˮ��ϴ���ܵ�. ���Ǽ�Ҫ����3�����ܵ�.��Ӧ�ûؼ���Ϣһ��!",1,"�õ� /KickOutSelf")
		end
	else
		Talk(1,"","�������ĳ����������Ļ��㻹�ǻ�ȥ��! ")
	end
end

function no()
end
