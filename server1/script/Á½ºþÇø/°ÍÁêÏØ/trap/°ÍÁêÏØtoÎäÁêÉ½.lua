--两湖区 巴陵县to武陵山
--TrapID：两湖区 81
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(70, 1608 ,3230)
else
	Talk(1,"","对不起，没到五级的新手不能出村。")
	SetPos(1334, 3306)						--走出Trap点
end

AddTermini(47)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		

end;
