Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
Include("\\script\\missions\\tianchimijing\\floor3\\playerfloor3.lua")
GameFloor3 = Game:new()
GameFloor3.tbMapCapacity = {} --每个房间的当前玩家人数

GameFloor3.tbMap = {937,938,939,940,941,942,943,944,945,946} --每个房间对应的地图
--GameFloor3.tbMap = {937} --每个房间对应的地图
GameFloor3.szMapType = "天池秘宝第三层"

GameFloor3.tbForbitItemType = 
{
	"PK","YAOXIANG","TRANSFER","MATE"
}

GameFloor3.Player = 
{
	szPath = "\\script\\missions\\tianchimijing\\floor3\\playerfloor3.lua",
	szClassName = "PlayerFloor3",
}

GameFloor3.tbNpcTypeList = 
{
	["monster1"] = 
	{
		nNpcId = 1602,
		szName = "孟安",
		nLevel = 95,
		nIsboss = 1,
		bNoRevive = 0,
		szDeathScript = "\\script\\missions\\tianchimijing\\floor3\\monsterdeath.lua",
		szPosPath = "\\settings\\maps\\tianchimijing\\floor3\\monster1.txt",
	},
	["monster2"] = 
	{
		nNpcId = 1603,
		szName = "谋克",
		nLevel = 95,
		nIsboss = 1,
		bNoRevive = 0,		
		szDeathScript = "\\script\\missions\\tianchimijing\\floor3\\monsterdeath.lua",
		szPosPath = "\\settings\\maps\\tianchimijing\\floor3\\monster2.txt",
	},
	["monster3"] = 
	{
		nNpcId = 1604,
		szName = "普李演",
		nLevel = 95,
		nIsboss = 1,
		bNoRevive = 0,		
		szDeathScript = "\\script\\missions\\tianchimijing\\floor3\\monsterdeath.lua",	
		szPosPath = "\\settings\\maps\\tianchimijing\\floor3\\monster3.txt",
	},
}

GameFloor3.tbTrapList = 
{
	["floor3exittraps"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor3\\exit.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor3\\exittraps.lua",--Trap脚本的路径
	},
}

function GameFloor3:WantEnterMap()
	local nTeamSize = GetTeamSize()
	if (nTeamSize ~= 0 and IsCaptain() ~= 1) then
		return
	end
	local nCount = getn(self.tbMap) --房间个数
	local tbWeight = {} --每个房间权重
	local tbPercent = {} --进入每个房间的概率
	local nTotalWeight = 0
	for i=1, nCount do
		if (self.tbMapCapacity[self.tbMap[i]] == nil or self.tbMapCapacity[self.tbMap[i]] == 0) then
			tbWeight[i] = 10
		elseif (self.tbMapCapacity[self.tbMap[i]] >= 1 and self.tbMapCapacity[self.tbMap[i]] <= 8) then
			tbWeight[i] = 35
		elseif (self.tbMapCapacity[self.tbMap[i]] >= 9 and self.tbMapCapacity[self.tbMap[i]] <= 16) then
			tbWeight[i] = 30
		elseif (self.tbMapCapacity[self.tbMap[i]] >= 17) then
			tbWeight[i] = 10
		end
		nTotalWeight = nTotalWeight + tbWeight[i]
	end
	for i=1, nCount do
		tbPercent[i] = (tbWeight[i] / nTotalWeight) * 100
	end
	local nRandom = random(0, GetCurServerTime()) + GetCurServerTime()
	local nPercent = mod(nRandom, 100)
	local nNumber = 0
	for i=1, nCount do
		nNumber = nNumber + tbPercent[i]
		if (nPercent < nNumber) then
			if (nTeamSize == 0) then
				CallPlayerFunction(PlayerIndex, self.MoveTo, self, self.tbMap[i], "\\settings\\maps\\tianchimijing\\floor3\\entrance.txt")
			else
				for j=1,nTeamSize do
					CallPlayerFunction(GetTeamMember(j), self.MoveTo, self, self.tbMap[i], "\\settings\\maps\\tianchimijing\\floor3\\entrance.txt")
				end
			end
			return
		end
	end
end

function GameFloor3:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor3:Start()	
	local nCount = getn(self.tbMap)
	for i=1, nCount do
		self:AssociateMap(self.tbMap[i])
	end	
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
	self:SetForbitItem()
end

