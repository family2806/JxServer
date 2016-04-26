--description: 天忍教教主完颜宏烈　天忍教出师任务、重返门派任务
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"送春饼/#tbMasterGift:getGift('tianren')",
				"想请教其他事/oldMain"
			}
		Say("新年安康兴旺", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事?", 2, "想请教大师/oldentence", "庆祝恩师节，在下已找够恩师卡和高手卡 /vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 7) then
		Describe("找我有什么事？ ", 2,
			"学120技能./lvl120skill_learn",
			"想请教其他事/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_tr = GetTask(4);
	local nFactID = GetLastFactionNumber();

	if (UTask_tr == 70*256) and (GetFaction() == "tianren") then			-- 回师错误修正
		SetFaction("")
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tr == 70*256) and (GetTask(8) >= 5*256) and (GetTask(8) < 10*256) then		-- 以前接过入门任务的
		SetTask(8,0)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tr == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(4,70*256)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tr == 80*256 and nFactID == 7 and GetCamp() == 2 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianren");
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	elseif (UTask_tr == 70*256 and nFactID == 7 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(7)", "想请教其他事/common_talk"};
	
	Say("最近我很忙，你来这有什么事？", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tr = GetTask(4);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),4) == 0) then				-- 世界任务：武林向背
		Talk(1,"","独孤剑失去理智啊？本教本是大金国教，独孤剑派人来问老妇此事。好，你和独孤剑说，你们只是一群乌合之众，敢与大金反抗，先考虑后世再说，哈哈哈!")
		Uworld40 = SetBit(GetTask(40),4,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 60*256) and (GetLevel() >= 50) then		-- 出师任务启动
			Say("本教圣书乃是一卷记载有金国国教——萨满教经文的<color=Red>羊皮书<color>，这卷羊皮书被上任教主封存在了后面的<color=Red>圣洞<color>里，据说凡是闯入圣洞者都有去无回。你身为本教的护教法王，有胆量进入圣洞取回羊皮书吗？", 2, "属下责无旁贷 /L60_get_yes", "属下恐难当此大任/L60_get_no")
		elseif (UTask_tr == 60*256+20) and (HaveItem(127) == 1 and HaveItem(128) == 1 and HaveItem(129) == 1 and HaveItem(130) == 1 and HaveItem(131) == 1) then 
			DelItem(127)
			DelItem(128)
			DelItem(129)
			DelItem(130)
			DelItem(131)
			SetTask(28,0)		-- 将子变量复位，圣洞中再继续使用
			SetTask(4,60*256+50)		-- 拿齐五把断剑后先找完颜洪烈才能进圣洞，简化程序处理。
			AddNote("找到5把断剑后，回天忍教，进圣洞. ")
			Msg2Player("你已经能进入圣洞")
			Talk(1,"","很好，现在你可以进圣洞拿羊皮卷回来.")
		elseif (UTask_tr == 60*256+70) and (HaveItem(132) == 1) then		-- 出师任务完成
			Talk(2, "L60_prise", "这果然就是本教的圣书！好！好！老夫不会看错人，以你目前的武功和胆识，假以时日，必会有一番惊天动地的大作为！希望你出师以后，不会成为老夫的敌人！哈哈哈哈!", "恭喜你艺成出师！你已被封为天忍教的萨满法王，从今以后可以自由行走江湖啦，希望你能大展拳脚，一展鸿图!")
		elseif (UTask_tr == 80*256) then						-- 重返后的自由出入
			check_skill()
		elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then					--已经接到出师任务，尚未拿到五把断剑
			Talk(1,"","在进入<color=Red>圣洞<color>取回<color=Red>羊皮书<color>之前，你必须先找到流落在<color=Red>汴京<color>城里的<color=Red>五把断剑<color> .")
		elseif (UTask_tr >= 60*256+50) and (UTask_tr <= 60*256+70) then					--已经接到出师任务，尚未拿到羊皮书
			Talk(1,"","<color=Red>羊皮书<color>就在后面的<color=Red>圣洞<color>里.")
		else
			Talk(1,"","自古以来，位高权重者多为人主所忌，当今圣上虽然对老夫恩宠有加，但是猜忌之心恐怕从未消失过，否则又怎会把七公主派到教中做一个小小的堂主呢？唉！罢！罢！罢！老夫只求无愧于天地良心，管不了那许多谗言的诽谤诋毁!")
		end
