-- 五毒 路人NPC 教主黑面郎君 出师任务、重返门派任务
-- by：Dan_Deng(2003-08-05)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"送生日蛋糕/#tbMasterGift:getGift('wudu')",
				"想请教其他的事情/oldMain"
			}
		Say("新年安康兴旺", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if allbrother_0801_CheckIsDialog(4) == 1 then
		allbrother_0801_FindNpcTaskDialog(4)
		return 0;
	end
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事", 2, "想请教大师/oldentence", "贺恩师礼，我已找够恩师卡和高度卡/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 3) then
		Describe("找我有什么事", 2,
			"学120级技能./lvl120skill_learn",
			"想请教别的事情/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wu = GetTask(10)
	local nFactID = GetLastFactionNumber();

	if (UTask_wu == 70*256) and (GetFaction() == "wudu") then			-- 回师错误修正
		SetFaction("")
		Say("系统发现漏洞，已及时修复!",0)
		return
	elseif (UTask_wu == 70*256) and (GetTask(2) >= 5*256) and (GetTask(2) < 10*256) then		-- 以前接过入门任务的
		SetTask(2,0)
		Say("系统发现漏洞，已及时修复!",0)
		return
	elseif (UTask_wu == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(10,70*256)
		Say("系统发现漏洞，已及时修复!",0)
		return
	elseif (GetTask(2) == 70*256) and (GetTask(10) == 70*256) then			-- 转门派错误修正
		SetTask(2,75*256)
		Say("系统发现漏洞，已及时修复!",0)
		return
	elseif (UTask_wu == 80*256 and nFactID == 3 and GetCamp() == 2 and GetFaction() == "想请教别的事") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudu");
			Say("系统发现漏洞，已及时修复!",0)
			return
		end
	elseif (UTask_wu == 70*256 and nFactID == 3 and GetCamp() ~= 4 and GetFaction() == "想请教别的事") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发现漏洞，已及时修复!",0)
			return
		end
	end
	
	local tbDes = {"带艺投师/#daiyitoushi_main(3)", "想请教其他事/common_talk"};
	
	
	Say("今日我又很多事情要解决，你来有什么事情", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wu = GetTask(10)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),10) == 0) then				-- 世界任务：武林向背
		Talk(1,"","独孤剑想联宋抗金？所言不虚？本教和金国原是密切联盟。这些势单力薄的有什么的吗")
		Uworld40 = SetBit(GetTask(40),10,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 60*256+20) and (HaveItem(222) == 1) then		-- 任务进行中
			Talk(2,"L60_prise","属下已夺来教派的宝物，请寨主看看！","好!太好了!非常好！果然没有辜负我的冀望. 真是不负五毒教派'的名号,现在你可以顺利出师了! 之后享誉武林了不要忘记本教")
		elseif (UTask_wu == 60*256) and (GetLevel() >= 50) then		--出师任务
			Say("本教和雁荡派原不共戴天。10年前本教和雁荡派进行了一次恶战。本教被暗算，本教的镇教之宝辟毒珠被雁荡派夺去，收在了雁荡山的羊角洞里。这件事一只让我耿耿于怀，实在是本教的奇耻大辱。如果你想出师的话，就去把辟毒珠给我夺回来，否则免谈。",2,"属下将竭尽全力夺回镇教之宝/L60_get_yes","弟子能力有限，恐怕不能完成这个任务! /no")
		elseif (UTask_wu == 80*256) then						-- 重返后的自由出入
			Say("你想出师是吧？时候到了！也是时候让中原人士看看本门弟子的厉害了",2,"是！多谢教主/goff_yes","弟子自认无一不精,恐怕要辜负教主了！/no")
		else
			Talk(1,"","不要看丐帮自称是武林第一帮，其实少林才是！哼，就算是第一高手也难逃过我的毒药。")
		end
