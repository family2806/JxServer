Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
local nDistance = 20 * 20

function OnDeath(nNpcIndex,nBelongerIndex)
	local szName = GetNpcName(nNpcIndex)
	local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if (szName ~= "完颜广阳" or nMapId ~= 947) then
		return
	end
	--New drop award when boss down - Modified By DinhHQ - 20120405
	local tbAwardForNew = 
	{
		[1] = {
			{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=20},
			{szName="金乌下戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=20},
			{szName="金乌武器宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=10},	
			{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=50},
		},
		[2] = {
			[1]={{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=20},},
			[2]={{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=20},},
			[3]={{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=20},},
			[4]={{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=20},},
			[5]={{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=20},},
			[6]={{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=20},},
			[7]={{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=20},},
			[8]={{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=15},},
			[9]={{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=15},},
			[10]={{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=10},},
			[11]={{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},},
			[12]={{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=2},},
			[13]={{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=2},},
			[14]={{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=2},},
			[15]={{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=2},},
			[16]={{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=2},},
			[17]={{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=2},},
			[18]={{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=2},},
			[19]={{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1},},
			[20]={{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1},},
			[21]={{szName="白虎器械图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.8},},
			[22]={{szName="白虎令",tbProp={6,1,2357,1,0,0},nRate=0.8},},
			[23]={{szName="同行令牌",tbProp={6,1,2590,1,0,0},nCount=1,nRate=10},},
			[24]={{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=2,nRate=100},},
			[25]={{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=2,nRate=100},},
		},
	}
	local tbAwardForOld = 
	{
		{szName = "至尊秘宝", tbProp = {6,1,2375,1,0,0}, nRate = 50},
		{szName = "武林秘籍", tbProp = {6,1,26,1,0,0}, nRate = 10},
		{szName = "洗髓经", tbProp = {6,1,22,1,0,0}, nRate = 10},
		{szName = "紫蟒令", tbProp = {6,1,2350,1,0,0}, nRate = 0.5},
		{szName = "玄猿令", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 10},
		{szName = "苍狼令", tbProp = {6,1,2352,1,0,0}, nRate = 9.5},
		{szName = "特效仙草露", tbProp = {6,1,1181,1,0,0}, nRate = 10},		
	}
	--local nBelongerIndex = GetPlayerIndex(nNpcIndex)
	--DynamicExecuteByPlayer(nBelongerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbAwardForOld, "杀死天池秘境四层boss完颜广阳获得奖励", 10)
	tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbAwardForNew, "Boss 天池秘境4层落下来", 1)
	
	--Exp award for player or team who killed boss - Modified By DinhHQ - 20120405
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "经验值", nExp = 20e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function GetPlayerIndex(nNpcIndex)
	local nPlayerIndex = PlayerIndex
	local nTeamSize = CallPlayerFunction(nPlayerIndex, GetTeamSize)
	if nTeamSize == 0 then
		return nPlayerIndex
	else
		local tbTeamIndex = {}
		local nPlayerNum = 0
		local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex)
		for i=1,nTeamSize do
			local nTeamMember = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			local nX, nY, nMapIndex = CallPlayerFunction(nTeamMember, GetPos)
			if (nMapIndex >= 0 and nMapIndex == nNpcMapIdx) then			 
				if CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
					nPlayerNum = nPlayerNum + 1
					tbTeamIndex[nPlayerNum] = nTeamMember
				end		
			end
		end
		if nPlayerNum > 1 then
			local nRandomIdx = random(1, nPlayerNum)
			return tbTeamIndex[nRandomIdx]
		else
			return tbTeamIndex[1]
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end