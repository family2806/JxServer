--江南区 龙泉村to五毒教
--Trap ID：江南区 108

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(183, 1371, 3677);
	else
		Talk(1,"","前方危险! 请回去修炼!")
	end
end;
