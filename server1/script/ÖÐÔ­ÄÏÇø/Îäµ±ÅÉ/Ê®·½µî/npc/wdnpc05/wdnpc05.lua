--description: 武当派徐岱岳　武当30级任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\timerhead.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	Uworld50 = GetTask(50)
--	Uworld31 = GetByte(GetTask(31),1)
	if (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 30*256) and (GetLevel() >= 30) then
			for i = 1,GetItemCount(133) do DelItem(133) end
			Talk(2, "L30_get", "你在武当学艺也有些时日了，我想考考你的武功，看看是否有所精进.", "具体方法是要你在规定的时间里，到伏牛山上采5株画眉草，如果超过规定时间或者数目不够，都算失败.")
--		为计时器错误打补丁，变量值为35、学会了纯阳心法(156)、武当剑法(151)的也可以接30级任务（已取消）
--		elseif  (UTask_wd == 35) and (HaveMagic(156) >= 0) and (HaveMagic(151) >= 0) and (GetLevel() >= 30) then
--			for i = 1,GetItemCount(133) do DelItem(133) end
--			Talk(2, "L30_get", "徐岱岳：你想再度尝试画眉草的考验，很好。", "在规定时间里，到伏牛山上采回五株画眉草，如果超过规定时间或者采的数目不够，都算失败。")
		elseif (UTask_wd == 30*256+20) then
			Say("你拿到5颗画眉草了吗?",2,"已采够了/L30_finish_yes","还没够/L30_finish_no")
		elseif (UTask_wd == 30*256+50) then 						--计时已到
			L30_fail()
		elseif (UTask_wd > 30*256) and (UTask_wd < 40*256) then					--已经接到30级任务，尚未完成
			L30_finish_no()
--			Talk(1,"","徐岱岳：你要在<color=Red>二十四个时辰<color>里去<color=Red>伏牛山<color>采回<color=Red>五株画眉草<color>，已经只剩"..GetRestCTime(2).."了，你要抓紧啊！")
		else					--已经完成30级任务，尚未出师（缺省对话）
			Talk(1,"","本门武功很注重修炼内功，移动灵活，但是，不看低纯净内功，也发挥着不少威力.")
		end
--	elseif (Uworld50 < 10) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 4) then		-- 点醒徐中原任务，启动
		--		Talk(3,"Uworld50_get","徐岱岳：中原，不是为父有所成见，那白莹莹心如蛇蝎，阴险毒辣，绝非良偶。","徐中原：爹，你没有和莹莹见过面，光凭江湖传言就这样把人家给量死了，其实莹莹她真的是出淤泥而不染的好姑娘，绝非人们口中所说的那样。","玩家：徐前辈，您且别心急，徐少侠让我来劝劝吧。")
	elseif (Uworld50 == 30) then
		Talk(2,"","妖女白莹莹用甜言蜜语来骗你!"," 现在我也是半信半疑，不完全相信她。如果她说的是真的，我们给她一个机会")
	elseif (Uworld50 == 50) then		-- 奖励2，任务完成
		Talk(1,"U50_Prise2","我早就说了，这个妖女不少好人，果然如此。不懂怎么感谢你。行，我教你两招绝剑")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","宝剑锋从磨砺出，梅花香自苦寒来。想成为高手，需要付出比别人更多的汗水.")
	else
		Talk(1,"","道学武，资质好，但是，不勤奋练习也不能成为高手")
	end
end;

function L30_get()
	Say("你有信心接这个任务吗?", 2, "不成问题!/L30_get_yes", "弟子能力有限，恐怕很难完成任务/L30_get_no")
end;

function L30_get_yes()
	i = GetTimerId()
	if (i > 0) and (i ~= 2) then		-- 另有计时器在运行中，并且不是此任务
		Talk(1,"","你有这么重要的任务，怎么还乱跑?")
		return
	end
		Talk(1,"","很好。现在开始计时，在<color=Red>72小时内<color> 上 <color=Red>伏牛山琻<color> 采摘 <color=Red>5 株画眉草<color>, 去吧!")
	StopTimer()
	SetTimer(72 * CTime * FramePerSec, 2)										--开启计时器:72个时辰 * 时辰长 * 帧数
	SetTask(5, 30*256+20)
	AddNote("见徐岱岳，接任务，在72小时之内，去伏牛山洞采摘5株画眉草.")
	Msg2Player("见徐岱岳，接任务，在72小时之内，去伏牛山洞采摘5株画眉草.")
end;

function L30_get_no()
	Talk(1,"","我会努力的!")
end;

function L30_finish_yes()
	if (GetItemCount(133) >= 5) then 
		L30_prise() 
	else
		Talk(1,"L30_finish_no","你还未采摘够5株 !")
	end
end;

function L30_finish_no()
	if (GetRestSec(2) > 0) then
		Talk(1,"","你的时限还有"..GetRestCTime(2).."而已，快抓紧时间吧!")
	else
		i = GetTimerId()
		if (i == 2) or (i == 0) then
			StopTimer()
		end
		L30_fail()
	end
end;

function L30_prise()
	for i = 1,GetItemCount(133) do DelItem(133) end
	if (GetTimerId() == 2) then			-- 正在任务计时中
		StopTimer()					--结束计时
	end
	Talk(1,"","看起来你的武功果然进步很大! ")
	SetRank(10)
	SetTask(5, 40*256)
--	AddMagic(164)
--	AddMagic(158)
	add_wd(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你被封为巡山道人。学到武当派武功剑飞惊天.")
	AddNote("在规定的时间内返还十方殿，带5株画眉草给徐岱岳，完成画眉草任务，升为巡山道人.")
end;

function L30_fail()
	for i = 1,GetItemCount(133) do DelItem(133) end
	SetTask(5, 30*256)
	AddNote("超过规定时间，画眉草任务失败.")
	Msg2Player("超过规定时间，画眉草任务失败.")
	Talk(1,"","时间已用完。你太让我失望了。平日是不是你很偷懒？一定要勤奋练习才行。什么时候准备好了，再来找我吧.")
end;

function Uworld50_get()
	SetTask(50,10)
	Msg2Player("接任务：让徐中原觉醒，不能被妖女白莹莹迷惑.")
	AddNote("接任务：让徐中原觉醒，不能被妖女白莹莹迷惑.")
end

function U50_Prise2()
	SetTask(50,255)
	AddProp(1)
	AddEng(1)
	Task88_4 = GetByte(GetTask(88),4) + 1
	if (Task88_4 > 255) then Task88_4 = 255 end
	Task88 = SetByte(GetTask(88),4,Task88_4)
	SetTask(88,Task88)			-- 记录任务得内功点总数

	Msg2Player("在徐岱岳的帮助下，你的内功上升1点。让徐中原觉醒任务完成.")
	AddNote("完成让徐中原觉醒任务")
end

function no()
end
