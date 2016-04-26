--description: 武当派道一真人　武当10级任务、40级任务、出师任务、重返门派任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- 修改Dan_Deng的错误：QBJ
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
				"送春节饼 /#tbMasterGift:getGift('wudang')",
				"想请教其他事/oldMain"
			}
		Say("新年安康兴旺", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事 ", 2, "想请教大师 /oldentence", "祝贺恩师节，在下已找够恩师卡和高徒卡/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 8) then
		Describe("找我有什么事 ", 2,
			"学120技能./lvl120skill_learn",
			"想请教其他事/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wd = GetTask(5)
	local nFactID = GetLastFactionNumber();

	if (UTask_wd == 70*256) and (GetFaction() == "wudang") then			-- 回师错误修正
		SetFaction("")
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_wd == 70*256) and (GetTask(9) >= 5*256) and (GetTask(9) < 10*256) then		-- 以前接过入门任务的
		SetTask(9,0)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_wd == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(5,70*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_wd == 80*256 and nFactID == 8 and GetCamp() == 1 and GetFaction() == "刚入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudang");
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	elseif (UTask_wd == 70*256 and nFactID == 8 and GetCamp() ~= 4 and GetFaction() == "刚入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(8)", "想请教其他事/common_talk"};
	
	Say("最近我有很多事要解决，你来这有什么事 ", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wd = GetTask(5)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),5) == 0) then				-- 世界任务：武林向背
		Talk(1,"","现在盟主以天下大义的名义邀请，武当派不能不到。传话给独孤盟主：武当派遵从盟主的安排")
		Uworld40 = SetBit(GetTask(40),5,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 60*256+20) and (HaveItem(69) == 1 and HaveItem(70) == 1 and HaveItem(71) == 1) then
			Talk(2, "L60_prise", "可以忧天下之忧，就是侠了。现在时势纷乱，战争，疾病、暴权、生灵涂炭，你可以按民意去做，将所学武艺造福百姓", "恭喜你艺成出师！你已被封为武当派的玄武神侍，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行剑客也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图")
		elseif (UTask_wd == 60*256) and (GetLevel() >= 50) then					--出师任务
			Say("在后山<color=Red>太子岩<color>上有<color=Red>三个宝箱<color>，每个宝箱都用一道符咒封印着，如果你能完成符咒上面注明的任务，就可以打开宝箱，宝箱里藏有本派的<color=Red>三件宝物<color>，能够取得宝物者方能出师!", 2, "接受任务/L60_get_yes", "暂不出师/L60_get_no")
		elseif ((UTask_wd == 40*256+60) or (UTask_wd == 40*256+80)) and (HaveItem(164) == 1) then		--40级任务完成
			Talk(3, "L40_prise", " 师父，弟子代周师兄去了一趟伏牛山，把信交给了润娘，这是她的回信!", "原来如此……这件事情你不要对旁人谈起，记住了吗?", " 弟子明白")
--		为计时器错误打补丁，变量值为35、未学武当剑法(151)的，也可以接10级任务（已取消）
--		elseif ((UTask_wd == 10*256) or (((UTask_wd == 35) or (UTask_wd >= 20*256)) and (HaveMagic(151) == -1))) and (GetLevel() >= 10) and (GetFaction() == "wudang") then
		elseif (UTask_wd == 10*256) and (GetLevel() >= 10) then
			Talk(1,"","凡我武当弟子，都应熟读<color=Red>《道德经》<color>。你先去好好请教一下<color=Red>叶继美<color>师叔，读熟了《道德经》之后再来找为师")
			SetTask(5, 10*256+20)
			AddNote("在紫宵殿见道一真人，接道德经任务，找叶继美学道德经. ")
			Msg2Player("在紫宵殿见道一真人，接道德经任务，找叶继美学道德经. ")
		elseif (UTask_wd == 10*256+50) then					--10级任务
			Talk(1,"L10_Q1","记熟了吗？为师要考考你，听清楚了")
		elseif (UTask_wd == 10*256+60)  then
			L10_Q2()
		elseif (UTask_wd == 10*256+70)  then
			L10_Q3()
		elseif (UTask_wd == 80*256) then						-- 重返后的自由出入（新加技能）
			check_skill()
		elseif (UTask_wd == 10*256+20) then
			Talk(1,"","凡我武当弟子，都应熟读<color=Red>《道德经》<color>。你先去好好请教一下<color=Red>叶继美<color>师叔，读熟了《道德经》之后再来找为师")
		elseif (UTask_wd > 60*256) and (UTask_wd < 70*256) then					--尚未完成出师任务
			Talk(1,"","你必须打开后山<color=Red>太子岩<color>上的<color=Red>三个宝箱<color>，拿到里面的<color=Red>三件宝物<color>，才能顺利出师!")
		elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--已经完成40级任务，尚未接到出师任务
			Talk(1,"","润娘的事情你不要对旁人谈起，记住了吗?")
		else					--已经完成10级任务，尚未完成40级任务（缺省对话）
			Talk(1,"","做人能够结为兄弟朋友，都是缘分")
		end
