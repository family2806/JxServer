--����������

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "�ƽ�����������"},
	[1255]	= {100, "��������������"},
	[1256]	= {50, "��ͭ����������"},
	[1257]	= {10, "��������������"},
}

--���Ի���
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("�Դ�ҩ�ˣ�",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("ʹ��������������<color=yellow>%d<color>������.", tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s,ʹ��������������", szlog, GetTask(WLLS_TASKID_HONOUR)))
end
