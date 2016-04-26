-- 丐帮 执法长老孟苍浪 20级任务
-- by：Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_gb = GetTask(8);
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 20*256+20) then			--带着20级任务
			Talk(2,"L20_prise","我刚才教训了孟远才，警告他以后不准再欺负帮中兄弟，如果我有做错，请孟长老责罚!","你做得很对，都怪我平日太过放纵这个侄子，这次能给他一个教训很好。你是非分明，能够仗义执言，我不仅不会怪你，还要升你为二十级弟子!")
		else
			Talk(1,"","孟远越来越傲慢，都怪我平日太过放纵")
		end
	else
		Talk(1,"","我们丐帮与金国为敌，金国不把我们放在眼里，全力杀我丐帮弟子.")
	end
end;

function L20_prise()
	SetTask(8,30*256)
	SetRank(39)
--	AddMagic(129)
	add_gb(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你，已经升为：执钵弟子。学到化险为夷")
	AddNote("恭喜你，已经升为：执钵弟子。学到化险为夷 ")
end
