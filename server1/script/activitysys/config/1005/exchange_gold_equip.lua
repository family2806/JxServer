Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
IncludeLib("SETTING")
tbPVLB_ExchgEquip = {}

function tbPVLB_ExchgEquip:MainDialog()	
	local nTransLife = ST_GetTransLifeCount()
	if nTransLife < 1 or nTransLife > 3 then
		return
	end
	local strTittle = "目前可以"
	local tbOpt = {}
	local nLevel = GetLevel()
	if nTransLife == 1 then		
		if nLevel >= 115 and nLevel <= 129 then
			strTittle = strTittle.."换1套苍狼装备获取玄猿(除武器和戒指)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_1) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "DoiTrangBiLan1", tbBITTASK_EXCHANGE_EQUIP_1}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>Х i thng<color>"
			end
		end
		if nLevel >= 130 and nLevel <= 139 then
			strTittle = strTittle.."换1套苍狼装备获取玄猿(除武器和戒指)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_2) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "DoiTrangBiLan2", tbBITTASK_EXCHANGE_EQUIP_2}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>Х i thng<color>"
			end
		end
		if nLevel >= 140 and nLevel <= 149 then
			strTittle = strTittle.."换1套苍狼装备获取玄猿(除武器和戒指)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_3) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "第三次换装备3", tbBITTASK_EXCHANGE_EQUIP_3}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
		if nLevel >= 150 and nLevel <= 159 then
			strTittle = strTittle.."换3套苍狼装备获取玄猿(除武器和戒指)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_4) == 0 then
				tinsert(tbOpt, {"换装备",tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "第4次换装备", tbBITTASK_EXCHANGE_EQUIP_4}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
		if nLevel >= 160 and nLevel <= 169 then
			strTittle = strTittle.."换3套苍狼装备获取玄猿(除武器和戒指)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_5) == 1 and tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_13) == 1 and tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_14) == 1 then				
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			else
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_5) == 0 then
					tinsert(tbOpt, {"第一次换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "第五次换装备", tbBITTASK_EXCHANGE_EQUIP_5}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_13) == 0 then
					tinsert(tbOpt, {"第2次换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "第13次换装备", tbBITTASK_EXCHANGE_EQUIP_13}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_14) == 0 then
					tinsert(tbOpt, {"第3次换装备", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "第14次换装备", tbBITTASK_EXCHANGE_EQUIP_14}})
				end
			end
		end
	elseif nTransLife == 2 then
		if nLevel >= 115 and nLevel <= 129 then
			strTittle = strTittle.."换2个苍狼戒指获取2个玄猿戒指"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_6) == 1 and  tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_12) == 1 then
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			else
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_12) == 0 then
					tinsert(tbOpt, {"换戒指1", tbPVLB_ExchgEquip.Exchange2, {tbPVLB_ExchgEquip, "第12次换装备", tbBITTASK_EXCHANGE_EQUIP_12}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_6) == 0 then
					tinsert(tbOpt, {"换戒指2", tbPVLB_ExchgEquip.Exchange2, {tbPVLB_ExchgEquip, "第6次换装备", tbBITTASK_EXCHANGE_EQUIP_6}})
				end
			end
		end
		if nLevel >= 131 and nLevel <= 139 then
			strTittle = strTittle.."换一个苍狼武器活动1个玄猿武器"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_7) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange3, {tbPVLB_ExchgEquip, "第7次换装备", tbBITTASK_EXCHANGE_EQUIP_7}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end		
		if nLevel == 175 then
			strTittle = strTittle.."换一套玄猿装备获取一套紫莽装备（除戒指和武器）"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_8) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "第8次换装备", tbBITTASK_EXCHANGE_EQUIP_8}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
		if nLevel == 177 then
			strTittle = strTittle.."换一套玄猿装备获取一套紫莽装备（除戒指和武器）"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_9) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "第9次换装备", tbBITTASK_EXCHANGE_EQUIP_9}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
		if nLevel == 179 then
			strTittle = strTittle.."换一套玄猿装备获取一套紫莽装备（除戒指和武器）"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_10) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "第10次换装备", tbBITTASK_EXCHANGE_EQUIP_10}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
	elseif nTransLife == 3 then
		if nLevel == 130 then
			strTittle = strTittle.."换一套玄猿装备获取一套紫莽装备（除戒指和武器）"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_11) == 0 then
				tinsert(tbOpt, {"换装备", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "第11次换装备", tbBITTASK_EXCHANGE_EQUIP_11}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>已换奖励<color>"
			end
		end
	end
	
	tinsert(tbOpt, {"сng"})
	CreateNewSayEx(strTittle, tbOpt)
end
--换苍狼获取玄猿，除戒指和武器
function tbPVLB_ExchgEquip:Exchange1(strLog, tbBitTask)
	local tbExchange =
	{
		nOldType = 3,
		nNewType = 4,
		tbExclude = {tbVnItemPos.UPPER_RING, tbVnItemPos.LOWER_RING, tbVnItemPos.WEAPON, },
		tbLog = {"PhongVanLenhBai", strLog},
		pCallBack = function() %tbVNG_BitTask_Lib:setBitTask(%tbBitTask, 1) end,
		bAccessBindItem = 1,
		nBindState = -2,
	}
	tbVNGetGoldEquip:UpgradeEquip(tbExchange)
end
--换苍狼获取玄猿
function tbPVLB_ExchgEquip:Exchange2(strLog, tbBitTask)
	local tbExchange =
	{
		nOldType = 3,
		nNewType = 4,
		tbExclude = {0,1,3,4,5,6,7,8 },
		tbLog = {"PhongVanLenhBai", strLog},
		pCallBack = function() %tbVNG_BitTask_Lib:setBitTask(%tbBitTask, 1) end,
		bAccessBindItem = 1,
		nBindState = -2,
	}
	tbVNGetGoldEquip:UpgradeEquip(tbExchange)
end
--换苍狼武器获取玄猿
function tbPVLB_ExchgEquip:Exchange3(strLog, tbBitTask)
	local tbExchange =
	{
		nOldType = 3,
		nNewType = 4,
		tbExclude = {0,1,2,3,4,5,7,8,9 },
		tbLog = {"PhongVanLenhBai", strLog},
		pCallBack = function() %tbVNG_BitTask_Lib:setBitTask(%tbBitTask, 1) end,
		bAccessBindItem = 1,
		nBindState = -2,
	}
	tbVNGetGoldEquip:UpgradeEquip(tbExchange)
end
--换玄猿获取紫莽（除戒指和武器）
function tbPVLB_ExchgEquip:Exchange4(strLog, tbBitTask)
	local tbExchange =
	{
		nOldType = 4,
		nNewType = 5,
		tbExclude = {2,6,9 },
		tbLog = {"PhongVanLenhBai", strLog},
		pCallBack = function() %tbVNG_BitTask_Lib:setBitTask(%tbBitTask, 1) end,
		bAccessBindItem = 1,
		nBindState = -2,
	}
	tbVNGetGoldEquip:UpgradeEquip(tbExchange)
end