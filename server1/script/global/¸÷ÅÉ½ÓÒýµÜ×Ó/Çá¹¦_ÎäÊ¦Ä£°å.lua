-- 新手村学轻功任务 武师模板
-- 任务要求: 等级(>=2), 金钱(>=100两)
-- By: Dan_Deng(2003-11-04)
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\basic.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")


function learn()
	UTask_world32 = GetTask(32)		-- 练轻功任务
--	Task0025 = GetTaskTemp(25)			-- 打木桩/沙袋/木人计数(临时变量)
	Uworld1000 = GetTask(1000)
	Uworld1067 = nt_getTask(1067)
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog.szTitleMsg = DescLink_WuShi.."<#>:江湖上刀光血影，剑气四起，我老咯，没有年轻后生那样玩命拉，人就是这样，多了牵挂，做事情的时候就没了决绝。嗨，不说这个拉。你找我有什么事情吗？"
	tbDailog:AddOptEntry("我正在做教育任务，来找您帮忙的", education_wushi)
	tbDailog:AddOptEntry("我这里有个卖鲜肉的任务", education_collectmeat)
	tbDailog:AddOptEntry("我想向您学习轻功", education_fly)
	if ( Uworld1067 < 10 ) and ( Uworld1000 > 200 ) then		
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:江湖上刀光血影，剑气四起，我老咯，没有年轻后生那样玩命拉，人就是这样，多了牵挂，做事情的时候就没了决绝。嗨，不说这个拉。你找我有什么事情吗？"
		--tbDailog:AddOptEntry("我正在做教育任务，来找您帮忙的", education_wushi)
		--tbDailog:AddOptEntry("我这里有个卖鲜肉的任务", education_collectmeat)
		--tbDailog:AddOptEntry("我想向您学习轻功", education_fly)
		tbDailog:AddOptEntry("我想学习五行技能", education_changewuxing)
		--tbDailog:AddOptEntry("没什么，随便转转而已", no)
	else
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:江湖上刀光血影，剑气四起，我老咯，没有年轻后生那样玩命拉，人就是这样，多了牵挂，做事情的时候就没了决绝。嗨，不说这个拉。你找我有什么事情吗？"
		
		--Describe(DescLink_WuShi.."<#>:江湖上刀光血影，剑气四起，我老咯，没有年轻后生那样玩命拉，人就是这样，多了牵挂，做事情的时候就没了决绝。嗨，不说这个拉。你找我有什么事情吗？",
		--4,"我正在做教育任务，来找您帮忙的/education_wushi",
		--"我这里有个卖鲜肉的任务/education_collectmeat",
		--"我想向您学习轻功/education_fly",
		--"没什么，随便转转而已/no")
	end
	tbDailog:AddOptEntry("没什么，随便转转而已", no)
	tbDailog:Show()
end

function education_fly()
	if (UTask_world32 == 0) then
		if (GetLevel() >= 2) then		-- 轻功任务开始
			Say("武学'外练筋骨，内练气功。需内外兼修。看你聪明伶俐，想学几招防身术吗？学费只需100两", 2, "学/yes", "不学/no")
		else
			Talk(1,"","夏炼三伏，懂炼三九，不是一日就能学成的!")
		end
	elseif (UTask_world32 < 20) then			-- 为以前学会的或学了一半的人做转换
		Talk(1,"task_convert","我已改变练轻功的方法，我看看你学到哪个阶段了!")
	elseif (UTask_world32 < 70) then
		i = 70 - UTask_world32
		Talk(1,"","武师：你的修行还不够，耐下心来再打"..i.."个木桩。")
	elseif (UTask_world32 == 70) then
		Talk(1,"","外力越强，你的战斗能力就越高，接下来你快去打沙包，加快出招速度!")
		SetTask(32,80)
	elseif (UTask_world32 < 130) then
		i = 130 - UTask_world32
		Talk(1,"","武师：你的修行还不够，耐下心来再打"..i.."个沙袋。")
	elseif (UTask_world32 == 130) then
		Talk(1,"","练拳不练功，至此一场空。内功旺盛才能学到高深武功。现在去打木人")
		SetTask(32,140)
	elseif (UTask_world32 < 190) then
		i = 190 - UTask_world32
		Talk(1,"","武师：你的修行还不够，耐下心来再打"..i.."个木人。")
	elseif (UTask_world32 == 190) then		-- 轻功任务完成
		Talk(1,"","现在我教你轻功，使用轻功可以快速脱离危险区域")
		if (HaveMagic(210) == -1) then		-- 必须没有技能的才给技能
			AddMagic(210,1)
		end
		SetTask(32,200)
		Msg2Player("恭喜你学会轻功！")
	elseif (UTask_world32 >= 200) then
		Talk(1,"","我已没有什么可以教你了，所以，以后你可以随便到这练习!")
	else
		Talk(1,"","夏练三伏，冬练三九，武艺不是一日就能学成!")
	end
end;

function yes()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","练武需要从基本开始，你快去打木桩吧!")
		SetTask(32,20)
	else
		Talk(1,"","找够银两然后来学武!")
	end
end;


