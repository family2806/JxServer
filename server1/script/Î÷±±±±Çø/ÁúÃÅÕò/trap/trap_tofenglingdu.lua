--西北北区 龙门镇to风陵渡
--TrapID：

function main(sel)
	if (GetLevel() >= 5) then
		SetFightState(1);
		NewWorld(336, 1119, 3192);
		AddTermini(224);
	else
		Talk(1,"","前方危险！还是回去练下功吧!")
	end
end;