Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\lib\\log.lua")
IncludeLib("TONG")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\config\\1005\\personal_award.lua")
Include("\\script\\activitysys\\config\\1005\\personal_quest.lua")
Include("\\script\\activitysys\\config\\1005\\exchange_gold_equip.lua")
Include("\\script\\activitysys\\config\\1005\\dailyaward.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\activitysys\\config\\1005\\exchange_wrong_equip.lua")
tbPVLB_Main = {}

function tbPVLB_Main:MainDialog()
	local tbOpt = {}
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_DONATE_ITEM_LIMIT) == 0 then
		tinsert(tbOpt, {"�����ֽ���", tbPVLB_Main.DonateItem, {tbPVLB_Main}})
	end
	tinsert(tbOpt, {"���ͽ���", tbPVLB_Award.MainDialog, {tbPVLB_Award}})
	tinsert(tbOpt, {"ÿ�ս���", PhongVanLenhBai2011.ShowDialogDaily, {PhongVanLenhBai2011}})
	tinsert(tbOpt, {"��������", tbPVLB_Quest.Main, {tbPVLB_Quest}})
	tinsert(tbOpt, {"��װ��", tbPVLB_ExchgEquip.MainDialog, {tbPVLB_ExchgEquip}})
	if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_WRONG_EQUIP) == 0 then
		tinsert(tbOpt, {"���س���װ��", tbExchangeWrongEquip.GetGoldEquipListInRoom, {tbExchangeWrongEquip}})
	end
	tinsert(tbOpt, {"ȡ��"})
	CreateNewSayEx("��������:", tbOpt)
end

function confirm_donate_ttkb(nCount)
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "�ò���ֻ���ڴ����ִ��")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "ÿ������ֻ�ܽ�һ�θ���Ʒ.", "~=") ~= 1 then
		return
	end
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "������Ʒ���ԣ����ټ��һ��")
		return
	end
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)
	if nG ~= 6 or nD ~= 1 or nP ~= 30144 then
		Talk(1, "", "������Ʒ���ԣ����ټ��һ��")
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	local nItemCount = TONG_GetTaskValue(nTongID, nTS_TONG_TASK_ITEM_COUNT)
	if nItemCount >= 0 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_DONATE_ITEM_LIMIT, 1)
		TONG_ApplySetTaskValue(nTongID, nTS_TONG_TASK_ITEM_COUNT, nItemCount + 1)
		Msg2Player(format("���ɹ�1 <color=yellow>���ֽ���<color> ����ᡣĿǰ����Ϊ: <color=green>%d<color>", nItemCount + 1))
		tbLog:PlayerActionLog("PhongVanLenhBai", "�����ֽ���")
		tbVngTransLog:Write("201109_�������ƻ/", 11, "�����ֽ���", "�������ֽ���: "..nItemCount + 1, 1)
	end	
end

function tbPVLB_Main:DonateItem()
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "�ò���ֻ���ڴ����ִ��")
		return
	end
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "����δ�����ᣬ���ܽ����ֽ���")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "ÿ����ֻ�ܽ�һ�θ���Ʒ.", "~=") == 1 then
		GiveItemUI("�����ֽ���", "Ҫ�����ֽ���", "confirm_donate_ttkb", "onCancel", 1)
	end
end