--	elseif (GetTask(9) == 5*256+10) then		-- 转门派到昆仑
--		Say("道一真人：昆仑派门风不正，况且为免疑虑，转门派的话我必须收回你所有本派武艺。你真的执意要入昆仑？",2,"不错，我意已决/defection_yes","那我还是不去了/defection_no")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wd == 70*256) and (GetTask(9) < 5*256) then		-- 重返师门任务
		Talk(2,"return_select","下山这些日子，你感觉怎么样?","漂泊江湖多日，才知道自己的武功真是差劲")
	elseif (GetCamp() == 4) and ((UTask_wd == 70*256+10) or (UTask_wd == 70*256+20)) then		-- 重返师门任务中
		Say("准备好五万两了吗?",2,"准备好了/return_complete","还没准备好/return_uncompleted")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","你虽已出师，为师仍有几句话相赠：对于习武之人，武道固然重要，武德更需用心修养。武德不佳者，终不能达到武学真境，望你好自为之!")
	else
		Talk(1,"","武学有道，步上正道，方能有所大成，倘若误入歧途，无异于南辕北辙")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(267) == -1) then
--		AddMagic(267)					-- 三环套月
--		Msg2Player("你学会了“三环套月”")
--		Say("道一真人：为师这次闭关苦思数日，新创了一招“三环套月”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("你的武艺已经进步很大，可以下山试炼了!",2,"是，弟子这就去/goff_yes","弟子练习还不够 /no")
--	end
end

-------------------------- 重返门派相关 ---------------------
function goff_yes()
	Talk(1,"","好，记住本派宗旨：常做善事，帮助贫弱者")
	SetTask(5,70*256)
	AddNote("离开武当派，行走江湖")
	Msg2Player("离开武当派，行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=153; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 怒雷指
	i=151; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 武当剑法
	i=152; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 武当拳法
	i=155; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 沧海明月
	i=156; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 纯阳心法
	i=157; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 坐忘无我
	i=158; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 剑飞惊天
	i=159; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 七星阵
	i=160; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 梯云纵
	i=161; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 两仪心法
	i=162; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 玄一无象
	i=164; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 剥及而复
	i=165; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 无我无剑
	i=166; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 太极神功
	i=267; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 三环套月
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(9,5*256+20)
	SetTask(5,75*256)				-- 为原门派作个标记
	SetRank(63)
	if (GetRepute() < 200) then
		Msg2Player("由于行为与门派不忠，你的名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("由于行为与门派不忠，你的名望减少200点! ")
		AddRepute(-200)
	end
	AddNote("收回武当武功，放弃玄武真人职位。你可以加入昆仑派. ")
	Msg2Player("收回武当武功，放弃玄武真人职位。你可以加入昆仑派. ")
	Talk(1,"KickOutSelf","既然如此，我就得收回你学的武功!")
end

function defection_no()
	AddNote("你放弃返回昆仑派的想法. ")
	Msg2Player("你放弃返回昆仑派的想法. ")
	SetTask(9,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_select()
	Say("有很多人研究和发扬本门武功，怎么样？你有兴趣和我一起研究武学最高境界吗?",2,"弟子希望可以一起研究武学 /return_yes","不需要/return_no")
end;

function return_yes()
	Talk(1,"","武当山有很多游客来参观，山路也因此损坏很多，为了考验你，你可以捐5万两维修山路吗？ ")
	SetTask(5,70*256+20)
	AddNote("交5万两可以返回武当派. ")
	Msg2Player("交5万两可以返回武当派. ")
end;

function return_no()
	Talk(1,"","多谢掌门的好意，但是，现在魔教盛行，生灵涂炭，弟子怎么能袖手旁观?")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","很好，我将出通报说你返回门派了!")
		Pay(50000)
		SetTask(5, 80*256)
		SetFaction("wudang")
--		if (HaveMagic(166) == -1) then
--			AddMagic(165)
--			AddMagic(267)
--			AddMagic(166)
		add_wd(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到镇派绝学，太极神功，无我无剑，三环曹月. ")
--		end
		SetCamp(1)
		SetCurCamp(1)
		SetRank(73)
		AddNote("已返回武当派 ")
		Msg2Player(GetName().."被封为武当派玄武真君，继续留在武当派修炼. ")
	else
		Talk(2,"","好像不是很够!","对不起，我检查一下!")
	end
end;

function return_uncompleted()
	Talk(1,"","加油!")
end;

------------------- 10级任务 --------------------
function L10_Q1()
	Say("道德经》第1章的开篇第一句话是什么?", 3, "道生一，一生二，二生三，三生万物/no", "人法地，地法天，天法道，道法自然/no", "道可道，非常道；名可名，非常名/L10_Q2")
end;

function L10_Q2()
	SetTask(5,10*256+60)
	Say("下一个问题：“大象无形”的“大象”是指的什么?", 3, "一种动物/no", "最大的形状/L10_Q3", "太像了/no")
end;

function L10_Q3()
	SetTask(5,10*256+70)
	Say("最后一个问题：“知人者智，自知者明”的后面一句是什么?", 3, "大直若曲，大巧若拙/no", "胜人者有力，自胜者强//L10_prise", "祸兮，福之所倚；福兮，祸之所伏/no")
end;

function no()
	Talk(1,"","看来你没有下苦功啊，读熟了《道德经》以后再来吧!")
end;

function L10_prise()
	Talk(1,"","看来你的确下了一番功夫，很好!")
	SetRank(8)
	SetTask(5, 20*256)
--	AddMagic(152)
--	AddMagic(151)
	add_wd(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("回紫宵大殿回答正确3个问题，完成道德经任务，成为闲散道人. ")
	Msg2Player("恭喜你成为闲散道人，学到武当拳法，武当剑法. ")
end

----------------------- 40级任务 -----------------------
function L40_prise()
	DelItem(164)
	SetRank(11)
	SetTask(5, 50*256)
--	AddMagic(160)
	add_wd(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你成为入关道人，学到武当派绝学齐云松. ")
	AddNote("到紫宵大殿交润娘的信给道一真人，完成任务，成为入关道人. ")
end;

------------------------- 出师任务 -------------------------
function L60_get_yes()
Say("你必须打开后山<color=Red>太子岩<color>上的<color=Red>三个宝箱<color>，拿到里面的<color=Red>三件宝物<color>，才能顺利出师!", 0);
SetTask(5, 60*256+20)	
AddNote("在紫宵大殿见道一真人，接出师任务，去后山太子岩拿三个宝箱里的三件宝物. ")
Msg2Player("在紫宵大殿见道一真人，接出师任务，去后山太子岩拿三个宝箱里的三件宝物. ")
end;

function L60_get_no()
	Talk(1,"","也好，那就在武当山多留些日子吧!")
end;

function L60_prise()
	DelItem(69)
	DelItem(70)
	DelItem(71)
--	AddGlobalCountNews(GetName().."艺成出师，告别各位师弟师妹出山闯荡江湖！", 1)
	Msg2SubWorld("武当派弟子"..GetName().."出师成功，告别师兄师妹出山行侠仗义! ")
	SetRank(63)
	SetTask(5, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("回紫宵大殿，把三本真经交给掌门道一真人，完成出师任务，顺利出师 ")
	Msg2Player("恭喜你出师，被封为玄武神侍，你的名望增加120点! ")
	AddRepute(120)
end;

function no()
end
