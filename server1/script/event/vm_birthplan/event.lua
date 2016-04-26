function vm_BirthPlan()
	Say("<#> 祝贺武林传奇满一岁，从11/6/2006 到 18/6 各位侠客练功将获得很多有趣的奖励!", 3,
	"<#> 做生日蛋糕./vm_birth_wantcake1",
	"<#> 做上等生日蛋糕./vm_birth_wantcake2",
	"<#> 我只来玩而已!/OnCancel")
end

function vm_birth_wantcake1()
	Say("<#> 做生日蛋糕需要<color=yellow>5 精粉和5糖精<color>.马上做吗？", 2,
	"<#> 对，请师父帮忙!/vm_birth_makecake1",
	"<#> 稍候回来!/OnCancel")
end

function vm_birth_makecake1()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and ConsumeEquiproomItem(5, 4, 976, 1, -1) == 1 and ConsumeEquiproomItem(5, 4, 977, 1, -1) == 1) then
		AddItem(6,1,1100,1,1,1)--生日蛋糕
		Say("<#> 生日蛋糕已做好，请拿去和大家分享!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t 武林传奇生日\t"..GetName().."\t"..GetAccount().."\t 做生日蛋糕.")
	else
		Say("<#> 做生日蛋糕需要 <color=yellow>5 精粉和5糖精<color>, 够原料了再来哦", 0)
	end
end

function vm_birth_wantcake2()
	Say("<#> 做上等生日蛋糕需要<color=yellow>5 精粉和5糖精, 2 鲜奶和2个鸡蛋<color>. 马上做吗？", 2,
	"<#> 对。请师父帮忙!/vm_birth_makecake2",
	"<#> 稍候回来!/OnCancel")
end

function vm_birth_makecake2()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	local nCount_egg = CalcEquiproomItemCount(4, 978, 1, 1)
	local nCount_milk = CalcEquiproomItemCount(4, 975, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and nCount_egg >= 2 and nCount_milk >= 2) then
		ConsumeEquiproomItem(2, 4, 978, 1, -1)
		ConsumeEquiproomItem(2, 4, 975, 1, -1)
		ConsumeEquiproomItem(5, 4, 976, 1, -1)
		ConsumeEquiproomItem(5, 4, 977, 1, -1)
		AddItem(6,1,1101,1,1,1)--高级蛋糕
		Say("<#> 生日蛋糕已做好，快快拿去与大家分享吧!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t 武林传奇生日\t"..GetName().."\t"..GetAccount().."\t 做高级蛋糕")
	else
		Say("<#> 做高级蛋糕需要<color=yellow>5 精粉和5糖精, 2 鲜奶和2个鸡蛋<color>, 够原料了再来吧", 0)
	end
end