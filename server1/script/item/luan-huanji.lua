--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--《陷阱术·乱环击》
--学会乱环击技能
--唐门，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(351)
	if(party ~= "tangmen") then							-- 不是唐门
		Msg2Player("你拿着《陷阱术·乱环击》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是唐门但未到80级
		Msg2Player("你拿着《陷阱术·乱环击》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《陷阱术·乱环击》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(351,0)
		Msg2Player("学会了技能“乱环击”。")
		return 0
	end
end