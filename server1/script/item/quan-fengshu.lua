--Created by fangjieying 2003-5-17
--《驭风术》
--学会傲雪啸风技能
--昆仑，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(372)
	if(party ~= "kunlun") then							-- 不是昆仑
		Msg2Player("你拿着《驭风术》研究了半天，结果什么也没领悟到。")
		return 1
	elseif(GetLever < 80) then							-- 是昆仑但未到80级
		Msg2Player("你拿着《驭风术》钻研了半天，结果领悟甚少，没什么效果。")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("你已经把《驭风术》钻研透彻，从中再也学不到任何东西。")
		return 1
	else
		AddMagic(372,1)
		Msg2Player("学会了技能“傲雪啸风”。")
		return 0
	end
end