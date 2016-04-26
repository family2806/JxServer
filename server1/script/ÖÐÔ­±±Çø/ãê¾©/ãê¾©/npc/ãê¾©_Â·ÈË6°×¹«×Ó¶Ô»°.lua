--中原北区 汴京府 路人6白公子对话

function main(sel)
	x = GetTask(12)
	Uworld123 = GetTask(123)
	if (x > 0) and (x < 256) and (HaveItem(231+x) == 1) and (GetLevel() >= 20) and (GetRepute() >= 20) then			-- 等级过20、声望过20、有任务、有信函能对应上，可以开始收买
		if (GetSex() == 0) then		-- 玩家是男角色
			Talk(2,"W12_sale_get","这位少侠相貌不凡，这里无人不晓。本少爷也仰慕你已久. ","讨人，你想什么就说，不用拍马屁 ")
		else
			Talk(2,"W12_sale_get","V这位姑娘美如花，这里无人不晓。本少爷也仰慕你已久. ","讨人，你想什么就说，不用拍马屁 ")
		end
	elseif (Uworld123 == 20) and (HaveItem(379) == 1) then		-- 唐不染任务：有任务并且有信函
		Talk(3,"Uworld123_step1","不染公子的信终于到了，等得很久了，让我看看他说什么!","原来如此。太好了，真是天不负我。等一下，我立即写信给他!","好了，请把这封信转交给不染公子 .")
	elseif (Uworld123 == 30) and (HaveItem(380) == 0) then		-- 信丢了
		Talk(1,"","你做什么呢？还没拿就要走?")
		AddEventItem(380)
		Msg2Player("返回去接收白公子的书信 ")
	else
		Talk(1,"","白公子：那些金兵飞扬跋扈，咱们老百姓是敢怒不敢言啊！")
	end
end;

function W12_sale_get()
	Say("既然如此，在下就直说了。请问，我可以看看你的密函吗？我这有20000两，算是心意.",2,"请原谅，我要听从驿官的话，不能给他人看。/W12_sale_no","如果我送你20000两白银和这件皮衣，怎么样？/W12_sale_yes")
end

function W12_sale_yes()
	if (GetSex() == 0) then
		Talk(1,"","兄台真是大度之人，以后大金攻破临安，一定请兄台喝茶! ")
	else
		Talk(1,"","姑娘真是大度之人，以后大金攻破临安，一定请姑娘喝茶! ")
	end
	x = GetTask(12)
	DelItem(231 + x)		-- 删除道具
	SetTask(12,GetGameTime()+7200)			-- 在线时间2小时后可以重复送信任务
	Earn(20000)
	Msg2Player("你带驿官的密函，卖给金人。你的名望被减少")
	AddNote("你带驿官的密函，卖给金人。你的名望被减少")
	i = GetRepute()
	if (i >= 20) then			-- 扣声望20点，不够20就扣光（小于10的话前面已设定不让做）
		AddRepute(-1 * 20)
	else
		AddRepute(-1 * i)
	end
end

function W12_sale_no()
	Talk(1,"","一定要这么固执吗？不懂时势，有什么用？尽忠报国不如享受荣华富贵。即使是岳飞也要饮恨!")
end

function Uworld123_step1()
	AddEventItem(380)
	SetTask(123,30)
	DelItem(379)
	Msg2Player("收到白公子的书信 ")
end

function no()
end
