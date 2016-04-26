Include("\\script\\tong\\tong_award_head.lua");
Include("\\script\\global\\signet_head.lua")

function main(nItemIndex)
	local nItemTime = GetItemParam(nItemIndex,1);
	
	if (signet_clude_use(nItemIndex) == 0) then
		return 1
	end
	
	if (GetWeeklyOffer() >= MAX_WEEK_CONTRIBUTION)	then
		Say("你的贡献度获得已达周上限，仅能增加帮会的建设基金和战备基金。你是否要使用此道具？", 
		2,
		"使用/#signet_sure_use("..nItemIndex..")",
		"取消/cancel")
		return 1
	end
	--增加个人贡献度及帮会基金
	tongaward_fenglingdui()
end


function GetDesc(nItemIndex)
	local nYear = GetItemParam(nItemIndex, 2)
	local nMonth = GetItemParam(nItemIndex, 3)
	local nDate = GetItemParam(nItemIndex, 4)

	return "使用期限：<color=blue>"..nYear.."年"..nMonth.."月"..nDate.."日"
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
		print("删除弑者之印错误操作！")
	end
end

function signet_clude_use(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	local nCurTime = GetCurServerTime()	--/秒
	local szItemName = GetItemName(nItemIndex)
	if (nCurTime >= nParam1) then
		Msg2Player(szItemName.."已经损坏，不能使用了！")
		RemoveItemByIndex(nItemIndex)
		return 0
	end
	local _, nTongID = GetTongName()

	if (nTongID == 0) then
		Msg2Player("你不在帮会中，不能使用此道具。")
		return 0
	end

	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
		Msg2Player("隐士不能使用此道具。")
		return 0
	end	
	return 1
end