-- 洗潜能的道士.lua （药王谷，跛道人）
-- By Dan_deng(2004-01-06)
-- 变量：GetTask(92): 洗过的次数（目前最多5次）
--			GetTaskTemp(8)：暂存洗潜能价格
--			GetTaskTemp(50): 是否用宝石洗的
-- Update: Dan_Deng(2004-05-24) 名驹奔火任务 (Uworld76 = GetTask(76))
-- Update: Dan_Deng(2004-05-27) 小儿失踪任务 (Uworld42 = GetTask(42))

function main()
	Uworld92 = GetTask(92)
	Uworld76 = GetTask(76)
	Uworld42 = GetTask(42)
	if (Uworld76 == 30) then    -- 名驹奔火任务：找到跛道人，任务进行中
		if (HaveItem(393) == 1) then
			Talk(11,"W76_step","道长，我们又见面了","找我有什么事","这里有一封信，你看了之后再说. ","啊！原谅贫道看轻了","其实是老王的信，可惜贫道现在有事在身，暂时不能离开","那怎么办才好? 我在老王面前拍着胸脯的. ","这是你的约定！和贫道有什么关系! ","道长怎忍心见死不救?","哈哈！我只是和你开玩笑的！贫道现在虽然不能去，但是你可以去。首先你要去找3样东西，那正是闪电之牙、丹泽之水、白云之翼.这些是配药，和贫道的神药结合可以治疗无力症","小子行走江湖，有时也感觉劳累，这是不是没有方法医治啊?","对，到时候贫道把回体奇术传给你，看来这次既救人也自救了，只是那3中配药不好找，赶快去吧. ","道长放心!")
		else
			Talk(2,"","你说是老彭要我帮忙，那信物呢？最少要有一封信吧","您不要急，我现在就回去让彭老写给您. ")
   	end
	elseif (Uworld76 == 40) then
		if (HaveItem(370) == 1) and (HaveItem(371) == 1) and (HaveItem(372) == 1) then
			Talk(6,"W76_end","道长，你要的东西都准备好了","啊","想不到你还有点本事。这是血勇丸，快去!","不是还要回体术吗?","什么回体不回体的，我不知道","算了，这样也行。道长不愿传给我一定有不便的理由，能够就骏马，学不学到武功都不重要了")
		else
			Talk(1,"","3 种材料是：闪电之牙、丹泽之水、白云之翼。你要快，不然病情加重了可与我无关!")
		end
	elseif (Uworld76 == 50) and (HaveItem(375) == 0) then			-- 名驹奔火任务：血勇丸丢了
		SetTask(76,40)
		Talk(1,"","血勇丸丢了？没有办法了，你再去找3中药材去。")
	elseif (Uworld42 == 10)  then  								-- 小儿失踪任务：去杀十名穿山
		Talk(4,"","道长！请问道长知道大理小二失踪案吗? ","世间已经黑白颠倒，人心变得久了。你何必去担心那些不相干的事情呢","别人怎么做是别人，我有我的做事方式。难道眼睁睁看着千家万户日日以泪洗面是正道吗","想不到还有你这样的人。药王洞有很多该死的穿山。你去杀十名，如果有命回来我就听你说. ")
		SetTask(42,20)
		AddNote("小儿失踪任务: 道人要你去药王洞杀十名穿山")
		Msg2Player("小儿失踪任务: 道人要你去药王洞杀十名穿山")
	elseif (Uworld42 == 30) then									-- 小儿失踪任务：完成子任务
		Talk(1,"","这个事我也帮不了什么忙！但是我有一个别号无名僧的朋友，钥匙你找到他，肯定能搞清楚所有事情")
		SetTask(42, 40)
		AddNote("接受任务：去找无名僧问小儿失踪的信息")
		Msg2Player("接受任务：去找无名僧问小儿失踪的信息")
	elseif (GetItemCountEx(353) >= 1) then				-- 洗潜能：用宝石洗
		Say("猩红宝石?我也正打算找几颗呢。这样吧，我帮你改造经脉来换你的猩红宝石",3,"学/tuneprop_jewel","没兴趣/no","猩红宝石要做他用，用钱帮我改造经脉可以吗? /sele3")
	elseif (GetLevel() >= 50) then			-- and ((GetCamp() == 0) or (GetCamp()== 4)) then		-- 洗潜能的基本要求：过50级，红名或白名（不再限制阵营）
		if (Uworld92 == 0) then			-- 没洗过
			Talk(1,"tuneprop_get","帮你改造经脉？是哪个多事的人让你来找我的?")
		elseif (Uworld92 < 5) then		-- 洗过次数未到上限
			Talk(1,"tuneprop_get","尝过一次甜头就一直不忘。我警告你，每次改造经脉都要损耗你的体气，这可不是随意做的事情. ")
		elseif (Uworld92 >= 5) then		-- 洗过次数达到上限
			Talk(1,"","我帮你改造经脉的次数太多了，要是继续的话会有意想不到的危险。这个我真不敢做，你还是去找别的高人吧!")
		else										-- 意外错误，让玩家找GM报BUG
			Talk(1,"","看你深色阴郁，面色暗淡，最近一定要遭大难了。你现在不该来找我，快找 <color=red>天神<color> 去!")
		end
	elseif (Uworld76 == 50) then
		Talk(1,"跛道人：现在世道太乱，像小兄弟你这样热血的人不多了")			
	else
		Talk(1,"","药王洞中百草丰富，真是个好地方。西北荒原也有这样一个地方，事情没有绝对化的. ")
	end
