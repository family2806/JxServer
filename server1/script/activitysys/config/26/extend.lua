Include("\\script\\activitysys\\config\\26\\head.lua")
Include("\\script\\activitysys\\config\\26\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
local szRemoteScript = "\\script\\event\\2011dayanqunxia\\event.lua"

function pActivity:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = self:GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		self:SetTask(TSK_DATE_A, nCurDate)
		self:SetTask(TSK_EXP_A, 0)
	end
end

function pActivity:AddTaskA(TSK_EXP_A, TSK_DATE_A, nAddValue)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:AddTask(TSK_EXP_A, nAddValue)	
end

function pActivity:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:GetTask(TSK_EXP_A)
end

function pActivity:CheckTaskA(TSK_EXP_A, TSK_DATE_A, nUpExpA, szMsgA, nNumber)
	local nCurExpA = self:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	if nCurExpA >= nUpExpA then
		if szMsgA ~= nil then
			Talk(1, "", szMsgA)
		end
		return
	end
	return 1
end

function pActivity:CheckTaskB(TSK_B, szMsg, szOption)
	local nValue = self:GetTask(TSK_B)
	if szOption == "==" then
		if nValue == 0 then
			return 1
		end
	elseif szOption == "~=" then
		if nValue ~= 0 then
			return 1
		end
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self:CheckTask(TSK_B, nCurDate, szMsg, szOption)
end

function pActivity:GiveEatAward(TSK_EXP_A, TSK_DATE_A, TSK_EXP_B, nNumber)
	local tbAward = 
	{
		{nExp_tl = 1000000, nRate = 40, 
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "���һ��'�����Ź�'���1.000.000 ����")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 1000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 1000000 / %nNumber)
			end
		},
		{nExp_tl = 2000000, nRate = 30,
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "���һ��óԵ� '��������' �����2.000.000����")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 2000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 2000000 / %nNumber)
			end
		},
		{nExp_tl = 3000000, nRate = 20,
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "����һ��óԵ�'�л���' , ���3.000.000����")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 3000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 3000000 / %nNumber)
			end
		},
		{nExp_tl = 5000000, nRate = 10, 
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "������һ��'������' ��һ�ںܺó�,���5.000.000 ����")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 5000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 5000000 / %nNumber)
			end
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "2011����Ⱥ��,�Բ˻�þ���.", 1)
end

function pActivity:CheckNotGetDrunk(nSkillId, szMsg)
	if GetSkillState(nSkillId) == -1 then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:CheckGetDrunk(nSkillId, szMsg)
	local nValue = self:CheckNotGetDrunk(nSkillId)
	if nValue ~= 1 then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:DrinkOneRound(TSK_A, TSK_B, TSK_Time, TSK_Round, TSK_AwardB, TSK_AwardC, TSK_Date, nSkillId, szKind, nDetailId)

	local nAddValueA = nil
	local nAddValueB = nil
	if szKind == "small" then
		nAddValueA = random(1, 6)
		nAddValueB = 3
	elseif szKind == "middle" then
		nAddValueA = random(2, 12)
		nAddValueB = 7
	elseif szKind == "big" then
		nAddValueA = random(3, 18)
		nAddValueB = 11
	end
	--TSK_AwardB:���Ƴɹ���  TSK_AwardC:��ο��
	self:AddTask(TSK_A, nAddValueA)--����
	self:AddTask(TSK_B, nAddValueB)--����
	
	local nValueA = self:GetTask(TSK_A)
	local nValueB = self:GetTask(TSK_B)
	
	if nValueA >= 100 then
		self:SetTask(TSK_AwardC, 1) --�а�ο��Ҫ��
		self:AddTaskDaily(TSK_Time, 1)--������1
		self:SetTask(TSK_Round, 0)--��������
		self:SetTask(TSK_A, 0)--��������
		self:SetTask(TSK_B, 0)--��������
		PlayerFunLib:AddSkillState(nSkillId, 1, 3, 30 * 60 * 18, 1)
		Talk(1, "", "���Ѿ������ˣ���Ż�µ������ˣ����ȥ�ο����")
	else
		self:AddTask(TSK_Round, 1)--������1
		local nRound = self:GetTask(TSK_Round)
		if nRound >= 12 then
			self:SetTask(TSK_AwardB, 1) --�ж��Ƴɹ���Ҫ��
			self:AddTaskDaily(TSK_Time, 1)--������1
			self:SetTask(TSK_Round, 0)--��������
			self:SetTask(TSK_A, 0)--��������
			self:AddJiuLiang(nValueB)
			self:SetTask(TSK_B, 0)--��������
			local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
			self:SetTask(TSK_Date, nCurDate)			
			Talk(1, "", "�˴ζ��Ʊ�������ɹ���!")
		else
			self:ExecActivityDetail(nDetailId)
		end
	end
	
