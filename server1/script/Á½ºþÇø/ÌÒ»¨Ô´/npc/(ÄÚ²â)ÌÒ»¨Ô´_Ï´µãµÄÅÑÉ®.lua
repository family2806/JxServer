--洗技能点的叛僧　（内测专用版）
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2003-12-10)

function main()
	Say("你想洗髓吗!可以！先给我捶捶背！知道怎么做吗?",2,"这是10万两，请大师收下 /pay_yes","算了吧/rollback_no")
end;

function pay_yes()
	if (GetCash() >= 100000) then
		Pay(100000)
		i = HaveMagic(210)		-- 轻功另外操作
		j = HaveMagic(400)		-- “劫富济贫”另外操作
		n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
		x = 0
		if (i ~= -1) then x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
		if (j ~= -1) then x = x + j end
		rollback_point = n - x			-- 把技能点当做空闲点数返还，但先扣除轻功等
		AddMagicPoint(rollback_point)
		if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
		if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
		if (GetTask(13) > 256) then		-- 是用宝石洗的点
			Msg2Player("用3颗水晶洗技能点。你应该回家休息一下!")
			Say("用3颗水晶洗技能点. 但是技要消耗3个技能点.你应该回家休息一下.",1,"好的 /KickOutSelf")
		else
			Msg2Player("用3颗水晶洗技能点. 但是技要消耗3个技能点.你应该回家休息一下!")
			Say("用3颗水晶洗技能点. 但是技要消耗3个技能点.你应该回家休息一下!",1,"好的 /KickOutSelf")
		end
	else
		Talk(1,"","这就是你的诚意吗？这样的话你还是回去吧! ")
	end
end

function no()
end
