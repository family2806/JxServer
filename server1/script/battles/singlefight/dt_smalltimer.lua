Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")

function OnTimer()
	t = GetMissionV(MS_TIME1_ACC) + 1
	SetMissionV(MS_TIME1_ACC , t)

	if (t == EXPRETIME) then  --������˽���ǰ10��������ʾ��Ҫ�˳�
		Msg2MSAll(GetMissionV(MS_DTMISSION), "<#>����ս����10��������")
	else
		RestTime = (TIMER_2 - t * TIMER_1)/FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime)
		if (RestSec == 0) then
			str = "<#>����ʱ�仹ʣ��"..RestMin.."��"
		else
			str = "<#>����ʱ�仹ʣ��"..RestMin.."��"..RestSec.."��"
		end
		Msg2MSAll(GetMissionV(MS_DTMISSION),str)
	end
end  