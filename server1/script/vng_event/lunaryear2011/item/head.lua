Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
if not tbVNG_NLY2011_Itemhead then
	tbVNG_NLY2011_Itemhead = {}
end
tbVNG_NLY2011_Itemhead.tbItems = 
	{
		["���꿨"] = 
			{
				tbTaskInfo =
					{
						nTaskID = 2756,
						nStartBit = 1,
						nBitCount = 8,
						nMaxValue = 100
					},
				tbExp = {nExp = 3e6},
				strName = "���꿨"
			},
		["���ձ�"] = 
			{
				tbTaskInfo =
					{
						nTaskID = 2755,
						nStartBit = 2,
						nBitCount = 11,
						nMaxValue = 1000
					},
				tbExp = {nExp = 5e5},
				strName = "���ձ�"
			},
		["����"] = 
			{
				tbTaskInfo =
					{
						nTaskID = 2756,
						nStartBit = 9,
						nBitCount = 13,
						nMaxValue = 3000
					},
				tbExp = {nExp = 1e6},
				strName = "����",
				tbItemAward =
					{
						[1] = 
							{
								{szName="���꿨",tbProp={6,1,30088,1,0,0},nCount=1,nRate=50,nExpiredTime=20110220},
							},
					}
			},
		["�ر�����"] = 
			{
				tbTaskInfo =
					{
						nTaskID = 2755,
						nStartBit = 13,
						nBitCount = 13,
						nMaxValue = 6000
					},
--				tbExp = {nExp = 20e6},
				strName = "�ر�����",
				tbItemAward =
					{
						{szName="���꿨",tbProp={6,1,30088,1,0,0},nCount=1,nExpiredTime=20110220},
					}
			},
	}
-- kiem tra han su dung item, 1: het han SD, 0: con han SD
function tbVNG_NLY2011_Itemhead:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end
function tbVNG_NLY2011_Itemhead:giveAward(tbAward, strLog)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTittle)
end
function tbVNG_NLY2011_Itemhead:checkBag(nCellCount)
	if (CalcFreeItemCellCount() < nCellCount) then
		return 0
	end
	return 1
end
function tbVNG_NLY2011_Itemhead:isMaxItemUse(tbTaskInfo)
	if (self:getBitTask(tbTaskInfo) >= tbTaskInfo.nMaxValue) then
		return 1;
	else return 0;
	end
end
function tbVNG_NLY2011_Itemhead:addTask(tbTaskInfo, nExp)
	local nCurExp = self:getBitTask(tbTaskInfo)
	local nNextExp = nCurExp + nExp
	if nNextExp > tbTaskInfo.nMaxValue then
		nNextExp = tbTaskInfo.nMaxValue
	end
	self:setBitTask(tbTaskInfo, nNextExp)
end
function tbVNG_NLY2011_Itemhead:getBitTask(tbTaskInfo)
	return GetBitTask(tbTaskInfo.nTaskID, tbTaskInfo.nStartBit, tbTaskInfo.nBitCount) 
end
function tbVNG_NLY2011_Itemhead:setBitTask(tbTaskInfo, nValue)
	return SetBitTask(tbTaskInfo.nTaskID, tbTaskInfo.nStartBit, tbTaskInfo.nBitCount, nValue) 
end

function tbVNG_NLY2011_Itemhead:useItem(strItemName)
	if tbVNG_LY2011:checkCondition() ~= 1 then
		return 0, "�㲻������ʹ����Ʒ��Ҫ��50���������ѳ�ֵ "
	end
	local tbItem = self.tbItems[strItemName]
	if self:isMaxItemUse(tbItem.tbTaskInfo) == 1 then
		return 0, "�����Ѵﵽ����Ʒ�����ʹ��!"
	end
	if strItemName == "banhchungdacbiet" then
		if self:CheckBag(2) ~= 1 then
			return 0, "Ϊȷ���Ʋ���ȫ��������2��װ����λ�����ʹ�ø���Ʒ!"
		end
		return self:banhchungdacbiet()
	end
	self:addTask(tbItem.tbTaskInfo, 1)
	if tbItem.tbExp then 
		local strLog = format("[VNG][Lunar Year 2011][ʹ�þ��齱��%s]", tbItem.strName)
		tbAwardTemplet:GiveAwardByList(tbItem.tbExp, strLog)
	end
	if tbItem.tbItemAward then
		local strLog2 = format("[VNG][Lunar Year 2011][ʹ����Ʒ���� %s]", tbItem.strName)
		for i =1, getn(tbItem.tbItemAward) do
			tbAwardTemplet:GiveAwardByList(tbItem.tbItemAward[i], strLog2)
		end
	end
	return 1
end

