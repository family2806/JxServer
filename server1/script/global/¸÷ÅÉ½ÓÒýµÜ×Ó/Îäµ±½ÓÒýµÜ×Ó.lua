-- 武当接引弟子 模板 武当道人
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "武当道人"

function default_talk()
	check_WDtask()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 8 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudang","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "emei") then
		Talk(1,"","武当道人：峨嵋女侠，小道这厢有礼了。令师清晓师太身体可好？")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","武当道人：翠烟门的功夫小道是很佩服的，不知姑娘有何指教？")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","武当道人：贵派掌门虽然性格偏激、行事不循常理，但是为人耿直坦荡，倒也不失为一个真君子。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","武当道人：使蛊下毒的本领再高超，也终究是末流之计，登不了大雅之堂。")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","武当道人：早就听说天王帮的兄弟们个个都是好汉，今日一见，果然是顶天立地的好男儿！")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","武当道人：原来是少林派的小师父，不知有何指教？")
	elseif (player_Faction == "wudang") then
		Say("道人：我十分挂念师父，他老人家近来身体可好？",4,"想要劳烦师兄送我回山/return_yes","地图介绍/map_help","技能说明/skill_help","师父一切都好/no")
--		Say("武当道人：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/wd_check_yes","不用了/wd_check_no")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","武当道人：原来是昆仑派的朋友，不知远道而来，有何指教？")
	elseif (player_Faction == "tianren") then
		Talk(1,"","武当道人：虽然是各为其主，但是金人虏我河山，欺我百姓，身为大宋子民，本派上下一定会力抗到底！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","武当道人：贵帮的何帮主与敝派掌门乃是忘年之交，贵帮有什么事，敝派一定会鼎立相助。")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","T? 你已学会野球拳!不能再入门派!")
	else
		UTask_wd = nt_getTask(5)
		if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- 入门任务中
			Talk(1,"","武当道人：你已经在武当山小道童清风处接了本派的入门任务，但是尚未完成，你需要为他找回掉落在井里的木桶。")
		elseif (UTask_wd >= 70) and (player_Faction ~= "wudang") then					--已经出师
			Say("武当道人：虽然你已出师下山，但是我们常常惦念你，你这一向可好？",3,"地图介绍/map_help","技能说明/skill_help","师傅一切都好/no")
		else
			Talk(3, "select", "武当道人：天下武学，北宗少林，南崇武当，你想必听说过吧？", "武当道人：本派武功讲究以静制动，以柔克刚，以短胜长，以慢击快、以意运气，以气运身，后发制人。冲虚恬淡，以无为胜有为，以无形胜有形，方是武学最高的境界。", "武当道人：本派武功有“五不传”，即柔骨质脆、心险、好斗、狂酒、轻露者，不传。")
		end
	end
end;

function select()
	UTask_wd = nt_getTask(5)
	UTask_kl = nt_getTask(9)
	if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- 已接了昆仑入门任务
		Talk(1,"","武当道人：哦，原来你想去昆仑学符法道术。")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_kl < 5*256) and (UTask_wd < 5*256) then		--火系、未入昆仑武当
		if (GetLevel() >= 10) then						--等级达到十级
			Say("武当道人：若加入本派需要收敛心性，专心修行，日后会有很多机会等着你，望你能善加对待。", 3, "加入武当派/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Say("武当道人：学武之道，欲速则不达。你初入江湖，还是先好好历练历练吧！到了<color=Red>十级<color>以后再来找我", 0)
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(81,40)	 					--设置重生点
--	nt_setTask(5, 10*256)
	SetFaction("wudang")      				--玩家加入武当
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(7)
	nt_setTask(137,65)
	SetLastFactionNumber(8)
-- 直接处理流程
	nt_setTask(5,80*256)
	SetRank(73)
	Msg2Player("欢迎你加入武当派，直接学会本门所有技能。")
	add_wd(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入武当派，请从一个道童开始，学到沧海明月武功!")
--	AddNote("加入武当派，成为道童!")
	Msg2Faction("wudang",GetName().."今日加入武当派，先拜见各位兄长!",GetName())
	NewWorld(81, 1574, 3224)				--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(81, 1574, 3224)			--把玩家传送到门派入口
end;

function wd_check_yes()
	if (GetSeries() ~= 4) then
		Talk(1,"","武当道人：你的五行属性不是我们土系，怎么会混到本派来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(164) >= 0) then		-- 做完了50级任务,剥及而复
		nt_setTask(5,60*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(161) >= 0) then		-- 做完了40级任务,两仪心法
		nt_setTask(5,50*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(158) >= 0) then		-- 做完了30级任务,剑飞惊天
		nt_setTask(5,40*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(156) >= 0) then		-- 做完了20级任务,纯阳心法
		nt_setTask(5,30*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(151) >= 0) then		-- 做完了10级任务,武当剑法
		nt_setTask(5,20*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(5,10*256)
		Talk(1,"","武当道人：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end

function wd_check_no()
	Say("武当道人：我十分挂念师父，他老人家近来身体可好？",2,"想要劳烦师兄送我回山/return_yes","师父一切都好/return_no")
end

function check_WDtask()
	if (nt_getTask(5) == 30*256+50) then		-- 任务变量错误
		if (GetFaction() == "wudang") then		-- 未出师重做所有任务
			nt_setTask(5,10*256)
			Say("武当道人：你的任务变量有错误，非常抱歉要请你重新从10级任务开始重做一次任务。",1,"多谢了/no")
		elseif (HaveMagic(164) >= 0) then			-- 已出师(学会了“剥及而复”并且不在门派中)的设为正常出师
			nt_setTask(5,70*256)
			Say("武当道人：你的任务变量有错误，我已经帮你修正为已出师状态。",1,"多谢了/no")
		else										-- 其它设为未入武当派
			nt_setTask(5,0)
			Say("武当道人：你的任务变量有错误，我已经帮你修正为尚未入门状态。",1,"多谢了/no")
		end
	end
end

function Uworld1000_jiaoyuwudang()
	nt_setTask(1000,260)
	Msg2Player("武当派接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end



function no()
end;
