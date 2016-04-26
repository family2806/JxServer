-- Created by fangjieying 2003-5-17
-- 《流星·刀法》
-- 学会技能天外流星
-- 天忍，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(362)
	if(party ~= "tianren") then							-- 不是天忍
		Msg2Player("你拿着《流星·刀法》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是天忍但未到80级
		Msg2Player("你拿着《流星·刀法》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《流星·刀法》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(362,1)										-- 学会技能
		Msg2Player("学会了技能“天外流星”。")
		return 0
	end
end