end

function pActivity:AddJiuLiang(nValue)
	local obj = ObjBuffer:New()
	local szName = GetName()
	obj:Push(szName)
	obj:Push(nValue)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	obj:Push(nCurDate)
	RemoteExecute(%szRemoteScript, "tbQunXia:g2s_AddJiuLiang", obj.m_Handle)
	obj:Destroy()	
end

function pActivity:GetTitle(TSK_A, TSK_B, TSK_C)
	local nValueA = self:GetTask(TSK_A)
	local nValueB = self:GetTask(TSK_B)
	local nValueC = self:GetTask(TSK_C)
	local szTitle = "�˴ζ��Ʊ���������Ҫ����12�־ƣ����Ѿ����� %d �־�, �������Ϊ %d, �˴ζ��ƣ����ѻ�õľ���Ϊ %d, ��һС����,�㽫����1-6�����⣬��һ�б��ƣ��㽫����2-12�����⣬����7����������һ�󱭾ƣ��㽫����3-18�����⣬����11�������� "
	szTitle = format(szTitle, nValueA, nValueB, nValueC)
	return szTitle
end

function pActivity:Lose(TSK_A, TSK_B, TSK_C, TSK_D, TSK_E)
	--TSK_A:����  TSK_B������   TSK_C������  TSK_D: ��ο��
	self:AddTaskDaily(TSK_A, 1)--������1
	self:SetTask(TSK_B, 0)--��������
	self:SetTask(TSK_C, 0)--��������
	self:SetTask(TSK_D, 1)--�а�ο����
	self:SetTask(TSK_E, 1)--��������
end

function pActivity:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
	self:AddNpc(szNpcName, nNpcId, tbNpcPos,  "\\script\\activitysys\\npcdailog.lua")
end

function pActivity:AddNpc(szNpcName, nNpcId, tbNpcPos, szLuaFile)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex > 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			if szLuaFile ~= nil then
				SetNpcScript(nNpcIndex, szLuaFile)
			end
		end		
	end
end

function pActivity:AddNpcFromFile(szNpcName, nNpcId, szPosPath, nMapId)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end	
	local tbNpcPos = {}
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		tbNpcPos[nRow - 1] = {}
		tbNpcPos[nRow - 1][1] = nMapId
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		tbNpcPos[nRow - 1][2] = nX
		tbNpcPos[nRow - 1][3] = nY
	end
	self:AddNpc(szNpcName, nNpcId, tbNpcPos)
end

function pActivity:AddMulNpc(tbNpcInfos, szNpcName, nNpcId)
	local nCount = getn(tbNpcInfos)
	for i = 1, nCount do
		self:AddNpcFromFile(szNpcName, nNpcId, tbNpcInfos[i]["szPosPath"], tbNpcInfos[i]["nMapId"])
	end
end

function pActivity:DisplayCurJiuLiang()
	local obj = ObjBuffer:New()
	local szName = GetName()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	obj:Push(szName)	
	obj:Push(nCurDate)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryPlayerJiuLiang", obj.m_Handle, "pActivity:ReceiveCurJiuLiang", 0)
	obj:Destroy()
end

function pActivity:ReceiveCurJiuLiang(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nJiuLiang = ObjBuffer:PopObject(ResultHandle)
	local szMsg = format("%-32s%-10d\n", szName, nJiuLiang)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local szTitle = format("%-32s%-10s\n", "����", "���վ���")
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle..szMsg, {{"�����Ի�"}})
	end
