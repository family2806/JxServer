--金锭和银锭脚本文件，玩家使用金锭、银锭后能够获得跨服银两

Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\log.lua")
local nMaxMoney = 1000000000

local tbItem2Jxb = 
{
	["6,1,3037"] = 10000000,
	["6,1,3036"] = 1000000,
}

function main(nItemIndex)
	
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then--不在原服就不能用
		return 1
	end
	
	local szItemName = GetItemName(nItemIndex)
	local szKey = format("%d,%d,%d", GetItemProp(nItemIndex))
	local nJxb = %tbItem2Jxb[szKey]
	if not nJxb then
		return
	end
	local tbItem = {}
	tbItem.tbProp = {nG, nD, nParticulType, -1, -1, 0}
	local nCurJxb = GetTask(TSK_TRIP_MONEY) + nJxb
	if nCurJxb > %nMaxMoney then
		Talk(1, "", "请大侠原谅，连接服务器储存银两超过100.000万两就过上限")
		return 1
	end
	SetTask(TSK_TRIP_MONEY, nCurJxb)
	Msg2Player(format("你使用一个%s 获得%d 连接服务器银两", szItemName, nJxb))
	tbLog:PlayerAwardLog("Trip", format("use %s", szItemName), "TRIP_MONEY", "", nJxb)	
end