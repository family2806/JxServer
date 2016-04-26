--description: 峨嵋派清晓师太（峨嵋入门任务、50级任务、出师任务、重返门派任务）
--author: yuanlan	
--date: 2003/3/6
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
--update: Dan_Deng(2003-07-24), 加“重返门派”任务
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应
-- update: xiaoyang(2004\4\19) 峨嵋90级任务

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>最近我很忙，你来这有什么事?"
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 4) then
		tbDailog:AddOptEntry("学习120技能.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("想请教其他事", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
	local UTask_em = GetTask(1)
	local nFactID = GetLastFactionNumber();

	if (UTask_em == 70*256) and (GetFaction() == "emei") then			-- 回师错误修正
		SetFaction("")
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_em == 70*256) and (GetTask(6) >= 5*256) and (GetTask(6) < 10*256) then		-- 以前接过入门任务的
		SetTask(6,0)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_em == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(1,70*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_em == 80*256 and nFactID == 4 and GetCamp() == 1 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("emei");
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	elseif (UTask_em == 70*256 and nFactID == 4 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(4)", "想请教其他事/common_talk"};
	
	Say("最近我很忙，你来这有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_em = GetTask(1)
	local Uworld125 = GetTask(125)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),1) == 0) then				-- 世界任务：武林向背
		Talk(1,"","本门虽是女流之辈，但是国家兴亡匹夫有责。答复独孤盟主，峨眉听从你的吩咐!")
		Uworld40 = SetBit(GetTask(40),1,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 80*256) then						-- 重返后的自由出入
			check_skill()
		elseif ((UTask_em == 60*256+50) and (HaveItem(24) == 1)) then		--拿到烟玉指环，出师任务完成
			DelItem(24)
			Talk(1,"L60_prise","你这次能够成功为本派夺回镇派之宝，功劳不小，以你的智慧和能力，已经可以顺利出师了，日后行走江湖，务必洁身自爱，切记切记!")
		elseif (UTask_em == 60*256) and (GetLevel() >= 50) then		--出师任务启动
			DelItem(24)
			Say("掌门信物<color=Red>烟玉指环<color>，乃是本派祖师传下来的镇派之宝。可是在几十年前，本派出了一个叛徒<color=Red>清和<color>，她是为师的师姐，因为对为师接任掌门不满，所以盗走了<color=Red>烟玉指环<color>，你愿意帮本派夺回<color=Red>烟玉指环<color>吗?" , 2, "愿意 /L60_get_yes", "恐难当此大任/L60_get_no")
		elseif (UTask_em == 50*256+80) then													--50级任务完成
			L50_prise()
		elseif ((UTask_em == 50*256+50) or (UTask_em == 50*256+60)) and (HaveItem(23) == 0) then
			AddEventItem(23)
			Talk(1,"","你的武功名声越来越高，真是本派的支柱，从今往后行事不能随意，这个金刚经要带在身边!")
		elseif (UTask_em == 50*256) and (GetLevel() >= 50) then		--50级任务启动
			DelItem(23)
			Say("为师与<color=Red>成都信相寺<color>的住持<color=Red>慈海大师<color>是方内知交，信相寺创建于隋炀帝大业年间，距今已五百五十五年。为了庆祝信相寺创寺的大好日子，为师准备送给信相寺一件佛门至宝<color=Red>《金线绣像金刚经》<color>作为贺礼。你愿意帮我去送这份贺礼吗?", 2, "愿意 /L50_get_yes", "恐难当此大任/L50_get_no")
		elseif (UTask_em > 50*256) and (UTask_em < 60*256) then								--已经接到50级任务，尚未完成的普通对话
			Talk(1,"","金刚经送了吗?")
		elseif (UTask_em > 60*256) and (UTask_em < 70*256) then				-- 出师任务中的普通对话
			Talk(1,"","<color=Red>烟玉指环<color>乃是镇派之宝，流落在外. 听说最近<color=Red>清和<color>在<color=Red>长江源头<color>附近现身，你要一切小心!")
		else
			Talk(1,"","我佛慈悲！既入我门，需谨守门规。望你好生学艺，不要辜负了为师的期望!")
		end
