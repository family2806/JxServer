--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս

function main()
	if (GetCurCamp() ~= 1) then 
		Msg2Player("ȥ���ˣ�Ҫȥ�Ļ���Ҫ���о��ķ�����. ");
	else
		SetCurCamp(GetCamp())
		SetFightState(0)
		SetLogoutRV(0)
		NewWorld(222, 1613, 3185)
	end;
end;
