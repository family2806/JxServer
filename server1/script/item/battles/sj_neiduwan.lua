Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 480, 5, 0, 3240);
	Msg2Player("你吃了一个内毒丸");
end