--	elseif (UTask_em == 5*256+70) and (HaveItem(17) == 1) and (GetSeries() == 2) and (GetCamp() == 0) then		--拿到白玉如意，入门任务完成
--		enroll_prise()
	elseif (Uworld125 == 20) and (HaveItem(388) == 1)then
		Talk(7,"Uworld125_lose","师太，您好","你是...?","在下接到萧伯伯的任务，带无字天书信物给峨眉.","太好了，不想几百年后，师祖的神功又回到峨眉。朋友，多谢你!","不用客气!","这是峨眉掌门的令箭，拿去成都找萧伯伯领取酬劳。以后回来峨眉，可以用令箭调动我这里的所有力量."," 多谢师太!.")
   elseif (Uworld125 == 30) and (HaveItem(389) == 0)then
   	Talk(1,"","放心，峨眉答应你的条件，绝不反悔!")
   	AddEventItem(389)
		Msg2Player("拿到峨眉令箭")
   elseif (Uworld125 == 40) then
		Talk(5,"Uworld125_finish","师太这么找我有什么事吗?","我的很多弟子因为练习无字天书经脉混乱，身受重伤.","怎么了？不可能。我没有动到秘籍.","这个我知道，事情发生在你带秘籍的时候，只有有缘人才能领悟","原来如此")
