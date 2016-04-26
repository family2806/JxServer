-- 昆仑 掌门 璇玑子 入门任务、出师任务、重返门派任务
-- by：Dan_Deng(2003-07-30)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>最近我有很多事情要做，你来有什么事?"
	G_TASK:OnMessage("昆仑", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 9) then
		tbDailog:AddOptEntry("雪120级技能.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("有什么想请教的", oldentence)
	tbDailog:Show() 
end

function oldentence()
	local UTask_kl = GetTask(9);
	local nFactID = GetLastFactionNumber();

	if (UTask_kl == 70*256) and (GetFaction() == "kunlun") then			-- 回师错误修正
		SetFaction("")
		Say("系统出现漏洞，已及时修复!",0)
		return
	elseif (UTask_kl == 70*256) and (GetTask(5) >= 5*256) and (GetTask(5) < 10*256) then		-- 以前接过入门任务的
		SetTask(5,0)
		Say("系统出现漏洞，已及时修复!",0)
		return
	elseif (UTask_kl == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(9,70*256)
		Say("系统出现漏洞，已及时修复!",0)
		return
	elseif (GetTask(5) == 70*256) and (GetTask(9) == 70*256) then			-- 转门派错误修正
		SetTask(5,75*256)
		Say("系统出现漏洞，已及时修复!",0)
		return
	elseif (UTask_kl == 80*256 and nFactID == 9 and GetCamp() == 3 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("kunlun");
			Say("系统出现漏洞，已及时修复!",0)
			return
		end
	elseif (UTask_kl == 70*256 and nFactID == 9 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统出现漏洞，已及时修复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(9)", "想请教别的事情/common_talk"};
	
	Say("近日我有很多事情要解决，你来有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_kl = GetTask(9);
	local Uworld31 = GetByte(GetTask(31),2)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),9) == 0) then				-- 世界任务：武林向背
		Talk(1,"","卿是大宋神人，抗击外侵义不容辞，但是独孤剑的岳父张风层服务于金人，只怕是难以服众")
		Uworld40 = SetBit(GetTask(40),9,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 60*256+20) and (HaveItem(16) == 1)) then	-- 出师任务完成
			Talk(2,"L60_prise","掌门！弟子经过千辛万苦最终在黄河源头找到五色石!","只希望五色石可以带给本门洪福。你可以完成这么艰巨的任务，我也感觉很欣慰。今后你可以顺利出师了")
		elseif ((UTask_kl == 60*256) and (GetLevel() >=50)) then		-- 出师任务
			Say("传说当年女娲炼五色石补天，补好之后，将余下的五色石散落在了人间，其中有一颗就落在了黄河源头。五色石象征着光明和幸福，谁得到了五色石，谁就可以趋吉避邪。如果你能为本帮找到这颗五色石，你就可以顺利出师了。",2,"弟子去找/L60_get_yes","那个故事就像瞎编的，算了. /L60_get_no")
		elseif (UTask_kl == 80*256) then						-- 重返后的自由出入
			check_skill()
			Say("你的武艺看起来也不差，有兴趣下山较量一番吗?",2,"弟子也正有此意/goff_yes","弟子想在练一段时间. /no")
		else
			Talk(1,"","做掌门一点也不简单!")
		end
	elseif (Uworld31 == 20) then		--入门任务
		Talk(4,"enroll_prise","听说你给我女儿抓了一只金丝猴?","是的!","恩，那你有什么要求?","晚辈想拜入昆仑门下学艺")
--	elseif (UTask_kl == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","璇玑子：好，好！你也转了过来，武当派无人矣！")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_kl == 70*256) and ((GetTask(5) < 5*256) or (GetTask(5) == 75*256)) then		-- 重返师门任务
		Talk(1,"return_select","师父，弟子在江湖上漂泊也有一段时间了，感觉自己见识浅薄，可以让弟子回来再入门修行武功吗?")
	elseif (GetCamp() == 4) and ((UTask_kl == 70*256+10) or (UTask_kl == 70*256+20)) then		-- 重返师门任务中
		Say("你刚刚说的做人道理是在哪里学的?",2,"准备好了/return_complete","还没准备好/return_uncompleted")
	elseif (GetTask(5) == 70*256+10) and (HaveMagic(182) >= 0) then		-- 武当重返门派，收回五雷正法
		Say("武当全是一群贪名骗人的人，白费我尽心尽力教导你，你竟然做出这种忘恩负义的事情!",2,"不错，我意已决. /defection_yes","弟子知错了. /no")
	else
		Talk(1,"","少林、武当做什么？我要将他们踩在脚下")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(275) == -1) then
--		AddMagic(275)					-- 霜傲昆仑
--		Msg2Player("你学会了“霜傲昆仑”")
--		Say("璇玑子：为师这次闭关苦思数日，新创了一招“霜傲昆仑”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("你的武艺看起来也不差，有兴趣下山较量一番吗?",2,"弟子也正有此意/goff_yes","弟子想在练一段时间. /no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("欢迎你加入昆仑，成为昆仑弟子")
	SetRevPos(131,57)		  				-- 设置重生点
	SetTask(9,10*256)						-- 入门
	SetFaction("kunlun")      			-- 玩家加入昆仑
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	AddMagic(169)
	Msg2Player("学会呼风法")
	AddNote("加入昆仑，成为昆仑弟子，学会呼风法")
	Msg2Faction("kunlun",GetName().." 从武当加入昆仑。本派力量会更强!",GetName())
end

-------------------------- 重返门派相关 ---------------------
function goff_yes()
	Talk(1,"","好了！你走吧！别忘了靠着我们你才有今天!")
	SetTask(9,70*256)
	AddNote("离开昆仑，继续漂泊江湖")
	Msg2Player("离开昆仑，继续漂泊江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_select()
	Say("这条不和门派规定。但要是你是通晓道义的人，我可以帮你想办法 ",2,"送50000两白银/return_yes","不重返师门/return_no")
end;

function return_yes()
	Talk(1,"","很好，果然是懂事，你已经悟道一些做人道理了，也要赶快准备了!")
	SetTask(9,70*256+20)
	AddNote("只要交50000两白银就可以重返师门")
	Msg2Player("只要交50000两白银就可以重返师门")
end;

function return_no()
	Talk(1,"","要是这样的话我就回江湖上继续学一段时间. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","太好了。我去通报你已经重返师门了. ")
		Pay(50000)
		SetTask(9,80*256)
		SetFaction("kunlun")
--		if (HaveMagic(275) == -1) then
--			AddMagic(182)
--			AddMagic(275)
		add_kl(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你已学会镇派绝学霜傲昆仑，五雷正法")
--		end
		SetCamp(3)
		SetCurCamp(3)
		SetRank(75)
		AddNote("回到了昆仑派，重新记门派中的名字 ")
		Msg2Player(GetName().."<#>被封为护法真君，返回昆仑继续修行. ")
	else
		Talk(2,"","只是嘴上说说，都拿不出什么具体的行动是怎么样?","不好意思，我立刻去赚钱!")
	end
end;

function return_uncompleted()
	Talk(1,"","总是这样阴阴郁郁的，让人怎么相信你的诚意呢!")
end;

----------------------- 门派任务相关 -------------------
function enroll_prise()
	Talk(1,"","想要入门的话只做这么小的事是不够的，但是看你聪明伶俐，本作就准你当记名弟子了! ")
	i = ReturnRepute(30,29,3)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld31 = SetByte(GetTask(31),2,127)
	SetTask(31,Uworld31)
	AddNote("<#>完成金丝猴任务，成为<color=Red>记名弟子<color>. 你的声望增加"..i.."<#>点.")
	Msg2Player("完成金丝猴任务，成为记名弟子")
end;

function L60_get_yes()
	SetTask(9,60*256+10)
	AddNote("接受出师任务：到黄河源头找五色石")
	Msg2Player("接受出师任务：到黄河源头找五色石")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(1,"","多谢掌门! ")
	DelItem(16)
	SetRank(65)
	SetTask(9, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("完成出师任务，被封为仙符真君")
	Msg2Player("恭喜你！成业出师。被封为仙符真君")
end;
