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
		tinsert(tbOpt, {"交新手金牌", tbPVLB_Main.DonateItem, {tbPVLB_Main}})
	end
	tinsert(tbOpt, {"奖惩奖励", tbPVLB_Award.MainDialog, {tbPVLB_Award}})
	tinsert(tbOpt, {"每日奖励", PhongVanLenhBai2011.ShowDialogDaily, {PhongVanLenhBai2011}})
	tinsert(tbOpt, {"新手任务", tbPVLB_Quest.Main, {tbPVLB_Quest}})
	tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.MainDialog, {tbPVLB_ExchgEquip}})
	if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_WRONG_EQUIP) == 0 then
		tinsert(tbOpt, {"换回出错装备", tbExchangeWrongEquip.GetGoldEquipListInRoom, {tbExchangeWrongEquip}})
	end
	tinsert(tbOpt, {"取消"})
	CreateNewSayEx("风云令牌:", tbOpt)
end

function confirm_donate_ttkb(nCount)
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "该操作只能在大理城执行")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "每个人物只能交一次该物品.", "~=") ~= 1 then
		return
	end
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "放入物品不对，请再检查一下")
		return
	end
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)
	if nG ~= 6 or nD ~= 1 or nP ~= 30144 then
		Talk(1, "", "放入物品不对，请再检查一下")
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
		Msg2Player(format("交成功1 <color=yellow>新手金牌<color> 到帮会。目前数量为: <color=green>%d<color>", nItemCount + 1))
		tbLog:PlayerActionLog("PhongVanLenhBai", "交新手金牌")
		tbVngTransLog:Write("201109_风云令牌活动/", 11, "交新手金牌", "帮内新手金牌: "..nItemCount + 1, 1)
	end	
end

function tbPVLB_Main:DonateItem()
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "该操作只能在大理城执行")
		return
	end
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "阁下未加入帮会，不能交新手金牌")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "每个人只能缴一次该物品.", "~=") == 1 then
		GiveItemUI("交新手金牌", "要求：新手金牌", "confirm_donate_ttkb", "onCancel", 1)
	end
end

