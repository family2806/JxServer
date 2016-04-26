-- 丐帮 传功长老魏了翁 40级任务
-- by：Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	UTask_gb = GetTask(8)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 40*256+30) then		--40级任务完成
			Talk(2,"L40_prise","子已经见到张大人，并将密函亲手交给了他.","这我就放心了，你也辛苦了，此事我会向帮主禀明，升为你四十级大弟子.")
		elseif (UTask_gb == 40*256+10) then		--40级任务中
			if (HaveItem(236) == 1) then
				Talk(4,"","魏长老，我已经除掉了那些金国杀手，这是从他们身上搜出一封密函.","给我看看 .....","? 密函中有一份暗中勾结金国的朝廷主和派的名单！这封信必须马上交给张浚大人，让他小心提防。.","你赶紧去扬州一趟，张大人就住在会友客栈，你要把信亲自交到他手上。切记切记!")
				SetTask(8,40*256+20)
				AddNote("带密函去见张俊")
				Msg2Player("带密函去见张俊")
			else
				Talk(1,"","时间紧急，你要快点赶快消除张大人眼前的障碍! ")
			end
		elseif ((UTask_gb == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("临安附近的弟子最近打探到，金国暗中勾结朝廷里的主和派，阴谋在枢密使张浚上京赴任的途中暗害他，以阻挠抗金的活动",2,"请交给弟子 /L40_get_yes","弟子功力不够，恐怕不能担此重任/L40_get_no")
		elseif (UTask_gb == 40*256+20) and (HaveItem(236) == 0) then		-- 任务中物品丢失处理
			AddEventItem(236)
			Talk(1,"","此事绝对不能有失误，这封信切记要带在身上!")
		else
			Skill150Dialog("如果大夏倒下，我丐帮也难抵抗，只能像孔明先生一样鞠躬尽瘁，死不足惜")
		end
	else
		Skill150Dialog("我最仰慕的人是诸葛孔明，到最后时刻都忠诚!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("C竔 Bang", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L40_get_yes()
	Talk(1,"","你要小心! ")
	SetTask(8,40*256+10)
	AddNote("接任务：杀金人杀手，保护张俊安全")
	Msg2Player("接任务：杀金人杀手，保护张俊安全")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(3,"","多谢魏长老! ")
	SetTask(8,50*256)
	SetRank(41)
--	AddMagic(277)
	add_gb(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你已升为丐帮龙头弟子，学到活不留守")
	AddNote("保护张俊的安全，完成40级任务，升为龙头弟子")
end;
