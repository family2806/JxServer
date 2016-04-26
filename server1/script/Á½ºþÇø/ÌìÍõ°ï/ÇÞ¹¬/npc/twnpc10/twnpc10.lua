--description: 天王帮寝宫 杨瑛　天王出师任务、重返门派任务
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事?", 2, "想请教大师！/oldentence", "恩师，在下已经找够恩师帖和高度帖了/vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>近日我有很多事情要解决，你来有什么事?"
	G_TASK:OnMessage("天王", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("学习120级技能.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("想请教别的事", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- 回师错误修正
		SetFaction("")
		Say("系统发现漏洞已及时修复!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- 以前接过入门任务的
		SetTask(7,0)
		Say("系统发现漏洞已及时修复!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(3,70*256)
		Say("系统发现漏洞已及时修复!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("系统发现漏洞已及时修复!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发现漏洞已及时修复!",0)
			return
		end
	end
	local tbDes = {"带艺投师/#daiyitoushi_main(1)", "想请教别的事情/common_talk"};
	
	Say("近日我有很多事情要解决，你找我有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- 世界任务：武林向背
		Talk(1,"","宋朝朝廷愚蠢，与我杨家不共戴天。当年楚王和我父亲坚决灭宋。杨瑛随不才，也要实现这个大志!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--拿到天王遗书
			Talk(3, "L60_prise", "属下不辱使命，已经将《天王遗书》取回，请帮主过目! ", "太好了！拿到天王遗书不但可以保全本帮还阻止了一场武林浩劫！你做的很好！今天起你可以自由闯荡江湖了?", "恭喜你成功出师。你被封为惊天元帅，从今往后你可以自由闯荡江湖了！希望你可以发挥力量，发展前途!")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "想当年，楚王在洞庭湖起兵，南抗赵宋，北抵金兵，何等英雄！楚王身故后，义军残部推举我爹大圣天王为领袖，继续领导起义。义军发展迅猛，引起朝廷恐慌，派重兵前来剿灭，在那场血战中，我爹不幸被叛徒出卖，力战不屈，在青螺岛被俘牺牲", "事后，我将爹的衣冠、佩剑和一本兵书一起埋在 <color=Red>青螺岛<color>. 那本兵书名为<color=Red>'天王遗书<color>, 里面不仅记载了我爹生前行军布阵的心得与密要，而且还详细记录了洞庭湖地区的军事要地和水路要塞，因此对于本帮而言乃是一本十分重要的密书. ", "可是最近不知被谁走漏了消息，这本书被金国打探到，他们派了大量杀手前往青螺岛，想去抢夺这本书. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- 重返后的自由出入
			Say("怎么？想行走江湖一番?",2,"是的，请帮主恩准. /goff_yes","不，我自己练的功夫还不够. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--已经接到出师任务，尚未完成
			Talk(1,"","<color=Red>'天王遗书<color>被藏在一个<color=Red>宝箱里<color>, 宝箱藏在<color=Red>青螺岛北部<color>, 之前要找到<color=Red>打开宝箱的钥匙<color>.")
		else
			Talk(1,"","金国狂妄地想推翻我们中原武林，如果我们兄弟不同心，怎么能对抗敌军呢")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- 转派至少林派
--		Say("杨瑛：叛帮者要废去本帮全部武功，你真的要背弃本门投入少林派？",2,"不错，我意已决/defection_yes","不，我还是不改投少林了/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- 重返师门任务
		Talk(1,"return_select","很好！行走江湖记得要帮助困苦的人")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("你准备好5万两了吗?",2,"准备好了/return_complete","还没准备好/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--已经出师
		Talk(1,"","离开天王之后每个人仍旧像亲手足一样!")
	else
		Talk(1,"","天王帮不靠宋金任何一边也能站稳，甚至发展快速，都是因为帮众兄弟团结一心")
	end
end

---------------------- 技能调整相关 ------------------------
function check_skill()
	x = 0
	skillID = 38					-- 盘古九式
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say("为师此次闭关思考几日，创造了新招式，现在传给你。学完之后记得要静养一段时间避免损伤筋脉.",1,"多谢师父/KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- 重返任务 ----------------------
function goff_yes()
	Talk(1,"","太好了! 行走江湖要记得帮助困苦的人啊")
	SetTask(3,70*256)
	AddNote("离开天王帮，继续行走江湖")
	Msg2Player("你已离开天王帮，继续行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- 刷掉技能
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 斩龙诀
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王枪法
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王刀法
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王锤法
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 回风落雁
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 行云诀
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 无心斩
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 静心诀
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 惊雷斩
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 阳关三叠
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天王战意
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 泼风斩
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 盘古九式（已取消技能）
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 断魂剌
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 血战八方
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 金钟罩
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- 为原门派作个标记
	SetRank(79)						-- 头衔降为镇帮元帅
	if (GetRepute() < 200) then
		Msg2Player("因为行为对门派不忠，你的名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("因为行为对门派不忠，你的名望减少200点! ")
		AddRepute(-200)
	end
	AddNote("杨瑛废了你天王帮的武功，夺来你惊天元帅的职位，同时公告天下你已离开天王帮。现在你可以加入少林派. ")
	Msg2Player("杨瑛废了你天王帮的武功，夺来你惊天元帅的职位，同时公告天下你已离开天王帮。现在你可以加入少林派. ")
	Talk(1,"KickOutSelf","真遗憾，我要收回教你的武功！取消你的惊天元帅之名")
end

function defection_no()
	SetTask(7,1*256)				-- 为企图叛师作个标记，以备将来不时之需
	AddNote("你放弃加入少林. ")
	Msg2Player("你放弃加入少林. ")
end

function return_select()
	Say("对！一个人的力量有限，要团结每一个人才可以成事。本帮还有镇派绝技“金钟罩”，只传给忠诚的弟子。如何，想要回本帮吗?",2,"好的，我想回天王帮/return_yes","不，我只是随口说说. /return_no")
end;

function return_yes()
	Talk(2,"","太好了，眼下我军正和宋军交战，军费不足，你交5万两就可以回本教来学金钟罩","好的！弟子准备一下. ")
	SetTask(3,70*256+20)
	AddNote("拿出5万两军费支持天王帮就可以回来门派. ")
	Msg2Player("拿出5万两军费支持天王帮就可以回来门派. ")
end;

function return_no()
	Talk(1,"","我只是路过来看看同门而已!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- 有50000两
		Talk(1,"","很好！欢迎你回来天王帮，我封你为惊天元帅. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学会天王帮技能：天王战意，武功无心斩，血战八方，御龙诀. ")
--		end
		AddNote("回到天王帮. ")
		Msg2Faction(GetName().."回到天王帮，被封为惊天元帅")
	else
		Talk(2,"","啊？好像还不够","不好意思，我检查一下.")
	end
end;

---------------------- 出师任务 ----------------------
function L60_get()
	Say("<color=Red>'天王遗书<color> 绝对不能落到金人手中. 你立刻到 <color=Red>青螺岛<color>, 拿到<color=Red>'天王遗书<color> 回来！做得到吗?", 2, "属下定当尽心尽力/L60_get_yes", "属下恐怕不能接受这个任务/no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'天王遗书<color>藏在一个<color=Red>宝箱<color>, 宝箱藏在<color=Red>青螺岛北部<color>, 之前要找到<color=Red>开启宝箱的钥匙<color>. 你赶快坐船去<color=Red>青螺岛<color>. 记住要千万小心!")
	SetTask(3, 60*256+20)
	AddNote("在天王帮寝宫(223, 196)见杨瑛, 接受任务去青螺岛拿回天王遗书")
	Msg2Player("在天王帮寝宫(223, 196)见杨瑛, 接受任务去青螺岛拿回天王遗书")
end;

function L60_prise()
DelItem(96)
Msg2Player("恭喜你出师成功，你被封为镇邦元帅！名望增加120点")
--AddGlobalCountNews(GetName().."艺成出师，告别同门师弟开始闯荡江湖。", 1)
Msg2SubWorld("天王"..GetName().."艺成出师，告别同门兄弟继续闯荡江湖")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--玩家退出天王帮
SetCurCamp(4)
AddNote("返回天王帮寝宫，把天王遗书交给帮主杨瑛，完成出师任务。升任惊天元帅.. ")
end;

function no()
end
