Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 483, 10, 0, 3240);
	Msg2Player("你吃了一个内电丸");
end