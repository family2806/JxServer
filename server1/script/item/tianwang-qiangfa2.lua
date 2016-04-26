-- Created by fangjieying 2003-5-17
-- 《天王枪法·卷二》
-- 学会技能追星逐月
-- 天王，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(323)
	if(party ~= "tianwang") then							-- 不是天王
		Msg2Player("你拿着《天王枪法·卷二》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是天王但未到80级
		Msg2Player("你拿着《天王枪法·卷二》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《天王枪法·卷二》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(323,1)										-- 学会技能
		Msg2Player("学会了技能“追星逐月”。")
		return 0
	end
end