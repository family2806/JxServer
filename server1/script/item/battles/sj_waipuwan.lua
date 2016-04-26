Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 487, 5, 0, 3240);
	Msg2Player("你吃了一个外普丸");
end