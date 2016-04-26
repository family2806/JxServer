Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 496, 5, 0, 3240);
	Msg2Player("你吃了一个飞速丸");
end