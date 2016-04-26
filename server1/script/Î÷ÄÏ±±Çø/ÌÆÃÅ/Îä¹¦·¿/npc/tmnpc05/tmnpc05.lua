--description: 唐门唐鹤 10级任务 
--author: yuanlan	
--date: 2003/3/10
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
	if (Uworld51 == 40) then		-- 洗清冤屈任务进行中
		Talk(6,"Uworld51_50","你想帮一尘，我已经知道了.","为什么唐仇掌门对一尘公子有成见？好坏都是自己的亲生骨肉","一尘多次想改家规，让掌门不开心，又加上不染想争权，喜欢在掌门面前说一尘的坏话 ","原来少林高僧遇难与金国有关，金国总是把少林视为眼中钉。几天前，我收到通报，说天忍教秘密收集中原的绝学秘笈.","有这事？那天忍教是被怀疑最多的","对，我要留下来，给你探听消息.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 10*256+80) and (HaveItem(36) == 1) then		--10级任务完成
			L10_prise()
		elseif (UTask_tm == 10*256) and (GetLevel() >= 10) then				--10级任务启动
--			DelItem(36)							--防止重接任务后，玩家捡起任务道具
			Say("昨日本座弟子在<color=Red>成都府<color>办事的时候，不小心被扒手偷走了本门的独门暗器<color=Red>魔雨针<color>, 这件事让掌门大发雷霆，谁要是能帮本座找回魔雨针，本座重重有赏! ", 2, "帮助寻找 /L10_get_yes", "不关我事 !/L10_get_no")
		elseif (UTask_tm > 10*256) and (UTask_tm < 20*256) then					--已经接到10级任务，尚未完成
			Talk(1,"","<color=Red>魔雨针<color>是在<color=Red>成都府<color>丢失的，你可以先到城里暗中打听一番。对了，你还没有见过<color=Red>魔雨针<color>吧？它是一种象蚊须一样的细针，通体漆黑.")
		elseif (UTask_tm >= 20*256) then					--已经完成10级任务，尚未出师
			Talk(1,"","你真有本事，能帮本堂找回魔雨针，只要你好自为之，将来一定前途无量")
		else
			Talk(1,"","两位公子不和，虽然不说，但是，此事不处理好，一定会有后患，不知掌门作何打算?")
		end
	else								--普通对话
		Talk(1,"","本门虽然以暗器名闻江湖，但是论到武功，也决不会逊于其它门派.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>魔雨针<color>是在<color=Red>成都府<color>丢失的，你可以先到城里暗中打听一番。对了，你还没有见过<color=Red>魔雨针<color>吧？它是一种象蚊须一样的细针，通体漆黑.")
	SetTask(2, 10*256+20)
	AddNote("在武功房遇到唐黑，接任务 <color=Red>去成都找魔雨针.<color> ")
	Msg2Player("接魔雨针任务，去成都找魔雨针")
end;

function refuse()
	Talk(1,"","本门暗器丢失，你怎么能说不关你事呢?")
end;

function L10_prise()
	Talk(1,"","你果然有些本事，能帮本座找回魔雨针，好，本座就教你几招，看好了! ")
	DelItem(36)
	SetRank(26)
	SetTask(2, 20*256)
--	AddMagic(43)
--	AddMagic(347)
	add_tm(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("返回武功房，交魔雨针给唐黑，完成任务，升为壮丁. ")
	Msg2Player("交魔雨针，找到唐黑，完成魔雨针任务，升为唐门壮丁，学到唐门暗器，地焰火. ")
end;

----------------------- 世界任务 --------------------------
function Uworld51_50()
	SetTask(51,50)
	Msg2Player("唐黑猜测，此事和天忍教有关，让你去打探消息. ")
end
