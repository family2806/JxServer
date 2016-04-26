
Include("\\script\\lib\\objbuffer_head.lua")
tbCaiPiao_Old = {}


tbCaiPiao_Old.SAVE_KEY			= "EVENT_cailuhongbao"
tbCaiPiao_Old.DK_STAGE			= 1
tbCaiPiao_Old.DK_TYPE			= 2
--tbCaiPiao_Old.DK_PLDATE			= 4	
tbCaiPiao_Old.DK_NUMBER_COUNT			= 3	
tbCaiPiao_Old.DK_NUMBER_NAME			= 4
tbCaiPiao_Old.DK_RESULT_NUMBER			= 5
tbCaiPiao_Old.DK_RESULT_NAME		= 6


function tbCaiPiao_Old:_init(nWeekDay)
	--本场数据
	self.nStage		= 1		--投注站状态
	self.nType		= mod(nWeekDay, 10)	--类型
	
--	self.tbData_PL	= {}	--个人投注数字
	
	self.tbNumberCount	= {}	--投注数字的次数
	self.tbNumberName	= {}	--投注数字的名字
	
	--中奖
	self.nResultNumber	= 0		--中奖数字
	self.szPlayerName	= ""	--中奖玩家名
	
	self.nWeekDay	= nWeekDay	
end


function tbCaiPiao_Old:Save(nWeekDay, nKey, var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, nWeekDay, nKey)
	OB_Release(handle)
end

function tbCaiPiao_Old:Load(nWeekDay, nKey)
	local handle = OB_Create()	
	OB_LoadShareData(handle, self.SAVE_KEY, nWeekDay, nKey)
	local var = nil
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end

function tbCaiPiao_Old:SaveAllData()
	local nWeekDay = self.nWeekDay
	self:Save(nWeekDay, self.DK_STAGE,			self.nStage			)
	self:Save(nWeekDay, self.DK_TYPE,			self.nType		    )

--	self:Save(nWeekDay, self.DK_PLDATE,			self.tbData_PL		)
	self:Save(nWeekDay, self.DK_NUMBER_COUNT,	self.tbNumberCount  )
	self:Save(nWeekDay, self.DK_NUMBER_NAME,	self.tbNumberName	)
	self:Save(nWeekDay, self.DK_RESULT_NUMBER,	self.nResultNumber  )
	self:Save(nWeekDay, self.DK_RESULT_NAME,	self.szResultName	)
	
end

function tbCaiPiao_Old:LoadAllData(nWeekDay)
	self.nWeekDay		= nWeekDay
	self.nStage			= self:Load(nWeekDay, self.DK_STAGE			)
	self.nType			= self:Load(nWeekDay, self.DK_TYPE			)

--	self.tbData_PL		= self:Load(nWeekDay, self.DK_PLDATE		)
	self.tbNumberCount	= self:Load(nWeekDay, self.DK_NUMBER_COUNT	)
	self.tbNumberName	= self:Load(nWeekDay, self.DK_NUMBER_NAME	)
	self.nResultNumber	= self:Load(nWeekDay, self.DK_RESULT_NUMBER	)
	self.szResultName	= self:Load(nWeekDay, self.DK_RESULT_NAME	)
end


function tbCaiPiao_Old:CheckRound(nWeekDay)
	if self:Load(nWeekDay, self.DK_STAGE) == nil then
		return
	else
		return 1
	end
end

function tbCaiPiao_Old:ClearRound(nWeekDay)
	self:_init(nWeekDay)
	self.nStage = 0
	self:SaveAllData()
end 


function tbCaiPiao_Old:NewRound(nWeekDay)
	self:_init(nWeekDay)
	self:SaveAllData()
end

function tbCaiPiao_Old:SetStage(nStage)
	self.nStage = nStage
	self:Save(self.nWeekDay, self.DK_STAGE, self.nStage)
end

function tbCaiPiao_Old:MegeCountData(tbSrcData, tbTmpData)
	if not tbTmpData then
		return
	end
	for nNumber, nCount in tbTmpData do
		if type(tbTmpData[nNumber]) == "number" then
			if type(tbSrcData[nNumber]) == "number" then
				tbSrcData[nNumber] = tbTmpData[nNumber] + tbSrcData[nNumber]
			else
				tbSrcData[nNumber] = tbTmpData[nNumber]
			end
		end
	end
end

function tbCaiPiao_Old:MegeNameData(tbSrcData, tbTmpData)
	if not tbTmpData then 
		return
	end
	for nNumber, tbName in tbTmpData do
		if not tbSrcData[nNumber] then --目前没人投过这个数
			tbSrcData[nNumber] = tbName
		else
			for k, v in tbTmpData[nNumber] do --遍历新数据的所有名字
				if not tbSrcData[nNumber][k] then --原数据里面这个人没投过，那就标记为投过		
					tbSrcData[nNumber][k] = v
				end
			end
		end
	end
