Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
tbPVLB_Quest = {}

tbPVLB_Quest.tbQuest = {
	[1] = 
	{
		tbRequirement =
		{
			nTK = 2,
			nVA = 1,
			nDT = 10,
			nVLMC = 1,
			nTS = 0,
		},
		tbAward = 
		{
			nLevel = 180,
			tbItem = 
			{
				{szName="银两",nJxb=2000000,nCount=1},
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_0_180,
		strLog = "Quest_TS0_180",
	},
	[2] = 
	{
		tbRequirement =
		{
			nTS = 1,
		},
		tbAward = 
		{
			tbItem = 
			{
				{szName="回城符(大) ",tbProp={6,1,1083,1,0,0},nCount=1, nBindState = -2},
				{szName="天山雪莲",tbProp={6,1,1431,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_TS1,
		strLog = "QuestTienHanhTS1",
	},
	[3] = 
	{
		tbRequirement =
		{
			nDT = 30,
			nBossST = 2,
			nVLMC = 1,
			nTS = 1,
		},
		tbAward = 
		{
			nLevel = 130,
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_1_130,
		strLog = "Quest_TS1_130",
	},
	[4] = 
	{
		tbRequirement =
		{
			nDT = 30,
			nTS = 1,
		},
		tbAward = 
		{
			nLevel = 140,
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_1_140,
		strLog = "Quest_TS1_140",
	},
	[5] = 
	{
		tbRequirement =
		{
			nTK =3,
			nVA = 1,
			nDT = 30,
			nVLMC = 1,
			nTS = 1,
		},
		tbAward = 
		{
			nLevel = 150,
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_1_150,
		strLog = "Quest_TS1_150",
	},
	[6] = 
	{
		tbRequirement =
		{
			nTK =3,
			nVA = 1,
			nPLD = 1,
			nDT = 30,		
			nTS = 1,	
		},
		tbAward = 
		{
			nLevel = 160,
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_1_160,
		strLog = "Quest_TS1_160",
	},
	[7] = 
	{
		tbRequirement =
		{
			nTK =3,
			nVA = 2,
			nPLD = 1,
			nDT = 30,		
			nTS = 1,	
		},
		tbAward = 
		{
			nLevel = 170,
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_1_170,
		strLog = "Quest_TS1_170",
	},
	[8] = 
	{
		tbRequirement =
		{
			nTS = 2,
		},
		tbAward = 
		{
			tbItem = 
			{				
				{szName="奔逍",tbProp={0,10,6,1,0,0},nCount=1, nBindState = -2},
				{szName="新手金牌",tbProp={6,1,30144,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_TS2,
		strLog = "QuestTienHanhTS2",
	},
	[9] = 
	{
		tbRequirement =
		{
			nDT = 30,	
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 130,
			tbItem = {
				{szName = "经验值", nExp=500e6},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_130,
		strLog = "Quest_TS2_130",
	},
	[10] = 
	{
		tbRequirement =
		{
			nVA = 3,
			nDT = 30,		
			nBossST = 10,
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 140,
			tbItem = {
				{szName = "经验值", nExp=1e9},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_140,
		strLog = "Quest_TS2_140",
	},
	[11] = 
	{
		tbRequirement =
		{
			nTK = 3,
			nTinSu = 1,
			nPLD = 2,
			nDT = 30,	
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 150,
			tbItem = {
				{szName = "经验值", nExp=2500e6},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_150,
		strLog = "Quest_TS2_150",
	},
	[12] = 
	{
		tbRequirement =
		{
			nTK = 4,
			nVA = 3,
			nTinSu = 1,
			nPLD = 2,			
			nDT = 30,
			nTS = 2,	
		},
		tbAward = 
		{
			nLevel = 160,
			tbItem = {
				{szName = "经验值", nExp=6e9},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_160,
		strLog = "Quest_TS2_160",
	},
	[13] = 
	{
		tbRequirement =
		{
			nTK = 4,
			nVA = 3,
			nTinSu = 1,
			nPLD = 3,			
			nDT = 30,	
			nVD = 2,
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 165,
			tbItem = {
				{szName = "经验值", nExp=7e9},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_165,
		strLog = "Quest_TS2_165",
	},
	[14] = 
	{
		tbRequirement =
		{
			nTK = 6,
			nVA = 3,
			nTinSu = 2,
			nPLD = 3,			
			nDT = 30,	
			nVD = 3,
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 170,
			tbItem = {
				{szName = "经验值", nExp=6500e6},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_170,
		strLog = "Quest_TS2_170",
	},
	[15] = 
	{
		tbRequirement =
		{
			nTK = 6,
			nVA = 3,
			nTinSu = 2,
			nPLD = 3,			
			nDT = 30,	
			nVD = 3,
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 172,
			tbItem = {
				{szName = "经验值", nExp=6e9},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_172,
		strLog = "Quest_TS2_172",
	},
	[16] = 
	{
		tbRequirement =
		{
			nTK = 6,
			nVA = 3,
			nTinSu = 1,
			nPLD = 2,			
			nDT = 30,	
			nVD = 2,
			nTS = 2,
		},
		tbAward = 
		{
			nLevel = 174,
			tbItem = {
				{szName = "经验值", nExp=5e9},			
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_2_174,
		strLog = "Quest_TS2_174",
	},
	[17] = 
	{
		tbRequirement =
		{
			nTS = 3,
		},
		tbAward = 
		{
			tbItem = 
			{
				{szName="一纪乾坤符",tbProp={6,1,2126,1,0,0}, nBindState = -2, nCount = 1},
				{szName="聚力凝神丸",tbProp={6,1,30143,1,0,0},nExpiredTime=86400, nCount = 1},
			},
		},
		tbBitTask = tbBITTASK_QUEST_AWARD_TS3,
		strLog = "QuestTienHanhTS3",
	},
}

function tbPVLB_Quest:GetQuestID()
	local nTransLife = ST_GetTransLifeCount()	
	if nTransLife < 0 or nTransLife >= 3 then
		return nil
	end
	local nLevel = GetLevel()
	if nTransLife == 0 then
		if nLevel >= 150 and nLevel <= 179 then
			return 1;
		end
		if nLevel >= 180 and nLevel <= 200 then
			return 2;
		end
	elseif nTransLife == 1 then
		if nLevel >= 115 and nLevel <= 129 then
			return 3;
		end
		if nLevel >= 130 and nLevel <= 139 then
			return 4;
		end
		if nLevel >= 140 and nLevel <= 149 then
			return 5;
		end
		if nLevel >= 150 and nLevel <= 159 then
			return 6;
		end
		if nLevel >= 160 and nLevel <= 169 then
			return 7;
		end
		if nLevel >= 170 and nLevel <= 200 then
			return 8;
		end
	elseif nTransLife == 2 then
		if nLevel >= 115 and nLevel <= 129 then
			return 9;
		end
		if nLevel >= 131 and nLevel <= 139 then
			return 10;
		end
		if nLevel >= 141 and nLevel <= 149 then
			return 11;
		end
		if nLevel >= 151 and nLevel <= 159 then
			return 12;
		end
		if nLevel >= 161 and nLevel <= 164 then
			return 13;
		end
		if nLevel >= 166 and nLevel <= 169 then
			return 14;
		end
		if nLevel == 171 then
			return 15;
		end
		if nLevel == 173 then
			return 16;
		end
		if nLevel >= 180 and nLevel <= 200 then
			return 17;
		end	
	end
	return nil
end

--reset 在接新任务前参加各种性能的次数
function tbPVLB_Quest:ResetTask()
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_YESOU_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_KILLER_BOSS_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_MAIL_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_VLMC_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_SONGJIN_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_COT_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_FLD_QUEST_COUNT, 0)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_YDBZ_QUEST_COUNT, 0)	
end

function tbPVLB_Quest:Main()	
	local nCurQuest = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_QUEST_ON_PROCCESS)
	if nCurQuest ~= 0 then
		self:QuestOnProccess(nCurQuest)
	else
		self:HaveNoQuest()
	end	
end

function tbPVLB_Quest:QuestOnProccess(nQuestID)
	local strTittle = "正在进行的任务:\n\n"
	local tbOpt = {}
	local tbTempQuest = self.tbQuest[nQuestID]
	local nIsComplete = 1
	local nIsCancel = 0
	if tbTempQuest then
		local tbRequirement = tbTempQuest.tbRequirement
		strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "要求", "情况<color=yellow>")
		--宋金
		if tbRequirement.nTK then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_SONGJIN_QUEST_COUNT)
			local nRequire = tbRequirement.nTK
			local str1 = ""
			local str0 = "宋金1000点"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--闯关
		if tbRequirement.nVA then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_COT_QUEST_COUNT)
			local nRequire = tbRequirement.nVA
			local str1 = ""
			local str0 = "闯关 20"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)			
		end
		--收集追功令
		if tbRequirement.nPLD then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_FLD_QUEST_COUNT)
			local nRequire = tbRequirement.nPLD
			local str1 = ""
			local str0 = "收集追功令任务"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--炎帝
		if tbRequirement.nVD then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_YDBZ_QUEST_COUNT)
			local nRequire = tbRequirement.nVD
			local str1 = ""
			local str0 = "炎帝闯关6"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--野叟
		if tbRequirement.nDT then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_YESOU_QUEST_COUNT)
			local nRequire = tbRequirement.nDT
			local str1 = ""
			local str0 = "完成野叟任务"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--杀手boss
		if tbRequirement.nBossST then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_KILLER_BOSS_QUEST_COUNT)
			local nRequire = tbRequirement.nBossST
			local str1 = ""
			local str0 = "消灭90杀手boss"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--信使
		if tbRequirement.nTinSu then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_MAIL_QUEST_COUNT)
			local nRequire = tbRequirement.nTinSu
			local str1 = ""
			local str0 = "信使任务"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end		
		--武林盟主
		if tbRequirement.nVLMC then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_VLMC_QUEST_COUNT)
			local nRequire = tbRequirement.nVLMC
			local str1 = ""
			local str0 = "武林盟主任务"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end	
		--重生
		if tbRequirement.nTS then
			local nCurCount = ST_GetTransLifeCount()
			local nRequire = tbRequirement.nTS
			local str1 = ""
			local str0 = "重生 "
			if nCurCount == nRequire then
				nCurCount = nRequire
				str1 = "<color=green>已完成<color>"
			else
				nIsComplete = 0
				nIsCancel = 1
				if nCurCount > nRequire then
					str1 = "<color=red>超过上限<color>"
				else
					str1 = "<color=red>未完成<color>"
				end
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0..nRequire, str1)
		end	
	end
	if nIsComplete == 1 then
		tinsert(tbOpt, {"完成任务", tbPVLB_Quest.CompleteQuest, {tbPVLB_Quest, tbTempQuest}})
	else
		if nIsCancel == 1 then
			tinsert(tbOpt, {"放弃任务", tbPVLB_Quest.CancelQuest, {tbPVLB_Quest, tbTempQuest}})
		end
	end
	tinsert(tbOpt, {"关闭"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Quest:HaveNoQuest()
	local strTittle = "可接任务:\n\n"
	local tbOpt = {}
	
	local nQuestID = self:GetQuestID()
	--没有任务
	if not nQuestID then
		strTittle = strTittle.."<color=red>\t\t\t\没有任务<color>\n"
	else		
		local tbTempQuest = self.tbQuest[nQuestID]
		if tbTempQuest then
			-- 已完成任务
			if tbVNG_BitTask_Lib:getBitTask(tbTempQuest.tbBitTask) == 1 then
				strTittle = strTittle.."\t\t\t\t<color=red>已完成<color>\n"
			else --未接任务
				strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "要求", "数量<color=yellow>")
				--描述任务
				local tbRequirement = tbTempQuest.tbRequirement
				--宋金
				if tbRequirement.nTK then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "宋金1000点", tbRequirement.nTK)
				end
				--闯关
				if tbRequirement.nVA then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "闯关 20", tbRequirement.nVA)
				end
				--收集追功令
				if tbRequirement.nPLD then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "收集追功令任务", tbRequirement.nPLD)
				end
				--炎帝 
				if tbRequirement.nVD then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "炎帝闯关6", tbRequirement.nVD)
				end
				--野叟
				if tbRequirement.nDT then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "完成野叟任务", tbRequirement.nDT)
				end
				--杀手BOOS
				if tbRequirement.nBossST then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "消灭90杀手boss", tbRequirement.nBossST)
				end
				--信使
				if tbRequirement.nTinSu then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "信使任务", tbRequirement.nTinSu)
				end
				--重生
				if tbRequirement.nTS then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "重生"..tbRequirement.nTS, 1)
				end
				--武林盟主
				if tbRequirement.nVLMC then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "武林盟主任务", tbRequirement.nVLMC)
				end
				strTittle = strTittle.."<color>"
				tinsert(tbOpt, {"接任务",tbPVLB_Quest.AcceptQuest, {tbPVLB_Quest, nQuestID}})
			end
		end
	end
	
	tinsert(tbOpt, {"сng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Quest:AcceptQuest(nID)
	self:ResetTask()
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, nID)
	local tbTempQuest = self.tbQuest[nID]
	tbLog:PlayerActionLog("PhongVanLenhBai", "Nhan"..tbTempQuest.strLog)
end

function tbPVLB_Quest:CompleteQuest(tbTempQuest)
	if PlayerFunLib:VnCheckInCity () ~= 1 then		
		return
	end
	if tbTempQuest.tbAward.tbItem and CalcFreeItemCellCount() < 59 then
		Talk(1, "", "请清理装备空位，然后领奖.")
		return
	end	
	tbVNG_BitTask_Lib:setBitTask(tbTempQuest.tbBitTask, 1)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, 0)
	local tbAward = tbTempQuest.tbAward
	local strLog = "HoanThanh"..tbTempQuest.strLog
	if tbAward.nLevel and tbAward.nLevel > GetLevel() then
		ST_LevelUp(tbAward.nLevel - GetLevel())
		tbLog:PlayerActionLog("PhongVanLenhBai", strLog, "ThangDangCap: "..GetLevel())
	end	
	if tbAward.tbItem then
		tbAwardTemplet:Give(tbAward.tbItem, 1, {"风云令牌", strLog})
		if tbTempQuest.strLog == "QuestTienHanhTS3" then
			tbVngTransLog:Write("201109_风云令牌活动/", 11, "N/A", "聚力凝神丸", 1)
		end
	end
	tbVngTransLog:Write("201109_风云令牌活动/", 11, strLog, "N/A", 1)
end

function tbPVLB_Quest:CancelQuest(tbTempQuest)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, 0)
end
