-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - H飊gB窽hi猲H估窆貼PC对话
-- 文件名　：npc_dailog.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "фi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H飊g", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi猲", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "уng C�", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "T﹏ B秐 C�", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "фi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H飊g", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi猲", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "Ho祅g K�", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "T﹏ B秐 K�", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g心剑", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50万 EXP (1 H飊g心剑)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "B竿跚�", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 万 EXP (1 B竿跚�)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "Thi猲残刀", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 万 EXP (1 Thi猲残刀)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H谷展�", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 万 EXP (1 H谷展�)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B竿跚�", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 万 EXP (5 H飊g心剑 + 2 B竿跚�)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B竿跚�", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi猲残刀", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 万 EXP (5 H飊g心剑 + 2 B竿跚� + 1 Thi猲残刀)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "S� lng kh玭g , t藀 h頿 cho  r錳 quay l筰 nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H飊g心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B竿跚�", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi猲残刀", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "H谷展�", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 万 EXP (5 H飊g心剑+2 B竿跚�+1 Thi猲残刀+1 H谷展�)",
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
				Msg2Player("Чi hi謕  nh薾 頲 kinh nghi謒 gi韎 h筺 cao nh蕋 r錳, kh玭g th� ti誴 t鬰 nh薾 th猰 n鱝!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("Ho箃 ng 揅h祇 m鮪g phi猲 b秐 m韎� di詎 ra t� %s n %s. Ngi mu鑞 t譵 hi觰 ho箃 ng n祇?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("在H瓜毵鎖", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "开门信物活动从 19/06/2009 到 24:00 19/07/2009.在此期间各位可以通过在信使处闯关收集H飊g心剑, B竿跚�, Thi猲残刀, H谷展刃盼�. 用这些信物来换取许多诱人的奖励.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ngi ch璦  甶襲 ki謓  nh薾 v藅 ph萴 n祔")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("L� Quan"..":".."Ta nh� kh玭g nh莔 th� ngi  nh薾 r錳?",1, "Th藅 ng筰 qu�! T筰 h� qu猲 m蕋./OnCancel")
		return 
	end
	local tbItem = {szName="C萴 nang s� ki謓", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	local tbSay = {};
	local szTitle = format(" {{捕肥刺猬}}活动 从 %s  到 %s. 在此期间您输入{{肥刺猬} 就将获得一些诱人的奖励. {{肥刺猬} 出现在7个大城市和8个新手村. 每Thi猲最多只能捕20只{{肥刺猬}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho箃 ng  k誸 th骳.");
	end
	local tbSay = {};
	local szTitle = format(" {{新手帮助}}活动从 %s 到 %s. 在此期间1-79的英H飊g可以在NPC的8个新手村 {{战心尊者}} 接近礼官接受 {{新手帮助}} 同时参加 {{捕肥刺猬}}活动. 参加新手帮助活动可以使各位在江湖上行侠更加顺利","19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay);
end

