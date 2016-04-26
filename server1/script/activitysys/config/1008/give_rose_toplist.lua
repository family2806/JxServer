Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
tbTop10 = {}
tbTop10.tbSubcribers = {}
tbTop10.tbTopList = {}
tbTop10.tbAwardCheck = {0,0,0}
tbTop10.nIDX_Account = 1
tbTop10.nIDX_TotalCount = 2
tbTop10.nIDX_LastUpdate = 3
tbTop10.tbFileHeader = {"Name", "Account", "数量", "最后一次交"}
tbTop10.tbTopListFileHeader = {"Name", "Account", "数量", "最后一次交"}
tbTop10.tbSubcribersPattern = {"*w", "*w", "*n", "*w"}
tbTop10.tbToplistPattern = {"*w", "*w", "*n", "*w"}
tbTop10.strFilePath = "vng_data/event_thang2_top10/"
tbTop10.strFileName = "subcribers.txt"
tbTop10.strTopListFileName = "toplist.txt"
tbTop10.nRegisterCount = 0
tbTop10.nSort_Time = 0005
tbTop10.tbPhase = {
	[1] = {201202020000, 201202282400}, --交花
	[2] = {201202290900, 201202292400}, --领奖
}
tbTop10.nStartDate = 201202020000
tbTop10.nEndDate = 201202292400

function tbTop10:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end

function tbTop10:CheckTime()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 0000 and nTime <= 0020) then
		return 1
	end
	return 0
end

function tbTop10:GetPhase()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	for i = 1, getn(self.tbPhase) do
		if nTime >= self.tbPhase[i][1] and nTime <= self.tbPhase[i][2] then
			return i
		end
	end
	return 0
end

function tbTop10:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end

function tbTop10:GiveRose(strName, strAccount, nCount)
	local nPhase = self:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "目前不是交物品时间.")
		return
	end
	if self:CheckTime() == 1 then
		Talk(1, "", "系统正进行排名，请稍候回来.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	self.tbSubcribers[strName] = {strAccount, nCount,strTime}
		
	if self:Subcribers2File() == 1 then
		Say("成功上交玫瑰", 1, "关闭/OnCancel")
	end
end

function tbTop10:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nIDX_Account], val[self.nIDX_TotalCount], val[self.nIDX_LastUpdate]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--Load 登记名单以及十大进入table
function LoadFromFile()
	--load 登记名单
	if not tbTop10.tbSubcribers then
		tbTop10.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strFileName, tbTop10.tbSubcribersPattern)
	if not tb then
		tbTop10.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop10.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4]}			
		end
	end
	
	tbTop10.nRegisterCount = nLength
	--load top list
	tbTop10:TopListFromFile()
	
	--已领奖励标记名单	
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, "rankawarded.txt", {"*n", "*n", "*n"})	
	if not tb then
		tbTop10.tbAwardCheck = {0,0,0}
	else
		tbTop10.tbAwardCheck = tb[1]
	end	
end

function test()
	for key,val in tbTop10.tbSubcribers do
		print(key.."   "..val[1].."   "..val[2])
	end
end
----=========top list==============-----
function tbTop10:UpdateTopList()
	nLamAnMapID = SubWorldID2Idx(176)
	if nLamAnMapID < 0 then		
		return
	end
	self.tbTopList = {}
	local tbTemp = {}	
	--建立table暂存排名材料	
	for key, val in self.tbSubcribers do		
		tinsert(tbTemp, {key, val[self.nIDX_Account], val[self.nIDX_TotalCount], val[self.nIDX_LastUpdate]})
	end
	--暂时按已交物品数量降序排列table
	sort(tbTemp, function (a, b) return(a[3] > b[3]) end)
	--选择10个数量最高的人放进名单用于存入文件或者在npc显示
	local nCount = 0
 	if getn(tbTemp) > 10 then
 		nCount = 10
 	else
 		nCount = getn(tbTemp)
 	end
	for i = 1, nCount do
		self.tbTopList[i] = tbTemp[i]
	end
	--save top list 进入file
	self:TopList2File()
end
function tbTop10:TopList2File()
	local tbTemp = {}
	--插入文件标题
	tinsert(tbTemp, self.tbTopListFileHeader)
	for key, val in self.tbTopList do
		tinsert(tbTemp, val)
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strTopListFileName, "w", tbTemp)	
	return 1
end

function tbTop10:TopListFromFile()
	if not self.tbTopList then
		self.tbTopList = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strTopListFileName, self.tbToplistPattern)
	if not tb then
		tbTop10.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

function tbTop10:ShowTopList()
	if self:CheckTime() == 1 then
		Talk(1, "", "系统正在进行排名，请稍候再来.")
		return
	end
	if not self.tbTopList or getn(self.tbTopList) <= 0 then
		CreateNewSayEx("目前没有排行榜",{{"关闭",OnCancel}})
		return
	end
	--local strTittle = format("%-13s%s\n%s <color=red>%s<color>\n\n", "", "上交数量最多的十人名单", "\t\t\t\t\t\t统计时间:", self.tbTopList[1][4])
	local strTittle = "上交数量最多的十人名单\n"
	strTittle = strTittle..format("%-5s%-17s%-12s\n", "名字", "上交数量", "最近一次上交")	
	for nRank = 1, getn(self.tbTopList) do
		strName = self.tbTopList[nRank][1]			
		local strTotalCount  = self.tbTopList[nRank][3]	
		local strLastUpdate = self.tbTopList[nRank][4]	
		if strName == GetName() then
			strTittle = strTittle..format("<color=cyan>%-5s%-17s%-12s<color>\n", nRank, strName, strTotalCount, strLastUpdate)
		else
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s<color>\n", nRank, strName, strTotalCount, strLastUpdate)
		end
	end
	CreateNewSayEx(strTittle,{{"关闭",OnCancel}})
end
--end top list
function tbTop10:GetCurRank(strName, strAccount)
	local j = 3
	if getn(self.tbTopList) < 3 then
		j = getn(self.tbTopList)
	end
	for i =1, j do
		local name = self.tbTopList[i][1]
		local acc = self.tbTopList[i][2]
		if strName == name and strAccount == acc then
			return i
		end
	end
	return -1
end

function tbTop10:GiveAward(nRank)
	if not self.tbAwardCheck then
		self.tbAwardCheck = {0,0,0}
	end
	self.tbAwardCheck[nRank] = 1
	local tbTemp = {}
	--insert header c馻 file
	tinsert(tbTemp, {"1等奖励","2等奖励","3等奖励"})
	tinsert(tbTemp, self.tbAwardCheck)		
	tbVngLib_File:Table2File(self.strFilePath, "rankawarded.txt", "w", tbTemp)	
end

function tbTop10:CheckCanGetAward(nRank)
	if not self.tbAwardCheck or not self.tbAwardCheck[nRank] or self.tbAwardCheck[nRank] == 1 then
		return 1
	end
	return 0
end

if tbTop10:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end