--	elseif (UTask_wu == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","黑面郎君：哈哈哈哈，给我好好干，荣华富贵少不了你的！")
--	elseif (GetSeries() == 1) and (GetTask(2) == 5*256+10) and (HaveMagic(76) >= 0) then		-- 叛师入唐门，逐出五毒，收回全部技能
--		Say("黑面郎君：想入唐门？难道本门武功还不够强，你竟然想投奔唐门？",2,"弟子只是想偷学唐门绝技来为本教光大/defection_yes","对不起，弟子知错了/no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wu == 70*256) and ((GetTask(2) < 5*256) or (GetTask(2) == 75*256)) then		-- 重返师门任务
		Say("你想重返师门?此事说大也大说小也小。只要你能够清楚掌握那些规律就可以决定. ",2,"请教主照顾/return_yes","请教主让我想一下/no")
	elseif (GetCamp() == 4) and ((UTask_wu == 70*256+10) or (UTask_wu == 70*256+20)) then			-- 重返过程中。设置为70*256+20，但兼容70*256+10的值
		Say("你说的那些都已经准备好了吗",2,"准备好了/return_complete","请再给弟子一点时间 /return_uncompleted")
	else							-- 常规对话
		Talk(1,"","允许本派弟子相互自行下毒是本派内规。谁比较强就会生存下")
	end
end;

---------------------- 技能调整相关 ------------------------
--function check_skill()
--	x = 0
--	skillID = 61					-- 五毒棒法
--	i = HaveMagic(skillID)
--	if (i >= 0) then
--		x = x + 1
--		DelMagic(skillID)
--		AddMagicPoint(i)
--	end
--	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
--		Say("黑面郎君：为师这次闭关苦思数日，将本门武艺作了一番整顿，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
--		return
--	end
--end

--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("欢迎你加入五毒教,你已成为五毒教童子")
	SetRevPos(183,70)		  			--设置重生点
	SetTask(10,10*256)				-- 入门
	SetFaction("wudu")       	--玩家加入门派
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	AddMagic(63)
	Msg2Player("学到毒砂掌")
	AddNote("加入五毒教成为五毒童子学会毒沙掌")
	Msg2Faction("wudu",GetName().."离开唐门加入五毒教。门派力量更加强!",GetName())
end

--------------------- 重返门派相关 ----------------------
function goff_yes()
	Talk(1,"","好了! 出师之后在武林中不要做有损门派名誉的事情")
	SetTask(10,70*256)
	AddNote("离开五毒教，继续周游江湖")
	Msg2Player("你离开五毒教，继续周游江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_yes()
	Talk(3,"","弟子这有5000两银两。请教主笑纳","好，你这么有诚意我也就不推辞了","请准弟子去准备")
	SetTask(10,70*256+20)
	AddNote("上交50000两银两就可以返回五毒教")
	Msg2Player("上交50000两银两就可以返回五毒教")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","喂! 你现在已是本教弟子! 我将提拔你做幽冥鬼王")
		Pay(50000)
		SetTask(10,80*256)
		SetRank(80)
--		if (HaveMagic(75) == -1) then
--			AddMagic(71)
--			AddMagic(74)
--			AddMagic(75)
		add_wu(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到镇派绝学，五毒奇经，武功天罡地煞，朱蛤青冥。 ")
--		end
		SetFaction("wudu")
		SetCamp(2)
		SetCurCamp(2)
		AddNote("回到五毒教，继续练武")
		Msg2Player(GetName().."返回了五毒教,被封为幽冥鬼王. ")
	else
		Talk(2,"","想出师了, 但你明显什么都没有准备","不好意思!我检查一下.")
	end
end;

function return_uncompleted()
	Talk(1,"","快点!")
end;

---------------------- 门派任务相关 ---------------------
function L60_get_yes()
	SetTask(10,60*256+10)
	AddNote("夺来原被雁荡派抢去的镇派之宝避毒珠")
	Msg2Player("夺来原被雁荡派抢去的镇派之宝避毒珠")
end;

function L60_prise()
	Talk(1,"","属下刻骨铭心，绝不敢忘")
	SetTask(10,70*256)
	DelItem(222)
	SetRank(70)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("从雁荡派手中夺来避毒珠，送还给五毒教。完成出师任务。被封为幽冥鬼使，顺利出师")
	Msg2Player("恭喜你!已成功出师。被封为幽冥鬼使")
end;

function no()
end;
