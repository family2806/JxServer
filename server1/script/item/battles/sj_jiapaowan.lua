Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 493, 2, 0, 3240);
	Msg2Player("你吃了一个加跑丸");
end