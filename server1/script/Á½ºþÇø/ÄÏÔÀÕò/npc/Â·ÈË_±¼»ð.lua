-- 南岳镇 路人 奔火
-- 2004/4/17 名驹奔火任务 by fangjieying

function main()
	Uworld76 = GetTask(76)
	if (Uworld76 == 10) then
		Talk(1,"","一匹骏马站在树下，正竖着耳朵听同伴的叫声")
		SetTask(76,20)
		Msg2Player("看来这匹马病了，应该是和这件事有关")
	elseif (Uworld76 == 50) and (HaveItem(375) == 1) then		-- 治好了
		DelItem(375)
		SetTask(76,60)
		DelMagic(396)
		if (HaveMagic(397) == -1) then		-- 必须没有技能的才给技能
			AddMagic(397)
		end
		Msg2Player("你领悟到武路重生心法")
		Talk(1,"","你把血融合给马吞下，同时运春风雨露技术心法，奔火的眼睛渐渐亮起来。到现在你才领悟到雨露重生心法")
	elseif (Uworld76 >10) and (Uworld76 < 50) then
		Talk(1,"","奔火叫一声，像打雷一样")
	elseif (Uworld76 > 50) then
		Talk(1,"","你医好了奔火的病")
	else
		Talk(1,"","这匹马毛红如血，名字叫'奔火'")
	end
end
