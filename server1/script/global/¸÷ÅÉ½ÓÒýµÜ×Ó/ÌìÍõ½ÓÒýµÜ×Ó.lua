-- 天王接引弟子 模板 天王将领
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )

npc_name = "天王将领"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 1 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianwang","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "emei") then				
		Talk(1,"","天王将领：敝帮帮主常常跟属下们提起贵派，对贵派掌门清晓师太一直都是十分敬慕的。")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","天王将领：女人麻烦，漂亮的女人尤其麻烦，会武功的漂亮女人更是麻烦中的麻烦，贵派的人咱可不敢招惹！")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","天王将领：学武之人应该光明磊落，我最讨厌那些使暗器、下毒药的见不得光的行径！")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","天王将领：本帮虽然不迷信任何名门正派，但是也不屑与那些使蛊下毒之徒为伍！")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","天王将领：少林功夫虽然号称武林正宗，但是我却不怎么服气，和尚好好念经才是正经，学什么人打架，实在有违清修之道。")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","天王将领：传说贵派的道一真人武功深不可测，不知什么时候有机会见到。")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","天王将领：贵派近年来发展神速，想必也不是浪得虚名，只是别把中原武林都看扁了！")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","天王将领：咱们可不和金人打什么交道！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","天王将领：贵帮与本帮号称天下两大帮，有机会咱们要好好亲近亲近。")
	elseif (player_Faction == "tianwang") then
		Say("天王将领：兄弟，要不要我送你回岛？",4,"好，多谢兄弟/return_yes", "地图介绍/map_help","技能说明/skill_help","不用了，多谢/no")
--		Say("天王将领：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/tw_check_yes","不用了/tw_check_no")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派!")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_tw = nt_getTask(3)
--		if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- 入门任务中
--			Talk(1,"","天王将领：你已经在天王岛孙道领处接了本帮的入门任务，但是尚未完成，你需要去巴陵县酒馆买到美酒“蓬莱春”")
		if (UTask_tw >= 70*256) then					--天王帮出师
			Say("天王将领：你已经在天王岛孙道领处接了本帮的入门任务，但是尚未完成，你需要去巴陵县酒馆买到美酒“蓬莱春”",3,"地图介绍/map_help","技能说明/skill_help","知道了/no")
		elseif (UTask_tw == 5*256+80) and (GetByte(nt_getTask(38),1) == 127) then		-- 天王记名完成，但是有BUG的人的修补
			Talk(1,"","天王将领：好兄弟，咱们又见面了，别来可好？有机会咱哥俩再喝一杯！")
			if (HaveMagic(29) >= 0) then		-- 学会了斩龙诀的（本门弟子），设置为已出师
				nt_setTask(3,70*256)
			else										-- 否则就清零，包括以前叛到少林的。
				nt_setTask(3,0)
			end
		else
			Talk(3, "select", "天王将领：本帮帮主杨瑛在江湖上赫赫有名，别看她是个女子，但是武艺高强，胆识过人，不让须眉，帮里的兄弟们都服她！", "本帮帮众遍布两湖，人多势大，天下无人敢小觑咱们！", "本帮既抗金兵、也反宋廷，兄弟们都是贫苦百姓出身，闯荡江湖也只是为了有条活路。哪个皇帝坐江山，跟咱们可没什么关系！")
		end
	end
end;

function select()
	UTask_tw = nt_getTask(3)
	UTask_sl = nt_getTask(7)			-- 暂时不允许重返少林再重返天王。
	if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- 已接了少林入门任务
		Talk(1,"","天王将领：兄弟原来是想入少林派，日后也欢迎来天王帮作客。")
	elseif (GetCamp() == 0) and (GetSeries() == 0) and (UTask_sl < 5*256) and (UTask_tw < 5*256) then		--金系、未入少林天王
		if (GetLevel() >= 10) then					--等级达到十级
			Say("天王将领：你加入本帮，咱们就是一家兄弟啦，大伙有福同享，有难同当，轰轰烈烈地大干一场！", 3, "加入天王帮/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","天王将领：学武之人，谁没流过血、流过汗？怕苦可不行！先出村好好练一练，打好根基到了<color=Red>十级<color>再来找我。")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(59,21)	  				--设置重生点
--	nt_setTask(3, 10*256)
	SetFaction("tianwang")       			--玩家加入天王帮
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(43)
	nt_setTask(137,63)
	SetLastFactionNumber(1)
-- 直接处理流程
	nt_setTask(3,80*256)
	SetRank(79)
	Msg2Player("欢迎你加入天王帮，直接学会本门所有技能。")
	add_tw(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入天王帮，变成天王帮弟子!")
--	Msg2Player("学到惊雷斩，回风落雁")
--	AddNote("加入天王帮，成为本帮弟子.")
	Msg2Faction("tianwang",GetName().." 从今日起加入天王帮，拜见各位，希望各位多多指教!",GetName())
	NewWorld(59,1552,3188)			--把玩家传送到门派入口
end;

function return_yes()
	NewWorld(59, 1425, 3472)			--把玩家传送到门派入口
end;

function tw_check_yes()
	if (GetSeries() ~= 0) then
		Talk(1,"","天王将领：你的五行属性不是我们金系，怎么会混到本帮来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(41) >= 0) then		-- 做完了50级任务,血战八方
		nt_setTask(3,60*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(37) >= 0) then		-- 做完了40级任务,泼风斩
		nt_setTask(3,50*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(36) >= 0) then		-- 做完了30级任务,天王战意
		nt_setTask(3,40*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(33) >= 0) then		-- 做完了20级任务,静心诀
		nt_setTask(3,30*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(23) >= 0) then		-- 做完了10级任务,天王枪法
		nt_setTask(3,20*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(3,10*256)
		Talk(1,"","天王将领：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end

function tw_check_no()
	Say("天王将领：兄弟，要不要我送你回岛？",2,"好，多谢兄弟/return_yes","不用了，多谢/return_no")
end


function Uworld1000_jiaoyutianwang()
	nt_setTask(1000,260)
	Msg2Player("天王帮接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end


function no()
end;


