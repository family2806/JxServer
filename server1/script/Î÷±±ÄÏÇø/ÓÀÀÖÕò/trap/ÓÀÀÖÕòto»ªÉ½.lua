--西北南区 永乐镇to华山
--TrapID：西北南区 30
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)

if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(2, 2287 ,4092)
else
	Talk(1,"","前面危险，还是回去修炼一下!")
	SetPos(1851, 2831)						--走出Trap点
end

end;
