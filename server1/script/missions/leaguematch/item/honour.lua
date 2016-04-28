--ÎäÁÖÈÙÓþÁî

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "Hoµng Kim Vâ L©m Vinh dù  "},
	[1255]	= {100, "B¹c Tr¾ng Vâ L©m Vinh dù  "},
	[1256]	= {50, "§ång Xanh Vâ L©m Vinh dù  "},
	[1257]	= {10, "H¾c ThiÕt Vâ L©m Vinh dù  "},
}

--Ö÷¶Ô»°¿ò
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("Uèng lén thuèc ? ",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("Sö dông Vâ L©m Vinh dù lµm ®¹t ®­îc <color=yellow>%d<color> vinh dù ®iÓm .", tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s, sö dông vâ l©m vinh dù lµm ®¹t ®­îc ", szlog, GetTask(WLLS_TASKID_HONOUR)))
end
