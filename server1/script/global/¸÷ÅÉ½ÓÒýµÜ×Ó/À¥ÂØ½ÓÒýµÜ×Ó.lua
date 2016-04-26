-- 各门派接引弟子脚本　昆仑
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "昆仑护法"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 9 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyukunlun","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","昆仑护法：好美的小妞！果然不是西北苦寒之地所能比拟，唉！")
	elseif (player_Faction == "emei") then				
		Talk(1,"","昆仑护法：女流之辈就该在家相夫教子，出来舞刀弄枪的成何体统。真是世风日下啊！")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","昆仑护法：唐门暗器，微末之技，怎与我们道法天尊亲传咒术相比！")
	elseif (player_Faction == "wudu") then
		Talk(1,"","昆仑护法：呔！邪麽外道也敢出来现世，看道爷我不把你们总舵挑了！")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","昆仑护法：天王帮虽然现在是红红火火，但由一女流带领，总有一天会把这份基业给断送了。")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","昆仑护法：都说少林武学正宗，可惜却是舶来之物，不象我昆仑天师道术，中华正宗武技。")
	elseif (player_Faction == "wudang") then
		Talk(1,"","昆仑护法：贵我两派同属道宗，又都擅长剑法，什么咱们比划比划，排个高低强弱出来。")
	elseif (player_Faction == "kunlun") then
		Say("面的花花世界果然比西北苦寒之地好多了吧，要不要回去了？",4,"回了，多谢道兄。/return_yes","地图介绍/map_help","技能说明/skill_help","这么好玩的地方，急着回去干嘛？/no")
	elseif (player_Faction == "tianren") then
		Talk(1,"","昆仑护法：灭绝金狗正是我辈本份，来来来吃道爷一剑！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","昆仑护法：一帮叫花子，就算声势再大也只是乌合之众，终究成不了什么气候。")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳,不能再入门派! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_kl = nt_getTask(9)
--		if (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_kl < 5*256) and (nt_getTask(5) == 70*256) then		-- 转门派任务启动
--			Say("昆仑护法：跟着道一老儿有什么好混的嘛，道一那老家伙四岁才会说话，七岁还尿裤子，你想你跟着他有什么前途！不如来我们昆仑派算了，象哥哥我这样仙风道骨，难道你不羡慕吗？",2,"嗯...可以考虑/defection_get","造谣诽谤，招摇撞骗之徒，我呸！/no")
		if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- 入门任务中
			Talk(1,"","昆仑护法：本派非等闲能入，你先好好把入门任务完成了再说吧。")
		elseif (UTask_kl >= 70*256) and (player_Faction ~= "kunlun") then					--已经出师
			Say("昆仑护法：听说你下山后很是风光快意啊，有没有想到我们师弟师妹啊？",3,"地图介绍/map_help","技能说明/skill_help","这么好玩的地方，急着回去干嘛？/no")
		else
			Talk(1,"enroll_select","昆仑护法：昆仑派远处西域，很少履及中原。在几代得力掌门的不断努力下，本派不断壮大，渐渐成为江湖上一大门派，雄据西域，与中原各大门派分庭抗礼。")
		end
	end
end;

function defection_get()
	Talk(1,"","昆仑护法：就是啊，看你真是醒目，赶紧去向道一老儿说你不干了，再向我派璇玑掌门禀报就可以了。")
	nt_setTask(9,5*256+10)
	Msg2Player("想要转投昆仑派，只要向武当派道一真人请求，再去向昆仑派璇玑子禀报。")
	AddNote("想要转投昆仑派，只要向武当派道一真人请求，再去向昆仑派璇玑子禀报。")
end

function enroll_select()
	UTask_kl = nt_getTask(9)
	UTask_wd = nt_getTask(5)
	if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- 已接了武当入门任务
		Talk(1,"","昆仑护法：原来你想入武当，也罢也罢，中原人士就是喜欢迷信名门大派。")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_wd < 5*256) and (UTask_kl < 5*256) then		--水系、未入武当昆仑
		if (GetLevel() >= 10) then						--等级达到十级
			Say("昆仑护法：本门擅长仙咒道术，比武当气功剑法胜出不止一筹。如何，要加入本派吗？", 3, "加入昆仑派/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","昆仑护法：本派不招无用之人，你的根基尚未打好，等到了十级再来吧。")
		end
	end		-- 不是土系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(131,57)		  				-- 等待提供重生点
--	nt_setTask(9,10*256)						-- 直接入门
	SetFaction("kunlun")      			-- 玩家加入昆仑
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(19)
	nt_setTask(137,69)
	SetLastFactionNumber(9)
-- 直接处理流程
	nt_setTask(9,80*256)
	SetRank(75)
	Msg2Player("欢迎你加入武当派，直接学会本门所有技能。")
	add_kl(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入昆仑派，成为佛尘弟子，学到护风法，狂雷震地")
--	AddNote("加入昆仑派，成为佛尘弟子?.")
	Msg2Faction("kunlun",GetName().."从今日去加入昆仑派，拜见各位师祖，希望各位关心指教!",GetName())
	NewWorld(131, 1582, 3175)			-- 等待提供坐标

end;

function return_yes()
	NewWorld(131, 1582, 3175)			--把玩家传送到门派入口
end;

function kl_check_yes()			-- 按技能确定任务变量的检查。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","昆仑护法：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","昆仑护法：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function em_check_no()
	Say("昆仑护法：外面的花花世界果然比西北苦寒之地好多了吧，要不要回去了？",2,"回了，多谢道兄。/return_yes","这么好玩的地方，急着回去干嘛？/no")
end

function Uworld1000_jiaoyukunlun()
	nt_setTask(1000,260)
	Msg2Player("昆仑派接引弟子说不用去了，你可以直接去见龙儿说话")
end

function no()
end;
