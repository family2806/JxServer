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
	local strTittle = "HiÖn t¹i cã thÓ: "
	local tbOpt = {}
	local nLevel = GetLevel()
	if nTransLife == 1 then		
		if nLevel >= 115 and nLevel <= 129 then
			strTittle = strTittle.."§æi 1 trang bÞ Th­¬ng Lang lÊy HuyÒn Viªn (Trõ vò khÝ vµ nhÉn)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_1) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "DoiTrangBiLan1", tbBITTASK_EXCHANGE_EQUIP_1}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel >= 130 and nLevel <= 139 then
			strTittle = strTittle.."§æi 1 trang bÞ Th­¬ng Lang lÊy HuyÒn Viªn (Trõ vò khÝ vµ nhÉn)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_2) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "DoiTrangBiLan2", tbBITTASK_EXCHANGE_EQUIP_2}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel >= 140 and nLevel <= 149 then
			strTittle = strTittle.."§æi 1 trang bÞ Th­¬ng Lang lÊy HuyÒn Viªn (Trõ vò khÝ vµ nhÉn)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_3) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "µÚÈý´Î§æi trang bÞ3", tbBITTASK_EXCHANGE_EQUIP_3}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel >= 150 and nLevel <= 159 then
			strTittle = strTittle.."§æi 1 trang bÞ Th­¬ng Lang lÊy HuyÒn Viªn (Trõ vò khÝ vµ nhÉn)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_4) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ",tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "µÚ4´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_4}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel >= 160 and nLevel <= 169 then
			strTittle = strTittle.."§æi 1 trang bÞ Th­¬ng Lang lÊy HuyÒn Viªn (Trõ vò khÝ vµ nhÉn)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_5) == 1 and tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_13) == 1 and tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_14) == 1 then				
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			else
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_5) == 0 then
					tinsert(tbOpt, {"µÚÒ»´Î§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "µÚÎå´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_5}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_13) == 0 then
					tinsert(tbOpt, {"µÚ2´Î§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "µÚ13´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_13}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_14) == 0 then
					tinsert(tbOpt, {"µÚ3´Î§æi trang bÞ", tbPVLB_ExchgEquip.Exchange1, {tbPVLB_ExchgEquip, "µÚ14´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_14}})
				end
			end
		end
	elseif nTransLife == 2 then
		if nLevel >= 115 and nLevel <= 129 then
			strTittle = strTittle.."§æi 2 nhÉn Th­¬ng Lang lÊy 2 nhÉn HuyÒn Viªn"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_6) == 1 and  tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_12) == 1 then
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			else
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_12) == 0 then
					tinsert(tbOpt, {"§æi nhÉn 1", tbPVLB_ExchgEquip.Exchange2, {tbPVLB_ExchgEquip, "µÚ12´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_12}})
				end
				if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_6) == 0 then
					tinsert(tbOpt, {"§æi nhÉn 2", tbPVLB_ExchgEquip.Exchange2, {tbPVLB_ExchgEquip, "µÚ6´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_6}})
				end
			end
		end
		if nLevel >= 131 and nLevel <= 139 then
			strTittle = strTittle.."§æi 1 vò khÝ Th­¬ng Lang lÊy 1 vò khÝ HuyÒn Viªn"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_7) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange3, {tbPVLB_ExchgEquip, "µÚ7´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_7}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end		
		if nLevel == 175 then
			strTittle = strTittle.."§æi 1 trang bÞ HuyÒn Viªn lÊy 1 trang bÞ Tö M·ng (trõ nhÉn vµ vò khÝ)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_8) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "µÚ8´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_8}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel == 177 then
			strTittle = strTittle.."§æi 1 trang bÞ HuyÒn Viªn lÊy 1 trang bÞ Tö M·ng (trõ nhÉn vµ vò khÝ)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_9) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "µÚ9´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_9}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
		if nLevel == 179 then
			strTittle = strTittle.."§æi 1 trang bÞ HuyÒn Viªn lÊy 1 trang bÞ Tö M·ng (trõ nhÉn vµ vò khÝ)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_10) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "µÚ10´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_10}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
	elseif nTransLife == 3 then
		if nLevel == 130 then
			strTittle = strTittle.."§æi 1 trang bÞ HuyÒn Viªn lÊy 1 trang bÞ Tö M·ng (trõ nhÉn vµ vò khÝ)"
			if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_EQUIP_11) == 0 then
				tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.Exchange4, {tbPVLB_ExchgEquip, "µÚ11´Î§æi trang bÞ", tbBITTASK_EXCHANGE_EQUIP_11}})
			else
				strTittle = strTittle.."\n\t\t\t\t<color=red>§· ®æi th­ëng<color>"
			end
		end
	end
	
	tinsert(tbOpt, {"§ãng"})
	CreateNewSayEx(strTittle, tbOpt)
end
--»»²ÔÀÇ»ñÈ¡ÐþÔ³£¬³ý½äÖ¸ºÍÎäÆ÷
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
--»»²ÔÀÇ»ñÈ¡ÐþÔ³
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
--»»²ÔÀÇÎäÆ÷»ñÈ¡ÐþÔ³
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
--»»ÐþÔ³»ñÈ¡×ÏÃ§£¨³ý½äÖ¸ºÍÎäÆ÷£©
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