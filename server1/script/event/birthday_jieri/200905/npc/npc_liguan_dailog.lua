-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 雄霸天下礼官NPC对话
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
		szComposeTitle =  "兑换",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "雄", tbProp = {6,1,2062,1}},
			{szName = "霸", tbProp = {6,1,2063,1}},
			{szName = "天", tbProp = {6,1,2064,1}},
			{szName = "下", tbProp = {6,1,2065,1}},
			{szName = "铜鼓", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "新版鼓", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "兑换",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "雄", tbProp = {6,1,2062,1}},
			{szName = "霸", tbProp = {6,1,2063,1}},
			{szName = "天", tbProp = {6,1,2064,1}},
			{szName = "下", tbProp = {6,1,2065,1}},
			{szName = "黄旗", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "新版旗", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "雄心剑", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50万 EXP (1 雄心剑)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "霸王枪", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 万 EXP (1 霸王枪)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "天残刀", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 万 EXP (1 天残刀)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "下日弓", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 万 EXP (1 下日弓)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "雄心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "霸王枪", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 万 EXP (5 雄心剑 + 2 霸王枪)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "雄心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "霸王枪", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "天残刀", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 万 EXP (5 雄心剑 + 2 霸王枪 + 1 天残刀)",
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
				Msg2Player("您领取的经验已达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "数量不够, 搜集够了之后再回来吧!",
		tbMaterial = 
		{
			[1]	= {szName = "雄心剑", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "霸王枪", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "天残刀", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "下日弓", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 万 EXP (5 雄心剑+2 霸王枪+1 天残刀+1 下日弓)",
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
				Msg2Player("您领取的经验以达上限, 不能再继续领取了!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "活动已结束.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("祝贺新版本活动从 %s 到 %s. 您想了解哪个活动?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("在下想兑换", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "活动已结束.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "开门信物活动从 19/06/2009 到 24:00 19/07/2009.在此期间各位可以通过在信使处闯关收集雄心剑, 霸王枪, 天残刀, 下日弓等信物. 用这些信物来换取许多诱人的奖励.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "活动已结束.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "您未达到领取此物品的条件")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("L? Quan"..":".."我没记错的话，您已经领取过了?",1, "真不好意思! 我忘记了./OnCancel")
		return 
	end
	local tbItem = {szName="锦囊事件", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "活动已结束.");
	end
	local tbSay = {};
	local szTitle = format(" {{捕肥刺猬}}活动 从 %s  到 %s. 在此期间您输入{{肥刺猬} 就将获得一些诱人的奖励. {{肥刺猬} 出现在7个大城市和8个新手村. 每天最多只能捕20只{{肥刺猬}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "活动已结束.");
	end
	local tbSay = {};
	local szTitle = format(" {{新手帮助}}活动从 %s 到 %s. 在此期间1-79的英雄可以在NPC的8个新手村 {{战心尊者}} 接近礼官接受 {{新手帮助}} 同时参加 {{捕肥刺猬}}活动. 参加新手帮助活动可以使各位在江湖上行侠更加顺利","19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay);
end

