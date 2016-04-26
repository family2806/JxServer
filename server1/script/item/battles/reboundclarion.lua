Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()
	CastSkill( 510, 1);		-- 3分钟内，减少附近敌方玩家伤害反弹20%
	Msg2Player("你使用了一个抗弹之角");
end