-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �۰��������NPC�Ի�
-- �ļ�������npc_dailog.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "�һ�",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "��", tbProp = {6,1,2062,1}},
			{szName = "��", tbProp = {6,1,2063,1}},
			{szName = "��", tbProp = {6,1,2064,1}},
			{szName = "��", tbProp = {6,1,2065,1}},
			{szName = "ͭ��", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "�°��", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "�һ�",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "��", tbProp = {6,1,2062,1}},
			{szName = "��", tbProp = {6,1,2063,1}},
			{szName = "��", tbProp = {6,1,2064,1}},
			{szName = "��", tbProp = {6,1,2065,1}},
			{szName = "����", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "�°���", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "���Ľ�", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50�� EXP (1 ���Ľ�)",
			[1]	= {nExp = 500000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 500000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 500000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "����ǹ", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 �� EXP (1 ����ǹ)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "��е�", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 �� EXP (1 ��е�)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "���չ�", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 �� EXP (1 ���չ�)",
			[1]	= {nExp = 3000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 3000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 3000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "���Ľ�", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "����ǹ", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 �� EXP (5 ���Ľ� + 2 ����ǹ)",
			[1]	= {nExp = 8000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 8000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 8000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "���Ľ�", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "����ǹ", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "��е�", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 �� EXP (5 ���Ľ� + 2 ����ǹ + 1 ��е�)",
			[1]	= {nExp = 12000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 12000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 12000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Ѵ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "��������, �Ѽ�����֮���ٻ�����!",
		tbMaterial = 
		{
			[1]	= {szName = "���Ľ�", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "����ǹ", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "��е�", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "���չ�", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 �� EXP (5 ���Ľ�+2 ����ǹ+1 ��е�+1 ���չ�)",
			[1]	= {nExp = 20000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 20000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 20000000 > 1000000000) then
				Msg2Player("����ȡ�ľ����Դ�����, �����ټ�����ȡ��!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "��ѽ���.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("ף���°汾��� %s �� %s. �����˽��ĸ��?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("������һ�", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "��ѽ���.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "���������� 19/06/2009 �� 24:00 19/07/2009.�ڴ��ڼ��λ����ͨ������ʹ�������ռ����Ľ�, ����ǹ, ��е�, ���չ�������. ����Щ��������ȡ������˵Ľ���.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "��ѽ���.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "��δ�ﵽ��ȡ����Ʒ������")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("L? Quan"..":".."��û�Ǵ�Ļ������Ѿ���ȡ����?",1, "�治����˼! ��������./OnCancel")
		return 
	end
	local tbItem = {szName="�����¼�", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "��ѽ���.");
	end
	local tbSay = {};
	local szTitle = format(" {{���ʴ��}}� �� %s  �� %s. �ڴ��ڼ�������{{�ʴ��} �ͽ����һЩ���˵Ľ���. {{�ʴ��} ������7������к�8�����ִ�. ÿ�����ֻ�ܲ�20ֻ{{�ʴ��}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "��ѽ���.");
	end
	local tbSay = {};
	local szTitle = format(" {{���ְ���}}��� %s �� %s. �ڴ��ڼ�1-79��Ӣ�ۿ�����NPC��8�����ִ� {{ս������}} �ӽ���ٽ��� {{���ְ���}} ͬʱ�μ� {{���ʴ��}}�. �μ����ְ��������ʹ��λ�ڽ�������������˳��","19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay);
end

