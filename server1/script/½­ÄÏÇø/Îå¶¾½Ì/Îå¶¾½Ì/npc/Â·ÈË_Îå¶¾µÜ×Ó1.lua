-- 五毒 路人NPC 五毒弟子1 入门任务
-- by：Dan_Deng(2003-08-05)

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- 入门任务中
		if ((HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) and (HaveItem(227) == 1)) then
			Talk(1,"","啊!怎么把孔雀羽毛送给我了.应该要带去送给洞里的师兄才对. ")
		else
			Talk(1,"","练功时间不够，你怎么又到这了? 看你这么萎靡不振的样子怎么能成为本门弟子呢?整天就做梦吧. ")
		end
	elseif (Uworld37 == 0) and (GetLevel() >= 10) and (GetFaction ~= "wudu") then		--入门任务
		Say("要想成为本门弟子, 要经过五毒洞的试炼. 你想试试吗？",2,"是！我想试试看! /enroll_get_yes","不，我只是来看看. /no")
	else							-- 常规对话
		Talk(1,"","不要乱跑. 被洞中的虫腰到就无药可医了. ")
	end
end;

function enroll_get_yes()
	Uworld37 = SetByte(GetTask(37),2,10)
	SetTask(37,Uworld37)
	AddNote("接到五毒洞的任务练功，走到洞中，你会看到5跟长的孔雀毛. ")
	Msg2Player("接到五毒洞的任务练功，走到洞中，你会看到5跟长的孔雀毛. ")
end;

function no()
end;
