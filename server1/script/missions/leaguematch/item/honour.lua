--����������

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "Ho�ng Kim V� L�m Vinh d�  "},
	[1255]	= {100, "B�c Tr�ng V� L�m Vinh d�  "},
	[1256]	= {50, "��ng Xanh V� L�m Vinh d�  "},
	[1257]	= {10, "H�c Thi�t V� L�m Vinh d�  "},
}

--���Ի���
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("U�ng l�n thu�c ? ",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("S� d�ng V� L�m Vinh d� l�m ��t ���c <color=yellow>%d<color> vinh d� �i�m .", tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s, s� d�ng v� l�m vinh d� l�m ��t ���c ", szlog, GetTask(WLLS_TASKID_HONOUR)))
end
