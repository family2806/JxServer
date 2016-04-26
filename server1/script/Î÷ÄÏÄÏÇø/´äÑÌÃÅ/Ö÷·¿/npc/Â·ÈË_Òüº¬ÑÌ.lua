-- 翠烟门 掌门尹含烟 10级任务、50级任务、出师任务、重返师门任务
-- by：Dan_Deng(2003-07-25)
-- Update: Dan_Deng(2003-09-24)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\item\\skillbook.lua")

function main()
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 5) then
		Describe("找我有什么事 ", 2,
			"学120级技能./lvl120skill_learn",
			"想请教其他事/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_cy = GetTask(6)
	local nFactID = GetLastFactionNumber();

	if (UTask_cy == 70*256) and (GetFaction() == "cuiyan") then			-- 回师错误修正
		SetFaction("")
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_cy == 70*256) and (GetTask(1) >= 5*256) and (GetTask(1) < 10*256) then		-- 以前接过入门任务的
		SetTask(1,0)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_cy == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(6,70*256)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (GetTask(1) == 70*256) and (GetTask(6) == 70*256) then			-- 转门派错误修正
		SetTask(1,75*256)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_cy == 80*256 and nFactID == 5 and GetCamp() == 3 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("cuiyan");
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	elseif (UTask_cy == 70*256 and nFactID == 5 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(5)", "想请教其他事/common_talk"};
	
	Say("最近我很忙，你来这有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_cy = GetTask(6)
	local Uworld51 = GetTask(51)
	local Uworld126 = GetTask(126)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),6) == 0) then				-- 世界任务：武林向背
		Talk(1,"","独孤盟主有令，我怎么敢不从。但是本门都是女流之辈，恐怕不行。请回报独孤盟主，本门一定支持各位英雄，祝各位旗开得胜!")
		Uworld40 = SetBit(GetTask(40),6,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 10) then			-- 洗清冤屈任务进行中
		Talk(5,"Uworld51_20","唐一尘让我带口信，我父亲不懂为什么突然反对我们两的婚事，婚事有点困难，但是你不用担心.","一尘 ","哦...不要哭了，事情不一定这样的，只要我们真心，就一定能过得了困难，走到一起","唐一尘很爱你，我一定问清楚后回答你.")
	elseif (Uworld51 == 100) then			-- 洗清冤屈任务完成
		Talk(3,"Uworld51_prise"," 原来如此，你因为一尘和我这么辛苦，不懂怎么报答你，请收下!","这是什么 ","这个是仙师留给我的，可以舒筋活血，可以增加功力!")
	elseif (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- 任务相关以及门派对话
		if (UTask_cy == 10*256+10) and (HaveItem(0) == 1) then		-- 10级任务完成
			Talk(2,"L10_prise","掌门，弟子已帮你找回翠舞簪了! ","太好了，你找到了啊.")
		elseif (UTask_cy == 10*256) and (GetLevel() >= 10) then		--10级任务启动
			Say("真是心疼，昨天去东南边的小树林散步，丢了我最喜欢的翠舞簪!",2,"我帮你去找/L10_get_yes","假装没听到/no")
		elseif (UTask_cy == 50*256+50) then		--完成50级任务
			Talk(1,"L50_prise","弟子按师命，帮助崇圣寺找回了梧桐观音，方丈大师让我传话给你，感谢师傅")
		elseif (UTask_cy == 50*256) and (GetLevel() >= 50) then			--50级任务启动
			Say("虚圆方丈是我的好友，他刚刚派人来说小偷偷走了梧桐观音，被发现后，就跑进天蚕塔。小偷的武艺高强，僧人无人能及，所以，派人来本门求助，你同意去崇圣寺帮忙吗？?",2,"没问题，我去 /L50_get_yes","弟子武功还不好，恐怕不能去/no")
		elseif (UTask_cy == 60*256+30) then							--出师任务完成
			L60_prise()
		elseif (UTask_cy == 80*256) then						-- 重返后的自由出入
			check_skill()
		elseif (UTask_cy >10*256) and (UTask_cy < 20*256) then		-- 10级任务中
			Talk(1,"","还没找到翠舞簪吗?")
		elseif (UTask_cy > 50*256) and (UTask_cy < 60*256) then		-- 50级任务中
			Talk(1,"","抓到小偷了吗?")
		elseif (UTask_cy >= 60*256) then		-- 完成50级任务后的常规对话
			Talk(1,"","崇圣寺的事你决定的很对，不久前，虚圆方丈来看你了.")
		else		-- 门派内其它状态下常规对话
			Talk(1,"","你的武功进步很快，但是也不要自满，需要继续修炼才行.")
		end
	elseif (Uworld126 == 20) then			-- 90级技能任务
		Talk(5,"Uworld126_talk","尹姑娘!","你有什么事?","在下得到段思成的帮助，想让两人和好，但是郦姑娘太固执了."," 哦，秋水太固执。那时，段公子是个人才，对她真心真意，遗憾的是公子在家里又是独尊，怎么能加入翠烟门呢？如今想和好，真是难啊。我劝不了郦姑娘，希望你找办法。 .","原来如此，在下会努力的.")
	elseif (Uworld126 == 80) and (GetFaction() ~= "cuiyan") then
		Talk(5,"Uworld126_finish"," 尹姑娘，事情成功了! ","哦？","事情是这样?","真是的，但是，他们已经见面了，缘分也会回来，真是不懂怎么感谢你.","在下能与各位姑娘做朋友已经很幸福了，何须谢我呢？")
	elseif (Uworld126 > 20) and (Uworld126 < 70) then
		Talk(1,"","小丽性情固执，她受不了本门的事情，她说，没有什么好事，所以，麻烦你了.")
--	elseif (UTask_cy == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","尹含烟：你天赋过人，相信很快就能成为本门栋梁了，不必在意现在暂时失去武功。你先去与本门各位姐妹熟悉一下，让我们所有人都快快乐乐地生活吧。")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_cy == 70*256) and ((GetTask(1) < 5*256) or (GetTask(1) == 75*256)) then		-- 重返师门任务
		Talk(2,"return_sele","传言，最近你杀了不少强盗，所以在江湖上很有名气","但是，我还是想起门派里温暖的空气，师傅，我可以返回翠烟门吗?")
	elseif (GetCamp() == 4) and ((UTask_cy == 70*256+10) or (UTask_cy == 70*256+20)) then		-- 重返师门任务中
		Say("准备好五万两了没有?",2,"准备好了/return_complete","还没准备好/return_uncompleted")
--	elseif (GetTask(1) == 70*256+10) and (HaveMagic(111) >= 0) then		-- 峨嵋派重返门派，收回碧海潮生
--		Say("尹含烟：韶光一去不再来，你真的执意要遁入空门？",2,"红尘实无可眷恋，请掌门让我去吧/defection_yes","我再考虑考虑/no")
	else
		Talk(1,"","如果本门和唐门联盟，当然是好事，只是")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(114) == -1) then
--		AddMagic(114)					-- 冰骨雪心
--		Msg2Player("你学会了“冰骨雪心”")
--		Say("尹含烟：为师这次闭关苦思数日，新创了一招“冰骨雪心”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("又想外面的世界了?",2,"是的，请掌门恩准/goff_yes","不，我觉得自己的功夫还不够. /no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("欢迎你加入翠烟门，成为花婢")
	SetRevPos(154,61)		  				-- 重生点
	SetTask(6,10*256)						-- 入门
	SetFaction("cuiyan")      			--玩家加入门派
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	AddMagic(99)
	Msg2Player("学到风花雪月")
	AddNote("加入翠烟门，成为花婢，学到风花雪月")
	Msg2Faction("cuiyan",GetName().." 从峨眉到加入翠烟门，门派力量又增强了!",GetName())
end

-------------------------- 重返门派相关 ------------------------
function goff_yes()
	Talk(1,"","有些事情，只有亲身经历过才明白，你去经历过也行.")
	SetCamp(4)
	SetCurCamp(4)
	SetTask(6,70*256)
	SetFaction("")
	AddNote("离开翠烟门，又一次行走江湖")
	Msg2Player("离开翠烟门，又一次行走江湖")
end

function return_sele()
	Say("当然可以，你只需要5万两就能返回门派.",2,"太好了 /return_yes","我去拿钱再说. /return_no")
end;

function return_yes()
	Talk(1,"","好，弟子去取五万两! ")
	SetTask(6,70*256+20)
	AddNote("捐5万两给翠烟门就能返回门派. ")
	Msg2Player("捐5万两给翠烟门就能返回门派. ")
end;

function return_no()
	Talk(1,"","5 万两不是小数，你想清楚了.")
end;

function return_complete()
	if (GetCash() >= 50000) then
		Talk(1,"","好，五万两已够了，我封你为本派花神，同时传与你本门绝学，碧海潮生，希望你继续努力.")
		Pay(50000)
		SetTask(6,80*256)
		SetFaction("cuiyan")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(67)
--		if (HaveMagic(114) == -1) then
--			AddMagic(108)
--			AddMagic(111)
--			AddMagic(114)
		add_cy(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到翠烟门绝学，冰骨雪心，牧野流星，碧海潮生 ")
--		end
		Msg2Player(GetName().."<#>返回翠烟门，被封为花神")
		AddNote("返回翠烟门了 ")
	else
		Talk(1,"","你所带银两好像不够，检查看看.")
	end
end;

---------------------- 门派任务 ---------------------------
function L10_get_yes()
	Talk(2,"","很少见人有这份心，麻烦你了.","师傅太客气了!")
	SetTask(6,10*256+10)
	AddNote("接10级任务：到东南边小树林召翠舞簪")
	Msg2Player("接10级任务：到东南边小树林召翠舞簪")
end;

function L10_prise()
	Talk(1,"","可以了，你真是有才。我升你为10级弟子.")
	DelItem(0)
	SetTask(6,20*256)
	SetRank(32)
--	AddMagic(95)
--	AddMagic(97)
	add_cy(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("交翠舞簪，回去向尹含烟复命，完成找簪子任务，成为三品花使")
	Msg2Player("恭喜你被封为翠烟门三品花使，学到翠烟刀法，翠烟双刀. ")
end;

function L50_get_yes()
	Talk(1,"","万事小心.")
	SetTask(6,50*256+10)
	AddNote("接50级任务：为崇圣寺方丈虚圆夺回梧桐观音 ")
	Msg2Player("接50级任务：为崇圣寺方丈虚圆夺回梧桐观音 ")
end;

function L50_prise()
	Talk(1,"","很好，你果然智勇双全，为本门做了不少事情，真不愧是本门弟子! ")
	SetTask(6,60*256)
	SetRank(36)
--	AddMagic(109)
	add_cy(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你被封为花精，学到雪影武功")
	AddNote("夺回梧桐观音，完成50级任务，被封为花精")
end;

function L60_prise()
	Msg2Player("你交信给尹含烟，把所有事都说给她听. ")
	Talk(2,"","此次你帮我解决了本门的事，立了大功。恭喜你，你可以出师了 ","多谢掌门! ")
	SetTask(6,70*256)
	SetRank(35)
	SetFaction("") 		   					--退出门派
	SetCamp(4)
	SetCurCamp(4)
	DelItem(235)
	AddNote("你交信给尹含烟，把所有事都说给她听，完成出师任务，被封为花仙")
	Msg2Player("恭喜你成为花仙，可以出师了")
end;

----------------------- 世界任务 --------------------------
function Uworld51_20()
	SetTask(51,20)
	Msg2Player("调查唐一尘到底发生了什么事，有什么办法回去吗? ")
end

function Uworld51_prise()
	SetTask(51,255)
	AddMagicPoint(1)
	Task86_2 = GetByte(GetTask(86),2) + 1
	if (Task86_2 > 255) then Task86_2 = 255 end
	Task86 = SetByte(GetTask(86),2,Task86_2)
	SetTask(86,Task86)			-- 记录任务得技能点总数
	Msg2Player("尹含烟因为想报答，拿了师傅的金丹送给你。你的功夫增加1点 ")
	Msg2Player("完成洗清冤屈任务")
	AddNote("完成洗清冤屈任务")
end

function no()
end;

function Uworld126_talk()
	SetTask(126,30)
	Msg2Player("尹含烟也没有更好的办法，你决定回去见郦秋水")
	AddNote("尹含烟也没有更好的办法，你决定回去见郦秋水")
end

function Uworld126_finish()
	if (GetTask(6) >= 70*256) and (GetTask(6) ~= 75*256) then
		Talk(3,"","行走江湖会遇到很多危险，这里含烟有本翠烟秘笈可以帮你. ","真是不好意思","江湖儿女，无需拘束，拿着吧!")
		if (HaveMagic(336) == -1) then		-- 必须没有技能的才给技能
			AddMagic(336,1)
		end
		if (HaveMagic(337) == -1) then		-- 必须没有技能的才给技能
			AddMagic(337,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("学完翠烟武功冰松无影，冰心仙子. ")
		SetTask(126,255)
	else
	   Talk(2,"","救人无需报恩，真是侠义! ","尹师傅过奖了!")
	   SetTask(126,245)								--获得声望的设置变量245
	end
	add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	AddRepute(add_repute)
	Msg2Player("<#>去除郦秋水和段思成的恩怨，任务完成. 你的名望增加"..add_repute.."<#>点.")
	AddNote("去除郦秋水和段思成的恩怨，任务完成. ")
end
