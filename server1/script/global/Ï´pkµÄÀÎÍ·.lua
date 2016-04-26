-- 大牢牢头.lua　（洗点任务）
-- By Dan_Deng(2003-11-12)

Include("\\script\\global\\timerhead.lua")
Include("\\Script\\Global\\FuYuan.lua")
Include("\\script\\nationalwar\\head.lua")

function main(sel)
	local Uworld96 = GetTask(96)
	local PK_value = GetPK();
	if (Uworld96 == 1) then			-- 探监的
		Say("牢头：探望好了没有，快点走！",2,"谢谢这位大哥，我走了/visit_leave","请大哥再担待一下，我很快就走/no")
--	elseif (Uworld96 == 0) then		-- 出错了
--		Talk(1,"","牢头：喂！你是怎么混进天牢重地来的？有什么话去找GM解释吧！")
	elseif (PK_value <= 0) then		-- 洗清了PK的
		Talk(2,"PKclear","牢头：你！收拾好行李，你已经可以出狱了！","玩家：多谢大哥，那么我就走了。")
	else									-- 洗PK的
		-- 天子系统：大赦天下
		local absolve_time = NW_GetTask(NW_TASKNO_ABSOLVE)
		local current_time = GetCurServerTime()
		if (absolve_time ~= 0 and current_time < absolve_time + SECONDS_ONEHOUR) then
			Say("我朝天子今日龙颜大悦，大赦天下一切罪恶之人，小子你运气不错！还不赶紧走！",
				2,
				"赶紧溜/nw_absolve",
				"不我要留在这里/Cancel")
		else
			local n_timerid = GetTimerId();
			if (n_timerid ~= 9) then
				SetTask(96,100 + PK_value);
				SetTimer(12 * CTime * FramePerSec, 9)
				return
			end
		Say("牢头：罪孽未清之犯人，不得随意走动！",3,"问问时间/ask_timer","贿赂银子/pay_money","是，是，我这就回去坐好/no")
		end
	end
end

-- 天子系统：大赦天下
function nw_absolve()
	SetPK(0)
	leave_prison()
end

function ask_timer()
	if (GetCash() >= 1000) then		-- 有500两银子才让问
		Pay(1000)
		Talk(2,"","玩家：这位大哥，这里1000两银子请喝杯茶，我只是想问一下现在是什么时辰了。","牢头：你想要略微减低罪孽都还差"..GetRestCTime(9).."，赶紧回去坐好！")
	else
		Talk(2,"","玩家：这位大哥，我只是想问一下现在是什么时辰了。","牢头：问什么问！讨打是不是，还不快回去坐好！")
	end
end

function pay_money()
	PK_PayMoney = GetPK() * GetPK() * 10000
	Talk(1,"pay_money2","玩家：牢头大哥，这里"..PK_PayMoney.."两银子，小小意思不成敬意，只是我这身子实在是病得重了抗不住，可否请大哥开恩放我保外就医呢？")
end

function pay_money2()
	Say("牢头：看你那寒酸样，能有那么多银子吗？",2,"把钱塞到他手里/pay_yes","继续恳求/pay_no")
end

function pay_yes()
	PK_PayMoney = GetPK() * GetPK() * 10000
	if (GetCash() >= PK_PayMoney) then
		Pay(PK_PayMoney)
		Msg2Player("牢头允许你保外就医，你可以离开大牢了。")
		Talk(1,"leave_prison","牢头：唉，人道是律法无情人有情，既然你病得这么重，那就先去看看医生吧。记住你这只是保外就医，身上罪孽未清的，出去千万不要再犯什么事儿了啊！")
	else
		pay_no()
	end
end

function pay_no()
	Talk(1,"","牢头：穷鬼，滚开！信不信我拿大鞭子抽你啊！")
end

function PKclear()
	Msg2Player("在深刻反省之后，你终于被释放出狱。")
	leave_prison()
end

function leave_prison()
	StopTimer()
	if (GetTask(94) == 9) then		-- 身上错误地保存了坐牢计时器，不做其它处理直接清掉
		SetTask(94,0)
		SetTask(95,0)
	elseif (GetTask(94) > 0) then		-- 恢复身上原有的计时器
		Msg2Player("你记起自己身上还带着任务，赶紧去完成它吧。")
		SetTimer(GetTask(95),GetTask(94))
		SetTask(94,0)
		SetTask(95,0)
	end
	FuYuan_Resume();
	leave2()
end

function visit_leave()
	leave2()
end

function leave2()
	SetTask(96,0)
	leave_pos = GetTask(93)
	DisabledTeam(0);
	if (leave_pos == 1) then		-- 临安
		NewWorld(176,1473,3245)
	else								-- 汴京
		NewWorld(37,1781,3044)
	end
--	NewWorld(57,1592,3195)		-- 扔到衡山大厅
end

function no()
end
