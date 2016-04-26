-- Created by fangjieying 2003-5-17
-- 《翠烟刀法》
-- 学会技能冰踪无影
-- 翠烟，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(336)
	if(party ~= "cuiyan") then							-- 不是翠烟
		Msg2Player("你拿着《翠烟刀法》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是翠烟但未到80级
		Msg2Player("你拿着《翠烟刀法》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《翠烟刀法》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(336,1)										-- 学会技能
		Msg2Player("学会了技能“冰踪无影”。")
		return 0
	end
end