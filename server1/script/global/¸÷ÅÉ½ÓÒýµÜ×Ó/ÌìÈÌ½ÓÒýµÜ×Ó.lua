-- 天忍接引弟子 模板 天忍死士
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "天忍死士"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 7 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianren","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "emei") then
		Talk(1,"","天忍死士：峨嵋派如果能加入本教，整天对着这些天仙般的美人，可真的要乐死了！")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","天忍死士：早就听说南国女子妖娆妩媚，如今亲眼一见，果然比我们北国的女子娇嫩。这样一个娇滴滴的美人儿，又何必舞刀弄剑呢？")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","天忍死士：本教教主一直希望贵派能够加入我们这边，荣华富贵、高官厚禄，享用不尽啊！")
	elseif (player_Faction == "wudu") then
		Talk(1,"","天忍死士：咱们天忍教和五毒教一北一南，已成合围之势，中原还不迟早是囊中之物？")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","天忍死士：任何人也阻挡不了本教入主中原的宏图伟业！")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","天忍死士：你们少林派的高手都已渐入老境，年轻后辈中好像没有什么人才，看来也是盛名之下、其实难负呀，哈哈哈哈！")
	elseif (player_Faction == "wudang") then
		Talk(1,"","天忍死士：早就听说武当派内功剑术天下一流，有机会一定要请教请教！")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","天忍死士：你们昆仑派称霸西域，一直就有逐鹿中原的野心，总有一日，本教会与你们在中原一决胜负的！")
	elseif (player_Faction == "tianren") then
		Say("天忍死士：有行动吗？",4,"行动已完成，送我回总坛/return_yes","地图介绍/map_help","技能说明/skill_help","没事/no")
--		Say("天忍死士：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/tr_check_yes","不用了/tr_check_no")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","天忍死士：你这个叫化子想混进来做奸细吗？")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派!")
	else
		UTask_tr = nt_getTask(4)
		if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- 入门任务中
			Talk(1,"","天忍死士：你已经在总坛接了本教的入门任务，但是尚未完成，你必须上华山为本教夺得禹王剑。")
		elseif (UTask_tr >= 70*256) and (player_Faction ~= "tianren") then					--已经出师
			Say("天忍死士：听说你出师以后，竟然混出了点名堂，真是士别三日，当刮目相看啊！",3,"地图介绍/map_help","技能说明/skill_help","没事/no")
		else
			Talk(1,"select","天忍死士：本教信奉大金国的国教萨满教，教主乃是国师完颜宏烈，他性情狂傲，智谋过人，就连大金皇帝对他也礼让三分。本教高手无数，招募了大批金宋两国的高手，可谓藏龙卧虎。")
		end
	end
end;

function select()
	UTask_tr = nt_getTask(4)
	UTask_gb = nt_getTask(8)
	if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- 已接了丐帮入门任务
		Talk(1,"","天忍死士：南朝昏庸，你们这些自命侠义道却还想为那赵老儿卖命，何苦呢。")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_gb < 5*256) and (UTask_tr < 5*256) then		--火系、未入丐帮天忍
		if (GetLevel() >= 10) then						--等级达到十级
			Say("天忍死士：你想加入本教吗？", 3, "加入天忍教/yes", "不加入/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","天忍死士：本教弟子都是精英之辈，像你这样没有经过磨砺的新手，建议你先去野外练练，<color=Red>十级<color>以后再来找我。")
		end
	end
end;

function yes()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	Talk(1,"","天忍死士：既加入本教，就要遵从教主号令。本教教规森严，优胜劣汰是本教的法则，你就用自己的实力来证明你的价值吧！")
	SetRevPos(49,28)	 						--设置重生点
--	nt_setTask(4, 10*256)
	SetFaction("tianren")      					--玩家加入天忍教
	SetCamp(2)
	SetCurCamp(2)
--	SetRank(55)							--设置称号
	nt_setTask(137,64)
	SetLastFactionNumber(7)
--	Msg2Player("加入天忍教，成为了一名杀手。")
--	AddNote("加入天忍教，成为杀手，学会武功残阳如血。")
	Msg2Faction("tianren",GetName().."自今日起加入天忍教，拜见各位师兄师姐！",GetName())
-- 直接处理流程
	nt_setTask(4,80*256)
	SetRank(81)
	Msg2Player("欢迎你加入天忍教，直接学会本门所有技能。")
	add_tr(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
	NewWorld(49, 1644, 3215)					--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(49, 1644, 3215)			--把玩家传送到门派入口
end;

function tr_check_yes()
	if (GetSeries() ~= 3) then
		Talk(1,"","天忍死士：你的五行属性不是我们火系，怎么会混到本教来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(148) >= 0) then		-- 做完了50级任务,七杀神拳
		nt_setTask(4,60*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(146) >= 0) then		-- 做完了40级任务,五行阵
		nt_setTask(4,50*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(141) >= 0) then		-- 做完了30级任务,烈火情天
		nt_setTask(4,40*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(138) >= 0) then		-- 做完了20级任务,推山填海
		nt_setTask(4,30*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(131) >= 0) then		-- 做完了10级任务,天忍矛法
		nt_setTask(4,20*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(4,10*256)
		Talk(1,"","天忍死士：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end

function tr_check_no()
	Say("天忍死士：有行动吗？",2,"行动已完成，送我回总坛/return_yes","没事/return_no")
end

function Uworld1000_jiaoyutianren()
	nt_setTask(1000,260)
	Msg2Player("天忍派接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end

function no()
end;
