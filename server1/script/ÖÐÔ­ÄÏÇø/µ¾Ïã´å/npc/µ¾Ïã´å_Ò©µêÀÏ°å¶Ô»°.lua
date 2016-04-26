--description: 新手村_药店老板
--author: wangzg	
--date: 2003/7/18
--modify wangzg 2003/7/21 17:00
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

Include("\\script\\global\\timerhead.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	UTask_world38 = GetTask(66)
	if (UTask_world38 == 1) then		--已接任务
  		Say("小兰的爷爷是熟客，他需要麝香虎骨膏，750两一瓶，如果有麝香和虎骨，我将免费做.", 4, "直接买/buy", "找原料/source", "买其他药/yes","让我想想!/no")
	elseif (UTask_world38==2) then
		if (HaveItem(185) == 1) and (HaveItem(142) == 1) then
			if (GetTimerId() > 0) then		-- 另有计时器在运行中
				Talk(1,"","你任务紧急，还乱跑?")
				return
			end
			SetTimer(0.5 * CTime * FramePerSec, 6)									--开启计时器：半个时辰 * 时辰长 * 帧数
			Talk(2, "", "老板，我已经找到虎骨和麝香了.", "两种药都有，半个小时后回来取!")
			SetTask(66,3)
			DelItem(185)
			DelItem(142)
			AddNote("找够原料后，等半个小时才能做好.")
			Msg2Player("找够原料后，等半个小时才能做好.")
		else
  			Say("如果有麝香和虎骨，我将免费做.", 3, "直接卖麝香虎骨膏!/buy","交易/yes", "不交易/no")
		end
	elseif (UTask_world38 == 3) then				-- 为计时器容错加入手动超时处理
		i = GetRestSec(6)
		if (i > 0) then
			Say("<#> 时间不够，药未做完，你要多等."..i.."<#> 秒.", 3, "我不想等了，直接买了!/buy","我想交易/yes", "那算了甶/no")
		else
			StopTimer()						--结束计时
			W66_getitem()
		end
	elseif (UTask_world38 == 4) then		-- 计时器已到时
		W66_getitem()
	else
		Say("你已经吃了五谷杂粮，不头痛才怪，我这里虽然小，但是，不缺什么，你想买药吗?", 3, "交易/yes","我来接初入任务/yboss", "不交易/no")
	end
end;

function buy()
  	if (GetCash() < 750) then
  		Talk(1,"","没有钱就不能买药.")
  	else
  		Pay(750)
  		AddEventItem(186)
  		Msg2Player("获得麝香虎骨膏.")
  		SetTask(66,5)
  		AddNote("买到麝香虎骨膏.")
  		Msg2Player("买到麝香虎骨膏.")
		if (GetTimerId() == 6) then			-- 正在合药计时中
			StopTimer()
		end
  	end
end

function source()
-- Say("药店老板：如果你能弄到麝香和虎骨两种原料，我也可以免费帮你合药。", 0)		--好象是重复了。
SetTask(66,2)
AddNote("需要两种原料，麝香和虎骨来做药.")
end

function W66_getitem()
	AddEventItem(186)
	Msg2Player("获得麝香虎骨膏.")
	SetTask(66,5)
--	StopTimer()
	AddNote("获得麝香虎骨膏.")
end

function yes()
Sale(91);   			--弹出交易框
end;

function no()
end;
