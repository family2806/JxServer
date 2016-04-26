--description: 峨嵋派穆云慈 
--author: yuanlan	
--date: 2003/3/5
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 30*256+50) then				-- 30级任务中
			if (HaveItem(120) == 1) then		-- 任务完成
				L30_prise()
			else
				Talk(1,"","麻烦你到<color=Red>后山湖边<color>找找看. 火狐最爱吃<color=Red>鸡腿<color>，你得用鸡腿引它回来，否则它不会和陌生人走的.")
			end
		elseif (UTask_em == 30*256) and (GetLevel() >= 30) then		-- 30级任务启动
			Say("<color=Red>我养的<color=Red>火狐<color>不见了，你能帮我找找吗?", 2, "帮助寻找/L30_get_yes", "没时间/L30_get_no")
		elseif (UTask_em >= 40*256) then   							--已经完成30级任务，尚未出师
			Skill150Dialog("小师妹，谢谢你帮我!")
		else
			Skill150Dialog("火狐呀火狐，你跑到哪里去了？快点出来吧!")
		end
	elseif (UTask_em == 70*256) then								--已经出师
		Skill150Dialog("小师妹，你要下山了吗？我和火狐都会想你的.")
	else
		Skill150Dialog("我的火狐已经通灵了，不可能是不良的人了.")
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
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get_yes()
	Talk(1,"","麻烦你到<color=Red>后山湖边<color>找找看。<color=Red>火狐<color>最爱吃<color=Red>鸡腿<color>，你得用鸡腿引它回来，否则它不会和陌生人走的.")
	SetTask(1, 30*256+50)
	AddNote(" 在峨嵋派后堂(242, 305) 见穆云慈，接<color=red>火狐任务<color>, 去后山找火狐")
	Msg2Player("接穆云慈火狐任务，到后山找火狐")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","火狐！你这个淘气的小东西，下次可不准乱跑了！谢谢你帮我找回火狐!")
	DelItem(120)
	SetRank(16)
	SetTask(1, 40*256)
--	AddMagic(385)
--	AddMagic(82)
--	AddMagic(89)
	add_em(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你被封为白莲仙子")
	AddNote("带火狐回去给穆云慈，完成火狐任务，被封为白莲仙子")
end;	
