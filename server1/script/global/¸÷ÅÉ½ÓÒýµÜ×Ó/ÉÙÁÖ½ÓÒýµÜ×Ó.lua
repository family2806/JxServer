-- 各门派接引弟子脚本　少林
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "少林罗汉"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 0 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyushaolin","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","少林罗汉：贵门以舞入武，在武学之道上另开蹊径，真神乎其技也。小僧此厢有礼了。")
	elseif (player_Faction == "emei") then				
		Talk(1,"","少林罗汉：贵派清晓师太佛学精深，武艺高明，小僧名闻已久了。")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","少林罗汉：久闻蜀中唐门化暗器为明器，将暗器上的功夫练得出神入化，文丈大师提起时也都佩服得紧。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","少林罗汉：贵派功夫过于阴毒狠辣，有违天和，贫僧斗胆劝你们多多修习佛经禅理，紧记慈爱祥和，化解戾气方是。")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","少林罗汉：贵帮处处与金兵针锋相对，听闻金国正在调兵遣将对付贵帮，请各位多加小心。")
	elseif (player_Faction == "shaolin") then
		Say("少林罗汉：师弟，师父又遣你下山办事？",4,"是，请师兄送我回山/return_yes","地图介绍/map_help","技能说明/skill_help","是的，替我向师父问安/no")
	elseif (player_Faction == "wudang") then
		Talk(1,"","少林罗汉：请转告贵派道一真人座上，敝派方丈以下，各位首座都盼着与贵派各位再聚，共叙武学真谛。")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","少林罗汉：贵派武学过于求成，锋芒太过必招嫉恨。行走江湖，这可是大忌啊。阿弥陀佛！")
	elseif (player_Faction == "tianren") then
		Talk(1,"","少林罗汉：贵教虽受金国庇护，但江湖自有江湖规则，并不是成为金国国教就可无所忌惮了。")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","少林罗汉：贵帮在何帮主带领下蒸蒸日上，成为中原武林中抗金的主力中坚，不愧我辈楷模。")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_sl = nt_getTask(7)
--		if (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_sl < 5*256) and (nt_getTask(3) == 70*256) then		-- 转门派任务启动
--			Say("少林罗汉：天下武功出少林，本派武功名门正宗，本寺七千弟子皆引以为傲。",2,"我想改投贵派学艺/defection_get","没兴趣/defection_no")
		if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- 入门任务中
			Talk(1,"","少林罗汉：师兄所给你的入门任务是考验锻炼你的心志毅力，只要将之完成就可以进入本寺了。")
		elseif (UTask_sl >= 70*256) and (player_Faction ~= "shaolin") then					--已经出师
			Say("少林罗汉：原来是出师师兄，不知近来可好？",3,"地图介绍/map_help","技能说明/skill_help","是的，替我向师父问安/no")
		else
			Talk(1,"enroll_select","少林罗汉：少林派素来被称为武林第一门派，号称中原武林的泰山北斗。少林寺僧众习武源远流长，以“少林七十二绝技”名闻天下。")
		end
	end
end;

function defection_get()
	Talk(1,"","少林罗汉：阿弥陀佛，你只要去向贵帮杨帮主请求脱离天王帮，再向敝寺玄因方丈禀报，就可加入敝寺了。")
	nt_setTask(7,5*256+10)
	Msg2Player("想要转投少林派，只要向天王帮杨帮主请求，再去向少林派玄因方丈禀报即可。")
	AddNote("想要转投少林派，只要向天王帮杨帮主请求，再去向少林派玄因方丈禀报即可。")
end

function defection_no()
	Talk(1,"","玩家：本帮武功自成一格，也未必便输于少林。我还是宁愿忠于杨帮主。")
end

function enroll_select()
	UTask_sl = nt_getTask(7)
	UTask_tw = nt_getTask(3)
	if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- 已接了入门任务
		Talk(1,"","少林罗汉：天王帮正红红火火，又不象本寺正处于金国领地危险之境，你作此选择也未尝不好。")
	elseif (GetSeries() == 0) and (GetCamp() == 0) and (UTask_tw < 5*256) and (UTask_sl < 5*256) then		--金系、未入天王少林
		if ((GetLevel() >= 10) and (HaveMagic(29) == -1)) then						--等级达到十级（并且没学过“斩龙决”）
			Say("少林罗汉：本寺为中原各大名门正派之首，你是否也想加入本寺？", 3, "加入少林派/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","少林罗汉：你的根基尚未打好，不宜过早修炼本派绝学，不如你先去打好基础，到了十级再来找小僧。")
		end
	end		-- 不是金系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(103,51)		  			--设置重生点
--	nt_setTask(7,10*256)				-- 直接入门
	SetFaction("shaolin")       			--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(1)
	nt_setTask(137,67)
	SetLastFactionNumber(0)
-- 直接处理流程
	nt_setTask(7,80*256)
	SetRank(72)
	Msg2Player("欢迎你加入少林派，直接学会本门所有技能。")
	add_sl(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎你加入少林派，成为扫地僧，学到降龙武功，金刚伏魔")
--	AddNote("加入少林派，成为扫地僧.")
	Msg2Faction("shaolin",GetName().."从今日去加入少林，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(103, 1845, 2983)			--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(103, 1845, 2983)			--把玩家传送到门派入口
end;

function sl_check_yes()			-- 按技能确定任务变量的检查。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","少林罗汉：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","少林罗汉：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function em_check_no()
	Say("少林罗汉：师弟，师父又遣你下山办事？",2,"是，请师兄送我回山/return_yes","是的，替我向师父问安/no")
end

function Uworld1000_jiaoyushaolin()
	nt_setTask(1000,260)
	Msg2Player("少林派接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end

function no()
end;