end

function pActivity:JieJiu(nSkillId)
	RemoveSkillState(nSkillId)
end

function pActivity:CheckDrinkTime(nStartHour, nEndHour, szMsg)
	local nCurHour = tonumber(GetLocalDate("%H"))
	if (nCurHour >= nStartHour and nCurHour <= nEndHour) then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:GetDrinkAward(TSK_EXP_A, nUpExpA, nAddExpA, szMsg, szOption, nNumber, szLogTitle)
	if self:CheckTask(TSK_EXP_A, nUpExpA, szMsg, szOption) ~= 1 then
		return
	end
	PlayerFunLib:AddExp(nAddExpA, 1, szLogTitle)
	self:AddTask(TSK_EXP_A, nAddExpA / nNumber)
	return 1
end

function pActivity:GetPaiMingAward()
	local nDate = self:GetTask(%TSK_LastTimeDate)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate == 0 or nDate >= nCurDate then
		Talk(1, "", "����Ŀǰ��Ȼû�н���Ҫ��")
		return
	end
	self:GetFixCountData(nDate, 10, GetName())
end

function pActivity:GetFixCountData(nDate, nCount, szName)
	local obj = ObjBuffer:New()
	obj:Push(nDate)
	obj:Push(nCount)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_LoadFixCountData", obj.m_Handle, "pActivity:ReceiveFixCountData", 0)
	obj:Destroy()	
end

function pActivity:ReceiveFixCountData(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	local nResult = DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:CheckTaskB", %TSK_LastTimeDate, "�����Ѿ���������������", "~=")
	if  nResult ~= 1 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	local nCount = 0
	if tbTopTen ~= nil then
		nCount = getn(tbTopTen)
	end
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "��������ʱû�н���Ҫ��")
		return
	end
	local nPos = -1
	for i = 1, nCount do
		if tbTopTen[i] ~= nil and tbTopTen[i][1] ~= nil then
			if tbTopTen[i][1] == szName then
				nPos = i
				break
			end
		end
	end
	if nPos == -1 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "��������ʱû�н���Ҫ��")
		return
	end
	local nAddExpA = 0
	if nPos == 1 then
		nAddExpA = %tbPaiMingExp[1]
	elseif nPos == 2 then
		nAddExpA = %tbPaiMingExp[2]
	elseif nPos == 3 then
		nAddExpA = %tbPaiMingExp[3]
	else
		nAddExpA = %tbPaiMingExp[4]
	end
	local bFlag = DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:GetDrinkAward", 
		%TSK_TotalDrinkExp, %nTotalDrinkUpExp, nAddExpA, "�����μӶ��ƻ�õľ����Ѵ����ޣ����ܼ�����ȡ�붷����صĽ����ˡ�", "<", %nNumber, "2011�����Ⱥ������ȡ������������.")
	DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:SetTask", %TSK_LastTimeDate, 0)
	if bFlag == 1 then
		local szMsg = ""
		if nPos >= 4 then
			szMsg = "����ȡ�ɹ����д�4-10���ƽ���."
		else
			szMsg = format("����ȡ�������н���%d( ����%d)�ɹ�", nPos, nPos)
		end
		CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
	end
end

function pActivity:GetYDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nTime = GetCurServerTime() - 24*60*60
	local tbYDate = Time2Tm(nTime)
	local nYDate = tbYDate[1] * 10000 + tbYDate[2] * 100 + tbYDate[3]
	return nYDate
end

function pActivity:DisplayCurTopTen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(nCurDate)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryTopTen", obj.m_Handle, "pActivity:ReceiveTopTen", 0)
	obj:Destroy()	
end

function pActivity:DisplayYTopTen()
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime >= 0 and nTime <= 5 then
		Talk(1, "", "Ŀǰû������")
		return
	end	
	local nYDate = self:GetYDate()
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(nYDate)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryTopTen", obj.m_Handle, "pActivity:ReceiveTopTen", 0)
	obj:Destroy()		
end

