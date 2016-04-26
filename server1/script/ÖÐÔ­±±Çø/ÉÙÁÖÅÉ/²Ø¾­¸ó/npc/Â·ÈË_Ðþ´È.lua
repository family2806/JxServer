-- 少林 路人NPC 玄慈 50级任务
-- by：Dan_Deng(2003-08-04)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if ((UTask_sl == 50*256+30) and (HaveItem(28) == 1)) then		-- 50级任务进行中
			L50_prise()
		elseif ((UTask_sl == 50*256) and (GetLevel() >= 50)) then		--50级任务启动
			Talk(2,"L50_get","：“《易骨经》、《易筋经》和《洗髓经》并称“少林三经”，相传为达摩祖师所著，记载了本派的武学精粹。当年金兵南下，为免少林宝笈落入敌手，慌乱之中，本座的弟子澄远将三经藏在了寺后的松林里，战火中，澄远为了保护藏经阁而死，事后众弟子在松林中只找到了《易筋经》和《洗髓经》，而《易骨经》却怎么也找不着了.")
--		elseif (UTask_sl == 70*256+10) then			-- 重返门派任务完成
--			Say("玄慈：十顶僧帽你收集齐了吗？",2,"已经准备好了/return_completed","请再等一段时间/return_sele_no")
--		elseif (UTask_sl == 70) then			-- 重返门派任务
--			Talk(1,"return_sele","玩家：师父，我出师了还可以借阅藏经阁中的书籍吗？")
		else							-- 常规对话
			Talk(1,"","本寺宝典古籍很多，金国窥视已久 .")
		end
	else
		Talk(1,"","藏经阁还是法堂，是高僧说经讲法的地方，藏经阁有很多佛经，很多绝版珍品.")
	end
end;

function L50_get()
	Say("如果易骨经真的被我们弟子弄丢，真是丢脸 ",2,"帮助/L50_get_yes","我不关心 !/L50_get_no")
end

function L50_get_yes()
	SetTask(7,50*256+10)
	AddNote("接少林寻经任务：找到被存封的易骨经. ")
	Msg2Player("接少林寻经任务：找到被存封的易骨经. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","这个真是易骨经，真是太好了....")
	SetTask(7,60*256)
	DelItem(28)
	SetRank(6)
--	AddMagic(271)
--	AddMagic(11)
--	AddMagic(19)
	add_sl(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("找到易骨经，完成任务，升级为伏魔天王. ")
	Msg2Player("恭喜你升级为伏魔天王，学到龙爪虎爪龟绿合，莫哈无量. ")
end;