end

function sele3()
	Talk(2,"","你以为帮别人改造经脉是小事吗？我要消耗很多力气，之后还要活很长时间静养！你的猩红宝石可以帮助我恢复元气","要是不给看就算了，明显是已经带给我看了，这样还不敢拿出1颗猩红宝石啊！这样还想要我帮你改造经脉，想都别想!")
end

function W76_step()
	DelItem(393)
	SetTask(76,40)
	Msg2Player("跛道人和你说，想要只这个病，要闪电之牙、丹泽之水、白云之翼这三种配药")
	AddNote("跛道人和你说，想要只这个病，要闪电之牙、丹泽之水、白云之翼这三种配药")
end

function W76_end()                                   -- 名驹奔火任务结束
	Talk(1,"","想不到有你这样热血道义之人，传给你也不违反师道! ")
	DelItem(370)                  -- 失去闪电之牙
	DelItem(371)                  -- 失去丹泽之水
	DelItem(372)                  -- 失去白云之翼
	AddEventItem(375)                  -- 得到血勇丸
	AddMagic(396)          -- 学会“春风雨露”
	SetTask(76,50)
	Msg2Player("把配腰带给跛道人，拿到血勇丸，同时学会技能春风雨露")
	AddNote{"跛道人感激你的热血心肠，传授给你血勇丸和春风雨露，赶快去救治奔火! "}
end

function tuneprop_get()				-- 接任务
	pay_money = {20,40,60,80,100}		-- 定义价格，实际使用时要*10000
	i = (GetTask(92) + 1)
	SetTaskTemp(8,pay_money[i]*10000)
	SetTaskTemp(50,0)
	Say("好说，这点小钱孝敬道长便是"..GetTaskTemp(8).."这可不是小数目，我要先去赚去",2,"看你也有心,算了，你想治好哪部分/tuneprop_go","力量/no")
end

function tuneprop_jewel()
	SetTaskTemp(50,1)			-- 使用宝石
	SetTaskTemp(8,0)			-- 免费
	tuneprop_go()
end

function tuneprop_go()
	pay_money = GetTaskTemp(8)
	if (GetCash() >= pay_money) then
		Say("身法 ",5,"力量/tune_str","身法/tune_dex","这个事情我要回去想想/tune_vit","内功/tune_eng","你的力量已经最大了，还不满意吗？这样我也没办法了.  /no")
	else
		Talk(1,"","其实没钱也没关系，不过就不必硬充好汉了嘛!")
	end
end

function tune_str()
	base_str = {35,20,25,30,20}			-- 五行人物的天生力量，洗潜能时不允许低于此值
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- 洗完后力量会低于天生力量，不允许洗
		Talk(1,"","你的力量已经最大了，还不满意吗？这样我也没办法了!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddStrg(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("好了！按照你的意思了！我累死了！让我休息一下！",1,"多谢/no")
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- 洗完后身法会低于天生身法，不允许洗
		Talk(1,"","你的力量已经最大了，还不满意吗？这样我也没办法了!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddDex(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("好了！按照你的意思了！我累死了！让我休息一下！",1,"多谢/no")
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- 洗完后外功会低于天生，不允许洗
		Talk(1,"","你的力量已经最大了，还不满意吗？这样我也没办法了!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddVit(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("好了！按照你的意思了！我累死了！让我休息一下！",1,"多谢/no")
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- 洗完后内功会低于天生，不允许洗
		Talk(1,"","你的力量已经最大了，还不满意吗？这样我也没办法了!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddEng(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("好了！按照你的意思了！我累死了！让我休息一下！",1,"多谢/no")
	end
end

function check_jewel()
	if (GetTaskTemp(50) == 1) then			-- 是宝石洗的
		DelItemEx(353)
	else
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
	end
	SetTaskTemp(50,0)			-- 复位临时变量
	SetTaskTemp(8,0)
	return
end

function no()
end
