--�𶧺������ű��ļ������ʹ�ý𶧡��������ܹ���ÿ������

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
	if nTripMode ~= TRIP_MODE_CLIENT then--����ԭ���Ͳ�����
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
		Talk(1, "", "�����ԭ�£����ӷ�����������������100.000�����͹�����")
		return 1
	end
	SetTask(TSK_TRIP_MONEY, nCurJxb)
	Msg2Player(format("��ʹ��һ��%s ���%d ���ӷ���������", szItemName, nJxb))
	tbLog:PlayerAwardLog("Trip", format("use %s", szItemName), "TRIP_MONEY", "", nJxb)	
end