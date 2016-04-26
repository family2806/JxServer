-- 洗PK的衙役.lua
-- By Dan_Deng(2003-11-10)

Include("\\Script\\Global\\TimerHead.lua")
Include("\\Script\\Global\\FuYuan.lua")

function default_talk()
	if (GetFightState() ~= 0) then
		SetFightState(0)
	end
	Say("衙役：国有国法，家有家规，双手沾满血腥之人逃到天涯海角也不可能逃脱律法的制裁！",3,"我来自首/atone","我来探监/visit","没事/no")
	LeaveTeam();
end

function atone()				-- 自首洗PK
	local PK_value = GetPK()
	local my_money = GetCash()
	local ExpPer = GetExpPercent()
	local Uworld96 = GetTask(96)
	local Uworld94 = GetTask(94)
	if (Uworld96 > 0) then		-- 容错处理：如果在牢房外发现处于坐牢状态，先还原了再说
		SetTask(96,0)
		StopTimer()
		if (Uworld94 > 0) then	-- 如果还有保存的计时器，同时还原(如果是坐牢计时器则直接关计时器)
			if (Uworld94 ~= 9) then
				SetTimer(GetTask(95),GetTask(94));
			end
			SetTask(94,0)
			SetTask(95,0)
		end
	end
	if (PK_value == 0) then			-- 无罪
		Talk(2,"","玩家：日前我曾经不小心误伤他人，特来自首。","衙役：本府经过调查认为你那属于正常防卫，只要下次小心一些，不必太过自责。你去吧。")
	elseif (Uworld94 > 0) and (Uworld94 ~= 9) then		-- 已经有保存的计时器，不允许再保存（如果已保存的是坐牢计时器，容错处理掉）
		Talk(1,"","现在你肩负着许多任务尚未完成，怎么可以随便浪费时间，把自己有用之身送入大牢这样的地方？")
		Msg2Player("身上有太多计时任务，不允许投案自首。")
	elseif (ExpPer < -50) then			-- 负经验惩罚中，不允许洗PK
		Talk(1,"","衙役：象你这样血债累累的惯犯还想自首赎罪？哼哼，等着被人追杀吧！")
		Msg2Player("律法订定：负经验超过50%者，不给予自首赎罪的宽待！")
	else
		Say(GetName()..":日前我曾经不小心误伤他人，特来自首。", 1, "继续对话/want_atone")
	end
end

function want_atone()
	local PK_value = GetPK();
	local my_money = GetCash();
	Say("衙役：你双手沾有血腥，必须经过官府鉴别，自己在大牢之中静心悔过方可赎罪。<enter>……<enter>现判决如下：<enter>　　该犯<color=red> "..safeshow(GetName()).." <color>现在PK值为<color=red>"..PK_value.."<color>，没收该犯所带全部赃款<color=red>"..my_money.."<color>两，投入大牢悔过<color=red>"..PK_value.."<color>天。", 2, "进入大牢/go_atone", "还是潜逃吧/no");
end;

function go_atone()

	SetTask(96,100+GetPK())
	i = GetTimerId()
	if (i > 0) and (i ~= 9) then		-- 如果身上原有计时器并且不是坐牢计时器，先保存
		SetTask(94,i)
		SetTask(95,GetRestTime(i))
	else
		SetTask(94,0)
		SetTask(95,0)
		StopTimer()
	end
	local my_money = GetCash();
	Pay(my_money);
	Msg2Player("官差没收了你身上的所有银子共"..my_money.."两，并将你投入大牢。")
	WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t被投入大牢扣掉身上所有现金"..my_money.."两")
	FuYuan_Pause();
	SetTimer(12 * CTime * FramePerSec, 9)				-- 每120分钟通过计时器更新降低PK值
	DisabledTeam(1);
	NewWorld(208,1785,3062)
end

function visit()			-- 探监
	Say("衙役：走开走开，那里面都是要犯，探什么探，是不是同党啊！",2,"贿赂5000两银子/go_visit","走开/no")
end

function go_visit()
	if (GetCash() >= 5000) then
		Talk(1,"","衙役：你说什么？你的朋友在牢里生病了？既然这样，那你去探望一下也算是人之常情吧。记住不要做什么偷偷摸摸的勾当啊。")
		Msg2Player("贿赂衙役5000两银子，进入大牢探监")
		Pay(5000)
		SetTask(96,1)
		DisabledTeam(1);
		NewWorld(208,1785,3062)
	else
		Talk(1,"","衙役：快走开！是不是一定要我把你当凶犯同党抓进去才高兴！")
	end
end

function no()
end
