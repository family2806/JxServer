Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
tbVNGWD2011_NpcHead = {}
tbVNGWD2011_NpcHead.tbCompose =
	{
		["合成有色种子"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("庆祝国际妇女节活动\t 合成%s", "有色种子"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "玫瑰花束", tbProp = {6,1,30102,1,0,0}, nCount = 1},
								{szName = "蝴蝶结", tbProp = {6,1,30099,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "有色种子", tbProp = {6,1,30100,1,0,0}, nExpiredTime = 20110314},
					},
					pCompos = nil;
			},
		["合成玫瑰花束"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("庆祝国际妇女节活动t 合成%s", "玫瑰花束"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "玫瑰花", tbProp = {6,1,30097,1,0,0}, nCount = 1},
								{szName = "花线", tbProp = {6,1,30098,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "玫瑰花束", tbProp = {6,1,30102,1,0,0}, nExpiredTime = 20110314},
					},
					pCompos = nil;
			},
		["送 玫瑰花束"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("庆祝国际妇女节活动t 送 %s", "玫瑰花束"),
						nWidth = 0,
						nHeight = 0,
						nFreeItemCellLimit = 0,
						tbMaterial = 
							{
								{szName = "玫瑰花束", tbProp = {6,1,30102,1,0,0}, nCount = 1},
							},
						pProductFun = function (self, nItemCount)
								%tbVNGWD2011_NpcHead:ExpAward(nItemCount, 5000000, "[VNG][8thang3][送 玫瑰花束]")
							end,
						pLimitFun = function (self, nItemCount) 
							return %tbVNGWD2011_NpcHead:CheckGivingRoseLimit(nItemCount)
						end,
					},
					pCompos = nil;					
			},
		["送 面包"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("庆祝国际妇女节活动t 送 %s", "面包"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "面包", tbProp = {6,1,30096,1,0,0}, nCount = 1},
							},					
						tbProduct = 
							{
								[1]={
									[1]=
										{
											{pFun = function (tbItem, nItemCount, szLogTitle) %tbVNGWD2011_NpcHead:GetExpBM(1000000)end,},
											{szName="玫瑰花",tbProp={6,1,30097,1,0,0},nCount=2,nExpiredTime=20110314},											
										},
									nRate = 50,
								},
								[2]={
									[1]=
										{
											{pFun = function (tbItem, nItemCount, szLogTitle) %tbVNGWD2011_NpcHead:GetExpBM(2000000)end,},
											{szName="玫瑰花",tbProp={6,1,30097,1,0,0},nCount=1,nExpiredTime=20110314},
										},
									nRate = 50,
								},
							},
					},				
					pCompos = nil;
			},
			["买 花线"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("庆祝国际妇女节活动t 买 %s", "花线"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName="银两",nJxb=100000, nCount = 1},
							},
						tbProduct = {szName = "花线", tbProp = {6,1,30098,1,0,0}, nExpiredTime = 20110314},
					},
					pCompos = nil;
			},
	}

function tbVNGWD2011_NpcHead:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbVNGWD2011_NpcHead:ComposeItem(strItemName)
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	local tbItem = self.tbCompose[strItemName]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);			
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end

--function tbVNGWD2011_NpcHead:GiveItem(strItemName)
--	local tbItem = self.tbCompose[strItemName]
--	if tbItem then
--		if (tbItem.pCompos == nil) then
--			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);
--		end
--		tbItem.pCompos:ComposeDailog(1);
--	end
--end



function tbVNGWD2011_NpcHead:GetExpBM(nExpAward)
	if PlayerFunLib:CheckTaskDaily(2750, 50, "", "<") ~= 1 then
		return		
	end
	
	PlayerFunLib:AddTaskDaily(2750, nExpAward/1000000)
	local tbAward = {szName = "经验值", nExp=nExpAward}
	tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][送面包]")
end

function tbVNGWD2011_NpcHead:CheckGivingRoseLimit(nCount)
	local tbTaskInfo =
					{
						nTaskID = 2749,
						nStartBit = 1,
						nBitCount = 11,
						nMaxValue = 1000
					}
	if (tbVNG_BitTask_Lib:getBitTask(tbTaskInfo)  >= tbTaskInfo.nMaxValue) then
		Msg2Player(format("阁下已参加最多该活动了，不能再参加了."))
		return 0
	end
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(tbTaskInfo) + nCount*5
	if ( nNextTskVal > tbTaskInfo.nMaxValue) then
		Msg2Player(format("数量超过上限，大侠只能送<color=yellow>%d <color>玫瑰花束.", (tbTaskInfo.nMaxValue - tbVNG_BitTask_Lib:getBitTask(tbTaskInfo))/5))
		return 0
	end
	return 1	
end

--送 玫瑰花束
function tbVNGWD2011_NpcHead:ExpAward(nCount, nExp, strLog)
	local tbTaskInfo =
					{
						nTaskID = 2749,
						nStartBit = 1,
						nBitCount = 11,
						nMaxValue = 1000
					}	
	
	local tbAward = {szName = "经验值", nExp=5000000}
	local tbTSK, tbTSK_FLAG = {}
	for i = 1, nCount do
		--add task cho moi lan tang hoa hong
		tbVNG_BitTask_Lib:addTask(tbTaskInfo, 5)
		
		tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE
		tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
		if ((tbVNG_BitTask_Lib:getBitTask(tbTaskInfo)/5) >= 100 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
			tbVNG_BitTask_Lib:setBitTask(tbTSK, 1) 
		end
		
		tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE
		tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
		if (tbVNG_BitTask_Lib:getBitTask(tbTaskInfo)/5 >= 200 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
			tbVNG_BitTask_Lib:setBitTask(tbTSK, 1) 
		end
		
		tbAwardTemplet:GiveAwardByList(tbAward, strLog)
	end
end