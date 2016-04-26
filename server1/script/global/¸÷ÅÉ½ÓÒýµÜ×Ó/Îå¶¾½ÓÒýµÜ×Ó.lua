-- 各门派接引弟子脚本　五毒
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "五毒散人"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 3 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudu","你已是本门弟子，不需要去，可以直接和龙儿见面说.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","五毒散人：小美人，来看你哥哥我吗？来来香一个。")
	elseif (player_Faction == "emei") then				
		Talk(1,"","五毒散人：臭尼姑？真倒霉，呸呸呸，大吉大利大吉大利。")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","五毒散人：别以为你们的飞刀有什么了不起的，我们的盅毒之术才是真正的无影无形，防不胜防！")
	elseif (player_Faction == "wudu") then
		Say("五毒散人：听说山上又来了一批俊男美女，是不是急着回去看看啊？嘿嘿嘿！",4,"哈哈，麻烦送我一程/return_yes","地图介绍/map_help","技能说明/skill_help","不用，也不急在一时/no")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","五毒散人：和大金国作对是没什么好处的，有朝一日大金国平定中原你们就该知道后悔了。")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","五毒散人：少林的贼秃们，别以为你们装出一付老实样我们就会信你，谁不知道你们身处大金心怀南朝。只要让我们抓到你们把柄了，哼哼哼！")
	elseif (player_Faction == "wudang") then
		Talk(1,"","五毒散人：怎么，武当的大侠们又想指教在下？这次恐怕不会让你们如意了！")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","五毒散人：削尖脑袋想往正派倒的投机分子，睁大你们的眼睛瞧瞧清楚，大金国和我们才是天下大势所趋，不要搞错了！")
	elseif (player_Faction == "tianren") then
		Talk(1,"","五毒散人：你我两教联盟，正成南北夹击，里应外合之势，这花花江山还不唾手可得？哈哈哈哈！")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","五毒散人：臭叫花子，滚开，别碰脏了大爷我的衣服！")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","你已学会野球拳!不能再入门派!")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_wu = nt_getTask(10)
--		if (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_wu < 5*256) and (nt_getTask(2) == 70*256) then		-- 转门派任务启动
--			Say("五毒散人：你唐门暗器怎及我毒药盅术之吵，何况唐仇傲慢不群，无礼当洒脱，将来定会被大金铁骑教训。你不如趁早改投我教，将来大金平定中原之时还可分一杯羹。",2,"散人之言有理，我想改投五毒教/defection_get","懒得理你/no")
		if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- 入门任务中
			Talk(1,"","五毒散人：只要通过了本派的入门考验，你就可以光荣地成为我们的一员啦。哈哈！")
		elseif (UTask_wu >= 70*256) and (player_Faction ~= "wudu") then					--已经出师
			Talk(1,"","五毒散人：好久不见了，看起来你最近混得不错嘛。")
		else
			Talk(1,"enroll_select","五毒散人：五毒教近来才在武林中兴起，组织严密。本教已与金国国教天忍教结成联盟，将来金国统一中原即可同享宝贵了。哈哈哈哈！")
		end
	end
end;

function defection_get()
	Talk(1,"","五毒散人：哈哈哈哈，果然是识时务者！你只要去向唐仇老儿说脱离唐门，然后再向本教教主黑面郎君禀报，就可加入五毒教了。")
	nt_setTask(10,5*256+10)
	Msg2Player("想要转投五毒教，只要向唐仇请求，再去向五毒教主黑面郎君禀报即可。")
	AddNote("想要转投五毒教，只要向唐仇请求，再去向五毒教主黑面郎君禀报即可。")
end

function enroll_select()
	UTask_wu = nt_getTask(10)
	UTask_tm = nt_getTask(2)
	if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- 已接了唐门入门任务
		Talk(1,"","五毒散人：唐门那种不入流的门派也有人想进。唉，浪费了半天口水。")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_tm < 5*256) and (UTask_wu < 5*256) then		--木系、未入唐门五毒
		if (GetLevel() >= 10) then						--等级达到十级
			Say("五毒散人：怎样，想不想加入本教？", 3, "加入五毒教/go", "我再想想/no","了解各门武艺精华/Uworld1000_knowmagic")
		else
			Talk(1,"","五毒散人：你现在还一点基础都没有，贸贸然入教天天和盅毒为伴那不是找死吗。你先去练到十级再说吧。")
		end
	end		-- 不是木系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(183,70)		  			--设置重生点
--	nt_setTask(10,10*256)				-- 直接入门
	SetFaction("wudu")       			--玩家加入峨嵋派
	SetCamp(2)
	SetCurCamp(2)
--	SetRank(49)
	nt_setTask(137,70)
	SetLastFactionNumber(3)
-- 直接处理流程
	nt_setTask(10,80*256)
	SetRank(80)
	Msg2Player("欢迎你加入五毒教，直接学会本门所有技能。")
	add_wu(90)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
--	Msg2Player("欢迎加入五毒教，成为五毒童子，学到毒砂掌，血刀毒杀.")
--	AddNote("加入五毒教，成为五毒童子.")
	Msg2Faction("wudu",GetName().."今日加入五毒教，拜见各位兄长，希望各位多多指教!",GetName())
	NewWorld(183, 1746, 2673)			--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(183, 1746, 2673)			--把玩家传送到门派入口
end;

function wu_check_yes()					-- 按技能确定任务变量的检查。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","五毒散人：你的五行属性不是我们水系，怎么会混到本门来的？先去问一下游戏管理员吧。")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你现在可以去接出师任务。")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你已经完成了40级任务。")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你已经完成了30级任务。")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你已经完成了20级任务。")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你已经完成了10级任务。")
	else
		nt_setTask(1,10*256)
		Talk(1,"","五毒散人：我已经把你的任务状态重新整理过了。你现在可以去接10级任务。")
	end
end;

function em_check_no()
	Say("五毒散人：听说山上又来了一批俊男美女，是不是急着回去看看啊？嘿嘿嘿！",2,"哈哈，麻烦送我一程/return_yes","不用，也不急在一时/no")
end

function Uworld1000_jiaoyuwudu()
	nt_setTask(1000,260)
	Msg2Player("五毒接引弟子说已是门派弟子，你可以直接去见龙儿说话.")
end

function no()
end;