--	elseif (GetTask(6) == 5*256+10) then		-- 转派至翠烟门
--		Say("清晓师太：本门门规虽然不禁转投他派，但不可以带走本门任何武艺。你真的打算要投入翠烟门？",2,"不错，我意已决/defection_yes","不，我还是不改投了/defection_no")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_em == 70*256) and (GetTask(6) < 5*256) then		-- 重返师门任务
		Talk(5,"return_sele","师傅 ","你又上山来玩啊","是的，弟子又想到了在上山的那些日子. ","嗯，我也是，转眼间你就下山了. ","江湖险恶，世事难料。现在我想留在上山. ")
	elseif (GetCamp() == 4) and ((UTask_em == 70*256+10) or (UTask_em == 70*256+20)) then		-- 重返师门任务中
		Say("准备好5万两了吗?",2,"准备好了/return_complete","还没准备好/return_uncompleted")
	elseif (Uworld125 > 20) and (Uworld125 < 40)then
   	Talk(1,"","峨眉和阁下还有缘分，以后希望能继续帮忙.")
	elseif (UTask_em < 10*256) and (GetSeries() == 2) then 								--尚未入门
		Talk(1,"","我峨嵋一派，传至今日，已有百年，弟子众多，广结善缘，不论是否拜入门墙，上得山来，皆是有缘人.")
	elseif (UTask_em == 70*256) then								--出师弟子（考虑重返门派的兼容）
		Talk(1,"","你已出师，从今往后行走江湖务必洁身自爱!")
	else														-- 非峨嵋派对话
		Talk(1,"","我峨眉虽然是女流之辈，但也不会输给其他门派.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(92) == -1) then
--		AddMagic(92)					--佛心慈佑
--		Msg2Player("你学会了“佛心慈佑”")
--		Say("清晓师太：为师这次闭关苦思数日，新创了一招“佛心慈佑”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	elseif  (HaveMagic(252) == -1) then
--		AddMagic(252)					--佛法无边
--		Msg2Player("你学会了“佛法无边”")
--		Say("清晓师太：为师这次闭关苦思数日，新创了一招“佛法无边”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("又想下山游玩?",2,"是的，请师父允许/goff_yes","不是，我感觉工夫还不够. /no")
--	end
end

----------------- 重返师门相关 ------------------
function goff_yes()				-- 重返后的自由出入（出）
	Talk(1,"","很好，吃一见长一智.")
	SetTask(1,70*256)
	AddNote("离开峨眉，行走江湖")
	Msg2Player("离开峨眉，行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=80; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 飘雪穿云
	i=101;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 治疗术
	i=77; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 峨嵋剑法
	i=79; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 峨嵋掌法
	i=81; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 秋风叶
	i=82; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 四象同归
	i=83; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 望月
	i=84; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 风雨飘香
	i=85; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 一叶知秋
	i=86; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 流水
	i=87; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 冰心决
	i=88; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 不灭不绝
	i=89; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 梦蝶
	i=91; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 佛光普照
	i=93; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 慈航普渡
	i=252;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 佛法无边
	i=92; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 佛心慈佑
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(6,5*256+20)
	SetTask(1,75*256)				-- 为原门派作个标记
	SetRank(74)
	if (GetRepute() < 200) then
		Msg2Player("由于你对门派的行为不忠，名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("由于你对门派的行为不忠，名望减少200 点! ")
		AddRepute(-200)
	end
	AddNote("清晓师太已废武功，拿到圣女金鼎称号，告诉天下已将你逐出峨眉，你可以加入翠烟了. ")
	Msg2Player("清晓师太已废武功，拿到圣女金鼎称号，告诉天下已将你逐出峨眉，你可以加入翠烟了. ")
	Talk(1,"KickOutSelf","不料，我教你的武功，你想废掉，真是世事难料!")
end

function defection_no()
	AddNote("你放弃加入翠烟派. ")
	Msg2Player("你放弃加入翠烟派. ")
	SetTask(6,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_sele()
	Say("你有诚意，我不能拒绝",2," 多谢师父 /return_yes","算了，不需要/return_no")
end;

function return_yes()				-- 重返的检查
	Talk(3,"","多谢师父，弟子漂泊江湖也获得一点银两，不懂师门需要吗?"," 想不到你有这份心，那就捐50000两，维修一下峨眉山路吧","是，弟子去准备 ")
	SetTask(1,70*256+20)
	AddNote("捐500两白银修理峨眉山山路，就能返回峨眉. ")
	Msg2Player("捐500两白银修理峨眉山山路，就能返回峨眉. ")
end;

function return_no()
	Talk(2,"","江湖无路回，需要自己闯出，多谢师父美意","没关系，如果想回来，峨眉随时为你打开")
end;

function return_complete()			-- 重返成功
	if (GetCash() >= 50000) then
		Talk(1,"","好，这是5万两，你被封为金鼎圣女，希望你努力帮助本派发扬光大.")
		Pay(50000)
		SetTask(1,80*256)
		SetFaction("emei")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(64)
--		if (HaveMagic(252) == -1) then
--			AddMagic(88)
--			AddMagic(91)
--			AddMagic(282)
--			AddMagic(252)
		add_em(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到镇派绝学：佛法无边，不灭不绝武功，佛光普照. ")
--		end
		AddNote("已返回峨眉派")
		Msg2Player(GetName().."被封为金鼎圣女，返回峨眉派. ")
	else
		Talk(2,"","好像你没有带很多钱","对不起，我去拿钱. ")
	end
end;

--------------- 入门任务 ----------------------
function enroll_prise()		-- 入门任务完成
	Talk(1,"","我佛慈悲，既然你一心至诚，贫尼就收你为徒，希望你好生学艺，谨守门规，不要辜负了为师的期望.")
	DelItem(17)
	SetFaction("emei")    			
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	AddMagic(80)
	AddMagic(101)
	SetRevPos(13, 13)
	SetTask(1, 10*256)
	AddNote("交白玉如意给清晓师太，完成入门任务。. 加入峨眉派，成为布衣尼，学到飘雪穿云，治疗术 ")
	Msg2Player("交白玉如意给清晓师太，完成入门任务. ")
	Msg2Player("欢迎加入峨嵋派，成为布衣尼")
	Msg2Player("学到飘雪穿云武功 '. ")
	Msg2Player("学到峨嵋派绝学治疗术' ")
end;

--------------------- 50级任务 -----------------------
function L50_get_yes()
	Talk(1,"","<color=Red>慈海大师<color>闭关多年，寻常不见外客，你可以先去找他的师弟<color=Red>慈云法师<color>. ")
	AddEventItem(23)
	Msg2Player("接任务，带金线绣像金刚经去成都信相寺. ")
	Msg2Player("获得金线绣像金刚经. ")
	SetTask(1, 50*256+50)
	AddNote("在正殿见清晓师太，接任务去信相寺，交金线绣像金刚经. ")
end;

function L50_get_no()
	Talk(1,"","那去找他吧!")
end;

function L50_prise()
	Talk(1,"","这件事情你办得很好，你天资聪颖，只要继续努力，将来一定会学有所成")
	AddNote("回去正殿向清晓师太复命，完成信相寺任务，升为散花天女，学到佛心慈佑. ")
	SetRank(18)
	SetTask(1, 60*256)
--	AddMagic(92)
	add_em(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为散花天女，学到佛心慈佑. ")
	AddNote("任务完成，被封为散花天女")
end;

----------------------- 出师任务 ------------------------
function L60_get_yes()
	Talk(1,"","听说最近<color=Red>清和<color>在<color=Red>长江源头<color>附近现身，你要一切小心! ")
	SetTask(1, 60*256+50)
	AddNote("在正殿见清晓师太，接出师任务，夺回掌门信物烟雨指环. ")
	Msg2Player("接出师任务，夺回掌门信物烟雨指环. ")
end;

function L60_get_no()
	Talk(1,"","看来只能把这个重任交给你!")
end;

function L60_prise()
	Talk(1, "","恭喜你成功出师，被封为圣女。日后可以自由行走江湖。你可以选择加入其他门派继续学艺，也可以建立帮会，或者做一个独行的女侠也很威风。江湖剑侠，天高地厚，希望你一展宏图!")
	Msg2Player("恭喜你学成，你被封为峨眉圣女，名望增加120点! ")
--	AddGlobalCountNews("峨嵋"..GetName().."艺成出师，告别同门师妹下山闯荡江湖", 1)
	Msg2SubWorld("峨眉弟子"..GetName().."艺成出师，告别同门师妹下山闯荡江湖")
	AddRepute(120)
	SetRank(74)
	SetTask(1, 70*256)
	SetFaction("") 		   					--玩家退出峨嵋派
	SetCamp(4)
	SetCurCamp(4)
	AddNote("回到正殿，交烟雨指环给清晓师太，完成出师任务，升为圣女")
end;

function no()
end;

-------------------- 世界任务 ---------------------
function Uworld125_lose()
	DelItem(388)
	AddEventItem(389)
	SetTask(125,30)
	Msg2Player("交出无字天书，拿到峨眉令箭. ")
	AddNote("拿到令箭，回成都找萧伯伯领奖. ")
end

function Uworld125_finish()
	if (GetTask(1) >= 70*256) and (GetTask(1) ~= 75*256) then
		Talk(4,"","看来峨眉与天书的缘分已尽，这个使命是你的才对!","在下?","是的，也行只有你才能明白里面的秘籍，贫尼将传与你其中的招式，希望你成功，不要枉费我的一番苦心!","弟子一定不辜负您的期望。日后有什么吩咐，弟子一定遵从!")
		if (HaveMagic(328) == -1) then		-- 必须没有技能的才给技能
			AddMagic(328,1)
		end
		if (HaveMagic(380) == -1) then		-- 必须没有技能的才给技能
			AddMagic(380,1)
		end
		if (HaveMagic(332) == -1) then		-- 必须没有技能的才给技能
			AddMagic(332)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("你学到三峨齐雪，封路翠影，普度众生")
		SetTask(125,255)  --学得技能的设置变量255
	else
		Talk(1,"","这本天书没有人能修炼，只能放在经楼等后人。你这么辛苦，这个小礼物送给你。","那弟子就不客气了!")
	   SetTask(125,245)  --获得声望的设置变量245
	end
	add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	AddRepute(add_repute)
	Msg2Player("峨眉天书顺利返回，任务完成. 名望增加"..add_repute.."点.")
	AddNote("峨眉天书顺利返回，任务完成. ")
end
