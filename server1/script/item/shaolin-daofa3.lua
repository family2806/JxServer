--Created by fangjieying 2003-5-17 
--《少林刀法·卷三》
--学会无相斩技能
--少林，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(321)
	if(party ~= "shaolin") then							-- 不是少林
		Msg2Player("你拿着《少林刀法·卷三》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是少林但未到80级
		Msg2Player("你拿着《少林刀法·卷三》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《少林刀法·卷三》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(321,1)										-- 学会技能
		Msg2Player("学会了技能“无相斩”。")
		return 0
	end
end