-- 五毒 路人NPC 赤蝎寨主屠异 30级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 30*256+10) then		-- 任务进行中
			if (HaveItem(87) == 1) then
				Talk(2,"L30_step1","笨蛋！这个木香鼎是假的","算了，也怪不得你，你没见过木香鼎。真的木香鼎应该是散出幽幽蓝光，而这个却是发黄。")
			else
				Talk(1,"","让我亲自去抓这个叛徒。我要把他抓到五毒洞让毒虫咬死他")
			end
		elseif (UTask_wu == 30*256+20) then		-- 任务完成
			if (HaveItem(221) == 1) then
				DelItem(221)
				L30_prise()
			else
				Talk(1,"","记住！木香鼎散发的是蓝光. ")
			end
		elseif ((UTask_wu == 30*256) and (GetLevel() >= 30)) then		--30级任务
			Talk(4,"L30_get","本教教规，叛教者死，可是偏偏有人胆大妄为！","难道有人会自寻死路吗？","哼，我最信任的一个亲信，竟然偷了我的炼毒宝器‘木香鼎’，逃到武夷山上去了，哼！他以为能逃得出我的手掌心吗? ","屠寨主打算怎么处置他?")
		else							-- 常规对话
			Talk(1,"","我不是不相信你，只是一直偷看我的那个奇怪的人就是小偷。这个宝贝我是多么艰难才得到?")
		end
	else
		Talk(1,"","我平生最恨那些背信弃义的小人")
	end
end;

function L30_get()
	Say("我现在给你一个立功的机会，去武夷山上抓到这个叛贼，夺回木香鼎。你愿不愿意去啊？",2,"愿为屠寨主效命/L30_get_yes","属下功力还不足，只担心不能完成任务。 /L30_get_no")
end;

function L30_get_yes()
	Talk(1, "", "如果你能夺回木香鼎，我就升你为黑暗阎罗")
	SetTask(10,30*256+10)
	AddNote("再次上武夷山夺回木香鼎")
	Msg2Player("再次上武夷山夺回木香鼎")
end;

function L30_get_no()
end;

function L30_step1()
	Talk(1,"","是，属下这就去夺回真的木香鼎来")
	SetTask(10,30*256+20)
	DelItem(87)
	AddNote("再上武夷山夺回真的木香鼎")
	Msg2Player("再上武夷山夺回真的木香鼎")
end;

function L30_prise()
	Talk(2,"","木香鼎！好！好！我一向赏罚分明，你这次立了大功，从今天起，我就升你为本教的黑暗阎罗。 ","多谢屠寨主！")
	SetTask(10,40*256)
	SetRank(52)
--	AddMagic(68)
--	AddMagic(384)
--	AddMagic(64)
--	AddMagic(69)
	add_wu(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为黑暗阎罗。学会武功：幽冥骷髅、无形蛊、赤炎蚀天 ")
	AddNote("夺得木香鼎带回给屠异，升为黑暗阎罗")
end;