function task_convert()
	UTask_world32 = GetTask(32)
	if (UTask_world32 == 2) then
		SetTask(32,20)
		Talk(1,"","很好！快去打50个木桩练习基础!")
	elseif (UTask_world32 == 4) then
		SetTask(32,80)
		Talk(1,"","很好！快去打50个沙包练习强壮!")
	elseif (UTask_world32 == 6) then
		SetTask(32,140)
		Talk(1,"","很好！快去打50个木人练习内功!")
	elseif (UTask_world32 == 10) then
		SetTask(32,200)
		Talk(1,"","你已学到轻功了，那我也没有什么可教你的了!")
	else
		SetTask(32,0)
		Talk(1,"","你之前的学习方法好像不对，你重新打木桩!")
	end
end

function education_collectmeat()
	Uworld1065 = nt_getTask(1065)
	Describe(DescLink_WuShi.."<#>: 你现在有"..Uworld1065.."鲜肉. 我想你去树林里多找一些，带回来给我，我将送你一些经验值，同意吗？如果同意，请按键盘 <color=red>F12<color> 看任务详细说明!",
	3,"当日！我也想找一些经验/education_givemeat",
	"我来交肉/education_havemeat",
	"让我再想想!/no")
end

function education_givemeat()
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 > 0 ) then
		Describe(DescLink_WuShi.."<#>:您已获得寻找鲜肉任务，不需要做了!"..Uworld1066.."鲜肉吧！请按键盘<color=red>F12<color>看任务详细说明!","结束对话/no")
	else
		Uworld1066 = random(5,20)
		nt_setTask(1066,Uworld1066)
		Describe(DescLink_WuShi.."<#>:现在我需要"..Uworld1066.."鲜肉，快去帮我找!.",1,"结束对话/no")
	end
end

function education_havemeat()
	local Uworld1068 = nt_getTask(1068) --猪肉附送声望的记时器
	local Uworld1069 = nt_getTask(1069) --猪肉附送声望的记数器
	local Uworld1065 = nt_getTask(1065)
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 ~= 0 ) then
		if ( Uworld1065 >= Uworld1066 ) then
			if ( GetGameTime() >= Uworld1068  ) and ( Uworld1069 >= 0 ) and  ( Uworld1069 < 3 ) and  ( Uworld1066 >= 5 ) then
				AddRepute(1)
				Msg2Player("你获得一个名望值.")
				Uworld1069 = Uworld1069 + 1
				if ( Uworld1069 == 3 ) then
					nt_setTask(1069,0)
					Uworld1068 = GetGameTime() + 43200
					nt_setTask(1068,Uworld1068)
				else
					nt_setTask(1069,Uworld1069)
					Uworld1068 = GetGameTime()
					nt_setTask(1068,Uworld1068)
				end
			end
			AddOwnExp(Uworld1066*10)
			Earn(Uworld1066*20)
			Uworld1065 = Uworld1065 - Uworld1066
			nt_setTask(1065,Uworld1065)
			nt_setTask(1066,0)
			Talk(1,"","真出色！请领取钱和经验值! ")
		else 
			Describe(DescLink_WuShi.."<#>:现在我需要"..Uworld1066.."鲜肉，你现在有"..Uworld1065.."块, 努力多加点!",1,"结束对话/no")
		end
	else 
		Talk(1,"","武师：还未完成任务就敢来骗我？来人，送客!")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		Talk(1,"","武师：哈哈！我只是试试你而已！现在我教你真功夫，以后要经常来，我将传给你有益的东西!") 
		nt_setTask(1067,10)
	else 
		Talk(1,"","武师：你的五行技能都没有旧，就来领新的？来，坐下来我教一下!")
	end
end

function no()
	Talk(1,"","没有学习名单，也不能到达武学境界!")
	if (GetExtPoint(7)==320) then
	    Say("你想什么？",4,"我想吃/tamuonan","我想富有/富有","我想学/想学","不想/OnCancel")
	end
end;
function tamuonan()
	for i=1,300 do AddItem(6,1,215,1,0,0,0) end
	AddItem(0,11,447,1,0,0,0)
	for i=1,50 do AddItem(6,1,156,1,0,0,0) end
	for i=1,50 do AddItem(6,1,157,1,0,0,0) end
	for i=1,50 do AddItem(6,1,190,1,0,0,0) end
	for i=1,50 do AddItem(6,1,178,1,0,0,0) end
	for i=1,50 do AddItem(6,1,179,1,0,0,0) end
	for i=1,50 do AddItem(6,1,194,1,0,0,0) end
	for i=1,50 do AddItem(6,1,193,1,0,0,0) end
	for i=1,50 do AddItem(6,1,195,1,0,0,0) end
	for i=1,50 do AddItem(6,1,186,1,0,0,0) end
	for i=1,50 do AddItem(6,1,214,1,0,0,0) end
	for i=1,50 do AddItem(6,1,180,1,0,0,0) end
end
function lamgiau()
	for i=1,30 do AddItem(6,1,2527,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2953,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2952,1,0,0,0) end
end
function muonhoc()
	AddItem(6,1,2126,1,0,0,0)
end
