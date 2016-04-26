Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
tbVNGWD2011_NpcHead = {}
tbVNGWD2011_NpcHead.tbCompose =
	{
		["�ϳ���ɫ����"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ף���ʸ�Ů�ڻ\t �ϳ�%s", "��ɫ����"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "õ�廨��", tbProp = {6,1,30102,1,0,0}, nCount = 1},
								{szName = "������", tbProp = {6,1,30099,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "��ɫ����", tbProp = {6,1,30100,1,0,0}, nExpiredTime = 20110314},
					},
					pCompos = nil;
			},
		["�ϳ�õ�廨��"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ף���ʸ�Ů�ڻt �ϳ�%s", "õ�廨��"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "õ�廨", tbProp = {6,1,30097,1,0,0}, nCount = 1},
								{szName = "����", tbProp = {6,1,30098,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "õ�廨��", tbProp = {6,1,30102,1,0,0}, nExpiredTime = 20110314},
					},
					pCompos = nil;
			},
		["�� õ�廨��"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ף���ʸ�Ů�ڻt �� %s", "õ�廨��"),
						nWidth = 0,
						nHeight = 0,
						nFreeItemCellLimit = 0,
						tbMaterial = 
							{
								{szName = "õ�廨��", tbProp = {6,1,30102,1,0,0}, nCount = 1},
							},
						pProductFun = function (self, nItemCount)
								%tbVNGWD2011_NpcHead:ExpAward(nItemCount, 5000000, "[VNG][8thang3][�� õ�廨��]")
							end,
						pLimitFun = function (self, nItemCount) 
							return %tbVNGWD2011_NpcHead:CheckGivingRoseLimit(nItemCount)
						end,
					},
					pCompos = nil;					
			},
		["�� ���"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ף���ʸ�Ů�ڻt �� %s", "���"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "���", tbProp = {6,1,30096,1,0,0}, nCount = 1},
							},					
						tbProduct = 
							{
								[1]={
									[1]=
										{
											{pFun = function (tbItem, nItemCount, szLogTitle) %tbVNGWD2011_NpcHead:GetExpBM(1000000)end,},
											{szName="õ�廨",tbProp={6,1,30097,1,0,0},nCount=2,nExpiredTime=20110314},											
										},
									nRate = 50,
								},
								[2]={
									[1]=
										{
											{pFun = function (tbItem, nItemCount, szLogTitle) %tbVNGWD2011_NpcHead:GetExpBM(2000000)end,},
											{szName="õ�廨",tbProp={6,1,30097,1,0,0},nCount=1,nExpiredTime=20110314},
										},
									nRate = 50,
								},
							},
					},				
					pCompos = nil;
			},
			["�� ����"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("��ף���ʸ�Ů�ڻt �� %s", "����"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName="����",nJxb=100000, nCount = 1},
							},
						tbProduct = {szName = "����", tbProp = {6,1,30098,1,0,0}, nExpiredTime = 20110314},
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
	local tbAward = {szName = "�i����ֵ", nExp=nExpAward}
	tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][�����]")
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
		Msg2Player(format("�����Ѳμ����û�ˣ������ٲμ���."))
		return 0
	end
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(tbTaskInfo) + nCount*5
	if ( nNextTskVal > tbTaskInfo.nMaxValue) then
		Msg2Player(format("�����������ޣ�����ֻ����<color=yellow>%d <color>õ�廨��.", (tbTaskInfo.nMaxValue - tbVNG_BitTask_Lib:getBitTask(tbTaskInfo))/5))
		return 0
	end
	return 1	
end

--�� õ�廨��
function tbVNGWD2011_NpcHead:ExpAward(nCount, nExp, strLog)
	local tbTaskInfo =
					{
						nTaskID = 2749,
						nStartBit = 1,
						nBitCount = 11,
						nMaxValue = 1000
					}	
	
	local tbAward = {szName = "�i����ֵ", nExp=5000000}
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