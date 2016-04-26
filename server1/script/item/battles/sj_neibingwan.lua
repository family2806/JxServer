Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 481, 10, 0, 3240);
	Msg2Player("你吃了一个内冰丸");
end