end 

function tbCaiPiao_Old:GetCurAwardWeekDay()
	local nHM = tonumber(date("%H%M"))
	local nWeek = tonumber(date("%W"))
	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 1 and (0000 <= nHM and nHM < 2000) then --跨年就会出问题，这次活动不跨年，暂时不处理
		nWeek = nWeek - 1
		return nWeek*10
	elseif nDay == 0 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10+6
	elseif nDay == 6 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10 + 5
	elseif (nDay == 0 or nDay == 5 or nDay == 6) and (2100 <= nHM and nHM <= 2400) then
		return nWeek*10 + nDay
	else
		return 
	end
end


function tbCaiPiao_Old:CalcResult()
	self:DebugOut(self.nStage)
	
	self:SetStage(2)
	local nWeek = floor(self.nWeekDay / 10)
	self.nResultNumber	= 0
	self.szPlayerName	= ""
	local tbData = self.tbNumberCount
	local tbDataName = self:Load(nWeek*10, self.DK_NUMBER_NAME)
	if self.nType == 0 then
		
		
		
		local nWeek = floor(self.nWeekDay / 10)
		--周五数据
		local tbTmpCount = self:Load(nWeek*10+5, self.DK_NUMBER_COUNT)
		local tbTmpName =  self:Load(nWeek*10+5, self.DK_NUMBER_NAME)
		self:MegeCountData(tbData, tbTmpCount)
		self:MegeNameData(tbDataName, tbTmpName)
		--周六数据
		tbTmpCount = self:Load(nWeek*10+6, self.DK_NUMBER_COUNT)
		tbTmpName =  self:Load(nWeek*10+6, self.DK_NUMBER_NAME)
		self:MegeCountData(tbData, tbTmpCount)
		self:MegeNameData(tbDataName, tbTmpName)
		
--		self:Save(self.nWeekDay, self.DK_NUMBER_COUNT, tbData)
--		self:Save(self.nWeekDay, self.DK_NUMBER_NAME, tbDataName)
	end
		
	if not tbData or getn(tbData) <= 0 then
		self:DebugOut("Calc data is nil")
		return 
	end	
	
	local nMinNumber = 0
	--查找最小且投注数为1的数字
	
	local tbTmpSet = {}
	for nNumber, nCount in tbData do 
		
		if type(nNumber) == "number" and nCount == 1 then
			if nMinNumber == 0 or nMinNumber > nNumber then
				nMinNumber = nNumber
			end
		elseif type(nNumber) == "number" then
			tinsert(tbTmpSet, nNumber)
		end
	end
	if not tbDataName[nMinNumber] then
		self:DebugOut("no player Wager", nMinNumber)
	end
	if tbDataName and tbDataName[nMinNumber] then
		for k, v in tbDataName[nMinNumber] do
			self.szPlayerName = k
		end
	end
	
	if nMinNumber <= 0 then --没人中奖，随机一个人中奖
		local nTmpNumber = tbTmpSet[random(1, getn(tbTmpSet))]
		tbTmpSet = {}
		for k,v in tbDataName[nTmpNumber] do
			if v then tinsert(tbTmpSet, k) end
		end
		self.szPlayerName = tbTmpSet[random(1, getn(tbTmpSet))]
	end
	
	self.nResultNumber		= nMinNumber
	
	--self:Save(self.nWeekDay, self.DK_RESULT_NAME,	self.szPlayerName)
	--self:Save(self.nWeekDay, self.DK_RESULT_NUMBER,	self.nResultNumber)
	self:SetStage(3)
	
	
	--self:AnnounceResult(self.nType, self.nResultNumber, self.szPlayerName)
	
	return self.nResultNumber, self.szPlayerName
end


function tbCaiPiao_Old:Wager(szName, nNumber)
	if self.nStage ~= 1 then
		
		return -1
	end
	
	if nNumber <= 0 then
		
		return 0
	end
	
--	if not self.tbData_PL[szName] then
--		self.tbData_PL[szName] = {}
--	end
	
--	if self.tbData_PL[szName][nNumber] ~= 1 then --玩家数据有改变才保存
--		self.tbData_PL[szName][nNumber]= 1
--		self:Save(self.DK_PLDATE, self.tbData_PL)
--	end
	
	if self.tbNumberCount[nNumber] then
		self.tbNumberCount[nNumber] = self.tbNumberCount[nNumber] + 1
	else
		self.tbNumberCount[nNumber] = 1
	end
	
	if not self.tbNumberName[nNumber] then
		self.tbNumberName[nNumber] = {}
	end
	
	if self.tbNumberName[nNumber][szName] ~= 1 then
		self.tbNumberName[nNumber][szName] = 1
		self:Save(self.nWeekDay, self.DK_NUMBER_NAME, self.tbNumberName)
	end
	
	self:Save(self.nWeekDay, self.DK_NUMBER_COUNT, self.tbNumberCount)
	
	
	return nNumber
	
