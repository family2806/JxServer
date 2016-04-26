-- Created by fangjieying 2003-5-17
-- 《太极剑谱·卷二》
-- 学会技能 人剑合一
-- 武当，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(368)
	if(party ~= "wudang") then							-- 不是武当
		Msg2Player("您研究太极剑谱-卷2半天了，依然没有领悟什么")
		return 1
	elseif(GetLever < 80) then							-- 是武当但未到80级
		Msg2Player("您研究太极剑谱-卷2半天了，领悟很少. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("您研究太极剑谱-卷2半天了，但是依然没有学到什么")
		return 1
	else
		AddMagic(368,1)										-- 学会技能
		Msg2Player("学到人剑合一技能. ")
		return 0
	end
end