function pActivity:ReceiveTopTen(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	local szMsg = "Ŀǰû������"
	if tbTopTen ~= nil then
		local nCount = getn(tbTopTen)
		if nCount == 0 then
			CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
			return
		end
		local szPaiMing = format("%-32s%-10s\n", "����", "����")
		for i = 1, nCount do
			local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
			szPaiMing = szPaiMing..szTemp
		end
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szPaiMing, {{"�����Ի�"}})
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
	end
end

function pActivity:DisplayPlayerPaiMing(nDate, szFun)
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(szName)	
	obj:Push(nDate)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryPlayerPaiMing", obj.m_Handle, szFun, 0)
	obj:Destroy()		
end

function pActivity:DisplayYPlayerPaiMing()
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime >= 0 and nTime <= 5 then
		Talk(1, "", "Ŀǰû������")
		return
	end	
	local nYDate = self:GetYDate()	
	self:DisplayPlayerPaiMing(nYDate, "pActivity:ReceivePlayerPaiMing")
end

function pActivity:ReceivePlayerPaiMing(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "����Ŀǰû�����վ�������")
		return
	end
	local szPaiMing = format("%-32s%-10d\n", szName, nPaiMing)
	local szTitle = format("%-32s%-10s\n", "����", "��������")
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle..szPaiMing, {{"�����Ի�"}})
end

function pActivity:CheckPaiMing()
	local nResult = self:CheckTaskB(%TSK_LastTimeDate, nil, "==")
	if nResult ~= 1 then
		local nDate = self:GetTask(%TSK_LastTimeDate)
		self:DisplayPlayerPaiMing(nDate, "pActivity:CheckRePaiMing")
	else
		self:pCreateDialog()
	end
end

function pActivity:CheckRePaiMing(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing >= 1 and nPaiMing <= 10 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "�ڲμӴ˴ζ��Ʊ���ǰ����Ҫ�����ϴζ��Ʊ��������н���(��ο�����ɹ����ƽ��������� ) ��ȥ������Щ������Ȼ�����μ�Ŷ��")	
	else
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:SetTask", %TSK_LastTimeDate, 0)
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:pCreateDialog")
	end
end

function pActivity:pCreateDialog()
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = self:GetTitle(%TSK_DrinkRound, %TSK_ZuiYi, %TSK_JiuLiang)
	tbDailog:AddOptEntry("��һС����", self.GotoDetail, {self, 6, {tbDailog}})
	tbDailog:AddOptEntry("��һ�б���", self.GotoDetail, {self, 7, {tbDailog}})
	tbDailog:AddOptEntry("��һ�󱭾�", self.GotoDetail, {self, 8, {tbDailog}})
	tbDailog:AddOptEntry("�ҺȲ���ȥ�ˣ��˴ζ��Ʊ���������", self.GotoDetail, {self, 9, {tbDailog}})
	tbDailog:Show()
end

function pActivity:BeginDrink()
	if self:CheckDate() ~= 1 then
		return
	end
		
	if self:CheckDrinkTime(9, 23, "�������ڲ��Ƕ���ʱ�䣬����9ʱ��24ʱ�������ﶷ��Ŷ") ~= 1 then
		return
	end
	
	if self:CheckTaskDaily(%TSK_DrinkTimes, 3, "�����Ѿ��ȹ�3�����ˣ�����������", "<") ~= 1 then
		return
	end
	
	if self:CheckNotGetDrunk(1020, "�������Ѿ������ˣ��Ⱦ���������Ŷ") ~= 1 then
		return
	end
	
	if self:CheckTask(%TSK_WinDrink, 0, "�ڲμӴ˴ζ��Ʊ���ǰ����Ҫ�����ϴζ��Ʊ��������н���(��ο�����ɹ����ƽ��������� ) ��ȥ������Щ������Ȼ�����μ�Ŷ", "==") ~= 1 then
		return
	end
	
	if self:CheckTask(%TSK_AnWei, 0, "�ڲμӴ˴ζ��Ʊ���ǰ����Ҫ�����ϴζ��Ʊ��������н���(��ο�����ɹ����ƽ��������� ) ��ȥ������Щ������Ȼ�����μ�Ŷ", "==") ~= 1 then
		return
	end
	
	self:CheckPaiMing()
end







