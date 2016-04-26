-- Created by fangjieying 2003-5-17
-- 《千佛秘籍》
-- 学会技能千佛千叶
-- 峨嵋，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(380)
	if(party ~= "emei") then							-- 不是峨嵋
		Msg2Player("你拿着《峨嵋佛光掌秘籍》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是峨嵋但未到80级
		Msg2Player("你拿着《峨嵋佛光掌秘籍》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《峨嵋佛光掌秘籍》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(380,1)										-- 学会技能
		Msg2Player("学会了技能“风霜碎影”。")
		return 0
	end
end