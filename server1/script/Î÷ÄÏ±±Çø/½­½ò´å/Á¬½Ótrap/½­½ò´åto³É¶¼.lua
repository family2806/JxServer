--西南北区 江津村to成都
--Trap ID：西南北区 55
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)

if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(11, 3407, 5295)
else
	Talk(1,"","前方危险，请回去再练习!")
	SetPos(3402, 6019)						--走出Trap点
end

end;
