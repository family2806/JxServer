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
				{szName="Ng©n l­îng",nJxb=2000000,nCount=1},
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
				{szName="Håi thµnh phï (lín) ",tbProp={6,1,1083,1,0,0},nCount=1, nBindState = -2},
				{szName="Thiªn S¬n TuyÕt Liªn",tbProp={6,1,1431,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
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
				{szName="B«n Tiªu",tbProp={0,10,6,1,0,0},nCount=1, nBindState = -2},
				{szName="T©n Thñ Kim Bµi",tbProp={6,1,30144,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
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
				{szName = "§iÓm Kinh NghiÖm", nExp=500e6},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=1e9},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=2500e6},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=6e9},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=7e9},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=6500e6},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=6e9},			
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
				{szName = "§iÓm Kinh NghiÖm", nExp=5e9},			
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
				{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0}, nBindState = -2, nCount = 1},
				{szName="Tô Lùc Ng­ng ThÇn Hoµn",tbProp={6,1,30143,1,0,0},nExpiredTime=86400, nCount = 1},
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

--reset ÔÚ½ÓÐÂÈÎÎñÇ°²Î¼Ó¸÷ÖÖÐÔÄÜµÄ´ÎÊý
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
	local strTittle = "NhiÖm vô ®ang tiÕn hµnh:\n\n"
	local tbOpt = {}
	local tbTempQuest = self.tbQuest[nQuestID]
	local nIsComplete = 1
	local nIsCancel = 0
	if tbTempQuest then
		local tbRequirement = tbTempQuest.tbRequirement
		strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "Yªu cÇu", "T×nh tr¹ng<color=yellow>")
		--ËÎ½ð
		if tbRequirement.nTK then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_SONGJIN_QUEST_COUNT)
			local nRequire = tbRequirement.nTK
			local str1 = ""
			local str0 = "Tèng Kim 1000 ®iÓm"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--´³¹Ø
		if tbRequirement.nVA then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_COT_QUEST_COUNT)
			local nRequire = tbRequirement.nVA
			local str1 = ""
			local str0 = "V­ît qua ¶i 20"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)			
		end
		--ÊÕ¼¯×·¹¦Áî
		if tbRequirement.nPLD then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_FLD_QUEST_COUNT)
			local nRequire = tbRequirement.nPLD
			local str1 = ""
			local str0 = "NV thu thËp Truy C«ng LÖnh"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--Ñ×µÛ®Õ
		if tbRequirement.nVD then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_YDBZ_QUEST_COUNT)
			local nRequire = tbRequirement.nVD
			local str1 = ""
			local str0 = "V­ît ¶i 6 Viªm §Õ"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--Ò°ÛÅ
		if tbRequirement.nDT then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_YESOU_QUEST_COUNT)
			local nRequire = tbRequirement.nDT
			local str1 = ""
			local str0 = "Hoµn thµnh NV D· TÈu"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--É±ÊÖboss
		if tbRequirement.nBossST then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_KILLER_BOSS_QUEST_COUNT)
			local nRequire = tbRequirement.nBossST
			local str1 = ""
			local str0 = "Tiªu diÖt boss s¸t thñ 90"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end
		--ÐÅÊ¹
		if tbRequirement.nTinSu then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_MAIL_QUEST_COUNT)
			local nRequire = tbRequirement.nTinSu
			local str1 = ""
			local str0 = "NhiÖm vô TÝn Sø"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end		
		--ÎäÁÖÃËÖ÷
		if tbRequirement.nVLMC then
			local nCurCount = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_VLMC_QUEST_COUNT)
			local nRequire = tbRequirement.nVLMC
			local str1 = ""
			local str0 = "NV Vâ L©m Minh Chñ"
			if nCurCount >= nRequire then
				nCurCount = nRequire
				str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
			else
				nIsComplete = 0
				str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
		end	
		--Trïng sinh 
		if tbRequirement.nTS then
			local nCurCount = ST_GetTransLifeCount()
			local nRequire = tbRequirement.nTS
			local str1 = ""
			local str0 = "Trïng sinh "
			if nCurCount == nRequire then
				nCurCount = nRequire
				str1 = "<color=green>§· hoµn thµnh<color>"
			else
				nIsComplete = 0
				nIsCancel = 1
				if nCurCount > nRequire then
					str1 = "<color=red>V­ît giíi h¹n<color>"
				else
					str1 = "<color=red>Ch­a hoµn thµnh<color>"
				end
			end
			strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0..nRequire, str1)
		end	
	end
	if nIsComplete == 1 then
		tinsert(tbOpt, {"Hoµn thµnh nhiÖm vô", tbPVLB_Quest.CompleteQuest, {tbPVLB_Quest, tbTempQuest}})
	else
		if nIsCancel == 1 then
			tinsert(tbOpt, {"Hñy nhiÖm vô", tbPVLB_Quest.CancelQuest, {tbPVLB_Quest, tbTempQuest}})
		end
	end
	tinsert(tbOpt, {"§ãng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Quest:HaveNoQuest()
	local strTittle = "NhiÖm vô cã thÓ nhËn:\n\n"
	local tbOpt = {}
	
	local nQuestID = self:GetQuestID()
	--Ã»ÓÐÈÎÎñ
	if not nQuestID then
		strTittle = strTittle.."<color=red>\t\t\t\tKh«ng cã nhiÖm vô nµo<color>\n"
	else		
		local tbTempQuest = self.tbQuest[nQuestID]
		if tbTempQuest then
			--®· ÒÑHoµn thµnh nhiÖm vô
			if tbVNG_BitTask_Lib:getBitTask(tbTempQuest.tbBitTask) == 1 then
				strTittle = strTittle.."\t\t\t\t<color=red>§· hoµn thµnh<color>\n"
			else --Î´NhËn nhiÖm vô
				strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "Yªu cÇu", "Sè l­îng<color=yellow>")
				--ÃèÊöÈÎÎñ
				local tbRequirement = tbTempQuest.tbRequirement
				--ËÎ½ð
				if tbRequirement.nTK then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "Tèng Kim 1000 ®iÓm", tbRequirement.nTK)
				end
				--´³¹Ø
				if tbRequirement.nVA then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "V­ît qua ¶i 20", tbRequirement.nVA)
				end
				--ÊÕ¼¯×·¹¦Áî
				if tbRequirement.nPLD then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "NV thu thËp Truy C«ng LÖnh", tbRequirement.nPLD)
				end
				--Ñ×µÛ ®Õ
				if tbRequirement.nVD then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "V­ît ¶i 6 Viªm §Õ", tbRequirement.nVD)
				end
				--Ò°ÛÅ
				if tbRequirement.nDT then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "Hoµn thµnh NV D· TÈu", tbRequirement.nDT)
				end
				--É±ÊÖBOOS
				if tbRequirement.nBossST then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "Tiªu diÖt boss s¸t thñ 90", tbRequirement.nBossST)
				end
				--ÐÅÊ¹
				if tbRequirement.nTinSu then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "NhiÖm vô TÝn Sø", tbRequirement.nTinSu)
				end
				--Trïng sinh 
				if tbRequirement.nTS then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "Trïng sinh "..tbRequirement.nTS, 1)
				end
				--ÎäÁÖÃËÖ÷
				if tbRequirement.nVLMC then
					strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "NV Vâ L©m Minh Chñ", tbRequirement.nVLMC)
				end
				strTittle = strTittle.."<color>"
				tinsert(tbOpt, {"NhËn nhiÖm vô",tbPVLB_Quest.AcceptQuest, {tbPVLB_Quest, nQuestID}})
			end
		end
	end
	
	tinsert(tbOpt, {"§ãng"})
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
		Talk(1, "", "Xin h·y dän trèng hµnh trang råi h·y nhËn th­ëng.")
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
		tbAwardTemplet:Give(tbAward.tbItem, 1, {"PhongVanLenhBai", strLog})
		if tbTempQuest.strLog == "QuestTienHanhTS3" then
			tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "N/A", "Tô Lùc Ng­ng ThÇn Hoµn", 1)
		end
	end
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, strLog, "N/A", 1)
end

function tbPVLB_Quest:CancelQuest(tbTempQuest)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, 0)
end
