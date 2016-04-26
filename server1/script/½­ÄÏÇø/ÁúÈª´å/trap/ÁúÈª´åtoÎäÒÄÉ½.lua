--江南区 龙泉村to武夷山
--Trap ID：江南区 9

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(193, 1937, 2851);
		AddTermini(154);
	else
		Talk(1,"","前方危险! 请回去修炼!")
	end
end;
