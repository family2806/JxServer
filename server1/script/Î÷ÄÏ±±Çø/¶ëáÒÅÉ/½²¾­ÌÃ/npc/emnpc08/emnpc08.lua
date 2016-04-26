--description: 峨嵋派妙如 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
--update: Dan_Deng(2003-07-24), 加“重返门派”任务
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1);
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 20*256) and (GetLevel() >= 20) then		--接到20级任务
			Say("最近<color=Red>后山山洞<color>常有<color=Red>猛虎<color>出没，伤害了不少上山进香的百姓，我们身为佛门子弟，怎能眼看猛虎伤人而置之不理呢？你愿意去收伏这些恶虎吗？", 2, "愿意/L20_get_yes", "有心无力/L20_get_no")
		elseif (UTask_em == 20*256+80) then										--20级任务过程中
			L20_prise()
		elseif (UTask_em == 20*256+50) then
			Talk(1,"","擒贼先擒王，你只要收伏了<color=Red>虎王<color>，其余的猛虎自然不敢为非作歹。虎性顽劣，你须得收服它<color=Red>三次<color>，它才会真正降服")
		elseif (UTask_em >= 30*256) then   							--已经完成20级任务，尚未出师
			Skill150Dialog("你能够深入虎穴，收伏猛虎，真不愧为我峨嵋弟子!")
		else
			Skill150Dialog("武学与佛理，同样需要参透，世上之事，只要用心，便能有所成就.")
		end
	elseif (UTask_em >= 70*256) then										--已经出师
		Skill150Dialog("以你的慧根，将来必有一番成就，到时可别忘了我们这些师姐啊!")
	else
		Skill150Dialog("武学与佛理，同样需要参透，世上之事，只要用心，便能有所成就.")
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
	G_TASK:OnMessage("峨眉", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L20_get_yes()
	Talk(1,"","擒贼先擒王，你只要收伏了<color=Red>虎王<color>，其余的猛虎自然不敢为非作歹。虎性顽劣，你须得收服它<color=Red>三次<color>，它才会真正降服")
	SetTask(1, 20*256+50)
	AddNote("在讲经堂见尼姑妙如(240, 308) , 收到 <color=red>降虎任务<color>, 去猛虎洞收复恶虎")
	Msg2Player("在讲经堂见尼姑妙如，收到去猛虎洞收复恶虎 ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","你能够深入虎穴，收伏猛虎，真不愧为我峨嵋弟子!")
	SetRank(15)
	SetTask(1, 30*256)
--	AddMagic(93)
	add_em(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你成为锦衣尼")
	AddNote("返回峨嵋派的讲经堂，复命秒如，完成任务，被封为锦衣尼. ")
end;
