--西北北区 龙门镇to莫高窟
--TrapID：

function main(sel)
	if (GetLevel() >= 5) then
		SetFightState(1);
		NewWorld(340,1853,3446);
		AddTermini(225);
	else
		Talk(1,"","前方危险！还是回去练下功吧!")
	end
end;