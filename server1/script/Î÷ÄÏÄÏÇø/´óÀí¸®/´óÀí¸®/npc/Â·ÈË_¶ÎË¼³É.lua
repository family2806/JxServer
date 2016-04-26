-- 大理　路人　段思成
-- by：Dan_Deng(2003-09-16)
-- update by xiaoyang(2004\4\22) 翠烟90级任务

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(14) == 1 then
		allbrother_0801_FindNpcTaskDialog(14)
		return 0;
	end
	Uworld126 = GetTask(126)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld126 < 10) and (GetLevel() >= 90) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="cuiyan") then
		Talk(6,"Uworld126_get","哎....","公子为何叹息?","年轻人要有大志向.","难道阁下的意中人不在了.","她还在，但是，心已经死了.","只要你诚心诚意，什么事都能成。阁下有什么困难，尽管说。.")
	elseif (Uworld126 == 10) and (HaveItem(391) == 0) then
		AddEventItem(391)
		Msg2Player("接到段思成的信 ")
		if (GetSex() == 0) then
			Talk(1,"","想见美人也不要这么急吧?信还没拿。")
		else
			Talk(1,"","姑娘忘记带信了")
		end
	elseif (Uworld126 == 40) then
		SetTask(126,45)
		Talk(8,"Uworld126_jump","不要说了!","段公子，你你已经给了俪秋水享不尽的荣华富贵，这样的女人随便能找10个，100个，何苦为难了自己呢.","你这样说也没用，请阁下快点离开这里.","段思成，你敬酒不吃吃罚酒，我受不了了，如果你还不回答，就给我.","哼 ","给你小子! ","啊.....","段公子")
	elseif (Uworld126 == 45) then			-- 没打完的
		Talk(1,"Uworld126_jump","你脱得出和尚的手，也逃不出这个庙，看招!")
	elseif (Uworld126 == 50) then
		Talk(8,"Uworld126_set","段公子不是他的对手!","幸亏你来的及时，在下还能撑得住.","对方从哪里来?","不明白，也许是秋水的敌人",".....有了，我将和俪姑娘说谎，说你重伤了.","这好像不是很好.","一生的幸福，难道困难不能过去吗？","段思成：好，阁下想怎么样都行，段某听从。")
	elseif (Uworld126 == 70) then
		Talk(3,"U126_70","怎么样？俪姑娘来看你吗?","她来，我们说话很开心，你帮我很多了，多谢!","何须操心，只要2人幸福，小事算什么?")
	elseif (Uworld126 > 10) and (Uworld126 < 50)then
		Talk(1,"","之前是我错了，真不懂怎么感谢!...")
	else
		Talk(2,"","我们大理和宋国，每年都供奉给天朝，丝绸，马屁，麝香.","你等金人这么贪婪，你们贡献多少都不够。")
   end
end;

function Uworld126_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		if (GetSex() == 0) then
			Talk(1,"","兄台的好意，思成铭记 ")
		else
			Talk(1,"","兄台的好意，思成铭记")
		end
	else
		Say("实不相瞒，以前在下有负于她，现在悔恨已晚。我又一封信，希望阁下可以亲手交给翠烟门俪秋水",2,"这有何难/Uworld126_yes","在下还有事，阁下找他人吧! /Uworld126_no")
	end
end

function Uworld126_yes()
	AddEventItem(391)
	SetTask(126,10)
	Msg2Player("收到段思成的信，到翠烟门见俪秋水 ")
	AddNote("收到段思成的信，到翠烟门见俪秋水")
end

function Uworld126_no()
end

function Uworld126_jump()
	SetFightState(1)
	NewWorld(230,1613,3175)
end

function Uworld126_set()
	SetTask(126,60)
	Msg2Player("骗秋水去看了段思成")
	AddNote("骗秋水去看了段思成")
end

function U126_70()
	Talk(1,"","对了，秋水说尹掌门相见你，不懂有什么事?")
	SetTask(126,80)
	Msg2Player("听到段和俪说话，很开心。你快去看尹含姻找我有什么事")
end
