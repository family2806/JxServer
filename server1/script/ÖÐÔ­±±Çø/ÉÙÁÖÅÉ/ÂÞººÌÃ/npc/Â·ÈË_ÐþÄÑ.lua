-- 少林 路人NPC 罗汉堂首座玄难 少林出师任务
-- by：Dan_Deng(2003-08-04)
-- update by xiaoyang(2004\4\15) 少林90级任务

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	if allbrother_0801_CheckIsDialog(206) == 1 then
		allbrother_0801_FindNpcTaskDialog(206)
		return 0;
	end
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
--	if (UTask_sl == 70*256) and (Uworld122 == 245) then		-- 白名做完90级任务后又入了门派的，直接给技能
--		Talk(1,"","玄难：阿陀陀佛，施主果然英雄出众，这里有少林绝艺一部，望你勤加练习，不仅要成为本寺，更要成为中原武林的栋梁。")
--		AddMagic("金龙探爪")
--		AddMagic("横扫千军")
--		AddMagic("无相斩")
--		Msg2Player("学会少林技能金龙探爪、横扫千军、无相斩")
--		SetTask(122,255)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if((UTask_sl == 60*256+10) and (HaveItem(217) == 1) and (HaveItem(215) == 1) and (HaveItem(216) == 1) and (HaveItem(214) == 1)) then		-- 任务完成
			L60_prise()
		elseif((UTask_sl == 60*256) and (GetLevel() >= 50)) then		--出师任务启动
			Say("按照本门规定，凡是本门想出师的弟子都要经过108罗汉阵的考验，你想冲关吗?",2,"同意/L60_get_yes","不想 /L60_get_no")
		else							-- 常规对话
			Talk(1,"","少林身在金国，魂向南朝，方丈师兄这样忧虑也对!")
		end
	elseif (Uworld122 == 20) then
		Talk(4,"Uworld122_censure","玄因大师，少林弟子正在华山打擂台，所以，会损害少林名声.","哪个小子来这？少林的事不用你插手，走吧!","在下路过华山，看见金国高手的身影，恐怕贵派被埋伏了.","少林出家弟子遍布金国，金军有什么动静，难道我能不知道吗？不要胡说，如果不去我不客气了!")
   elseif (Uworld122 >= 30) and (Uworld122 < 60) then
   	Talk(1,"","还站这里啊，想我出手吗?") 
   elseif (Uworld122 == 70) then
   	Talk(7,"U122_prise","大师","大师","算了，是我错了，玄难从不向谁跪头。今天向小兄弟认错!","哎呀，大师，我不敢啊!","为什么不？阁下在水深火热中救各弟子，真是有再造之恩.","大师敢作敢当，小子拜服.")
	else
		Talk(1,"","你懂什么是禅权归一吗？那是指武学少林博大精深，以无修禅!")
	end
end;

function L60_get_yes()
	Talk(1,"","进入佛像后面的罗汉阵进去拿：念珠，禅杖，木鱼，钵盂4件信物，然后从原路返回，自己看着办吧")
	SetTask(7,60*256+10)
	AddNote("接受少林出师任务：进入罗汉阵找到4件宝物：念珠，禅杖，木鱼，钵盂. ")
	Msg2Player("接受少林出师任务：进入罗汉阵找到4件宝物：念珠，禅杖，木鱼，钵盂. ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(2,"","恭喜你已冲过108罗汉阵，你可以出师，以后行走江湖，救济助人，行侠仗义，不能骄傲，记住了!","弟子记住了")
	DelItem(217)
	DelItem(215)
	DelItem(216)
	DelItem(214)
	SetRank(62)
	SetTask(7,70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("在罗汉阵找到4件信物交给玄难，完成出师任务，升级无量释尊，顺利出师")
	Msg2Player("恭喜你出师，你被封为无量释尊")
end;

function Uworld122_censure()
	SetTask(122,30)  --设置任务变量为30
	Msg2Player("玄难没有注意到你，你只能去找玄悲. ")
	AddNote("玄难没有注意到你，你只能去找玄悲. ")
end

function U122_prise()
   if(GetTask(7) >= 70*256) and (GetTask(7) ~= 75*256) then			-- 是天王弟子或出师弟子
		Talk(2,"玄难，金国正继续动兵，武林中原将有一番惊天动地，在这老僧有一部《少林绝技》，送给小友，希望你勤奋练功，不只是成为本寺弟子，还能","大师的吩咐，小子怎么不敢遵从!")
		if (HaveMagic(318) == -1) then		-- 必须没有技能的才给技能
			AddMagic(318,1)
		end
		if (HaveMagic(319) == -1) then		-- 必须没有技能的才给技能
			AddMagic(319,1)
		end
		if (HaveMagic(321) == -1) then		-- 必须没有技能的才给技能
			AddMagic(321,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("学到少林技能：达摩渡江，横扫千军，无相斩. ")
		SetTask(122,255)
	else
	   SetTask(122,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("")
   Msg2Player("救出常、李二人，与禅僧和解，完成少林任务，名望增加. "..add_repute.."点.")
   AddNote("救出常、李二人，与禅僧和解，完成少林任务 . ")
end
