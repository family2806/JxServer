--Created by fangjieying 2003-5-17
--《丐帮掌法》
--学会飞龙在天技能
--丐帮，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(357)
	if(party ~= "gaibang") then							-- 不是丐帮
		Msg2Player("你拿着《丐帮掌法》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是丐帮但未到80级
		Msg2Player("你拿着《丐帮掌法》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《丐帮掌法》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(357,1)
		Msg2Player("学会了技能“飞龙在天”。")
		return 0
	end
end