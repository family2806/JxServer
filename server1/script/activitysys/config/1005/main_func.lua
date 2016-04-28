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
		tinsert(tbOpt, {"Nép T©n Thñ Kim Bµi", tbPVLB_Main.DonateItem, {tbPVLB_Main}})
	end
	tinsert(tbOpt, {"KiÓm tra phÇn th­ëng", tbPVLB_Award.MainDialog, {tbPVLB_Award}})
	tinsert(tbOpt, {"PhÇn th­ëng hµng ngµy", PhongVanLenhBai2011.ShowDialogDaily, {PhongVanLenhBai2011}})
	tinsert(tbOpt, {"NhiÖm vô t©n thñ", tbPVLB_Quest.Main, {tbPVLB_Quest}})
	tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.MainDialog, {tbPVLB_ExchgEquip}})
	if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_WRONG_EQUIP) == 0 then
		tinsert(tbOpt, {"§æi l¹i trang bÞ nhËn sai", tbExchangeWrongEquip.GetGoldEquipListInRoom, {tbExchangeWrongEquip}})
	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx("Phong V©n LÖnh Bµi:", tbOpt)
end

function confirm_donate_ttkb(nCount)
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "Thao t¸c nµy chØ thùc hiÖn ®­îc trong thµnh §¹i Lý.")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "Mçi nh©n vËt chØ ®­îc nép vËt phÈm nµy 1 lÇn.", "~=") ~= 1 then
		return
	end
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i")
		return
	end
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)
	if nG ~= 6 or nD ~= 1 or nP ~= 30144 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i")
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
		Msg2Player(format("Nép thµnh c«ng 1 <color=yellow>T©n Thñ Kim Bµi<color> vµo bang héi. Sè l­îng hiÖn t¹i: <color=green>%d<color>", nItemCount + 1))
		tbLog:PlayerActionLog("PhongVanLenhBai", "Nép T©n Thñ Kim Bµi")
		tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "Nép T©n Thñ Kim Bµi", "T©n Thñ Kim Bµi trong bang: "..nItemCount + 1, 1)
	end	
end

function tbPVLB_Main:DonateItem()
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "Thao t¸c nµy chØ thùc hiÖn ®­îc trong thµnh §¹i Lý.")
		return
	end
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "¸óÏÂÎ´¼ÓÈë°ï»á£¬²»ÄÜNép T©n Thñ Kim Bµi")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "Mçi nh©n vËt chØ ®­îc nép vËt phÈm nµy 1 lÇn.", "~=") == 1 then
		GiveItemUI("Nép T©n Thñ Kim Bµi", "Yªu CÇu: T©n Thñ Kim Bµi", "confirm_donate_ttkb", "onCancel", 1)
	end
end

