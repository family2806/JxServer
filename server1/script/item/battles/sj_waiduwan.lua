Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 485, 5, 0, 3240);
	Msg2Player("你吃了一个外毒丸");
end