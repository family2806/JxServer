Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")

function OnTimer()
	t = GetMissionV(MS_TIME1_ACC) + 1
	SetMissionV(MS_TIME1_ACC , t)

	if (t == EXPRETIME) then  --如果到了结束前10秒钟则提示将要退出
		Msg2MSAll(GetMissionV(MS_DTMISSION), "<#>单挑战场于10秒后结束！")
	else
		RestTime = (TIMER_2 - t * TIMER_1)/FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime)
		if (RestSec == 0) then
			str = "<#>单挑时间还剩："..RestMin.."分"
		else
			str = "<#>单挑时间还剩："..RestMin.."分"..RestSec.."秒"
		end
		Msg2MSAll(GetMissionV(MS_DTMISSION),str)
	end
end  