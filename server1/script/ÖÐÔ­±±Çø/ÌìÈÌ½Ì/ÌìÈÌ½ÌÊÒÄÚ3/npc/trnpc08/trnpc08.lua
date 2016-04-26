--description: 天忍教左护法端木睿
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

-- 与新任务系统相关修改过后的端木睿脚本
-- Edited by peres
-- 2005/01/20

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\item\\skillbook.lua")

Include("\\script\\global\\skills_table.lua")

function main()

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==360) then
		task_level60_01();
		return
	end


-- 新任务系统与邪教主线相关的脚本 --

	UTask_tr = GetTask(4)
	Uworld123 = GetTask(123)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 50*256) and (GetLevel() >= 50) then
			Say("<color=Red>星坛坛主凤翕如<color>被宋兵抓去，关押在<color=Red>汴京<color>的一座<color=Red>铁塔<color>里面，如果宋兵从他口中逼问出什么秘密，将对本教大业十分不利，因此不论死活，你都要把凤翕如救出来。", 2, "属下遵命/yes", "属下恐难当此大任/no")
		elseif (UTask_tr == 50*256+50) then 
			L50_prise()
		elseif (UTask_tr > 50*256) and (UTask_tr < 50*256+50) then					--已经接到50级任务，尚未完成
			Talk(1,"","<color=Red>汴京铁塔<color> 关押 <color=Red>凤翕如<color> 有<color=Red>三道机关<color>, 打开全部机关即可救出凤翕如，记住，不论死活，都绝不能让凤翕如落在宋人手里!")
		else							--已经完成50级任务，尚未出师（缺省对话）
			Skill150Dialog("新人在教内经常有，胜败是不可行")
		end
	elseif (Uworld123 == 60) and (HaveItem(377) == 1) then			-- 唐不染“嫁祸一尘”任务
		if (GetTask(2) >= 70*256) and (GetTask(2) ~= 75*256) then			-- 唐门弟子或唐门出师的才能学到技能
			Talk(11,"Uworld123_step4a","等这么久，唐门秘籍果然不辜负我!","啊，果然是不难，遗憾的是天下没人想到.","端木先生，你看可以明白唐门秘籍里的武功吗？","秘籍写的太明白了，有什么不明白?","真是不敢隐瞒，我前后看很少书，因此不懂.","既然如此，有什么不懂就问我.","............","...............?","............","...............?")
		else
			Talk(1,"Uworld123_step4b","等这么久，唐门秘籍果然不辜负我!")
		end
	elseif (UTask_tr >= 70*256) then							--已经出师
		Skill150Dialog("成就大事者，需不拘小节，倘若做什么事都瞻前顾后、畏首畏尾，那就什么也做不成了!")
	else
		Skill150Dialog("武功本无正邪，只有强弱。江湖之事，能者为之，天下之势，强者掌之.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("天忍", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function yes()
	Talk(1,"","<color=Red>汴京铁塔<color> 关押 <color=Red>凤翕如<color> 有<color=Red>三道机关<color>, 打开全部机关即可救出凤翕如，记住，不论死活，都绝不能让凤翕如落在宋人手里!")
	SetTask(4, 50*256+20)
	Msg2Player("见左护法端木睿，接救人任务，到汴京铁塔救凤翕如 ")
	AddNote("见左护法端木睿，接救人任务，到汴京铁塔救凤翕如")
end;

function no()
	Talk(1,"","你身为本教掌旗使，连这点小事也做不了，如何服众?")
end;

function L50_prise()
	Talk(1,"","你虽然是新弟子，但是可以担当重任，本教很需要像你一样的人，我会和教主说，给你册封.")
	SetRank(60)
	SetTask(4, 60*256)
	SetTask(21,0)		--用完后就将辅助变量清零，便于今后重复利用
--	AddMagic(143)
	add_tr(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你被册封为天忍教护教使.")
	AddNote("回天忍教见左护法端木睿复命，完成救人任务，升为护教使")
end;

function Uworld123_step4a()
	DelItem(377)
	if (HaveMagic(339) == -1) then		-- 必须没有技能的才给技能
		AddMagic(339,1)
	end
	if (HaveMagic(302) == -1) then		-- 必须没有技能的才给技能
		AddMagic(302,1)
	end
	if (HaveMagic(342) == -1) then		-- 必须没有技能的才给技能
		AddMagic(342,1)
	end
	if (HaveMagic(351) == -1) then		-- 必须没有技能的才给技能
		AddMagic(351)
	end
	CheckIsCanGet150SkillTask()
	Msg2Player("你学到摄魂月影，暴雨梨花，九宫飞星!")
	Msg2Player("端木睿继续请你去给唐不染报信.")
	SetTask(123,75)
	Talk(2,"","麻烦你传话给不染公子，说端木睿不会让他失望. ","好，在下谢谢前辈指教. ")
end

function Uworld123_step4b()
	DelItem(377)
	SetTask(123,70)
	Talk(1,"","很好，麻烦你传话给不染公子，说端木睿不会让他失望. ")
	Msg2Player("端木睿继续请你去给唐不染报信.")
end
