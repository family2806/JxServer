-- ������-������-����3(�������񡰾�С�ꡱ)
-- by��Dan_Deng(2004-03-03)

function main(sel)
	Uworld41 = GetTask(41)
	if (GetByte(Uworld41,1) == 30) and (HaveItem(352) == 1) then		-- �����У��С�����Կ�ס�����δ�ȳ�
		if (GetBit(Uworld41,11) == 0) then				-- ���ص�ǰΪ�ر�
			Say("���������ǹرյ�״̬����Ҫ��������",2,"��/Turn_On","�������ֹر�/Turn_Off")
		else
			Say("���������Ǵ򿪵�״̬����Ҫ�����ر���",2,"�������ִ�/Turn_On","�ر�/Turn_Off")
		end
	end
end

function Turn_On()
--	Talk(1,"","���ش��ˡ�")
	Msg2Player("���ش��ˡ�")
	Cur_Switchs = SetBit(GetTask(41),11,1)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Turn_Off()
--	Talk(1,"","���عر��ˡ�")
	Msg2Player("���عر��ˡ�")
	Cur_Switchs = SetBit(GetTask(41),11,0)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Check_Switch()
	Cur_Switchs = GetByte(GetTask(41),2)
	Set_Switchs = GetByte(GetTask(41),3)
	if (Cur_Switchs == Set_Switchs) then			-- �ܹ�һ�£��ȳ�С��
		Uworld41 = SetByte(GetTask(41),1,100)
		SetTask(41,Uworld41)
		DelItem(352)						-- �ɹ�����ɾ��Կ��
		Talk(1,"","������أ���ɹ��ؾȳ���С�ꡣ")
		Msg2Player("���Ѿ�����˻��أ��ȳ�С�ꡣ")
	else
		Msg2Player("������ص����������������ţ�ȴ��Ȼ��˿������")
	end
end
