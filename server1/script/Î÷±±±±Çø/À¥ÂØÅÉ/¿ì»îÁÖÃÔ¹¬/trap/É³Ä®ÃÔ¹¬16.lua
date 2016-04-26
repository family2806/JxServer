--西北北区 快活林to沙漠迷宫
--TrapID：沙漠迷宫16

function main(sel)
	i = random(0,2)
	if (GetLevel() >= 80) then
		SetFightState(1);
		AddTermini(195);
		if (i == 0) then 
			NewWorld(224,1620,3216)
		elseif (i == 1) then 
			NewWorld(224,1594,3166)
		else
			NewWorld(224,1622,3144)
		end

	else
		Say("沙漠很危险！回去再练功去!",1,"回到快活林. /no")
		SetPos(1716,3144)
	end
end;

function no()
end
