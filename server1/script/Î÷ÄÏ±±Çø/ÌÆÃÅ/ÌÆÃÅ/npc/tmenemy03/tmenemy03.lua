--description: �����񺣵����ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		elseif (i == 1) then
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		elseif (i == 2) then 
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		elseif (i == 3) then 
			Talk(1,"","����Ϊˮ")
			Msg2Player("�õ��ھ�������Ϊˮ")
		elseif (i == 4) then 
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		elseif (i == 5) then 
			Talk(1,"","����Ϊɽ")
			Msg2Player("�õ��ھ�������Ϊɽ")
		elseif (i == 6) then 
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		else
			Talk(1,"","����Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
		end
	end
end;