--	elseif (GetTask(8) == 5*256+10) then		-- 转门派到丐帮
--		Say("完颜洪烈：丐帮与本帮誓不两立，你竟想背弃本教改投丐帮？小心我废了你的功夫！",2,"对不起，但吾意已决/defection_yes","我还是不去了/defection_no")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tr == 70*256) and (GetTask(8) < 5*256) then		-- 重返师门任务
		Talk(1,"return_sele","教主，出师后的人可以返回门派继续奉事吗?")
	elseif (GetCamp() == 4) and ((UTask_tr == 70*256+10) or (UTask_tr == 70*256+20)) then		-- 重返师门任务中
		Say("准备好五万两了吗?",2,"准备好了/return_complete","还未准备好/return_uncompleted")
	elseif (UTask_tr >= 70*256) then							--已经出师
		Talk(1,"","到底是后生可畏啊！以你目前的武功和胆识，假以时日，必会有一番惊天动地的大作为！希望日后你我不会成为敌人!")
	else
		Talk(1,"","只要是青年才俊想加入本教，本教都十分欢迎.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(150) == -1) then
--		AddMagic(142)
--		AddMagic(148)
--		AddMagic(150)
--		AddNote("你学会了镇派绝学天魔解体、武功偷天换日、魔焰七杀。")
--		Msg2Player("你学会了镇派绝学天魔解体、武功偷天换日、魔焰七杀。")
--		Say("完颜宏烈：为师这次闭关苦思数日，改进了本门武功，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("你想去南朝打探消息吗?",2,"可以属下也想侵入江湖一派. /goff_yes","属下感觉练习不够/no")
--	end
end

----------------------- 重返门派相关 --------------------
function goff_yes()
	Talk(1,"","很好，技能不要落入南朝的诱惑. ")
	SetTask(4,70*256)
	AddNote("离开天忍教，继续行走江湖")
	Msg2Player("你离开天忍教，继续行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=135; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 残阳如血
	i=131; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍刀法
	i=132; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍矛法
	i=134; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍锤法
	i=136; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 火莲焚华
	i=137; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 幻影飞狐
	i=138; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 推山填海
	i=139; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 浑水摸鱼
	i=140; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 飞鸿无迹
	i=141; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 烈水睛天
	i=142; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 偷天换日
	i=143; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 厉魔夺魂
	i=145; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 弹指烈焰
	i=146; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 五行阵
	i=147; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 玄冥吸星
	i=148; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 七杀神拳
	i=149; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 蚀骨血刃
	i=150; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天魔解体
	i=254; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 三味真火
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(8,5*256+20)
	SetTask(4,75*256)				-- 为原门派作个标记
	SetRank(71)
	if (GetRepute() < 200) then
		Msg2Player("因为行为与门派不忠，名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("因为行为与门派不忠，名望减少200点! ")
		AddRepute(-200)
	end
	AddNote("放弃天忍教的技能和称号后，现在你可以加入丐帮了. ")
	Msg2Player("放弃天忍教的技能和称号后，现在你可以加入丐帮了. ")
	Talk(1,"KickOutSelf","既然如此，请废除武功，你想怎么样都行. ")
end

function defection_no()
	AddNote("你放弃加入丐帮. ")
	Msg2Player("你放弃加入丐帮. ")
	SetTask(8,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_sele()
	Say("你说想返回本教?",2,"遵命!/return_yes","不. /return_no")
end;

function return_yes()
	Talk(2,"","想到本教艰苦的发展过程，本教规定返回本教需要交5万两 ","好，弟子已带了5万两.")
	SetTask(4,70*256+20)
	AddNote("交五万两返回天忍教. ")
	Msg2Player("交五万两返回天忍教. ")
end;

function return_no()
	Talk(1,"","以后返回来服务本教，现在还有未做完的事. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","很好，你已成为本教记名弟子，我会向本教圣教长老提拔你，不要让我失望.")
		Pay(50000)
		SetFaction("tianren")	
		SetCamp(2)
		SetCurCamp(2)
		SetRank(81)
		SetTask(4, 80*256)
--		if (HaveMagic(150) == -1) then
--			AddMagic(142)
--			AddMagic(148)
--			AddMagic(150)
		add_tr(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你已学到镇派绝学：天魔解体，游天换日，魔焰七杀. ")
--		end
		AddNote("返回天忍教")
		Msg2Player(GetName().."返回天忍教，被封为圣教长老. ")
	else
		Talk(2,"","怎么了？你只带这么多银两?","对不起，让我检查一下.")
	end
end;

function return_uncompleted()
	Talk(1,"","快点!")
end;

----------------------- 出师任务 ------------------------
function L60_get_yes()
	Talk(1,"","老夫果然没有看走眼，你倒是有些胆识！不过在进入圣洞之前，你必须先找到流落在<color=Red>汴京<color>里的<color=Red>五把断剑<color> .")
	SetTask(4, 60*256+20)
	AddNote("见完颜洪烈，接出师任务，首先要去汴京找五把断剑. ")
	Msg2Player("见完颜洪烈，接出师任务，首先要去汴京找五把断剑. ")
end;

function L60_get_no()
	Talk(1,""," 难道你不注重名声吗?")
end;

function L60_prise()
	DelItem(132)
--	AddGlobalCountNews(GetName().."艺成出师，告别各位教友南下江湖。", 1)
	Msg2SubWorld("天忍教信徒"..GetName().."出师成功，告别各位教友返回南方. ")
	SetRank(71)
	SetTask(28,0)		-- 将子变量复位
	SetTask(4, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("返回天忍教，把羊皮卷给完颜洪烈，完成出师任务，升为萨满法王 ")
	Msg2Player("恭喜你艺成出师！你已被封为天忍教的萨满法王，名望增加120点! ")
	AddRepute(120)
end;

function no()
end