end

function tbCaiPiao_Old:DebugOut(...)
	if not arg or getn(arg) <= 0 then
		return
	end
	local szMsg = ""
	
	for i=1, getn(arg) do
		szMsg = szMsg.."  "..arg[i]
	end
	OutputMsg("[caipiao - fix]"..szMsg)
end

function tbCaiPiao_Old:LoadRound(nWeekDay)
	local nType	 	= mod(nWeekDay,10)
	self.nWeekDay	= nWeekDay
	if not self:CheckRound(nWeekDay) then
		
		self:DebugOut("data", nWeekDay, "not exist")
		return 
	else
		self:LoadAllData(nWeekDay)
		self:DebugOut("load", nWeekDay, "data")
		return 1
	end
end


function tbCaiPiao_Old:GetPersonData(szName)
--	if not self.tbData_PL[szName] then
--		self.tbData_PL[szName] = {}
--	end
--	return self.tbData_PL[szName]
end




-------------------接收到Gameserver的申请

function tbCaiPiao_Old_SetStage(ParamHandle, ResultHandle)
	local nStage	= ObjBuffer:PopObject(ParamHandle)
	
	if nStage == 2 then
		tbCaiPiao_Old:CalcResult()
	else
		tbCaiPiao_Old:SetStage(nStage)
	end
	
end


function tbCaiPiao_Old_ApplyGetInfo(ParamHandle, ResultHandle)
	
	local nWeekDay = ObjBuffer:PopObject(ParamHandle)
	local tbTmpCount = tbCaiPiao_Old:Load(nWeekDay, tbCaiPiao_Old.DK_NUMBER_COUNT)
	local tbTmpName =  tbCaiPiao_Old:Load(nWeekDay, tbCaiPiao_Old.DK_NUMBER_NAME)
	
	ObjBuffer:PushObject(ResultHandle, tbTmpCount)
	ObjBuffer:PushObject(ResultHandle, tbTmpName)
end

function tbCaiPiao_Old_PersonQuery(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local tbData = tbCaiPiao_Old:GetPersonData(szName)
	
	ObjBuffer:PushObject(ResultHandle, tbData)
end


--投注 
function tbCaiPiao_Old_Wager(ParamHandle, ResultHandle)	
	
	local szName	= ObjBuffer:PopObject(ParamHandle)
	local nNumber	= ObjBuffer:PopObject(ParamHandle)
	
	local nResult	= tbCaiPiao_Old:Wager(szName, nNumber)
	
	ObjBuffer:PushObject(ResultHandle, nResult)	
end


--获得结果数据
function tbCaiPiao_Old_GetResultData(ParamHandle, ResultHandle)
	local nWeekDay	= ObjBuffer:PopObject(ParamHandle)
	
	local nType	= tbCaiPiao_Old:Load(nWeekDay, tbCaiPiao_Old.DK_TYPE)
	local nResultNumber = tbCaiPiao_Old:Load(nWeekDay, tbCaiPiao_Old.DK_RESULT_NUMBER)
	local szPlayerName	= tbCaiPiao_Old:Load(nWeekDay, tbCaiPiao_Old.DK_RESULT_NAME)
	
	ObjBuffer:PushObject(ResultHandle, {nType, nResultNumber, szPlayerName, nWeekDay})	
end

function tbCaiPiao_Old_StartRound(ParamHandle, ResultHandle)
	local nWeekDay	= ObjBuffer:PopObject(ParamHandle)
	tbCaiPiao_Old:LoadRound(nWeekDay)
end


function tbCaiPiao_Old:Fix(nWeekDay)
	self:LoadRound(nWeekDay)
	local szMsg = ""
	if nWeekDay == 55 then
		szMsg = "date：2010-02-05 ResultNumber is %d  PlayerName is %s"
	elseif nWeekDay == 56 then
		szMsg = "date：2010-02-06 ResultNumber is %d  PlayerName is %s"
	elseif nWeekDay == 50 then
		szMsg = "date：2010-02-07 ResultNumber is %d  PlayerName is %s"
	end
	if not self.nResultNumber or not self.szResultName then
		self.nResultNumber, self.szPlayerName = self:CalcResult()
	end

	self:DebugOut(format(szMsg, self.nResultNumber , self.szResultName))
	
end