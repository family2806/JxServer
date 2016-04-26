--西南北区 成都府 采药少女对话（“采集药材”任务）
-- Update: Xiao_Yang(2004-04-26)（增加“采集药材任务”）

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld132 = GetTask(132)
	Uworld133 = GetByte(GetTask(133),1)
	if (Uworld132 == 10) and (HaveItem(112) == 1) and (HaveItem(113) ==1) and (HaveItem(114) ==1) and (HaveItem(115) ==1) and (HaveItem(116) ==1) then
		Talk(2,"Uworld132_finish","小姑娘! 你要的东西都在我这里","真的吗？太感谢你了!")
	elseif (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) and ((Uworld132 < 10) or ((GetGameTime() > Uworld132) and (Uworld132 > 255))) then		-- “采集药材”任务允许启动
		if (Uworld133 >= 5) then
			SetTask(133,0)
		end
		Talk(5,"Uworld132_get","...","小姑娘有什么事吗?","我的药店最近缺少一样主要药材，沧州的药都被大老板买完了.","买卖的事我不懂，但是，经常到你的店里买药，有什么困难你尽管说，说不定我能帮你.","真的吗？你知道哪里可以找到5种药：紫苜蓿、地锦草、茜草、虎耳草和灵芝吗?","哈哈，太幸运了，这些药我在药王谷看到过")
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","采药少女：我们成都附近山可多了，近的有峨眉山、青城山，稍远点有四姑娘山、邛崃山、岷山。山多，草药自然就多，尤其盛产川贝、麝香、天麻、虫草。")
		elseif (i == 1) then
			Talk(1,"","采药少女：我采来的草药，有些自己卖掉，有些卖给药铺，换来的钱养活我和奶奶。")
		else
			Talk(1,"","采药少女：我爹娘很早就去世了，只剩下我和奶奶相依为命，奶奶是我唯一的亲人。")
		end
	end
end;

function Uworld132_get()
	Say("那你可以帮我摘一点带回来吗?",2,"都是小事，姑娘等一下. /Uworld132_yes"," 那里很多怪物，在下武艺不精，最好是先多修炼一下. /Uworld132_no")
end

function Uworld132_yes()
	SetTask(132,10)
	Msg2Player("你说在药王谷看到了这五种药材，承诺会帮姑娘采摘. ")
end

function Uworld132_no()
end

function Uworld132_finish()
	
	local nResult = 0;
	
	-- 检查物品是还存在，如果非 1 则直接 return
	for i=112, 116 do
		nResult = HaveItem(i);
		if nResult~=1 then
			return
		end;
		DelItem(i);
	end;
	
	SetTask(132,GetGameTime()+3600)
	
	Uworld133 = GetByte(GetTask(133),1)
	Uworld133_2 = GetByte(GetTask(133),2)
	Cur_date = tonumber(date("%d"))
	if (Uworld133_2 == Cur_date) then
		Uworld133 = Uworld133 + 1
	else
		Uworld133 = 1
	end
	AddRepute(Uworld133)
	Msg2Player("你达到"..Uworld133.."名望值")
	if (Uworld133 >= 5)then
		SetTask(133,0)
		AddRepute(10)
		Msg2Player("多次出手帮助，你获得10点奖励! ")
	else
		Uworld133 = SetByte(Uworld133,2,Cur_date)
		SetTask(133,Uworld133)
	end
end
