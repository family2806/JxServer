--description: �����񺣵����ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","Ch�nh ��ng l� L�i ")
			Msg2Player("�õ��ھ���Ch�nh ��ng l� L�i ")
		elseif (i == 1) then
			Talk(1,"","Ch�nh Nam l� H�a")
			Msg2Player("�õ��ھ���Ch�nh Nam l� H�a")
		elseif (i == 2) then 
			Talk(1,"","Ch�nh T�y l� m�c")
			Msg2Player("�õ��ھ���Ch�nh T�y l� m�c")
		elseif (i == 3) then 
			Talk(1,"","Ch�nh B�c l� n��c")
			Msg2Player("�õ��ھ���Ch�nh B�c l� n��c")
		elseif (i == 4) then 
			Talk(1,"","��ng Nam l� gi� ")
			Msg2Player("�õ��ھ�����ng Nam l� gi� ")
		elseif (i == 5) then 
			Talk(1,"","��ng B�c l� n�i")
			Msg2Player("�õ��ھ�����ng B�c l� n�i")
		elseif (i == 6) then 
			Talk(1,"","T�y Nam l� ��t")
			Msg2Player("�õ��ھ���T�y Nam l� ��t")
		else
			Talk(1,"","T�y B�c l� tr�i")
			Msg2Player("�õ��ھ���T�y B�c l� tr�i")
		end
	end
end;
