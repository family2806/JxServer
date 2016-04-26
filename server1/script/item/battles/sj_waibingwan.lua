Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 486, 10, 0, 3240);
	Msg2Player("你吃了一个外冰丸");
end