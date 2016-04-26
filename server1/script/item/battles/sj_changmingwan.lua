Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 488, 5, 0, 3240);
	Msg2Player("你吃了一个长命丸");
end