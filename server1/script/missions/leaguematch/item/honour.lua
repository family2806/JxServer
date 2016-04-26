--武林荣誉令

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "黄金武林荣誉令"},
	[1255]	= {100, "白银武林荣誉令"},
	[1256]	= {50, "青铜武林荣誉令"},
	[1257]	= {10, "黑铁武林荣誉令"},
}

--主对话框
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("吃错药了？",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("使用武林荣誉令获得<color=yellow>%d<color>荣誉点.", tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s,使用武林荣誉令获得", szlog, GetTask(WLLS_TASKID_HONOUR)))
end
