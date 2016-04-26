-- Created by fangjieying 2003-5-17
-- 《五毒刀法·卷二》
-- 学会技能玄阴斩
-- 五毒，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(355)
	if(party ~= "wudu") then							-- 不是五毒
		Msg2Player("你拿着《五毒刀法·卷二》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是五毒但未到80级
		Msg2Player("你拿着《五毒刀法·卷二》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《五毒刀法·卷二》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(355,1)										-- 学会技能
		Msg2Player("学会了技能“玄阴斩”。")
		return 0
	end
end