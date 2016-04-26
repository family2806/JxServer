function main()
	Say("你暂时要入哪方？", 4, "正义方/ChangeCamp", "邪恶方/ChangeCamp", "杀手方/ChangeCamp", "暂时不换/OnCancel");
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