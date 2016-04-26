-- 唐门接引弟子 模板 唐门侍卫
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "唐门侍卫"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 2 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutangmen","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "tangmen") then
		Say("唐门侍卫：门主派你来是有什么吩咐吗？",4,"我想请你送我回去/return_yes","地图介绍/map_help","技能说明/skill_help","没有，我出来办其它事情/no")
--		Say("唐门侍卫：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/tm_check_yes","不用了/tm_check_no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","唐门侍卫：贵派对本门一直颇有微词，咱们两派虽然同在蜀地，却从来没有交往。")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","唐门侍卫：本门行事虽然不拘常规，但是也不会欺负弱质女子。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","唐门侍卫：你是五毒教的人吗？本门与贵教素无来往，不知有何贵干？虽然听说贵教使毒下蛊的手段天下一流，但是本门却不怕，倘若贵教有什么企图，恐怕在本门的暗器底下也讨不了好去！")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","唐门侍卫：贵帮远在洞庭，与本门好像没有什么交情吧？")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","唐门侍卫：本门从不与那些所谓的名门正派交往。")
	elseif (player_Faction == "wudang") then
		Talk(1,"","唐门侍卫：本门从不与那些所谓的名门正派交往。")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","唐门侍卫：有何指教？")
	elseif (player_Faction == "tianren") then
		Talk(1,"","唐门侍卫：你我既不是朋友，也不是敌人，不必套什么近乎！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","唐门侍卫：想不到一群叫化子也能闯出一番天地，本门还是很佩服的。")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派!")
	else
		UTask_tm = nt_getTask(2)
		if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- 入门任务中
			Talk(1,"","唐门侍卫：你已经在竹海三关接了本门的入门任务，但是尚未完成，你必须拿到青、紫、白三柄竹杖，然后交给出口的同门。")
		elseif (UTask_tm >= 70) and (GetFaction() ~= "tangmen") then					--已经出师
			Say("门侍卫：好久不见，出师以后有何奇遇啊，说来听听？",3,"地图介绍/map_help","技能说明/skill_help","没有，我出来办其它事情/no")
		else
			Talk(2, "select", "唐门侍卫：本门雄踞川蜀，凭借暗器和火器独步武林，饮誉江湖达数百年之久。江湖中人谈本门而色变，可见本门的厉害！", "什么武林正道、民族大义，全都是狗屁！咱们只按照自己的牌理出牌，既不愿与那些所谓的名门正派结交，也不屑与邪魔歪道为伍。想加入本门可不是一件容易的事，存心不良的人咱们可不要！")
		end
	end
end;

function select()
	UTask_tm = nt_getTask(2)
	UTask_wu = nt_getTask(10)
	if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- 已接了五毒入门任务
		Talk(1,"","唐门侍卫：大好才华，却想入五毒教，着实可惜可叹。")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_wu < 5*256) and (UTask_tm < 5*256) then		--木系、未入五毒唐门
		if (GetLevel() >= 10) then						--等级达到十级
			Say("唐门侍卫：本门暗器功夫天下闻名，对机关陷阱也深有研究，你不想在这些方面一试身手吗？但是要记住，千万不可泄漏本门秘技！", 3, "加入唐门/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","唐门侍卫：你的基础这么差，入了本门也难以有所作为，先去自己磨练磨练，到了<color=Red>十级<color>以后再来找我吧！")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(25,15)	 				--设置重生点
--	nt_setTask(2, 10*256)
	SetFaction("tangmen")      				--玩家加入唐门
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(25)
	nt_setTask(137,62)
	SetLastFactionNumber(2)
-- 直接处理流程
	nt_setTask(2,80*256)
	SetRank(76)
	Msg2Player("欢迎你加入唐门，直接学会本门所有技能。")
	add_tm(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入唐门，成为杂役，学到功积历丹")
--	AddNote("加入唐门，成为杂役.")
	Msg2Faction("tangmen",GetName().."从今日起加入唐门，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(25, 3982, 5235)				--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(25, 3982, 5235)			--把玩家传送到门派入口
end;

function tm_check_yes()
	if (GetSeries() ~= 1) then
		Talk(1,"","唐门侍卫：你的五行属性不是我们木系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(58) >= 0) then		-- 做完了50级任务,天罗地网
		nt_setTask(2,60*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(54) >= 0) then		-- 做完了40级任务,漫天花雨
		nt_setTask(2,50*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(50) >= 0) then		-- 做完了30级任务,追心箭
		nt_setTask(2,40*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(47) >= 0) then		-- 做完了20级任务,夺魂镖
		nt_setTask(2,30*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(43) >= 0) then		-- 做完了10级任务,唐门暗器
		nt_setTask(2,20*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(2,10*256)
		Talk(1,"","唐门侍卫：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function tm_check_no()
	Say("唐门侍卫：门主派你来是有什么吩咐吗？",2,"我想请你送我回去/return_yes","没有，我出来办其它事情/return_no")
end

function Uworld1000_jiaoyutangmen()
	nt_setTask(1000,260)
	Msg2Player("唐门派接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end

function no()
end;
