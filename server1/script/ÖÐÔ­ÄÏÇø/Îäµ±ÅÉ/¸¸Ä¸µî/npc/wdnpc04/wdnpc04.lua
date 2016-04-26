--description: 武当派姚石门　武当20级任务、重返门派任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）


-- 修改后与邪教主线相关的武当派姚石门珠脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue==170) then -- 来到武当派后与姚石门的对话
		task_level40_01();
		return
	elseif (myTaskValue==209) then -- 玩家等级不够 40 级，再次回来时
		task_level40_02();
		return
	elseif (myTaskValue==210) then 
		Say("希望你能帮武林消除大难.",0);
		return
	elseif (myTaskValue==220) then
		task_level40_06();
		return 
	end
		
	
-- 新任务系统与邪教主线相关的脚本 --



	UTask_wd = GetTask(5);
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
--		为计时器错误打补丁，变量值为35、学会了武当剑法(151)、未学纯阳心法(156)的，也可以接20级任务（已取消）
--		if ((UTask_wd == 20*256) or (((UTask_wd == 35) or (UTask_wd >= 30*256)) and (HaveMagic(151) >= 0) and (HaveMagic(156) == -1))) and (GetLevel() >= 20) then
		if (UTask_wd == 20*256) and (GetLevel() >= 20) then
			Say("我自幼被师父收养，师父育我成人，教我武功，对我恩重如山。再过几日就是师父的八十华诞，我花了全部积蓄买<color=Red>天蚕道袍<color> 在襄阳，打算送给师父做礼物", 2, "帮你寻找/L20_get_yes", "我忙/L20_get_no")
		elseif (UTask_wd == 20*256+20) then
			if (HaveItem(66) == 1) then
				SetTask(5, 20*256+40)
				AddNote("返回父母殿，知道可以到襄阳见杂货铺老板做道袍.")
				Msg2Player("到襄阳见杂货铺老板做道袍.")
				Talk(2, "", "真是倒霉，道袍被红狼给咬烂了，该怎么办?", "道袍在襄阳杂货铺买的，我去<color=Red>襄阳<color> 找 <color=Red>杂货店老板<color> 想办法.")
			else
				Talk(1,"","我记得<color=Red>天蚕道袍<color> 丢失在 <color=Red>火狼洞<color>.")
			end
		elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 1) then
			L20_prise()
		elseif (UTask_wd == 20*256+40) and (HaveItem(66) == 0) then		-- 任务中物品丢失的容错处理
			AddEventItem(66)
			Msg2Player("T找到被咬烂的天蚕道袍了.")
			Talk(1,"","你说去找杂货铺老板该道袍，为什么不带道袍去?")
		elseif (UTask_wd >= 20*256+40) and (UTask_wd < 30*256) then					--已经接到20级任务，尚未完成
			Talk(2,"","没有天蚕道袍，我拿什么给师傅祝寿","我到襄阳找杂货铺老板想办法.")
		else
			Talk(1,"","我觉得师傅的武功深厚难测，我一生都难以学到.")
		end
	elseif (UTask_wd >= 70) then								--已经出师
		Talk(1,"","师傅常说，海纳百川，有容乃大，碧立天忍，无欲则刚，我想送这句话给你!")
	else
		Talk(1,"","师傅对我恩重如山，像我父母一样疼我!")
	end
end;

function L20_get_yes()
	Talk(1,"","很好，多谢，我记得<color=Red>天蚕道袍<color> 掉在 <color=Red>火狼洞<color>.")
	SetTask(5, 20*256+20)
	AddNote("见姚石门，接道袍任务，去火狼洞找天蚕道袍.")
	Msg2Player("见姚石门，接道袍任务，去火狼洞找天蚕道袍.")
end;

function L20_get_no()
	Talk(1,"","我一个人去找!.")
end;

function L20_prise()
	Talk(1,"","果然修好了，太好了，感谢!")
	DelItem(68)
	SetRank(9)
	SetTask(5, 30*256)
--	AddMagic(159)
	add_wd(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你，你升为清修道人，学到七精阵!")
	AddNote("返回父母殿，带天蚕道袍给姚石门，完成道袍任务，被封为清修道人.")
end;
