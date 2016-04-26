-- 各门派接引弟子脚本　翠烟门
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "翠烟花使"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 5 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyucuiyan","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "cuiyan") then		-- 本门
		Say("翠烟花使：妹妹又偷偷溜出来玩了？",4,"嗯，麻烦姐姐送我回去/return_yes","地图介绍/map_help","技能说明/skill_help","姐姐装作没看到我就行了啦/no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","翠烟花使：如花般的女子，偏要日日面对青灯古佛。我最不喜欢你们就是这一点。")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","翠烟花使：贵我两派联姻在即，不必再分彼此，实乃天大喜事。")
	elseif (player_Faction == "wudu") then
		Talk(1,"","翠烟花使：我最讨厌偷偷下毒害人的下三滥！啊，抱歉，我不是说你啊。")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","翠烟花使：你们帮中杨湖有负我家何姐姐，哼，天下男人果然没一个好东西！")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","翠烟花使：我是不想当着和尚骂秃驴啦，不过大和尚你没事找我搭讪干什么？")
	elseif (player_Faction == "wudang") then
		Talk(1,"","翠烟花使：贵派以侠义自居，却不知单思南总是象赖皮狗一般粘着我们嫣师姐是哪门子侠义？")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","翠烟花使：久仰昆仑派迅速堀起风头强劲，原来贵派同门练功是真刀真枪性命相博，当真难能可贵，小女子自叹弗如呀！")
	elseif (player_Faction == "tianren") then
		Talk(1,"","翠烟花使：谁做皇帝是不关我的事，但你们残杀无辜荼毒生灵本姑娘就是瞧不顺眼！")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","翠烟花使：大侠！不要过来！！","翠烟花使：啊！！！跳蚤！！！！")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_cy = nt_getTask(6)
--		if (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_cy < 5*256) and (nt_getTask(1) == 70*256) then		-- 转门派任务启动
--			Say("翠烟花使：如花般的女子，偏要日日面对青灯古佛，何必呢。哪象我们翠烟门下，天天欢声笑语，那才是我们真正应该拥有的日子呀。",2,"有道理，那么我想改投翠烟该怎么办呢？/defection_get","青灯古佛本我所愿，姐姐不必多言/no")
		if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- 入门任务中
			Talk(1,"","翠烟花使：你已经在师妹那里接了入门任务，但是尚未完成，你通过花魁阵的考验之后就是同门姐妹了。")
		elseif (UTask_cy >= 70*256) and (player_Faction ~= "cuiyan") then					--已经出师
			Say("翠烟花使：姐姐为什么要出师嘛，“含翠凝烟笑牡丹”不是更逍遥自在吗？",3,"地图介绍/map_help","技能说明/skill_help","姐姐装作没看到我就行了啦/no")
		else
			Talk(1,"enroll_select","翠烟花使：我们翠烟门虽然全为女子，但本门武功以“轻、快、奇、美”而名动江湖，姐妹齐心，江湖中也无人敢小瞧咱们。")
		end
	end
end;

function defection_get()
	Talk(1,"","翠烟花使：很简单，你只要去向贵派清晓师太请求转到翠烟门来，然后再向本门尹含烟掌门禀报就可以了。放心，清晓师太通情达理，不会难为你的。")
	nt_setTask(6,5*256+10)
	Msg2Player("想要转投翠烟门，只要向峨嵋清晓师太请求，然后去向翠烟尹含烟掌门禀报即可。")
	AddNote("想要转投翠烟门，只要向峨嵋清晓师太请求，然后去向翠烟尹含烟掌门禀报即可。")
end

function enroll_select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- 已接了翠烟入门任务
		Talk(1,"","翠烟花使：又一位好姐妹要去长伴木鱼青灯，真是可惜可叹！")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_em < 5*256) and (UTask_cy < 5*256) then		--水系、未入峨嵋翠烟
		if (GetLevel() >= 10) then						--等级达到十级
			Say("翠烟花使：妹妹想不想加入我们翠烟门？", 3, "加入翠烟门/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","翠烟花使：你先把根基打一打，到了<color=Red>十级<color>我们一起做好姐妹吧。")
		end
	end		-- 不是水系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(154,61)		  				-- 重生点
--	nt_setTask(6,10*256)						-- 直接入门
	SetFaction("cuiyan")      			--玩家加入峨嵋派
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(31)
	nt_setTask(137,66)
	SetLastFactionNumber(5)
-- 直接处理流程
	nt_setTask(6,80*256)
	SetRank(77)
	Msg2Player("欢迎你加入翠烟门，直接学会本门所有技能。")
	add_cy(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎您加入翠烟门派变成花子，学到风花雪月，风卷残月")
--	AddNote("加入翠烟门派，成为花子")
	Msg2Faction("cuiyan",GetName().."从今天加入翠烟门派，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(154, 403, 1361)			-- 传到门派中

end;

function return_yes()
	NewWorld(154, 403, 1361)			-- 传到门派中
end;

function cy_check_yes()					-- 由峨嵋改来。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","翠烟花使：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","翠烟花使：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function cy_check_no()
	Say("翠烟花使：妹妹又偷偷溜出来玩了？",2,"嗯，麻烦姐姐送我回去/return_yes","姐姐装作没看到我就行了啦/no")
end

function Uworld1000_jiaoyucuiyan()
	nt_setTask(1000,260)
	Msg2Player("翠烟门接引弟子说你可以直接去见龙儿说话.")
end

function no()
end;
