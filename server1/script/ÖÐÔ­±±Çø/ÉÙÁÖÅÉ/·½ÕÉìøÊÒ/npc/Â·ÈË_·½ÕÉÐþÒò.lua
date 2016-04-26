-- 少林 路人NPC 方丈玄因 10级任务、40级任务
-- by：Dan_Deng(2003-08-01)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事 ", 2, "想请教大师 /oldentence", "庆祝恩师节，在下找够了恩师卡和高徒卡 /vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)

	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>最近我有很多事要解决，你来这有什么事?"
	G_TASK:OnMessage("少林 ", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("学120技能.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("想请教其他事", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- 回师错误修正
		SetFaction("")
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- 以前接过入门任务的
		SetTask(3,0)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(7,70*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- 转门派错误修正
		SetTask(3,75*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	end
	
	local tbDes = {"带艺投师/#daiyitoushi_main(0)", "想请教其他事/common_talk"};
	
	Say("最近我有很多事要解决，找我有什么事 ", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- 世界任务：武林向背
		Talk(1,"","独孤盟主有此宏才大略，老衲一定听从，只是本寺在金人手里，老衲不能不得不考虑众弟子的性命，不敢冒然行事。麻烦你回去和独孤盟主说老衲帮不了")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10级任务启动
			Say("阿弥陀佛！所有新入门的弟子，都需要接受考核。你准备好了吗?",2,"我已准备好!/L10_get_yes","我没有装备好!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40级任务进行中
			SetTaskTemp(43,0)		-- 临时变量43,计数回答正确的话
			Talk(1,"L40_sele3_1","两位师叔祖要弟子带5句话给掌门，说两人的心意就在5句话里面:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("本门师叔祖寂灭二僧，武功已达到了深不可测的地步，但是二老当年为了避开本派的一场门户之争，一直住在后山的密室里闭关不出，如今天下纷乱，中原武林岌岌可危，为师想向寂灭二僧请教天下局势，你愿意去请他们二老出关吗?",2,"同意/L40_get_yes","弟子能力有限，恐怕不能胜任/no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- 重返后的自由出入，以及技能调整检查判断
			check_skill()
		else
			Talk(1,"","好，好。加油！佛祖会保佑.")
		end
--	elseif (UTask_sl == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","玄因方丈：阿弥陀佛，既入空门，就好好收拾心情钻研藏经阁内典籍，不要再去挂虑战场厮杀，国恨家仇了。")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- 重返师门任务
		Talk(1,"return_sele","师傅，弟子可以借藏经阁里的经典吗?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- 重返师门任务中
		Say("5 万两准备好了没有?",2,"已准备好了/return_complete","还没准备好/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- 少林派重返门派，收回金钟罩
--		Say("玄因方丈：天王帮与金兵战火正酣，你若投入天王帮，恐金兵以此向本寺启衅。",2,"为免师父烦恼，请收回弟子名号/defection_yes","弟子考虑未周，请师父原谅/no")
	else							-- 常规对话
		Talk(1,"","对于少林僧人来说，工夫是修炼，练功的目的是想改变人的素质，少林僧人正是为了修炼.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- 如来千叶手
--		Msg2Player("你学会了“如来千叶手”")
--		Say("玄因方丈：为师这次闭关苦思数日，新创了一招“如来千叶手”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("你已成为江湖中人了，如果想下山就下去吧!",2,"多谢方丈恩准 /goff_yes","弟子不敢乱来/no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("欢迎你加入少林派，变成造地僧. ")
	SetRevPos(103,51)		  			--设置重生点
	SetTask(7,10*256)					-- 入门
	SetFaction("shaolin")       	--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("学到金刚伏魔. ")
	AddNote("加入少林派，成为造地僧，学到金刚伏魔. ")
	Msg2Faction("shaolin",GetName().." 天王弟子加入少林派，本派力量增强了!",GetName())
end

---------------------- 重返门派相关 --------------------------
function goff_yes()
	Talk(1,"","去吧，记得下山后还要坚守慈悲心.")
	SetTask(7,70*256)
	AddNote("离开少林寺，下山继续行走江湖")
	Msg2Player("离开少林寺，下山继续行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("出师完就不是少了弟子了，当日是不能了，但是，如果参考佛理，少林总是会接纳重返门派的人.",2,"我想返回少林 /return_yes","不需要/no")
end;

function return_yes()
	Talk(1,"","佛像久不维修，所以，有点损坏，如果你给本寺化缘50000两就能重返少林.")
	SetTask(7,70*256+20)
	AddNote("交50000两就能重返少林")
	Msg2Player("交50000两就能重返少林")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- 有50000两
		Talk(1,"","很好，根据你对本寺的贡献，升为护法长老.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到少林派绝学如来天叶，易筋经. ")
--		end
		AddNote("已返回少林派. ")
		Msg2Faction(GetName().." 已返回少林派，被封为护法长老")
	else
		Talk(1,"","阿弥陀佛，好像不够五万两.")
	end
end;

------------------------- 门派任务相关 --------------------------------
function L10_get_yes()
	Talk(1, "", "只要你顺利在木人巷拿到金莲花就能通过考验")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("接少林派挑战，在木人巷拿到金莲花. ")
	Msg2Player("接少林派挑战，在木人巷拿到金莲花. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","很好，你升为护院武僧.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("拿到金莲花，回去见玄因方丈，完成少林派考验，升为护院武僧. ")
	Msg2Player("恭喜你升为护院武僧，学到少林拳法，少林棍法，少林刀法. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("接玄因方丈之令，去请寂灭二僧出关. ")
	Msg2Player("接玄因方丈之令，去请寂灭二僧出关. ")
end;

function L40_sele3_1()
	Say("第一句是",5,"生死变异，虚伪无主/L40_sele3_2","四大苦空，五阴无我/L40_sele3_2","如是观察，渐离生死/L40_sele3_2","世间无常,国土危脆/L40_sele3_correct1","心是恶源,形为罪薮/L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("第二句是",5,"世间无常,国土危脆 /L40_sele3_3","四大苦空，五阴无我 /L40_sele3_correct2","生死变异，虚伪无主 /L40_sele3_3","如是观察，渐离生死 /L40_sele3_3","心是恶源,形为罪薮 /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("第三句是 ",5,"心是恶源,形为罪薮 /L40_sele3_4","如是观察，渐离生死/L40_sele3_4","四大苦空，五阴无我/L40_sele3_4","世间无常,国土危脆 /L40_sele3_4","生死变异，虚伪无主/L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("第四句是",5,"如是观察，渐离生死/L40_sele3_5","心是恶源,形为罪薮 /L40_sele3_correct4","世间无常,国土危脆 /L40_sele3_5","生死变异，虚伪无主/L40_sele3_5","四大苦空，五阴无我/L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("第五句是 ",5,"四大苦空，五阴无我/L40_sele3_result","生死变异，虚伪无主/L40_sele3_result","如是观察，渐离生死/L40_sele3_correct5","心是恶源,形为罪薮 /L40_sele3_result","生死变异，虚伪无主/L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，全对方可进入
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- 五句全对
		Talk(1,"","这个任务你完成很好，为师给你升为40级，不要让我失望")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		AddNote("拿到寂灭二僧的指教，完成任务，升为传经罗汉. ")
		Msg2Player("恭喜你升为少林传经罗汉，学到狮子吼武功. ")
	else
		Talk(1,"","这五句是怎么回事，是不是你读反了?")
	end
	SetTaskTemp(43,0)			-- 用完后释放变量
end;

function no()
end
