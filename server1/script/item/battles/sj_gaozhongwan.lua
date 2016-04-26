Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	AddSkillState( 495, 50, 0, 3240);
	Msg2Player("你吃了一个高中丸");
end