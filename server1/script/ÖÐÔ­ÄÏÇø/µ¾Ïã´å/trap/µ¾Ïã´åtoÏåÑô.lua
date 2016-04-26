--中原南区 稻香村to襄阳
--TrapID：中原南区 73
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)

if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(78, 1799, 3425)
else
	Talk(1,"","前方危险，请回去再练习!")
	SetPos(1335, 3397)						--走出Trap点
end

end;
