--系统接受登记级排名服务器最高的10名 - Created by DinhHQ - 20110614

Include("\\script\\vng_feature\\top10\\vngglobalvar.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function tbTop10:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end

function tbTop10:CheckTime()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 0955 and nTime <=1005) or (nTime >= 0000 and nTime <=0010) then
		return 1
	end
	return 0
end

function tbTop10:CheckDay()
	local nTime = tonumber(date("%Y%m%d"))
	if nTime < 20110707 or nTime > 20110713 then
		return 0
	end
	return 1
end

function tbTop10:IsActive()
	local nTime = tonumber(date("%Y%m%d"))
	if nTime < 20110707 or nTime > 20110717 then
		return 0
	end
	return 1
end

function tbTop10:MainDialog()
	if self.CheckTime() == 1 then
		Talk(1, "", "系统正在进行排名，请稍候再来.")
		return
	end
	local tbOpt = {}
	local pEventType = EventSys:GetType("AddNpcOption")
	if self.CheckDay() == 1 then
		tinsert(tbOpt, {"我想登记", tbTop10.Regist, {tbTop10}})
		tinsert(tbOpt, {"我想更新信息", tbTop10.UpdateInfo, {tbTop10}})
	end	
	tinsert(tbOpt, {"看十大高手名单", tbTop10.ShowTopList, {tbTop10}})
	tinsert(tbOpt, {"放弃 "})
	CreateNewSayEx("我负责接收登记十大高手，你想登记吗?", tbOpt)
end

--=======================Subcribers===========================

