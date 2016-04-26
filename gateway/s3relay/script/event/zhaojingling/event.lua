Include("\\script\\lib\\objbuffer_head.lua")

tbJingLing = {}
tbJingLing.tbData = {} --无序排列，记录所有玩家的当前斗酒成功的总酒量
tbJingLing.tbName = {}	--key为玩家名，value为此玩家名对应的在tbJingLing.tbTData的索引
tbJingLing.nFormerDate = 1 --前一天
tbJingLing.nCurDate = 2 --当天
tbJingLing.nSortKey = 3 --记录下次排序时间的key值
tbJingLing.nNextSortTime = 0 --下次排序时间

tbJingLing.SAVE_KEY = "EVENT_zhaojingling"

tbJingLing.Sort = function(tbA, tbB)
	return tbA[2] > tbB[2]
end

function tbJingLing:Save(nKey1, nKey2, var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	OB_Release(handle)
end

function tbJingLing:Load(nKey1, nKey2, varDefault)
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	local var = varDefault
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end

function tbJingLing:SaveData(tbTData, tbTName, nDate)
	local nCount = getn(tbTData)
	self:Save(nDate, 0, nCount)
	for i=1, nCount do
		self:Save(nDate, i, tbTData[i])
		local szName = tbTData[i][1]
		tbTName[szName] = i
	end
end

function tbJingLing:LoadData(nDate)
	local nCount = self:Load(nDate, 0, 0)
	local tb1 = {}
	local tb2 = {}
	for i=1, nCount do
		tb1[i] = self:Load(nDate, i, {})
		local szName = tb1[i][1]
		if szName ~= nil then
			tb2[szName] = i
		end
	end
	return tb1, tb2
end

function tbJingLing:GetData(nDate)
	if not self.tbData[nDate] then
		self.tbData[nDate], self.tbName[nDate] = self:LoadData(nDate)
	end
	return self.tbData[nDate]
end

function tbJingLing:g2s_AddCount(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nCount = ObjBuffer:PopObject(ParamHandle)
	self:GetData(self.nCurDate)
	local nIndex = self.tbName[self.nCurDate][szName]
	local nDataCount = getn(self.tbData[self.nCurDate])
	if type(nCount) == "number" then
		if nIndex == nil then
			tinsert(self.tbData[self.nCurDate], {szName, nCount})
			self.tbName[self.nCurDate][szName] = nDataCount + 1
			self:Save(self.nCurDate, 0, nDataCount + 1)
			self:Save(self.nCurDate, nDataCount + 1, self.tbData[self.nCurDate][nDataCount + 1])
		else
			self.tbData[self.nCurDate][nIndex][2] = self.tbData[self.nCurDate][nIndex][2] + nCount
			self:Save(self.nCurDate, nIndex, self.tbData[self.nCurDate][nIndex])
		end
	end	
end

function tbJingLing:g2s_GetFormerPaiMing(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nPaiMing = self:GetPaiMing(szName, self.nFormerDate)
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nPaiMing)
end

function tbJingLing:GetPaiMing(szName, nDate)
	self:GetData(nDate)
	if self.tbName[nDate] == nil or self.tbName[nDate][szName] == nil then
		return nil
	else
		return self.tbName[nDate][szName]
	end
end

function tbJingLing:g2s_QueryTopTen(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local tbTopTen = self:GetTopTen(self.nFormerDate)
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, tbTopTen)
end

function tbJingLing:GetTopTen(nDate)
	if nDate ~= self.nCurDate and nDate ~= self.nFormerDate then
		return nil
	end
	self:GetData(nDate)
	local nCount = getn(self.tbData[nDate])
	if nCount > 10 then
		nCount = 10
	end
	local tbTopTen = {}
	for i=1, nCount do
		local tb = self.tbData[nDate][i]
		if tb ~= nil and tb[1] ~= nil and tb[2] ~= nil then
			tinsert(tbTopTen, {tb[1], tb[2]})
		end
	end
	return tbTopTen
end

function tbJingLing:SortPaiMing()
	if self:CheckCanSort() ~= 1 then
		return
	end
	self:GetData(self.nCurDate)
	self:GetData(self.nFormerDate)
	sort(self.tbData[self.nCurDate], tbJingLing.Sort) --对今天的数据进行排序
	self:WriteLog(self.nCurDate)--将当天排名情况记入log
	self:SaveData(self.tbData[self.nCurDate], self.tbName[self.nFormerDate], self.nFormerDate) --用今天的数据覆盖掉昨天的数据
	self.tbData[self.nFormerDate] = nil
	local nCount = getn(self.tbData[self.nCurDate])
	if nCount == 0 then
		self.tbName[self.nFormerDate] = nil
		self:Save(self.nFormerDate, 0, 0)
	end
	self:GetData(self.nFormerDate) --更新昨天的数据
	--把今天的数据清空
	self.tbData[self.nCurDate] = nil
	self.tbName[self.nCurDate] = nil
	self:Save(self.nCurDate, 0, 0)
	self:GetData(self.nCurDate)
end

function tbJingLing:WriteLog(nDate)
	local szCurDate = tostring(date("%Y_%m_%d"))
	local szFilePath = format("\\relay_log\\%s\\zhaojingling.log", szCurDate)
	
	local nCount = getn(self.tbData[nDate])
	for i = 1, nCount do
		if self.tbData[nDate][i] ~= nil and self.tbData[nDate][i][1] ~= nil and self.tbData[nDate][i][2] ~= nil then
			WriteStringToFile(szFilePath, format("排名: %d 任务: %s 数量: %d/n", i, self.tbData[nDate][i][1], self.tbData[nDate][i][2]))
		end
	end
end

function tbJingLing:CheckCanSort()
	local nCurTime = GetSysCurrentTime()
	self:GetNextSortTime()
	if nCurTime >= self.nNextSortTime then
		self.nNextSortTime = self.nNextSortTime + 24 * 60 * 60
		self:Save(self.nSortKey, 0, self.nNextSortTime)
		return 1
	end
end

function tbJingLing:GetNextSortTime()
	if self.nNextSortTime == 0 then
		self.nNextSortTime = self:Load(self.nSortKey, 0, 0)
	end
	if self.nNextSortTime == 0 then --活动发布后第一次排序
		local nCurTime = GetSysCurrentTime()
		local tbDate = Time2Tm(nCurTime)
		local nTime = Tm2Time(tbDate[1], tbDate[2], tbDate[3])
		self.nNextSortTime = nTime + 24 * 60 * 60 + 30 * 60 --每天的00:30进行排名
		self:Save(self.nSortKey, 0, self.nNextSortTime)
	end
	return self.nNextSortTime
end


