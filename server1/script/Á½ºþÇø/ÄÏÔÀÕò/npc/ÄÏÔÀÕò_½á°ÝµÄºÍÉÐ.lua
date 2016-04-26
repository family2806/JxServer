-- 结拜的和尚
-- By: Dan_Deng(2003-08-22)

function main(sel)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then			-- 只有队长才能启动结拜
		Talk(1,"Wswear_select", 11374)
	else
		Talk(1,"", 11375)
	end
end;

function Wswear_select()
	if (GetSex() == 0) then
		P_sex = "少侠"
	else
		P_sex = "女侠"
	end
	Say("静督禅师：说得好！只需要"..P_sex.." 3000两修佛像, 什么事都好说.",2,"捐 3000 两. /Wswear_yes","不需要!/Wswear_no")
end;

function Wswear_yes()
	if (GetCash() >= 3000) then
		if(SwearBrother(GetTeam()) == 1)then
			Pay(3000)
			Msg2Team("恭喜二位结义金兰. ")
		else
			Msg2Team("队中有夫妻关系，结拜失败. ")
		end
	else
		Talk(1,"", 11376)
	end
end;

function Wswear_no()
end;