function tbTop10:Regist()
	if self.CheckDay() == 0 then
		Talk(1, "", "登记已过期 ")
		return
	end
	if self.CheckTime() == 1 then
		Talk(1, "", "系统正在进行排名，请稍候再来.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < 3 then
		Talk(1, "", "你修炼的程度不够，请回去再练习.")
		return
	end
	local strName = GetName()
	if self.tbSubcribers[strName] then
		Talk(1, "", "你已登记了，不需要再登记了，请更新信息.")
		return
	end
	self.tbSubcribers[strName] = {}
	local tbSubcriber = self.tbSubcribers[strName]
	for i = 1, nTransLifeCount do
		local nlevel, _ = zhuansheng_get_gre(i);
		tinsert(tbSubcriber, nlevel)		
	end
	--目前水平
	tinsert(tbSubcriber, GetLevel())
	--目前经验
	tinsert(tbSubcriber, GetExp()/1e9)
	tinsert(tbSubcriber, GetExpPercent())
	if self:Subcribers2File() == 1 then
		Say("登记成功，请检查名单.", 1, "关闭/OnCancel")
	end
end

function tbTop10:UpdateInfo()
	if self.CheckDay() == 0 then
		Talk(1, "", "更新信息已过期.")
		return
	end
	if self.CheckTime() == 1 then
		Talk(1, "", "系统正在进行排名，请稍候再来.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local strName = GetName()
	if (not self.tbSubcribers[strName]) then
		Talk(1, "", "你依然未登记，不能更新信息 .")
		return
	end
	
	--每天只能更新一次 
	local nTaskDayCount = PlayerFunLib:GetTaskDailyCount(self.nTaskDayLimit)
	if nTaskDayCount == 1 then
		Talk(1, "", "每天只能更新一次，每天再来吧.")
		return
	end
	
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < 3 then
		Talk(1, "", "你修炼的程度不够，请回去再练习.")
		return
	end
		
	local tbSubcriber = self.tbSubcribers[strName]

	--目前水平
	tbSubcriber[self.nCUR_LVL] = GetLevel()
	--目前经验
	tbSubcriber[self.nCUR_EXP] = GetExp()/1e9
	tbSubcriber[self.nCUR_EXP_PERCENT] = GetExpPercent()
	if self:Subcribers2File() == 1 then
		PlayerFunLib:AddTaskDaily(self.nTaskDayLimit, 1)
		Say("更新信息成功，请检查名单.", 1, "关闭/OnCancel")
	end
end

function tbTop10:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nST1_LVL], val[self.nST2_LVL], val[self.nST3_LVL], val[self.nCUR_LVL], val[self.nCUR_EXP], val[self.nCUR_EXP_PERCENT]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--=======================End Subcribers===========================

function OnCancel()
end

function tbTop10:ShowList()	
	if not self.tbSubcribers then
		CreateNewSayEx("目前没有排行",{{"关闭",OnCancel}})
		return
	end
	
	local nCounter = 0
	local strTittle = format("%-6s%-16s%-6s%-6s%-6s%s\n", "序号", "名字", "重生1", "重生2", "重生3", "目前")
	for key, val in self.tbSubcribers do
		nCounter = nCounter + 1
		strTittle = strTittle..format("<color=yellow>%-6d%-16s%-6d%-6d%-6d%d<color>\n", nCounter, key, val[1], val[2], val[3], val[4])
	end
	CreateNewSayEx(strTittle,{{"关闭",OnCancel}})
end

--=======================Top list===========================

function tbTop10:ShowTopList()
	if self.CheckTime() == 1 then
		Talk(1, "", "系统正在进行排名，请稍候再来.")
		return
	end
	if not self.tbTopList or getn(self.tbTopList) <= 0 then
		CreateNewSayEx("目前没有排行",{{"关闭",OnCancel}})
		return
	end
	local strTittle = format("%-13s%s\n%s <color=red>%s<color>\n\n", "", "十大高手名单","\t\t\t\t\t\t统计时间:", self.tbTopList[1][5])
	strTittle = strTittle..format("%-5s%-17s%-12s%-10s%-8s\n", "等级", "名字", "重生", "目前", "Exp(经验")
	local strTittle_TS = ""
	local strName = ""
	local strCurLVL = ""
	for nRank = 1, getn(self.tbTopList) do
		strName = self.tbTopList[nRank][1]		
		local tbPlayer = self.tbSubcribers[strName]
		strTittle_TS = format("%d/%d/%d", tbPlayer[self.nST1_LVL], tbPlayer[self.nST2_LVL], tbPlayer[self.nST3_LVL])
		strCurLVL = format("%d(%d", self.tbTopList[nRank][2], self.tbTopList[nRank][3]).."%)"
		if strName == GetName() then
			strTittle = strTittle..format("<color=cyan>%-5s%-17s%-12s%-10s%-8.04f<color>\n", nRank, strName, strTittle_TS, strCurLVL,self.tbTopList[nRank][4])
		else
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s%-10s%-8.04f<color>\n", nRank, strName, strTittle_TS, strCurLVL,self.tbTopList[nRank][4])
		end
	end
	CreateNewSayEx(strTittle,{{"关闭",OnCancel}})
end

--按照经验登记名单排名来找10个经验排名最高的人
--保留十大高手名单进入预防文件夹
function tbTop10:UpdateTopList()
	nLamAnMapID = SubWorldID2Idx(176)
	if nLamAnMapID < 0 then
		print("\nMap 临安没有在该服务器上")
		return
	end
	self.tbTopList = {}
	local tbTemp = {}
	local nExp = 0
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	--在 table 保存整理资料
	for key, val in self.tbSubcribers do
		nExp = ((val[self.nST1_LVL] - 160) * 2 + 18.5667721) + ((val[self.nST2_LVL] - 170) * 4 + 72.3667721) + ((val[self.nST3_LVL] - 180) * 8 + 221.9667721) + (self.tbCurLvl_Exp[val[self.nCUR_LVL]]) + val[self.nCUR_EXP]
		tinsert(tbTemp, {key, val[self.nCUR_LVL], val[self.nCUR_EXP_PERCENT], nExp, strTime})
	end
	--整理table暂时按照经验值降序排列
	sort(tbTemp, function (a, b) return(a[4] > b[4]) end)
	--选择10个经验值最高的人放入排名名单以做保存到文件夹或者在npc显示
	local nCount = 0
 	if getn(tbTemp) > 10 then
 		nCount = 10
 	else
 		nCount = getn(tbTemp)
 	end
	for i = 1, nCount do
		self.tbTopList[i] = tbTemp[i]
	end
	--save top list进入file
	self:TopList2File()
end

function tbTop10:TopList2File()
	local tbTemp = {}
	--insert header file
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
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strTopListFileName, {"*w", "*n", "*n", "*n", "*w"})
	if not tb then
		tbTop10.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

--=======================Top list===========================
--Load 等级名单以及十大进入table
function LoadFromFile()
	--load 等级名单
	if not tbTop10.tbSubcribers then
		tbTop10.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strFileName, {"*w", "*n", "*n", "*n", "*n", "*n", "*n"})
	if not tb then
		tbTop10.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop10.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4], tb[i][5], tb[i][6], tb[i][7]}			
		end
	end
	
	tbTop10.nRegisterCount = nLength
	--load top list
	tbTop10:TopListFromFile()
end
if tbTop10:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end