IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]="����",
	["3492"]="����",
	["3493"]="����",
	["3494"]="��ˮ",
	["3495"]="����",
	["3496"]="����",
	["3497"]="���",
	["3498"]="׷Ӣ",
	["3499"]="����",
	["3500"]="���",
	["3501"]="����",
	["3502"]="�������",
	["3503"]="��ӧ",
	["3504"]="��ѩ��˪",
	["3505"]="��⳾Ե",
	["3506"]="���Ǿ���",
	["3880"]="����",
	["3881"]="��ƽ��",
	["3882"]="�ش�",
	["3883"]="��ľ",
	["3884"]="����",
	["3885"]="��ʯ",
	["3886"]="�׻��",
	["3887"]="��������",
	["3888"]="�i���軨��",
}

tbVnGiaHanPhu.nExpiredTime = 10080

function tbVnGiaHanPhuGiveUIConfirm(nCount)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")	
	if not nCheckMap then
		return
	end
	if nCount ~= 1 then
		Talk(1, "", "������Ʒ���ԣ�����!")
		return
	end
	local nIDX = GetGiveItemUnit(1)
	local nQuality = GetItemQuality(nIDX)
	if nQuality ~= 1 then
		Talk(1, "", "������װ�����ǻƽ�װ��")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nIDX)
	if not tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] then
		Talk(1, "", "������װ������װ�Σ�����!")
		return
	end
	local nCurItemExpiredTime = ITEM_GetExpiredTime(nIDX)
	local nCurTime = GetCurServerTime()
	if (nCurItemExpiredTime - nCurTime < 0) then
		Talk(1, "", "װ���ѹ�ʹ���ڣ���������.")
		return
	end
	if (nCurItemExpiredTime <= 0) or (nCurItemExpiredTime - nCurTime > tbVnGiaHanPhu.nExpiredTime*60) then
		Talk(1, "", "ֻ������ʹ����Ϊ7�����µ�װ��.")
		return
	end
	if ConsumeEquiproomItem(1, 6,1,30225,1) ~= 1 then
		Talk(1, "", "û�ҵ����޷���Ʒ������ʧ��.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, tbVnGiaHanPhu.nExpiredTime)
	SyncItem(nIDX)
	Msg2Player(format("������Ʒ <color=yellow>%s<color> �ɹ�����Ʒʹ������<color=yellow>7<color> �죬�����ڻ�������.", strItemName))
	tbLog:PlayerActionLog("SuDungVatPhamGiaHanPhu", "������Ʒ "..strItemName, "�ɵ�ʹ�����޻�ʣ "..(nCurItemExpiredTime - nCurTime).." ��")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("���޷�", "�����һ����ʹ�����޵�װ�ε�����Ŀ�λ", "tbVnGiaHanPhuGiveUIConfirm", "onCancel")
	return 1
end