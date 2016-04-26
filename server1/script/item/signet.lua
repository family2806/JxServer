Include("\\script\\tong\\tong_award_head.lua");
Include("\\script\\global\\signet_head.lua")

function main(nItemIndex)
	local nItemTime = GetItemParam(nItemIndex,1);
	
	if (signet_clude_use(nItemIndex) == 0) then
		return 1
	end
	
	if (GetWeeklyOffer() >= MAX_WEEK_CONTRIBUTION)	then
		Say("��Ĺ��׶Ȼ���Ѵ������ޣ��������Ӱ��Ľ�������ս���������Ƿ�Ҫʹ�ô˵��ߣ�", 
		2,
		"ʹ��/#signet_sure_use("..nItemIndex..")",
		"ȡ��/cancel")
		return 1
	end
	--���Ӹ��˹��׶ȼ�������
	tongaward_fenglingdui()
end


function GetDesc(nItemIndex)
	local nYear = GetItemParam(nItemIndex, 2)
	local nMonth = GetItemParam(nItemIndex, 3)
	local nDate = GetItemParam(nItemIndex, 4)

	return "ʹ�����ޣ�<color=blue>"..nYear.."��"..nMonth.."��"..nDate.."��"
end

function PickUp( nItemIndex, nPlayerIndex )
	local _, nTongID = GetTongName()
	if (nTongID > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 1)
	end
	return 1
end

function signet_sure_use(nItemIndex)
	if (signet_clude_use(nItemIndex) == 0) then
		return 0
	end
	
	if (RemoveItemByIndex(nItemIndex) == 1) then
		tongaward_fenglingdui()
	else
		print("ɾ��߱��֮ӡ���������")
	end
end

function signet_clude_use(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	local nCurTime = GetCurServerTime()	--/��
	local szItemName = GetItemName(nItemIndex)
	if (nCurTime >= nParam1) then
		Msg2Player(szItemName.."�Ѿ��𻵣�����ʹ���ˣ�")
		RemoveItemByIndex(nItemIndex)
		return 0
	end
	local _, nTongID = GetTongName()

	if (nTongID == 0) then
		Msg2Player("�㲻�ڰ���У�����ʹ�ô˵��ߡ�")
		return 0
	end

	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
		Msg2Player("��ʿ����ʹ�ô˵��ߡ�")
		return 0
	end	
	return 1
end