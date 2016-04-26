Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
		AddSkillState(472, 5, 0, 54 )	--增加玩家血量和内力持续恢复
		Msg2Player("<#>你使用了一个乾坤造化丹（小）。")	
end

