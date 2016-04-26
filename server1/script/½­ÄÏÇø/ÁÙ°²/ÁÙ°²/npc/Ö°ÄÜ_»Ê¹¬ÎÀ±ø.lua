-- 临安　职能　皇宫卫兵（两名）（丐帮50级任务）
-- by：Dan_Deng(2003-09-16)

function main()
		UTask_gb = GetTask(8)
	if ((UTask_gb >= 50*256+30) and (UTask_gb <60)) then		-- （第三次）
		Talk(3,"","曹公公有令，没有身份不得入宫!走开!",":T我有通行令牌","有通行令牌也不能进! ")
--		SetTask(8,50*256+40)
	elseif (UTask_gb == 50*256+20) and (HaveItem(139) == 1) then	-- （第二次）
		Msg2Player("令牌验证无误，进入皇宫. ")
		NewWorld(177, 1569, 3169)
	elseif (UTask_gb == 50*256+10) then		--带着50级任务（第一步）
		Talk(3,"","站住站住，你是活得不耐烦了敢在这乱跑! ","在下是丐帮弟子，有一件极其重要的东西要交给皇上","皇上不是任何人都可以见的。没有张大人密使的通行令牌谁都别想进")
		SetTask(8,50*256+20)
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","皇宫卫兵：喂喂喂！睁大你的狗眼，看看这是什么地方！好大胆子，竟敢在皇宫前面乱逛！")
		elseif (i == 1) then
			Talk(1,"","皇宫卫兵：皇宫禁地，擅闯者死！")
		else
			Talk(1,"","皇宫卫兵：站住！你不要命了，竟敢擅闯皇宫！")
		end
	end
end;
