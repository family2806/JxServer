-- 文件名　：event.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-16 10:57:44
--领取地点: 村镇的礼官。不能在七大城市的礼官领取
--要求：每日每账号只能领取4次
--领取时间: 每天21点00 – 22点00
--领取时限: 从 2008年02月02号 – 2008年03月02号 24点00
--使用时限: 从 2008年02月02号 – 2008年03月02号 24点00
Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\pay.lua")

local _FormatTimeHMToSring = function(nTimeHM)
	local nMinute = floor(nTimeHM / 100)
	local nSecond = mod(nTimeHM , 100)
	szMsg = format("%02d:%02d", nMinute, nSecond)
	return szMsg
end
function luckplanting_0801_main()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	local nTimeHM	= tonumber(GetLocalDate("%H%M"))
	local nTSKV		= GetTask(TSK_luckplanting_0801)
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	if luckplanting_0801_CheckMap() ~= 1 then
		Say("不好意思，这个我不清楚，大侠还是到新手村问问吧.", 0)
		return 0;
	end
	
	--每天21点00 – 22点00
	if nTimeHM < luckplanting_0801_GiveTime_S or nTimeHM > luckplanting_0801_GiveTime_E then
		Say(format("每天 %s - %s才分发树苗﹜.",%_FormatTimeHMToSring(luckplanting_0801_GiveTime_S), %_FormatTimeHMToSring(luckplanting_0801_GiveTime_E)),  0)
		return 0;
	end
	
	if GetLevel() < 80 or IsCharged() == 0 then
		Say("不好意思，你的等级还未到80级并且/或者还未充值.", 0)
		return 0;
	end
	
	
	if not luckplanting_0801_IsActDay() then
		Say(format("活动<color=yellow>%s<color>还没开始.",luckplanting_0801_szActName), 0)
		return 0;
	end
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --清零并更新时间
	end
	if mod(nTSKV,256) >= TSKV_luckplanting_0801 then --次数
		Say(format("你今日已领到<color=yellow>%d<color> 次, 明天再来吧.", TSKV_luckplanting_0801), 0)
		return 0;
	end
	local tbItem = {szName="C﹜ con", tbProp={6, 1, 1642, 1, 0, 0}, nExpiredTime = 20090105}
	tbAwardTemplet:GiveAwardByList(tbItem, "luckplanting")
	
	SetTask(TSK_luckplanting_0801, nTSKV+1);
end

function luckplanting_0801_IsActDay()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	return nDate >= luckplanting_0801_Time_S and nDate <= luckplanting_0801_Time_E and tbWeek[nWeek]
end

function luckplanting_0801_CheckMap()
	local tbCityMap = 
	{
		[174]	=1,
		[121]	=1,
		[153]	=1,
		[101]	=1,
		[99]	=1,
		[100]	=1,
		[20]	=1,
		[53]	=1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)]
end
         