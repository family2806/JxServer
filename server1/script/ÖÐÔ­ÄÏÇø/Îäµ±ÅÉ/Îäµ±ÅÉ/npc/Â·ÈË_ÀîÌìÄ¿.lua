-- 中原南区\武当派\武当派\npc\路人_李天目.lua
-- by xiaoyang(2004\4\15) 武当90级任务

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
Uworld129 = GetTask(129)
Uworld31 = GetByte(GetTask(31),1)
	if (Uworld129 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="wudang") and (Uworld31 ==127) then
		Talk(2,"Uworld129_interchange","李道长年轻才高！在下仰慕已久！望指教!","如果说到痴迷武学，整个武当没人比得上周云泉师弟了，你还是去找他吧!")
   elseif (Uworld129 == 20)then
   	Talk(9,"Uworld129_interchange2","李大侠，在下想上山学武。周云泉师兄叫我来找你.","在下不敢当!","这样啊？在下怎么不这么觉得呢?","今日相见看来是缘分!","在下想向李兄请教内外家的观点","内外力药相合，力由气生，气仁力涌，相互配合。从你学武的目的来说，也是以气为主。练气只练心，心净则生，无欲则刚!","听君一席话，胜读十年书","阁下年轻才高，何必这么谦虚呢!","周兄过奖了，在下还要继续努力!")
	elseif (Uworld129 == 40)then
		Talk(10,"Uworld129_interchange3","周兄收到家书，下山了。我去告诉你。","家书？你看过内容了吗？.","大概是说家里父母很挂念，要他赶快回去一趟","坏了! ","怎么了?","周师兄自小在山上，很久没有和家里联系，宋金交兵是，人民流离。师傅已经派人调查了，但是没有师兄父母的消息。那封信可能是假的!","这可如何是好","请阁下及时通报，现在还来得及。你去伏牛山，暗中保护周师兄.","在下听闻武当已久，能够帮忙实在是荣幸.","信上说周兄家在天心洞附近.")
	elseif (Uworld129 == 60) and (GetFaction() ~= "wudang") then
		Talk(6,"Uworld129_finish","兄弟果然厉害！这真是天忍教的阴谋.","看来金军已经开始动手了。周师兄他还不知道呢","伤的不轻，命是保住了，但是要好好休息一段时间!","天目不知道怎么报答你对武当的恩德？我送你一卷武当秘籍.","行侠仗义是我的本分.")
	else
		Talk(1,"","不求什么！只希望武当可以度过此劫!")
	end
end

function Uworld129_interchange()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","但是你还不懂武功，一定是周师弟和你说了什么?")
	else
		SetTask(129,10)  --任务启动
		Msg2Player("李天目让你找周云泉学武艺")
		AddNote("李天目让你找周云泉学武艺")
	end
end

function Uworld129_interchange2()
	SetTask(129,30)  --设置任务变量30
	Msg2Player("李天目叫你劝周云泉不要太痴迷武道")
	AddNote("李天目叫你劝周云泉不要太痴迷武道")
end

function Uworld129_interchange3()
	SetTask(129,50)  --设置任务变量50
	Msg2Player("听李天目的话到伏牛山保护周云泉. ")
	AddNote("听李天目的话到伏牛山保护周云泉. ")
end

function Uworld129_finish()
	if (GetTask(5) >= 70*256) and (GetTask(5) ~= 75*256) then
		Talk(2,"","我把这个给你是希望你可以把它发扬光大，这样中原武林有多了一份抗金力量!")
		if (HaveMagic(365) == -1) then		-- 必须没有技能的才给技能
			AddMagic(365,1)
		end
		if (HaveMagic(368) == -1) then		-- 必须没有技能的才给技能
			AddMagic(368,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("学会技能天地无极，人剑合一")
		SetTask(129,255)
	else
	   SetTask(129,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("救周云泉，任务完成。你的名望增加"..add_repute.."点.")
   AddNote("救周云泉，任务完成。任务完成")
end
