--西南南区 石鼓镇to大理府
--Trap ID：西南南区 2

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(162, 1691, 3517);
	else
		Talk(1,"","前方危险，快回去多多修炼吧!")
	end
end;
