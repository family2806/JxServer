-- 各门派接引弟子脚本　丐帮
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "丐帮三袋弟子"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 6 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyugaibang","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","丐帮三袋弟子：久闻翠烟门下姑娘美丽又善良，这位姑娘是来打赏叫化子几个酒钱吗？")
	elseif (player_Faction == "emei") then				
		Talk(1,"","丐帮三袋弟子：叫花子对峨嵋武功奇术敬仰已久，今日得见，侠骨柔肠，仁心仁术果然名不虚传。")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","丐帮三袋弟子：唐门暗器虽然闻者色变，但终究是小巧功夫，其实贵门刀法不弱，在那上面下功夫也未必逊于他人。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","丐帮三袋弟子：自古正邪不两立，蛊毒之术也敢张狂！")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","丐帮三袋弟子：本帮与贵帮合称天下两天帮，咱哥儿俩也该好好亲近亲近。哈哈！")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","丐帮三袋弟子：贵派为中华武术之源，今日在金国凶境仍然屹立不倒，叫花子着实佩服得紧。")
	elseif (player_Faction == "wudang") then
		Talk(1,"","丐帮三袋弟子：武当诸侠名满天下，不愧我辈楷模。请代叫花子向道一真人与各位道长向候。")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","丐帮三袋弟子：原来是新近堀起的昆仑派高徒，难怪如此气势凌人。")
	elseif (player_Faction == "tianren") then
		Talk(1,"","丐帮三袋弟子：虽是各为其主，但丐帮天忍既为死敌，咱们也不必多言，来日沙场再见吧。")
	elseif (player_Faction == "gaibang") then				-- 本门
		Say("丐帮三袋弟子：有什么要我转告帮主的，还是要我送你回总舵？",4,"麻烦送我回去/return_yes","地图介绍/map_help","技能说明/skill_help","请向帮主问候，弟子一切安好/no")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派!")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_gb = nt_getTask(8)
--		if (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_gb < 5*256) and (nt_getTask(4) == 70*256) then		-- 转门派任务启动
--			Say("丐帮三袋弟子：身为大宋儿女，却认贼作父为天忍效力，你羞也不羞？还不快弃暗投明用实际行动来证明你拳拳赤子心？",2,"是，请给我机会加入丐帮为大宋出力/defection_get","没兴趣/defection_no")
		if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- 入门任务中
			Talk(1,"","丐帮三袋弟子：你正在进行的入门任务是在扬州城，拖得太久了可不太好。")
		elseif (UTask_gb >= 70*256) and (player_Faction ~= "gaibang") then					--已经出师
			Say("帮三袋弟子：许久不见，大家伙儿都怪想念的，不知近来可好？",3,"地图介绍/map_help","技能说明/skill_help","请向帮主问候，弟子一切安好/no")
		else
			Talk(1,"enroll_select","丐帮三袋弟子：本帮有天下第一帮的称号，名扬江湖，百年不衰，帮中卧虎藏龙，人材辈出。")
		end
	end
end;

function defection_get()
	Talk(1,"","丐帮三袋弟子：既然你有悔改之意，那么只要向天忍完颜洪烈请求离教，然后再来找我们何人我帮主禀明即可。")
	nt_setTask(8,5*256+10)
	Msg2Player("想要转投丐帮，只要向天忍教教主请求离教，再去向丐帮何人我帮主禀明情况即可。")
	AddNote("想要转投丐帮，只要向天忍教教主请求离教，再去向丐帮何人我帮主禀明情况即可。")
end

function defection_no()
	Talk(1,"","玩家：向来成王败寇，哪有那么多对错之分，何况那无聊的汉夷之防更是落入了下乘。丐帮尽出你这种人材，看来不去也罢。")
end

function enroll_select()
	UTask_gb = nt_getTask(8)
	UTask_tr = nt_getTask(4)
	if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- 已接了天忍入门任务
		Talk(1,"","丐帮三袋弟子：本帮与天忍是死敌，既然你想入天忍，那我也没什么可说的了。")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_tr < 5*256) and (UTask_gb < 5*256) then		--火系、未入天忍丐帮
		if (GetLevel() >= 10) then						--等级达到十级
			Say("丐帮三袋弟子：有没有兴趣加入丐帮，大家有饭一起吃，有酒一起喝！", 3, "加入丐帮/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","丐帮三袋弟子：你的根基尚未打好，过早入帮对你有害无利，不如先去把根基打好一点，到了十级再来找我吧。")
		end
	end		-- 不是火系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(115,53)		  			--等待提供重生点
--	nt_setTask(8, 10*256)				-- 直接入门
	SetFaction("gaibang")       			--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(37)
	nt_setTask(137,68)
	SetLastFactionNumber(6)
-- 直接处理流程
	nt_setTask(8,80*256)
	SetRank(78)
	Msg2Player("欢迎你加入丐帮，直接学会本门所有技能。")
	add_gb(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入丐帮，成为无袋弟子，学到本门技能")
--	AddNote("加入丐帮，成为无袋弟子.")
	Msg2Faction("gaibang",GetName().."今天加入丐帮，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(115, 1501, 3672)			--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(115, 1501, 3672)			--把玩家传送到门派入口
end;

function gb_check_yes()			-- 按技能确定任务变量的检查。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","丐帮三袋弟子：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","丐帮三袋弟子：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function gb_check_no()
	Say("丐帮三袋弟子：有什么要我转告帮主的，还是要我送你回总舵？",2,"麻烦送我回去/return_yes","请向帮主问候，弟子一切安好/no")
end

function Uworld1000_jiaoyugaibang()
	nt_setTask(1000,260)
	Msg2Player("你已是丐帮弟子，不用去了，你可以直接去见龙儿说话.")
end

function no()
end;
