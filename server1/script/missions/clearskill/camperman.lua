function main()
	Say("����ʱҪ���ķ���", 4, "���巽/ChangeCamp", "а��/ChangeCamp", "ɱ�ַ�/ChangeCamp", "��ʱ����/OnCancel");
end;

function ChangeCamp(nSel)
	SetFightState(1)
	if (nSel == 0) then 
		SetCurCamp(1)
	elseif (nSel == 1) then 
		SetCurCamp(2)
	else
		SetCurCamp(4)
	end;
end;

function OnCancel()
end;