function tbVNG_NLY2011_Itemhead:banhchungdacbiet()
	local tbItem = self.tbItems["banhchungdacbiet"]
	--Tao bang phan thuong kinh nghiem
	local tbExp = {
							{n_Exp =5e6, n_Rate = 20},
							{n_Exp =6e6, n_Rate = 65},
							{n_Exp =8e6, n_Rate = 12},
							{n_Exp =10e6, n_Rate = 2},
							{n_Exp =20e6, n_Rate = 1}	
						};	
	local nTaskValue = self:getBitTask(tbItem.tbTaskInfo)
	local nTemp = (tbItem.tbTaskInfo.nMaxValue  - nTaskValue) * 1000000
	if (not tbExp) then
		return 1;
	end
	-- khong cho kinh nghiem vuot qua gioi han
	for i = 1, getn(tbExp) do
		if (nTemp < tbExp[i].n_Exp) then
			tbExp[i].n_Exp = nTemp
		end
	end	
	local tbExpAward = {}
	local tbTaskInfo = tbItem.tbTaskInfo
	for i = 1, getn(tbExp) do
		tbExpAward[i] = 
			{
				[1] = {nExp = tbExp[i].n_Exp},					
				[2] = 
						{
							pFun = function (tbItem, nItemCount, szLogTitle)								
								%tbVNG_NLY2011_Itemhead:addBCDBTask(%tbTaskInfo, %tbExp[%i].n_Exp)
							end
						},
				nRate = tbExp[i].n_Rate,
			}
	end
	if (tbExpAward)then
		tbAwardTemplet:GiveAwardByList(tbExpAward, "[VNG][Lunar Year 2011][�ر�����ʹ�þ��齱��]");	
	end
	if tbItem.tbItemAward then
		local strLog2 = format("[VNG][Lunar Year 2011][ʹ�����꿨���� %s]", tbItem.strName)
		for i =1, getn(tbItem.tbItemAward) do
			tbAwardTemplet:GiveAwardByList(tbItem.tbItemAward[i], strLog2)
		end
	end
	
	local tbItemAward = 
		{
			{szName="��Ч�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=3},
			{szName="�쾧�׾���",tbProp={6,1,2183,1,0,0},nCount=1,nRate=2},
			{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
			{szName="���ܻԻ͹�",tbProp={6,1,2271,1,0,0},nCount=1,nRate=4,nExpiredTime=43200},
			{szName="���˹���ֵ1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbVNG_NLY2011_Itemhead:addContribution(50000)
				end,
				nRate = 10
			},
			{szName="�i���˹���ֵ2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbVNG_NLY2011_Itemhead:addContribution(100000)
				end,
				nRate = 5
			},
			{szName="�i���˹���ֵ3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbVNG_NLY2011_Itemhead:addContribution(200000)
				end,
				nRate = 2
			},
				{szName="�i���˹���ֵ4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbVNG_NLY2011_Itemhead:addContribution(500000)
				end,
				nRate = 1
			},
			{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=1.5,nExpiredTime=14400},
			{szName="�����������",tbProp={6,1,1781,1,0,0},nCount=1,nRate=2,tbParam={60}},
			{szName="Į��������",tbProp={6,1,1448,1,0,0},nCount=1,nRate=2},
			{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
			{szName="���丣������",tbProp={6,1,1817,1,0,0},nCount=1,nRate=5},
			{szName="�������",tbProp={6,1,2355,1,0,0},nCount=1,nRate=3},
			{szName="������",tbProp={6,1,2256,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="�ĺ���ң�����",tbProp={6,1,2398,1,0,0},nCount=1,nRate=2},
			{szName="������յ����",tbProp={6,1,2399,1,0,0},nCount=1,nRate=2},
			{szName="�������ε����",tbProp={6,1,2400,1,0,0},nCount=1,nRate=2},
			{szName="�������ǲ�",tbProp={6,1,1674,1,0,0},nCount=1,nRate=0.5},
			{szName="ǧ�����ǲ�",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.3},
			{szName="������ʻ�",tbProp={6,1,2265,1,0,0},nCount=1,nRate=0.2},
			{szName="����������",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.2},
			{szName="Ԫ˧���",tbProp={0,11,447,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="��ɽѩ��",tbProp={6,1,1431,1,0,0},nCount=1,nRate=0.2},
			{szName="��Ч�ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=4},
			{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5},
			{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5},
			{szName="һ��Ǭ����",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.2},
			{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
			{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=24.9},
		}
	tbAwardTemplet:GiveAwardByList(tbItemAward, "[VNG][Lunar Year 2011][�ر�����ʹ��item���� ]");	
	return 1
end
function tbVNG_NLY2011_Itemhead:CheckBag(nCellCount)
	if (CalcFreeItemCellCount() < nCellCount) then
		return 0
	end
	return 1
end
function tbVNG_NLY2011_Itemhead:addBCDBTask(tbTaskInfo, nValue)
	local nVal = nValue / 1e6
	self:addTask(tbTaskInfo, nVal)
end
function tbVNG_NLY2011_Itemhead:addContribution(nValue)
	local sTongName, nResult = GetTong() 
	if nResult == 0 then 
		return
	end
	AddContribution(nValue)
	Msg2Player(format("���� %d ���˹���ֵ", nValue))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."[VNG][Lunar Year 2011][�ر�����ʹ����Ʒ����]"..GetAccount().."\t"..GetName().."\t".."��ø��˹���ֵ����"..nValue)
end
