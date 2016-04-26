Include("\\script\\tong\\tong_setting.lua")
--配置参数
WS_MAX_LEVEL = 10 --作坊最大等级
WS_COEF_CLOSE = 0.2 --关闭作坊的维护消耗比（对于开启状态）

aWorkshopTypeData = {}	--各类型作坊的配置参数
aWorkshopLevelData = {}	--作坊等级参数
aWorkshopNameType = {}  --由名字索引的类型ID

function LoadWorkshopSetting()	--载入配置
	local b2 = TabFile_Load("\\settings\\tong\\workshop\\workshop_level_data.txt", "WorkshopLevelData")
	local b3 = TabFile_Load("\\settings\\tong\\workshop\\workshops.txt", "WorkshopTypeData")
	if b2~=1 or b3~=1 then
		print("加载作坊配置文件失败！")
		if b2 == 1 then TabFile_UnLoad("WorkshopLevelData") end
		if b3 == 1 then TabFile_UnLoad("WorkshopTypeData") end
		return
	end
	local nRowCount = TabFile_GetRowCount("WorkshopLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("WorkshopLevelData", y, "LEVEL"))
		aWorkshopLevelData[nLevel] = {}
		for x = 1, 100 do 
			local szHead = TabFile_GetCell("WorkshopLevelData", 1, x)
			if szHead ~= "" then	
				aWorkshopLevelData[nLevel][szHead] = TabFile_GetCell("WorkshopLevelData", y, x)
			else
				break	
			end		
		end	
	end	
	nRowCount = TabFile_GetRowCount("WorkshopTypeData")
	for y = 2, nRowCount do
		local eType = tonumber(TabFile_GetCell("WorkshopTypeData", y, "TYPE"))
		aWorkshopTypeData[eType] = {}
		for x = 1, 100 do
			local szHead = TabFile_GetCell("WorkshopTypeData", 1, x)
			if szHead ~= "" then	
				aWorkshopTypeData[eType][szHead] = TabFile_GetCell("WorkshopTypeData", y, x)
			else
				break	
			end		
		end	
	end
	for i = 1, getn(aWorkshopTypeData) do
		aWorkshopNameType[aWorkshopTypeData[i]["NAME"]] = i
	end	
--	TabFile_UnLoad("WorkshopLevelData")
--	TabFile_UnLoad("WorkshopTypeData")
end
LoadWorkshopSetting()
------------------------运算公式-------------------------------------
--帮会人数修正系数
function calcMemberCoef(nMembers)
	if nMembers < 50 then
		return 1.5 - nMembers/50*(1.5-1)
	elseif	nMembers > 300 then
		return 5 - (300/nMembers)*(5-3)
	else
		return 1
	end
end

--作坊日常维护费用公式：基础建设度*帮会人数*作坊种类修正*帮会人数修正
function calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	return nBaseFund*nMembers*coefType*coefMember
end

--由正常作坊的日常消耗计算关闭状态作坊的日常消耗
function calcCloseDailyFund(nNormalFund)
	return nNormalFund * WS_COEF_CLOSE
end

-------------------------数据接口------------------------------------
function wsGetMaxLevel(nTongID, eType)
	return WS_MAX_LEVEL
end

function wsGetName(eType)
	return aWorkshopTypeData[eType]["NAME"]
end

function wsGetTypeID(szName)
	return aWorkshopNameType[szName]
end

function wsGetUpgradeCostFund(nTongID, eType, nCurLevel) --获取升下级所需建设基金
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["UPGRADE_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("获取升级建设基金时出错！")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen) --获取日常维护费用
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--基础建设度
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--获取帮会人数
	local coefMember = calcMemberCoef(nMembers)	--人数修正系数
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --建设系数（作坊种类修正）
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("获取日常维护费用时出错！")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen) --获取单人日常维护费用
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--基础建设度
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--获取帮会人数
	local coefMember = calcMemberCoef(nMembers)	--人数修正系数
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --建设系数（作坊种类修正）
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("获取日常维护费用时出错！")
		return INVALID_VALUE
	end
	return floor(nRet/nMembers)
end

function wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel) --获取开关单人维护费用差
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--基础建设度
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--获取帮会人数
	local coefMember = calcMemberCoef(nMembers)	--人数修正系数
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --建设系数（作坊种类修正）
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if (nRet == nil) then
		print("获取日常维护费用时出错！")
		return INVALID_VALUE
	end
	nRet = nRet - calcCloseDailyFund(nRet)
	return floor(nRet/nMembers)
end

function wsGetOpenCost(nTongID, eType, nCurLevel)	--获取开启消耗
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["OPEN_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("获取开启消耗时出错！")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetAllDayConsume(nTongID)	--获取所有作坊一天维护消耗
	local nTotalValue = 0
	local nID = TWS_GetFirstWorkshop(nTongID)
	while nID ~= 0 do
		local eType = TWS_GetType(nTongID, nID)
		local bOpen = TWS_IsOpen(nTongID, nID)
		local nCurLevel = TWS_GetUseLevel(nTongID, nID)
		nTotalValue = nTotalValue + wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen)
		nID = TWS_GetNextWorkshop(nTongID, nID)
	end
	return nTotalValue
end