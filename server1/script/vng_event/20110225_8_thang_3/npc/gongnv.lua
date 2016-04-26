--Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_GongNV = {}

function tbVNGWD2011_GongNV:addDialog(tbDialog)	
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= 20110321 or now < 20110307) then
		return
	end	
	tbDialog:AddOptEntry("国际妇女节活动",tbVNGWD2011_GongNV.main,{tbVNGWD2011_GongNV})				
end

function tbVNGWD2011_GongNV:main()	
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	if tbVNG_WomenDay2011:IsActive() == 1 then
		tbMainDialog:AddOptEntry("介绍活动", tbVNGWD2011_GongNV.description, {tbVNGWD2011_GongNV})
		tbMainDialog:AddOptEntry("送玫瑰花束", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "送玫瑰花束"})
		tbMainDialog:AddOptEntry("换有色种子", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "合同有色种子"})
	end
	tbMainDialog:AddOptEntry("领取补充奖励", tbVNGWD2011_GongNV.GetExtraAward, {tbVNGWD2011_GongNV})
	tbMainDialog:Show()			
end

function tbVNGWD2011_GongNV:description()	
	local tbDescDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDescDialog.szTitleMsg = "该时间正举行庆祝国际妇女节活动。请到游戏主页了解详情."
	tbDescDialog:AddOptEntry("返回", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDescDialog:Show()
end

function tbVNGWD2011_GongNV:GetExtraAward()
	local tbDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDialog.szTitleMsg = "请选择奖励"
	
	local tbTSK, tbTSK_FLAG = {}
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("送玫瑰花束奖励100束", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("送玫瑰花束奖励200束", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("使用100 个礼盒奖励", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("使用200 个礼盒奖励", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("使用300 个礼盒奖励", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 300})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("使用400 个礼盒奖励", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 400})
	end
	
	tbDialog:AddOptEntry("返回", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDialog:Show()
end

function tbVNGWD2011_GongNV:ExtraRoseAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
		tbAward = {szName = "经验值", nExp=20000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
		tbAward = {szName = "经验值", nExp=40000000}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][奖励增加 %d束]", nRank))
end

function tbVNGWD2011_GongNV:ExtraGiftAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
		tbAward = {szName = "经验值", nExp=25000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
		tbAward = {szName = "经验值", nExp=50000000}
	elseif nRank == 300 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
		tbAward = {szName = "经验值", nExp=75000000}
	elseif nRank == 400 then
		if (CalcFreeItemCellCount() < 2) then
			Talk(1, "", format("为保卫财产，请留下 <color=red>%d<color> 装备空位后才能领奖!", 2))
			return
		end
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
		tbAward = 
			{
				{szName="五行印 (强化)",tbProp={0,3209},nCount=1,nQuality = 1,nExpiredTime = 43200},
				{szName="五行印 (弱化)",tbProp={0,3219},nCount=1,nQuality = 1,nExpiredTime = 43200},
			}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][使用%d 礼盒奖励", nRank))
end

function tbVNGWD2011_GongNV:onCancel()
end