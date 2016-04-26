Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")

local szEventName = "Event_NhaGiaoVN"
local nMaxAskNumber = 2000 -- 打包上交时最大可支持数


local tbBookPartAward = {
	[20]={szName="花之音",tbProp={6,1,3043,1,0,0},nExpiredTime=20111201},
	[40]={szName="花之音",tbProp={6,1,3043,1,0,0},nCount = 3,nExpiredTime=20111201},
	[60]={szName="花之音",tbProp={6,1,3043,1,0,0},nCount = 4,nExpiredTime=20111201},
	[80]={szName="花之音",tbProp={6,1,3043,1,0,0},nCount = 5,nExpiredTime=20111201},
	[100]={szName="花之音",tbProp={6,1,3043,1,0,0},nCount = 7,nExpiredTime=20111201},
	[200]={nExp_tl=1,nCount = 20000000,},
	[300]={nExp_tl=1,nCount = 20000000,},
	[400]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[500]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[600]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[700]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[800]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[900]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1000]={nExp_tl=1,nCount = 20000000,},
	[1100]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1200]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1300]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1400]={szName="天宇魂",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1500]={nExp_tl=1,nCount = 50000000,},
	[1600]={nExp_tl=1,nCount = 60000000,},
	[1700]={nExp_tl=1,nCount = 70000000,},
	[1800]={nExp_tl=1,nCount = 80000000,},
	[1900]={nExp_tl=1,nCount = 90000000,},
	[2000]={nExp_tl=1,nCount = 100000000,},
}
local tbBookPartAwardLog ={
	[20] = "使用20次书籍",
	[40] = "使用40次书籍",
	[60] = "使用60次书籍",
	[80] = "使用80次书籍",
	[100] = "使用100次书籍", 
	[200] = "使用200次书籍",
	[300] = "使用300次书籍",
	[400] = "使用400次书籍",
	[500] = "使用500次书籍",
	[600] = "使用600次书籍", 
	[700] = "使用700次书籍",
	[800] = "使用800次书籍",
	[900] = "使用900次书籍",
	[1000] = "使用1000次书籍",
	[1100] = "使用1100次书籍", 
	[1200] = "使用1200次书籍h",
	[1300] = "使用1300次书籍",
	[1400] = "使用1400次书籍",
	[1500] = "使用1500次书籍",
	[1600] = "使用1600次书籍", 
	[1700] = "使用1700次书籍",
	[1800] = "使用1800次书籍",
	[1900] = "使用1900次书籍",
	[2000] = "使用2000次书籍",
}

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("您获得"..nCount.."帮会贡献点")
		%tbLog:PlayerActionLog(%szEventName, "使用书籍获得物品", nCount.."帮会贡献点")
	end
end

