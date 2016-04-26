-- 丐帮 掌棒长老罗匡生 30级任务
-- by：Dan_Deng(2003-07-28)
-- by: xiaoyang(2004\4\22)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_gb = GetTask(8)
	Uworld128 = GetTask(128)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 30*256) and (GetLevel() >= 30) then		--30级任务
			Say("我负责处理丐帮各分舵的日常事务，每个月各分舵的舵主会上交一份文书，但是这个月第三分舵的赵舵主迟迟未上交文书，你愿意帮我去催一下吗?",2,"同意/L30_get_yes","真遗憾，我有其他事了 /L30_get_no")
		elseif (UTask_gb == 30*256+40) and (HaveItem(81) == 1) then		--30级任务完成
			L30_prise()
		elseif (UTask_gb >= 30*256+10) and (UTask_gb < 400*256) then		--30级任务进行中
			Talk(1,"","路过扬州了没有？为什么赵舵主还没带公文来?")
		else
			Talk(1,"","金兵越来越残暴，我们要行动才是!")
		end
	elseif (Uworld128 == 20) and (HaveItem(390) == 1) then
		Talk(9,"Uworld128_danger","罗长老，这里有戒无邪的信",".....请问阁下从哪里拿的信?","我与戒无邪认识，在长江源头，他给我的.","那应该没错，信上说你很值得信任，说有人想害他。.","怎么?","此事非常重要，绝对不能让外人知道","在下明白","我不方面出头露面，你敢担当次重任吗/","那我去!")
	elseif (Uworld128 == 50) then
		Talk(5,"Uworld128_finish","罗长老，戒大哥已经脱险.","多谢朋友，但是我还担心一件事","请说!","戒无邪是丐帮的希望，对方将不会放过的。希望你努力保护他。.","罗长老请放心 ! ")
	elseif (Uworld128 == 20) then
		Talk(1,"","罗长老，贵帮戒无邪让我带信给你，但是我忘记带了.")
	elseif (Uworld128 > 20) and (Uworld128 < 50)then
		Talk(1,"","小戒是丐帮的希望，可以给你带来福分! ")
	else
		Talk(1,"","金兵越来越蛮动，我们需要早点行动才行.")
	end
end;

function L30_get_yes()
	Talk(1,"","第三分舵在扬州，你到那里将会见到赵舵主")
	SetTask(8,30*256+10)
	Msg2Player("接到任务：到扬州问明白赵舵主为什么迟迟不交文书 ")
	AddNote("接到任务：到扬州问明白赵舵主为什么迟迟不交文书")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(2,"","长老，我带文书回来了!","看来金兵真是行动了，我们需要更加小心才行。这次你立大功了，我封你为30级弟子")
	DelItem(81)
	SetTask(8,40*256)
	SetRank(40)
--	AddMagic(274)
--	AddMagic(124)
	add_gb(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你已经升为丐帮执钵弟子，将能学降龙掌：打狗阵. ")
	AddNote("解决蜀岗山的事情，救出丐帮弟子，升为执钵弟子")
end;

function Uworld128_danger()
	DelItem(390)
	SetTask(128,30)
	Msg2Player("罗长老让你去救戒无邪 ")
	AddNote("罗长老让你去救戒无邪")
end

function Uworld128_finish()
	if (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) then
		Talk(1,"","我丐帮有部秘诀，传给你!")
		if (HaveMagic(357) == -1) then		-- 必须没有技能的才给技能
			AddMagic(357,1)
		end
		if (HaveMagic(359) == -1) then		-- 必须没有技能的才给技能
			AddMagic(359,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("你学到丐帮绝技，飞龙在天，天下无狗")
		SetTask(128,255)
	else
	   SetTask(128,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("救出戒无邪，完成任务。你的名望增加"..add_repute.."点.")
   AddNote("救出戒无邪，完成任务 ")
end
