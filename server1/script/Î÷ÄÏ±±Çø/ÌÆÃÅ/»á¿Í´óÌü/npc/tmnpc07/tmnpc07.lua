--description: 唐门唐仇 20级任务、出师任务 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-13)
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
				"赠送春节饼/#tbMasterGift:getGift('tangmen')",
				"想请教其他事/oldMain"
			}
		Say("新年安康兴旺", getn(tbSay), tbSay)
		return
	end
	oldMain()
end

function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("找我有什么事?", 2, "想请教大师/oldentence", "庆祝恩师节，在下已找够恩师卡和高徒卡/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 2) then
		Describe("找我有什么事?", 2,
			"学120技能./lvl120skill_learn",
			"想请教其他事/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end
	local UTask_tm = GetTask(2);
	local nFactID = GetLastFactionNumber();
	
	if (UTask_tm == 70*256) and (GetFaction() == "tangmen") then			-- 回师错误修正
		SetFaction("")
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tm == 70*256) and (GetTask(10) >= 5*256) and (GetTask(10) < 10*256) then		-- 以前接过入门任务的
		SetTask(10,0)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tm == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(2,70*256)
		Say("系统发现错误，已及时恢复!",0)
		return
	elseif (UTask_tm == 80*256 and nFactID == 2 and GetCamp() == 3 and GetFaction() == "初入江湖 ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tangmen");
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	elseif (UTask_tm == 70*256 and nFactID == 2 and GetCamp() ~= 4 and GetFaction() == "初入江湖") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("系统发现错误，已及时恢复!",0)
			return
		end
	end

	local tbDes = {"带艺投师/#daiyitoushi_main(2)", "想请教其他事/common_talk"};
	
	Say("最近我很忙，你有什么事?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tm = GetTask(2);
	local Uworld51 = GetTask(51)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),2) == 0) then				-- 世界任务：武林向背
		if (GetSex() == 0) then
			Talk(1,"","唐门祖师教训弟子不能干预外面的事，. 唐仇不敢违抗，麻烦公子转达我对独孤盟主的歉意")
		else
			Talk(1,"","唐门祖师教训弟子不能干预外面的事，. 唐仇不敢违抗，麻烦公子转达我对独孤盟主的歉意")
		end
		Uworld40 = SetBit(GetTask(40),2,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 30) then				-- 洗清冤屈任务进行中
		Talk(4,"Uworld51_40","掌门，在下听说你与一尘公子有成见，现在他被你误解.","这是唐家的事，与你无关!","掌门，一尘公子是你的亲身骨肉?.!","哼，送客! ")
	elseif (Uworld51 == 80) and (HaveItem(377) == 1) then				-- 洗清冤屈任务：已经夺回秘笈
		Talk(8,"Uworld51_90","掌门，少林高僧遇难已调查清楚，天忍教夺得本教秘笈后，暗算了少林高僧，这个秘笈由不染公子泄漏出去!","什么？怎么会这样?","不染担心一尘是长子，怕将来会和他争夺掌门之位。所以，他经常和金国秘使白公子联系，偷书给天忍教!","天忍教得到此书后，派了2个高手去暗杀少林高僧，此次，他们正准备暗杀丐帮高手。在下去夺回本门秘笈，请掌门不要烦心.","不染又这样？真是逆子啊 ","掌门息怒，不染公子只是一时糊涂，在下请求掌门绕他一次!","大逆不道的家伙，死罪难免，别想继承掌门之位.","麻烦你替我安慰一尘，原来我错怪了他!")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 20*256+60) and (UTask_tm <= 20*256+70) and (HaveItem(41) == 1)) then		-- 20级任务完成
			Talk(5, "L20_prise", "这是幽妹妹的项圈，怎么在你这里?", "这是师姑叫我交给掌门的，她已经原谅掌门了!", "幽妹妹她真的原谅我了？她真的愿意回家了？是你说服她的吗?", "这件事是大师兄安排的，弟子并没有做什么", "不管怎么说，你帮为师解开了这辈子最大的心结，功劳不小，为师绝不会亏待你.")
		elseif (UTask_tm == 60*256+60) and (HaveItem(49) == 1) then		-- 出师任务完成
			Talk(3, "L60_prise", "掌门，我在竹丝洞里之找到了这把破剑，它不会就是传说中的七星绝命剑吧?", "这正是七星绝命剑！别看它残破，它的价值就在于你对它的取舍。你放弃金钱和宝藏而选择它，说明你在面对诱惑的时候，仍能保持对本门的忠诚，很好！很好！你已经通过考验，可以顺利出师了", "恭喜你艺成出师！你已被封为唐门的千手神卫，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行客也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图")
		elseif (UTask_tm == 60*256+70) then				--出师任务
			Talk(3, "L60_fail", "我要的七星绝命剑呢?", "............", "你如此经不起金银财宝的诱惑，我怎么放心让你出师呢？说不定有一天你会为了更大的利益，而背叛本门!")
		elseif (UTask_tm == 60*256+80) then
			if (GetCash() >= 20000) then
				Talk(1,"","看你诚心悔过，我就再给你一次机会，你必须再闯一次竹丝洞，取回七星绝命剑.")
				Pay(20000)
				SetTask(2, 60*256+20)
				AddNote("付20000两，求掌门宽恕，到竹丝洞取回七星绝命剑. ")
				Msg2Player("付20000两，求掌门宽恕，到竹丝洞取回七星绝命剑. ")
			else
				Talk(1,"","悔恨也无益，快拿钱来再说!")
			end
		elseif (UTask_tm == 60*256+90) then
			if (GetCash() >= 40000) then
				Talk(1,"","哼，我再给你一次机会，你去一次竹丝洞，取回七星绝命剑..")
				Pay(40000)
				SetTask(2, 60*256+20)
				AddNote("付40000两，求掌门宽恕，到竹丝洞取回七星绝命剑. ")
				Msg2Player("付40000两，求掌门宽恕，到竹丝洞取回七星绝命剑. ")
			else
				Talk(1,"","快付40000两，到竹丝洞取回七星绝命剑.. ")
			end
		elseif ((UTask_tm == 60*256) and (GetLevel() >= 50) and (GetFaction() == "tangmen")) then				--出师任务启动
			Say("你在本门学艺多时，为师要考一考你，东面竹林深处有一个<color=Red>竹丝洞<color>，如果你能够在<color=Red>竹丝洞<color>中取得一把<color=Red>七星绝命剑<color>，就可以顺利出师了", 2, "接受考验/L60_get_yes", "暂不接受 /no")
		elseif (UTask_tm == 80*256) then						-- 重返后的自由出入
			Say("又想念江湖之事了？",2,"是的，请掌门给弟子行走江湖/goff_yes","弟子修炼不够，需要努力练功. /no")
		elseif (UTask_tm > 20*256) and (UTask_tm < 20*256+60) then					--已经接到20级任务，尚未完成
			Talk(1,"","不知幽妹妹过得可好？唉！直到今天，她仍然不肯原谅我这个哥哥!")
		elseif (UTask_tm >= 30*256) and (UTask_tm <= 60*256) then					--已经完成20级任务，尚未接到出师任务
			Talk(1,""," 你帮为师解开了这辈子最大的心结，为师绝不会亏待你 !")
		elseif (UTask_tm > 60*256) and (UTask_tm < 70*256) then					--已经接到出师任务，尚未完成
			Talk(1,"","只要你能够在<color=Red>竹丝洞<color>中取回一把<color=Red>七星绝命剑<color>，就算通过出师考验了 ")
		else					--已经入门，尚未接20级任务（缺省对话）
			Talk(1,"","本门技艺从不外传，倘若门下弟子有人敢泄漏绝技，必按门规处置，绝不轻饶!")
		end