local tbBookAward = {
	{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
	{szName="金乌金牌",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.05},
	{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.05},
	{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.05},
	{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
	{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
	{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.05},
	{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.03},
	{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.001},
	{szName="青驹石",tbProp={6,1,2710,1,0,0},nCount=1,nRate=0.4},
	{szName="云禄石",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.3},
	{szName="苍狼石",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
	{szName = "6000000 经验值", nExp=6000000,nRate=35},
	{szName = "8000000 经验值", nExp=8000000,nRate=22},
	{szName = "12000000 经验值", nExp=12000000,nRate=10},
	{szName = "20000000 经验值", nExp=20000000,nRate=3},
	{szName = "50000000 经验值", nExp=50000000,nRate=0.5},
	{szName = "100000000 经验值", nExp=100000000,nRate=0.1},
	{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3},
	{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3},
	{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="宋金招兵令",tbProp={6,1,30083,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
	{szName="玉重炼",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	{szName="积功助力丸",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="阴阳活血丹",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="木仁令",tbProp={6,1,30105,1,0,0},nCount=5,nRate=9.664},
	{szName="50000 个帮会贡献点",nCount=1,nRate=2, pFun = function() %pContributionAward(50000) end},
	{szName="100000 个帮会贡献点",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
	{szName="紫蟒之宝(帽)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={1,0,0,0,0,0}},
	{szName="紫蟒之宝(腰带)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	{szName="紫蟒之宝(手套)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={3,0,0,0,0,0}},
	{szName="紫蟒之宝(玉佩)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={8,0,0,0,0,0}},
	{szName="紫蟒之宝(衣服)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={5,0,0,0,0,0}},
	{szName="紫蟒之宝(鞋子)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	{szName="紫蟒之宝(项链)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={0,0,0,0,0,0}},
	{szName="紫蟒之宝(上戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={2,0,0,0,0,0}},
	{szName="紫蟒之宝(下戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={9,0,0,0,0,0}},
	{szName="紫蟒之宝(武器)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
}

local tbBaizhiPartLog = {
	[500] = "交白纸物品500次",
	[1000] = "交白纸物品1000次",
	[1500] = "交白纸物品1500次",
	[2000] = "交白纸物品2000次",
	[2500] = "交白纸物品2500次",
	[3000] = "交白纸物品3000次",
}	

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1431,3287,},
		[2] = {176,1428,3283,},
	}
	local tbNpc = {
		[1] = {
			szName = "大老师", 
			nLevel = 95,
			nNpcId = 1877,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "书童", 
			nLevel = 95,
			nNpcId = 1878,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:GetItemCount(tbMaterial)
	local nMaxCount = -1
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
			nCount = floor(nCount / tbMaterial[i].nCount)
			if nMaxCount < 0 then
				nMaxCount = nCount
			else
				nMaxCount = min(nMaxCount, nCount)
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
		nMaxCount = min(nMaxCount, nCount)
	end
	nMaxCount = max(0, nMaxCount)
	return nMaxCount
end

function pActivity:ConsumeItem(tbMaterial, nCount)
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nTotalCount = nCount * tbMaterial[i].nCount
			if ConsumeItem(3, nTotalCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
				Msg2Player(format("当消耗%s 已失败, 请等一下再来",tbMaterial[i].szName))
				return 0
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		if ConsumeItem(3, nCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
			Msg2Player(format("当消耗%s 已失败, 请等一下再来",tbMaterial[i].szName))
			return 0
		end
	end
	return 1
end

function pActivity:CheckItemCount(nValue, nTarget)
	if nValue < nTarget then
		Say("你不足原料，请再准备")
		return 0
	end
	return 1
end

-- 上交书本成功后相关操作
--function pActivity:DoHandInBook(nCount, nTaskId)
--	local nPreCount = self:GetTask(nTaskId)
--	local nNowCount = nPreCount + nCount
--	
--	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
--		return 
--	end
--	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham"})
--	for key,value in %tbBookPartAward do
--		if key > nPreCount and key <= nNowCount then
--			tbAwardTemplet:Give(value, 1, {%szEventName,%tbBookPartAwardLog[key]})
--		end
--	end
--	self:AddTask(nTaskId, nCount)
--end

-- 上交白纸成功后相关操作
function pActivity:DoHandInPaper(nCount, nTaskId)
	local tbExp = {{nExp_tl=1,nCount = 1000000,},}
	local nPreCount = self:GetTask(nTaskId)
	local nNowCount = nPreCount + nCount
	tbAwardTemplet:Give(tbExp, nCount, {%szEventName, "HandInPaper"})
	for key,value in %tbBaizhiPartLog do
		if key > nPreCount and key <= nNowCount then
			%tbLog:PlayerActionLog(%szEventName, value)
			tbVngTransLog:Write("201111_20Thang11/", 16, value, "N/A", 1)
		end
	end
	self:AddTask(nTaskId, nCount)
end

-- 上交道具阶段性奖励
function pActivity:GiveAward(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		self:DoHandInBook(nCount, nTaskId)
	elseif nTaskId == %TSK_HandInPaper then
		self:DoHandInPaper(nCount, nTaskId)
	end
	
end

function pActivity:CheckFreeCell(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		local nFreeCount = nCount * 3 -- 漠北传送令有3张且不可叠加
		if CalcFreeItemCellCount() < nFreeCount then
			Say(format("为了确保财产安全，请确保装备还剩%d空位.",nFreeCount))
			return 0
		end
	end
	return 1
end

-- 确定上交道具
function pActivity:SureHandIn(tbMaterial, nTaskId, nCount)
	if nCount <= 0 then
		return 
	end	
	--检查上交数量有没有超过上限- Modified by DinhHQ - 20111101
	local nMaxCount = 0
	if nTaskId == %TSK_HandInBook then
		nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook) - nCount
	elseif nTaskId == %TSK_HandInPaper then
		nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper) - nCount
	end	
		
	if nMaxCount < 0 then
		Say("数量超过上限，请输入其他数!")
		return 
	end
	
	local nItemCount = self:GetItemCount(tbMaterial)
	if self:CheckItemCount(nItemCount, nCount) ~= 1 then
		return
	end
	
	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
		return 
	end 
	
	if self:ConsumeItem(tbMaterial, nCount) ~= 1 then
		return 
	end
	
	self:GiveAward(nTaskId, nCount)
end

-- 上交书本
--function pActivity:HandInBook()
--	print("上交书籍")
--	local tbBook = {
--		[1]={szName="书籍",tbProp={6,1,3042,1,0,0},},	
--	}
--	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
--	if nMaxCount < 1 then
--		Say("目前您的上交数量已达最高上限，不能再上交了")
--		return 
--	end
--	print("nMaxCount = " .. nMaxCount)
--	print("nMaxAskNumber" .. %nMaxAskNumber)
--	nMaxCount = min(%nMaxAskNumber, nMaxCount)
--	local nItemCount = self:GetItemCount(tbBook)
--	nMaxCount = min(nMaxCount, nItemCount)
--	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
--		return
--	end
--	g_AskClientNumberEx(0,nMaxCount, format("输入数字(0-%d)", nMaxCount), {self.SureHandIn, {self,tbBook,%TSK_HandInBook}})
--end


-- 上交白纸
function pActivity:HandInPaper()
	local tbPape = {
		[1]={szName="白纸",tbProp={6,1,3039,1,0,0},},	
	}
	local nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper)
	if nMaxCount < 1 then
		Say("目前您上交次数已达最高上限，不能再上交了")
		return 
	end
	nMaxCount = min(%nMaxAskNumber, nMaxCount)
	local nItemCount = self:GetItemCount(tbPape)	
	nMaxCount = min(nMaxCount, nItemCount)
	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
		return
	end
	g_AskClientNumberEx(0,nMaxCount, format("输入数字(0-%d)", nMaxCount), {self.SureHandIn, {self,tbPape,%TSK_HandInPaper}})
end

-- 领取教师节经验奖励
function pActivity:TeacherAward()
	local nStartTime = 20111120
	if tonumber(GetLocalDate("%Y%m%d")) ~= nStartTime then
		Say("只能在 <color=yellow>  20/11/2011 <color> 才能获得该奖励，目前不能领取")
		return 
	end
	local tbTeacherEXP = { {nExp_tl=1,nCount = 100000000,}, }
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(tbTeacherEXP,1,{%szEventName, "领取奖励在NPC大老师", tbTranslog})
	self:AddTask(%TSK_TeacherAward, 1)
end

local tbJinwu = {
	[1]={szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},},
	[2]={szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},},
	[3]={szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},},
	[4]={szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},},
	[5]={szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},},
	[6]={szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},},
	[7]={szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},},
}
-- 领取上次书本次数超过700时的金乌奖励
function pActivity:JinwuAward()
	print("领取金乌图谱奖励")
	local szTitle = "请选择你想领取的图谱:"
	local tbOpt = {}
	for nIndex=1,getn(%tbJinwu) do
		tinsert(tbOpt, {%tbJinwu[nIndex].szName, self.SelectJinWu,{self, nIndex}})
	end
	tinsert(tbOpt, {"让我再想想!", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectJinWu(nIndex)
	local nFreeItemCellLimit = 1
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("为确保您的财产安全，请确保最少<color=yellow>%d <color> 装备空位",nFreeItemCellLimit))
		return 
	end
	tbAwardTemplet:Give(%tbJinwu[nIndex], 1, {%szEventName, "使用700次书籍_金乌"})
	self:AddTask(%TSK_JinwuAward, 1)
end

function pActivity:UseZhienhua()
	local tbUseLog = {
		[10] = "使用花之音10次",
		[20] = "使用花之音20次",
		}
	self:AddTask(%TSK_UsedZhienhua,1)
	local nUseTime = self:GetTask(%TSK_UsedZhienhua)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("使用成功<color=yellow>%s<color>, 获得<color=yellow>%d<color> 上交 <color=yellow>%s<color> 次","花之音",%nPerZhienhua,"白纸"))
end

function pActivity:UseTianyuhun()
	local tbUseLog = {
		[10] = "使用天宇魂10次",
		[20] = "使用天宇魂20次",
		}
	self:AddTask(%TSK_UsedTianyuhun,1)
	local nUseTime = self:GetTask(%TSK_UsedTianyuhun)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("使用成功<color=yellow>%s<color>, 获得<color=yellow>%d<color> 上交 <color=yellow>%s<color> 次","天宇魂",%nPerTianyuhun,"书籍"))
end

function pActivity:CheckBookLimit()
	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
	if nMaxCount < 1 then
		Say("大侠已使用该物品达最大值，不能再使用了!")
		return nil
	end
	return 1
end

function pActivity:UseBook()
	self:AddTask(%TSK_HandInBook,1)	
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham", tbTranslog})
	local nUseTime = self:GetTask(%TSK_HandInBook)
	--print(nUseTime)
	if %tbBookPartAward[nUseTime] then
		tbAwardTemplet:Give(%tbBookPartAward[nUseTime], 1, {%szEventName,%tbBookPartAwardLog[nUseTime]})
		tbVngTransLog:Write("201111_20Thang11/", 16, %tbBookPartAwardLog[nUseTime], "N/A", 1)
	end	
end

pActivity.nPak = curpack()
