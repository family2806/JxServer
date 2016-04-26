Include("\\script\\event\\2011dayanqunxia\\event.lua")

local nStartDate = 20110123000
local nEndDate = 201102210000

function TaskShedule()
	
	TaskName("大宴群侠24h酒量排行")

	-- 一天一次，单位分钟
	TaskInterval(1440)
	-- 设置触发时间
	TaskTime(0, 0)
	OutputMsg("在举行大宴群侠的活动期间，将根据玩家每天在24时的酒量来进行排名")
	-- 执行无限次
	TaskCountLimit(0)
end

function TaskContent()
	local nCurDate = tonumber(tbQunXia:GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < %nStartDate or nCurDate > %nEndDate then
		return
	end
	tbQunXia:PaiMing()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end