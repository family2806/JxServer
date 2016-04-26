-- 丐帮 帮主何人我　10级任务、50级任务、重返师门任务
-- by：Dan_Deng(2003-07-28)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事?", 2, "想请教大师/oldentence", "恩师节，在下已找够恩师卡，高徒卡/vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>最近我有很多事要解决，你来这有什么事?"
	G_TASK:OnMessage("丐帮", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 6) then
		tbDailog:AddOptEntry("学到120技能.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("想请教其他事", oldentence)
	tbDailog:Show() 
end
	

function oldentence()
--	check_skill()
	local UTask_gb = GetTask(8)
	local nFactID = GetLastFactionNumber();

	if (UTask_gb == 70*256) and (GetFaction() == "gaibang") then			-- 回师错误修正
		SetFaction("")
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_gb == 70*256) and (GetTask(4) >= 5*256) and (GetTask(4) < 10*256) then		-- 以前接过入门任务的
		SetTask(4,0)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_gb == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(8,70*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (GetTask(4) == 70*256) and (GetTask(8) == 70*256) then			-- 转门派错误修正
		SetTask(4,75*256)
		Say("系统发生错误，已及时恢复!",0)
		return
	elseif (UTask_gb == 80*256 and nFactID == 6 and GetCamp() == 1 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("gaibang");
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	elseif (UTask_gb == 70*256 and nFactID == 6 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发生错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(6)", "想请教其他事/common_talk"};
	
	Say("最近我有很多事要解决，你找我有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_gb = GetTask(8)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),8) == 0) then				-- 世界任务：武林向背
		Talk(1,"","丐帮和金国不共戴天，而且盟主有令，在下不能不从。请你回去转告：丐帮上下将听你的.")
		Uworld40 = SetBit(GetTask(40),8,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 50*256+60) then		-- 50级任务完成
			Talk(1,"L50_prise","事情就是这样，弟子已经将《中原地形图》交给了张大人，请他面呈皇上.")
		elseif ((UTask_gb == 50*256+10) or (UTask_gb == 50*256+20)) and (HaveItem(199) == 0) then		--任务中，道具丢了
			Talk(2,"","你怎么这样苟且，我说了多少遍了，要你小心拿好地图，怎么能弄丢了？!","这里还有一副，这次要更加小心，不要发生什么事!")
			AddEventItem(199)
		elseif ((UTask_gb == 50*256) and (GetLevel() >= 50)) then		--50级任务启动
			Say("这个锦盒里是一张描述中原的地图，需要你带到临安给朝廷，你同意去吗?",2,"同意 /L50_get_yes","弟子还很差劲，不能担任此事!/no")
		elseif (UTask_gb == 10*256+40) and (HaveItem(76) == 1) and (HaveItem(77) == 1) and (HaveItem(78) == 1) and (HaveItem(79) == 1) and (HaveItem(80) == 1) then
			L10_prise()
		elseif (UTask_gb == 10*256) and (GetLevel() >= 10) then		--10级任务启动
			Talk(3,"L10_get","人活在世上，不要冤冤相报，丰衣足食过日子就好了!","帮主，是不是你喝醉了?","哈哈哈，越醉我越醒，我是谁？谁是我？哈哈哈!")
		elseif (UTask_gb == 80*256) then						-- 重返后的自由出入
			Say("我叫花子志在四方，你不要整天坐在那里!",2,"是，弟子想词汇江湖锻炼!/goff_yes","弟子觉得自己武艺差劲，还不能出师/no")
		elseif (UTask_gb > 10*256) and (UTask_gb < 20*256) then		--10级任务进行时的普通对话
			Talk(1,"","怎么酒还没带来？快点，快点!")
		else
			Talk(1,"","圣人多烦恼，只有我才快乐.")
		end
--	elseif (UTask_gb == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","何人我：很好，弃暗投明更是大智大勇。到抗金前线上去证明你的赤胆忠心吧！")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_gb == 70*256) and ((GetTask(4) < 5*256) or (GetTask(4) == 75*256)) then		-- 重返师门任务
		Talk(3,"return_sele","外面的叫花子废话真多","当然，给人饭吃需要有点什么，理所当然了!","经常不给他们饭吃，还要他们出去!")
	elseif (GetCamp() == 4) and ((UTask_gb == 70*256+10) or (UTask_gb == 70*256+20)) then		-- 重返师门任务中
		Say("5 万两准备好了吗?",2,"已准备好了/return_complete","还未准备好/return_uncompleted")
--	elseif (GetTask(4) == 70*256+10) and (HaveMagic(128) >= 0) then		-- 天忍重返门派，收回亢龙有悔
--		Say("何人我：本帮与金国誓不两立，你竟想背弃本教投靠金国？",2,"属下心意已决/defection_yes","对不起，属下知错了/no")
	else
		Talk(1,"","圣人多烦恼，只有我才快乐.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()		-- 目前没有玩家变动修改需求，没有60级技能
	x = 0
	skillID = 121					-- 
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say("为师需要闭关冥想，今天把本教武艺绝学传与你，学完要休息一下，防止损伤经脉.",1,"多谢师父 /KickOutSelf")
	else
		return
	end
end

--------------------- 转门派相关 ------------------------
function defection_complete()
	SetRevPos(115,53)		  			--等待提供重生点
	SetTask(8, 10*256)				-- 直接入门
	SetFaction("gaibang")       			--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	AddMagic(117)
	Msg2Player("欢迎你加入丐帮，成为无袋弟子!")
	Msg2Player("学到见人伸手，沿门托钵")
	AddNote("加入丐帮，成为无袋弟子，学到见人神守，沿门托钵")
	Msg2Faction("gaibang",GetName().."有天忍教人加入丐帮，丐帮更加强大",GetName())
end

--------------- 重返师门相关 ------------------------
function goff_yes()
	Talk(1,"","好，记住，遇到不平之事，需要出手相助!")
	SetTask(8,70*256)
	AddNote("离开丐帮，继续行走江湖")
	Msg2Player("你离开丐帮，行走江湖 ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("哈哈，快返回本帮吧，大家可以一起吃饭，每人生气，怕什么.",2,"多次额帮助/return_yes","不用!/return_no")
end;

function return_yes()
	Talk(2,"","纸在本帮支出大费用，经常不够运转，你要重返本派需要捐助50000两.","好，弟子准备钱去了.")
	SetTask(8,70*256+20)
	AddNote("交50000两，重返丐帮.")
	Msg2Player("交50000两，重返丐帮.")
end;

function return_no()
	Talk(1,"","师傅，我感觉活在世上要建业，不能靠他人施舍活在。所以，我不想回来了.")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","哈哈，没想到你准备了我说的钱数，很好。我作为帮主，让你重返本帮，同时，担任九大长老职务.")
		Pay(50000)
		SetTask(8,80*256)
		SetFaction("gaibang")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(78)
--		if (HaveMagic(130) == -1) then
--			AddMagic(360)
--			AddMagic(130)
		add_gb(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到绝学醉蝶狂舞，逍遥功")
--		end
		AddNote("允许返回丐帮")
		Msg2Player(GetName().."重返丐帮，被封为九大长老")
	else
		Talk(2,"","不要认为我罪了，银两我看得很清楚，这里不够5万两","对不起，是我数错了，让我检查一下.")
	end
end;

function return_uncompleted()
	Talk(1,"","5万两不是小数，你慢慢来，没事!")
end;

---------------- 门派任务相关 -----------------------
function L10_get()
	Say("接受10级任务，去买5种酒，惠泉酒，金陵春，百花让，琼花露，双钩大曲.",2,"去买酒/L10_get_yes","假装听不到/no")
end;

function L10_get_yes()
	SetTask(8,10*256+10)
	AddNote("接受10级任务，去买5种酒，惠泉酒，金陵春，百花让，琼花露，双钩大曲回去给帮主 ")
	Msg2Player("接受10级任务，去买5种酒，惠泉酒，金陵春，百花让，琼花露，双钩大曲回去给帮主")
end;

function L10_prise()
	Talk(2,"","帮主，我的酒买回来了!","很好，兄弟一起喝")
	DelItem(76)
	DelItem(77)
	DelItem(78)
	DelItem(79)
	DelItem(80)
	SetTask(8,20*256)
	SetRank(38)
--	AddMagic(116)
--	AddMagic(115)
	add_gb(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("买够5种酒，完成10级任务，变成执大弟子")
	Msg2Player("恭喜，被封为执袋大弟子。学到丐帮掌法，丐帮棒法.")
end;

function L50_get_yes()
	Talk(1,"","这个中原地图关系重大，小心不要落入金人之手!")
	SetTask(8,50*256+10)
	AddEventItem(199)
	AddNote("接受50级任务，送中原地图给朝廷.")
	Msg2Player("接受50级任务，送中原地图给朝廷.")
end;

function L50_prise()
	Talk(1,"","帮主：你做的很好，希望此事能帮助抗金!")
	SetTask(8,60*256)
	SetRank(42)
--	AddMagic(128)
--	AddMagic(125)
	add_gb(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜。被封为大龙头，学到亢龙有悔，棒打恶狗工夫.")
	AddNote("成功交中原地图给张俊，完成50级任务。成为大龙头.")
end;

function no()
end;
