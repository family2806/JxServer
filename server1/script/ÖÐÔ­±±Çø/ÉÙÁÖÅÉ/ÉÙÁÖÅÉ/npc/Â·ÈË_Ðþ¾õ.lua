-- 少林 路人NPC 玄觉 30级任务
-- by：Dan_Deng(2003-08-01)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 30*256+20) and (HaveItem(27) == 1) then		--30级任务完成
			Talk(2,"L30_prise","师叔，塔林的那些敌人原来是金国的爪牙，他们偷偷盗走了本门的《般若波罗蜜多心经》，不过弟子已经把经书夺回来了，请师叔过目.","阿弥陀佛，幸亏你及时发现了他们的阴谋，夺回经书，否则后果不堪设想，这次你立了大功，本座就升你为三十级弟子吧!")
		elseif ((UTask_sl == 30*256) and (GetLevel() >= 30)) then		--30级任务
			Say("刚才有寺僧来报告，说是在塔林附近发现了一些行踪诡秘的人，不知有何不轨意图，你愿意去塔林看看吗?",2,"愿意 /L30_get_yes","我还有其他事. /L30_get_no")
		else							-- 常规对话
			Talk(1,"","金国把我们我们看成眼中钉，几次派人来少林捣乱.")
		end
	else
		Talk(1,"","我们少林武功自古就堂堂正正，慈悲为怀.")
	end
end;

function L30_get_yes()
	Talk(1,"","太辛苦你了，要小心!")
	SetTask(7,30*256+10)
	AddNote(" 去塔林调查可疑之人. ")
	Msg2Player(" 去塔林调查可疑之人. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","多谢师叔!")
	DelItem(27)
	SetTask(7,40*256)
	SetRank(4)
--	AddMagic(16)
	add_sl(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("拿到般若波罗蜜多心经，升为护法罗汉. ")
	Msg2Player("恭喜你升为护法罗汉，学到罗汉阵. ")
end;
