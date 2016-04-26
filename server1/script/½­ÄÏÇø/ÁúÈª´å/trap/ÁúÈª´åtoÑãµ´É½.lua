--江南区 龙泉村to雁荡山
--Trap ID：江南区 7

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(195, 682, 2863);
		AddTermini(156);
	else
		Talk(1,"","前方危险! 请回去修炼!")
	end
end;