--	elseif (GetTask(10) == 5*256+10) then		-- 转门派到五毒教
--		Say("唐仇：想投入五毒？须知本门不许带艺另投，除非你先自行废去本门绝艺。你不再重新考虑一下吗？",2,"不错，我意已决/defection_yes","我还是不去五毒算了/defection_no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tm == 70*256) and (GetTask(10) < 5*256) then		-- 重返师门任务
		Say("此次回来，你想返回唐门吗?",2,"遵命!/return_yes","不. /return_no")
	elseif (GetCamp() == 4) and ((UTask_tm == 70*256+10) or (UTask_tm == 70*256+20)) then		-- 重返师门任务中
		Say("准备好5万了吗?",2,"已准备好了/return_complete","未准备好/return_uncompleted")
	elseif (Uworld51 >= 90) then			-- 已经完成“洗清冤屈”任务
		Talk(1,"","该死的不染有负于我!")
	elseif (UTask_tm == 70*256) and (GetFaction() ~= "tangmen") then							--已经出师
		Talk(1,"","你出师后要好自为之，不可让人小瞧了本门的功夫!")
	else
		Talk(1,"","世人都把我唐门看成龙潭虎穴，把我唐仇看成喜怒无常的魔头，哼！?")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
	x = 0
	skillID = 51					-- 青木功
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (GetFaction() == "tangmen") and (GetTask(2) == 80*256) and (HaveMagic(253) == -1) then		-- 重返师门且无新技能
		AddMagic(253)
		Msg2Player("你学到无毒蚀骨. ")
		Say("我已闭关修炼多日，创造出一招无毒蚀骨，今天我传给你。你学完后，需要注意休息，避免伤及经脉!",1,"多谢师傅/KickOutSelf")
		return 0
	elseif (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
		Say("我已闭关修炼多日，创造出一招无毒蚀骨，今天我传给你。你学完后，需要注意休息，避免伤及经脉!",1,"多谢师傅/KickOutSelf")
		return 0
	else
		return 1
	end
end

------------------------ 重返门派相关 -------------------------
function goff_yes()
	Talk(1,"","好，去吧，要记得不能与邪教结交")
	SetTask(2,70*256)
	AddNote("离开唐门，行走江湖")
	Msg2Player("离开唐门，行走江湖")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=45; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 霹雳弹
	i=43; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 唐门暗器
	i=44; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 唐门刀法
	i=47; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 夺魂镖
	i=48; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 心眼
	i=50; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 追心箭
	i=51; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 青木功（已取消）
	i=54; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 漫天花雨
	i=55; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 淬毒术
	i=57; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 冰魄寒光
	i=58; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天罗地网
	i=249;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 小李飞刀
	i=253;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 驭毒蚀骨
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(10,5*256+20)
	SetTask(2,75*256)				-- 为原门派作个标记
	SetRank(66)
	if (GetRepute() < 200) then
		Msg2Player("由于与本派不中，你的名望减少"..GetRepute().."点!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("由于与本派不中，你的名望减少200点! ")
		AddRepute(-200)
	end
	AddNote("唐仇收回你的唐门武功，现在你可以加入五毒教了. ")
	Msg2Player("唐仇收回你的唐门武功，现在你可以加入五毒教了. ")
	Talk(1,"KickOutSelf","为了防止本门绝学外露，你已决心加入五毒，我就要收回唐门绝学i!")
end

function defection_no()
	AddNote("你取消加入五毒教的想法")
	Msg2Player("你取消加入五毒教的想法")
	SetTask(10,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_yes()
	Talk(3,"","对，弟子在江湖还没有什么名气，想请各位师伯指教!","按照门规，你要交五万两重返门派!","是，让弟子准备一下!")
	SetTask(2,70*256+20)
	AddNote("交五万两就立即可以返回唐门")
	Msg2Player("交五万两就立即可以返回唐门")
end;

function return_no()
	Talk(2,"","我想多飘泊江湖一段时间.","既然如此，你要保重!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","很好，你有这份诚信，我怎么能拒绝!")
		Pay(50000)
		SetTask(2,80*256)
		SetRank(76)
--		if (HaveMagic(48) == -1) then
--			AddMagic(249)
--			AddMagic(58)
--			AddMagic(341)
--			AddMagic(48)
		add_tm(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("你学到镇派绝学：新眼，小李飞刀，天罗地网，散花镖")
--		end
		SetFaction("tangmen")
		SetCamp(3)
		SetCurCamp(3)
		AddNote("已返回唐门")
		Msg2Player(GetName().."返回唐门，升为禄阁长老. ")
	else
		Talk(2,"","你明显没有准备好!","对不起，我检查一下.")
	end
end;

function return_uncompleted()
	Talk(1,"","没错，继续准备吧!")
end;

----------------------- 20级任务 -----------------------
function L20_prise()
	DelItem(41)
	SetRank(27)	
	SetTask(2, 30*256)
--	AddMagic(303)
	add_tm(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你成为唐门护卫，学到毒刺骨")
	AddNote("交金项圈给唐仇掌门，完成唐幽任务，升为护卫")
end;

----------------------- 出师任务 --------------------------
function L60_get_yes()
	SetTask(2, 60*256+20)
	AddNote("在大厅( 508, 322) , 见唐仇，接 <color=red>出师任务<color>, 到竹丝洞取回七星绝命剑")
	Msg2Player("在大厅见唐仇，接出师任务，到竹丝洞取回七星绝命剑")
end;

function L60_prise()
	DelItem(49)
	Msg2Player("恭喜你学成，可以出师了。你被封为天守神卫，名望增加120点")
--	AddGlobalCountNews(GetName().."艺成出师，告别各位同门行走江湖。", 1)
	Msg2SubWorld("唐门"..GetName().."学成出师，辞别同名兄妹，行走江湖")
	AddRepute(120)
	SetRank(66)
	SetTask(2, 70*256)
	SetFaction("")				    			--玩家退出唐门
	SetCamp(4)
	SetCurCamp(4)
	AddNote("返回唐门，交七星绝命剑给唐仇掌门，完成出师任务，升为天守神卫 ")
end;

function L60_fail()
	Say("掌门生气了，你该怎么办?", 2, "钱到手了还这样/L60_faila", "请掌门宽恕/L60_failb")
end;

function L60_faila()
	SetTask(2,60*256+90)
	Talk(1,"","立即交4万两，然后去竹丝洞取回七星绝命剑!")
end;

function L60_failb()
	SetTask(2,60*256+80)
	Talk(1,"","看你诚信改过，我就给你一个机会，立即交2万两，然后去竹丝洞取回七星绝命剑.")
end;

----------------------- 世界任务 --------------------------
function Uworld51_40()
	SetTask(51,40)
	Msg2Player("看来没有办法劝唐仇了，你决定去找唐一尘的师傅唐黑解决此事")
end

function Uworld51_90()
	DelItem(377)
	SetTask(51,90)
	Msg2Player("真相明白，唐仇最后知道错怪了唐一尘. 快去告诉唐一尘公子")
	AddNote("真相明白，唐仇最后知道错怪了唐一尘. ")
end

function no()
end
