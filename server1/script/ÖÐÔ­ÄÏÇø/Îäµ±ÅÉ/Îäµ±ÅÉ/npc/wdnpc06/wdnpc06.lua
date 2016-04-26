---中原南区\武当派\武当派\npc\wdnpc06.lua
--description: 武当派周云泉　武当40级任务
--author: yuanlan	
--date: 2003/5/15
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)
-- updage by xiaoyang(2004\4\15) 武当90级任务
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	

	local szTitleMsg = "<npc>最近我有很多事要解决，你来这有什么事?"
	local tbOpt = 
	{
		{"150级任务", dailog150skill},
		{"想请教其他事", org_dailog}
	}

	CreateNewSayEx(szTitleMsg, tbOpt)
end

function org_dailog()
	UTask_wd = GetTask(5)
	Uworld129 = GetTask(129)
	if((UTask_wd == 40*256) and (GetLevel() >= 40) and (GetFaction() == "wudang")) then
		Say("你可以帮我吗？掌门想我带<color=Red>1 封信<color>到<color=Red>鸡冠洞<color> 给 <color=Red>润娘<color>, 突然我有急事，你可以送信吗?", 2, "不成问题!/L40_get_yes", "对不起，我有其他事/L40_get_no")
	elseif (UTask_wd >= 40*256+20) and (UTask_wd <= 40*256+40) and (HaveItem(163) == 0) then		-- 道具丢了
		AddEventItem(163)
		Talk(1,"","你真是鲁莽，掌门的信没带还想跑?")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 1) then					--有润娘的回信
		Talk(2, "", "朱师兄，我已帮你带信了，这是润娘的回信!", "辛苦你了，去把这个信拿回给掌门，掌门在紫宵殿.")
		Msg2Player("回到武当找朱云泉，知道要交信给掌门. ")
		AddNote("回到武当找朱云泉，知道要交信给掌门 ")
		SetTask(5,40*256+80)
	elseif (UTask_wd == 40*256+80) and (HaveItem(164) == 0) then			-- 道具丢了
		AddEventItem(164)
		Talk(1,"","你把信忘记在我这里了!")
	elseif (Uworld129 == 10) then
		Talk(12,"Uworld129_admit","道兄是武当豪杰，在下听闻已久，今天才上山请教","好，朱某很久没有对手练习了，手脚很痒了","小的怎么敢比试","我也不强迫他人，阁下第一次上武当，你决定比试方式","武学流传到现在，自古分内外行家，请问，该看重什么？","内家练气，外家炼身。没有好身体怎么定神？因此，需看重外家","不是，天地万物，造化使然。如果以心炼气，气通自然，才能炼正道。","心什么？气什么？如果人有3,5种病，每天吐血，那叫什么天地","武功最强表现在外，但是...","可以了，我吵不过你，如果想证明这些，你去找李天目师弟","请朱大侠赎罪","快走，你让我受不了了!")
   elseif(Uworld129 == 30)then
   	Talk(6,"Uworld129_admit2","朋友，快来!","朱兄有什么指教!","啊，给你看这个",".....家书？恭喜朱兄!","哈哈，父母在家等我，我要立即下山，麻烦你跟我师兄弟说一下.","人生在世，孝为先!")
   elseif (Uworld129 > 10) and (Uworld129 < 60)then
   	Talk(1,"","武当在中原武林占有重要的位置，到武当谈论武功算是找对地方了.")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","<color=Red>润娘<color> 在<color=Red>鸡冠洞<color>.")
	elseif (UTask_wd > 40*256+20) and (UTask_wd < 40*256+80) then					--已经接到40级任务，尚未完成
		Talk(1,"","见润娘了吗？事情怎么样了?")
	elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--已经完成40级任务，尚未出师
		Talk(1,"","师傅与润娘的恩怨我有听过，只因为师傅好像不想谈及，我们做弟子的也不该多问")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","我们既是同门，就是有缘，有缘人以后还会见面，请保重! ")
	else
		dailog150skill()
	end
end

function dailog150skill()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>我总是自勉，在武当山努力学习武功，至今没有想娶妻生子的事，现在已经过了那个时期了，心里也有点忧愁."
	G_TASK:OnMessage("Th髖 Y猲", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L40_get_yes()
	Talk(1,"","多谢<color=Red>润娘<color> 在 <color=Red>鸡冠洞<color>,带这封信去!")
	Msg2Player("掌门吩咐把书信带给润娘. ")
	AddEventItem(163)
	SetTask(5, 40*256+20)
	AddNote("在清水湖畔遇到朱云泉，接润娘任务，到伏牛山鸡冠洞把信交给润娘. ")
	Msg2Player("在清水湖畔遇到朱云泉，接润娘任务，到伏牛山鸡冠洞把信交给润娘. ")
end;

function L40_get_no()
	Say("那我找他人帮忙. ")
end;

function Uworld129_admit()
	SetTask(129,20)  --设置任务变量20
	Msg2Player("与朱云泉对话后，回来找李天目. ")
	AddNote("与朱云泉对话后，回来找李天目. ")
end

function Uworld129_admit2()
	SetTask(129,40)
	Msg2Player("与朱云泉对话后，回来找李天目. ")
	AddNote("朱云泉收到家书，你替他高兴，答应他和李天目说. ")
end
