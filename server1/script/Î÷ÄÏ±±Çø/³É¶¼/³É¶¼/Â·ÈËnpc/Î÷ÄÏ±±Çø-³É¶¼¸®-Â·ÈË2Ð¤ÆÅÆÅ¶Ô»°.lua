--西南北区 成都府 路人2肖婆婆对话
-- update by xiaoyang(2004\4\16) 娥眉90级任务

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld125 = GetTask(125)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld125 < 10) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~= "emei") then
		Talk(8,"Uworld125_task","阁下流落江湖，不觉得累吗?","世间还有很多困难，累也要坚持。","好，有志气。我有一个任务，你敢做吗?","什么任务?","峨嵋派创立了一部无字天书，不久前，我收到消息，天书出现在青城山附近，但是，没有人找到。你可以去一趟吗?","你不怕我拿到后，占为己有吗?","哈哈哈，无字天书只有有缘人才能看懂。即使找到了，没有办法打开也是没用!","原来如此 .")
   elseif (Uworld125 == 15) and (HaveItem(388) == 1) then
   	Talk(10,"Uworld125_fire","怎么样？","弟子拿到了.","让我看看，果然是无字天书.","看起来我是有缘人.","你拿的秘籍，江湖不懂多少人想要!","最后还是安全回来了.","还未完事。和你说，我是峨眉弟子，隐居在成都。掌门有秘令交信的任务给你，快去做吧!","婆婆呢?","我将帮你阻止想要偷秘籍的盗贼!","遵命!")
   elseif (Uworld125 == 30) and (HaveItem(389) == 1) then
   	Talk(6,"Uworld125_change","你终于还是到了?","怎么了?","刚刚收到掌门的鸽子送的信，让你赶快回峨眉?","信中没有说清楚，但是按照掌门的话，此事很急","我立即去!")
   elseif (Uworld125 == 10) then
   	Talk(2,"","怎么样？没找到天书啊？","不要生气，我一定会找到的!")
   elseif (Uworld125 == 20) and (HaveItem(388) == 0) then
   	Talk(1,"","天书要交给掌门清晓师太")
		AddEventItem(388)
		Msg2Player("夺得无字天书 ")
   elseif (Uworld125 == 30) then
   	Talk(1,"","你没有峨眉令箭，怎么证明你已交给掌门了?")
   elseif (Uworld125 >= 50) then
   	Talk (1,"","小兄弟，江湖险恶，需要保重. ")
   else
		Talk(1,"","肖婆婆：那个小混混真是个害群之马，不是偷鸡摸狗，就是欺负女娃儿，闹得大家鸡犬不宁，也没人管管")
	end
end

function Uworld125_task()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","看你那么瘦弱，受得了吗？我只是开玩笑，你要练功，然后再说. ")
	else
		Say("完事后，我会重谢你.",2,"我，弟子会去青城一趟. /Uworld125_yes","我还有其他事，恐怕不能帮你了. /Uworld125_no")
	end
end

function Uworld125_yes()
	SetTask(125,10)
	Msg2Player("按肖婆婆说的，去青城找秘笈")
	AddNote("按肖婆婆说的，去青城找秘笈")
end

function Uworld125_no()
end

function Uworld125_fire()
	SetTask(125,20)
	Earn(10000)
	Msg2Player("肖婆婆给你1万两，同时让你带天书送给峨眉. ")
	AddNote("帮肖婆婆带天书送给峨眉 ")
end

function Uworld125_change()
	SetTask(125,40)
	DelItem(389)
	Msg2Player("收到鸽子送信给清晓师太，返回峨眉")
	AddNote("收到鸽子送信给清晓师太，返回峨眉")
end
