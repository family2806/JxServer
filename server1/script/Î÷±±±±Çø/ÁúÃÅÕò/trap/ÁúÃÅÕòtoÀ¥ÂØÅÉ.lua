--西北北区 龙门镇to昆仑派
--TrapID：西北北区 3

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1); 
		NewWorld(131, 1872, 3659);
	else
		Talk(1,"","前方危险！还是回去练下功吧!")
	end
end;