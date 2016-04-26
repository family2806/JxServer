-- 峨嵋接引弟子 模板 峨嵋锦衣尼
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "峨嵋锦衣尼"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 4 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuemei","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "emei") then
		Say("峨嵋锦衣尼：小师妹，又下山来玩？这次要我送你回山吗？",4,"是的，又要麻烦姐姐了/return_yes", "地图介绍/map_help","技能说明/skill_help","不用了，多谢师姐/no")
--		Say("峨嵋锦衣尼：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/em_check_yes","不用了/em_check_no")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","峨嵋锦衣尼：贵派偏处云南，与本派从无来往，不知有何指教？")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","峨嵋锦衣尼：你是蜀南唐门的人吗？本门乃是名门正派，从不与旁门左道之人交往。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","峨嵋锦衣尼：武林的邪魔歪道，人人得而诛之！")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","峨嵋锦衣尼：贵帮帮主杨瑛乃是一位女中豪杰，贫尼素来仰慕，可惜一直缘悭一面。")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","峨嵋锦衣尼：阿弥陀佛！原来是少林派的师兄，不知玄因大师近来是否康健？")
	elseif (player_Faction == "wudang") then
		Talk(1,"","峨嵋锦衣尼：武当侠义，名满天下，贵派道一真人和本派掌门交情不浅，咱们两派可称得上是同气连枝啊！")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","峨嵋锦衣尼：敝派与贵派素无往来，不知有何指教？")
	elseif (player_Faction == "tianren") then
		Talk(1,"","峨嵋锦衣尼：贵教一直居心叵测，依附金国，对我大宋江山图谋不轨，我们正派武林与你们誓不两立！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","峨嵋锦衣尼：贵帮人多势大，豪气冲天，本派很愿意结交你们这些朋友！")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_em = nt_getTask(1)
		if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- 入门任务中
			Talk(1,"","峨嵋锦衣尼：你已经在峨眉山叶冰痕师姐处接了本派的入门任务，但是尚未完成，你必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意。")
		elseif (UTask_em >= 70*256) and (player_Faction ~= "emei") then					--已经出师
			Say("峨嵋锦衣尼：原来是师姐，不知近来可好？",3,"地图介绍/map_help","技能说明/skill_help","不用了，多谢师姐/no")
		else
			Talk(1,"select","峨嵋锦衣尼：天下女子所创的门派中，以本派为第一。本派弟子均为女子，不仅武功高强，而且多才多艺，琴棋书画无所不精。有人说江湖是男人的世界，但是本派却能够与少林武当鼎立，因此武林中人无不敬本门弟子三分。")
		end
	end
end;

function select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- 已接了翠烟入门任务
		Talk(1,"","峨嵋锦衣尼：这位妹妹原来是想入翠烟门，人各有志，我也不便勉强了。")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_cy < 5*256) and (UTask_em < 5*256) then		--水系、未入翠烟峨嵋
		if (GetLevel() >= 10) then						--等级达到十级
			Say("峨嵋锦衣尼：加入我们峨嵋派，大家都是好姊妹，相亲相爱，处处以本派利益为重，共同将本派发扬光大。", 3, "加入峨嵋派/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Say("峨嵋锦衣尼：你的根基尚未打好，尚需一段时日的磨练，不要操之过急。先去野外练一练，到了<color=Red>十级<color>再来找我吧。", 0)		
		end
	end		-- 不是水系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(13,13)		  			--设置重生点
--	nt_setTask(1, 10*256)				-- 直接入门
	SetFaction("emei")       			--玩家加入峨嵋派
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(13)
	nt_setTask(137,61)
	SetLastFactionNumber(4)
-- 直接处理流程
	nt_setTask(1,80*256)
	SetRank(74)
	Msg2Player("欢迎你加入峨嵋派，直接学会本门所有技能。")
	add_em(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎你加入峨眉派，成为峨眉弟子，学到一叶知秋，飘雪穿云")
--	AddNote("加入峨眉派，成为峨眉弟子")
	Msg2Faction("emei",GetName().."从今日起加入峨眉派，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(13, 1898, 4978)			--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(13, 1898, 4978)			--把玩家传送到门派入口
end;

function em_check_yes()
	if (GetSeries() ~= 2) then
		Talk(1,"","峨嵋锦衣尼：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","峨嵋锦衣尼：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function em_check_no()
	Say("峨嵋锦衣尼：小师妹，又下山来玩？这次要我送你回山吗？",2,"是的，又要麻烦姐姐了/return_yes","不用了，多谢师姐/return_no")
end

function Uworld1000_jiaoyuemei()
	nt_setTask(1000,260)
	Msg2Player("峨眉派接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end

function no()
end;
