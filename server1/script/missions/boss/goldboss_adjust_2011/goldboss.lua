-- 文件名　：goldboss.lua
-- 创建者　：wangjingjun
-- 内容　　：黄金boss调整，新增boss24小时后自动删除
-- PS	   : 由于在该文件加载的时候需要进行boss死亡注册，重复加载，boss死亡会多给奖励
-- 创建时间：2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}

local tbDropItem = {
	[1]={{szName="紫蟒之宝 (帽子)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={1,0,0,0,0,0}, },},
	[2]={{szName="紫蟒之宝 (衣)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={5,0,0,0,0,0}, },},
	[3]={{szName="紫蟒之宝 (项链)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={0,0,0,0,0,0}, },},
	[4]={{szName="紫蟒之宝 (玉佩)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={8,0,0,0,0,0}, },},
	[5]={{szName="紫蟒之宝 (鞋)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={7,0,0,0,0,0}, },},
	[6]={{szName="紫蟒之宝 (手套)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={3,0,0,0,0,0}, },},
	[7]={{szName="紫蟒之宝 (上戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={2,0,0,0,0,0}, },},
	[8]={{szName="紫蟒之宝 (下戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={9,0,0,0,0,0}, },},
	[9]={{szName="紫蟒之宝 (背带)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={4,0,0,0,0,0}, },},
	[10]={{szName="紫蟒之宝 (武器)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=3,tbParam={6,0,0,0,0,0}, },},
	[11]={{szName="蓝水晶",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	[12]={{szName="绿水晶",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	[13]={{szName="紫水晶",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	[14]={{szName="猩红宝石",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	[15]={{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=60},},
	[16]={{szName="黄金印(强化)",tbProp={0,3210},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[17]={{szName="黄金印(弱化)",tbProp={0,3220},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[18]={{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1},},
	[19]={{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1},},
	[20]={{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1},},
	[21]={{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1},},
	[22]={{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1},},
	[23]={{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1},},
	[24]={{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1},},
	[25]={{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1},},
	[26]={{szName="白虎上下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1},},
	[27]={{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5},},
	[28]={{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.3},},
	[29]={{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=4},},
	[30]={{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=6},},
	[31]={{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},},
	[32]={{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},},
	[33]={{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},},
	[34]={{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=6},},
	[35]={{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=5},},
	[36]={{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
	[37]={{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
	[38]={{szName="金乌器戒图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=2},},
	[39]={{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1.8},},
	[40]={{szName="金乌金牌",tbProp={6,1,3001,1,0,0},nCount=1,nRate=1},},
	[41]={{szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,nRate=70,nExpiredTime=10080},},
	[42]={{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.9, },},
	[43]={{szName="金乌衣宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.9, },},
	[44]={{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.8, },},
	[45]={{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.8, },},
	[46]={{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.8, },},
	[47]={{szName="金乌项链宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.9, },},
	[48]={{szName="金乌佩宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.8, },},
	[49]={{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.6, },},
	[50]={{szName="金乌下戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.6, },},
	[51]={{szName="金乌武器宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.4, },},
}
local tbNpcInfo = 
{
	[1] = {1873,"张宣",},		
	[2] = {1874,"金世亮",},		
	[3] = {1875,"慕容端",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("大侠 <color=yellow>%s<color> 在 <color=yellow>%s<color>已成功消灭<color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss 死亡 " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--兑换奖品 - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="天灵丹",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="天灵丹",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="天灵丹",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--丢弃奖品天之箱 - Modified by DinhHQ - 20111009
--	local tbOtherAward = 
--	{
--		[1873] = {90, 30},
--		[1874] = {94.825, 30},
--		[1875] = {94.825, 40},
--	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--丢弃奖品天之宝箱 - Modified by DinhHQ - 20111009
--	local nRate = random(1,10000) / 100
--	if nRate <= tbOtherAward[nKind][1] then
--		local tbTeam = getPlayerTeam()
--		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
--	else
--		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
--	end
	--Change boss award 2012- Modified by DinhHQ - 20120315
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--Ph莕 thng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "经验"},
		["Around"] = {nExp = 10e6, szName = "经验"},
	}
	nOldPlayer = PlayerIndex	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "给消灭的组队exp奖品"..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "给消灭的个人exp奖品"..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "给站的最近的exp奖品"..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "天之宝箱", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- 存在时间 5 分钟
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- 得到创建的时间
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- 中间预留一个位置放置天灵丹，所以在计算可显示行数时，在总数上需要+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- 每行6个宝箱，以boss死亡的位置为中心成矩阵排列
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- 中心位置显示天灵丹，不放置宝箱
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()