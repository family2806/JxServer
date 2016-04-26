--江南区 龙泉村to罗霄山
--Trap ID：江南区 5

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(179, 1618, 3292);
		AddTermini(153);
	else
		Talk(1,"","前方危险! 请回去修炼!")
	end
end;
