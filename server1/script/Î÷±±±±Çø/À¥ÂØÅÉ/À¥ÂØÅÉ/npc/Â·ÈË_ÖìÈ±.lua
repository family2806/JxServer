-- 昆仑 弟子 朱缺 30级任务
-- by：Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 30*256+10) and (GetItemCount(111) >= 3) then		--30级任务完成
			L30_prise()
		elseif ((UTask_kl == 30*256) and (GetLevel() >= 30)) then		--30级任务启动
			Say("掌门师尊交待去找三颗夜明珠来。这种小事就交给你去办吧. ",2,"好........ /L30_get_yes","我能力有限，只怕不行啊. /L30_get_no")
		else
			Talk(1,"","我一直想不明白为什么我师父还让像叹老这样的人活在世上。他常说无毒不丈夫，不杀他就像……你在那偷听什么! ")
		end
	else
		Talk(1,"","昆仑派要想和和各门派在中原地位平等，一定要有些武功出众，仁义的人掌权才可以!")
	end
end;

function L30_get_yes()
	Talk(1,"","听说附近有个雪豹洞，里面有许多价值连城的夜明珠。你就去那碰碰运气吧!")
	SetTask(9,30*256+10)
	AddNote("接30级任务：进雪豹洞拿回3颗夜明珠")
	Msg2Player("接30级任务：进雪豹洞拿回3颗夜明珠")
end;

function L30_get_no()
	Talk(1,"","师兄吩咐也敢不尊令，真是大胆!")
end;

function L30_prise()
	Talk(1,"","嗯，动作不慢嘛。好，我升你做太微护法，以后好好给我办事自然少不了你的好处!")
	i = GetItemCount(111)
	for j = 1, i do DelItem(111) end
	SetTask(9,40*256)
	SetRank(22)
--	AddMagic(178)
--	AddMagic(172)
--	AddMagic(393)
--	AddMagic(173)
--	AddMagic(177)			-- 百川纳海
	add_kl(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你！升级成昆仑太微护法！学会武功一气三清，天清地浊，百川汇海")
	AddNote("找到3颗夜明珠，完成昆仑30级任务，升为太微护法")
end;
