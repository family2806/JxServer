--description: 武当派叶继美　武当10级任务
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if allbrother_0801_CheckIsDialog(12) == 1 then
		allbrother_0801_FindNpcTaskDialog(12)
		return 0;
	end
	UTask_wd = GetTask(5)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_TASK:OnMessage("武当", tbDailog, "DialogWithNpc")
	if (UTask_wd == 10*256+20) then 
		SetTask(5, 10*256+50)
		AddNote("在叶继美　处学到道德经")
		Msg2Player("在叶继美　处学到道德经")
		tbDailog.szTitleMsg = "<npc>道德经是祖师老子写的，第一卷有37章，后面章节44章"
		tbDailog:AddOptEntry("Chng 1 ", ch1)
		tbDailog:AddOptEntry("Chng 25 ", ch2)
		tbDailog:AddOptEntry("Chng 33 ", ch3)
		tbDailog:AddOptEntry("Chng 41 ", ch4)
		tbDailog:AddOptEntry("Chng 42 ", ch5)
	elseif (UTask_wd == 10*256+50) then 
		tbDailog.szTitleMsg = "<npc> <道德经>内容博大精深，不是在短时间能领悟的，你先熟读前5章吧."
		tbDailog:AddOptEntry("Chng 1 ", ch1)
		tbDailog:AddOptEntry("Chng 25 ", ch2)
		tbDailog:AddOptEntry("Chng 33 ", ch3)
		tbDailog:AddOptEntry("Chng 41 ", ch4)
		tbDailog:AddOptEntry("Chng 42 ", ch5)
	elseif (UTask_wd < 10*256+20) and (GetFaction() == "wudang") then								--尚未接10级任务
		tbDailog.szTitleMsg = "<npc>不懂道德经，怎么能成为武当弟子?"
	elseif (UTask_wd >= 20*256) and (GetFaction() == "wudang") then					--已经完成10级任务，尚未出师
		tbDailog.szTitleMsg = "<npc>今天你学道德经了吗?"
	elseif (UTask_wd >= 70*256) then							--已经出师
		tbDailog.szTitleMsg = "<npc>我和你一样年轻的时候，也是一个强壮的大丈夫，到今天才知道山高地厚，你虽然是本派出师弟子，但是，也不能小看他人."
	else
		tbDailog.szTitleMsg = "<npc>老子的道德经，第一卷有37章，后面章节44章。一起5000字，内容博大精深."
	end
	tbDailog:Show() 
end;

function ch1()
	Talk(1,"","道可道，非常道，名可名，非常名.")
end;

function ch2()
	Talk(1,"","人法地，地法天，天法道，道法自然.")
end;

function ch3()
	Talk(1,"","知人者智，自知之明，胜人者有力，自胜者强.")
end;

function ch4()
	Talk(1,"","大方无隅，大器晚成，大音希成，大象无形.")
end;

function ch5()
	Talk(1,"","道生一，一生二，二生三，三生万物.")
end;
