
IncludeLib("FILESYS");

Include("\\script\\misc\\eventsys\\type\\map.lua")
Include("\\script\\item\\forbiditem.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\item\\heart_head.lua")

Game = {}

Game.szMapType = "天池秘境第N层" --改变地图表示

Game.szMapType = "天池秘境第N层" --改变地图表示
Game.tbForbitItemType = --重载 违禁道具
{
	"PK",
}
Game.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor_templet\\player.lua",
	szClassName = "Player"
}

Game.tbNpcTypeList = --npc的类型
{
	["怪物名称"] = 
	{
		nNpcId = 1234,
		szName = "怪物名称",
		nLevel = 90,
		nIsboss = 1, --对话npc可以不需要这个
		szScriptPath = "\\script\\missions\\tianchimijing\\npc_script.lua",--根据游戏内容定制的某个npc脚本,主要针对对话npc
	},
	["怪物名称 2"] = 
	{--另外一个怪物
		nNpcId = 2354,
		szName = "另一个怪物的名字",
		nLevel = 90,
		nIsboss = 1, --对话npc可以不需要这个
		szScriptPath = "\\script\\missions\\tianchimijing\\npc_script.lua",--根据游戏内容定制的某个npc脚本
	},	
}
Game.tbTrapList = 
{
	["Trap 点名，用于程序员分别自己的角色"] =
	{
		
		szPosPath = "",--Trap点的坐标文件
		szTrapFile = "",--Trap脚本的路径
	}
}


function Game:AddATrap(szPosPath, szTrapFile)
	
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow=2, nRowCount do
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		for nMapId, bFlag in self.tbMapList do
			if bFlag then
				AddMapTrap(nMapId, nX,nY, szTrapFile);
			end
		end
	end
end

function Game:AddAllTrap()
	for key, value in self.tbTrapList do
		self:AddATrap(value.szPosPath, value.szTrapFile)
	end
end

function Game:AddANpc(szName, szPosPath)
	local tbNpc = self.tbNpcTypeList[szName]
	
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	if not tbNpc then
		return 
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow=2, nRowCount do
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		for nMapId, bFlag in self.tbMapList do
			if bFlag then
				basemission_CallNpc(tbNpc, nMapId, nX, nY)
			end
		end
	end
end

function Game:MoveToTrap(szType)
	if not self.tbTrapList[szType] then
		return 
	end
	
	self:MoveTo(nil, self.tbTrapList[szType].szPosPath)
end


function Game:MoveTo(nMapId, szPosPath)
		
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	local nRow = random(2, nRowCount)
	local nX = TabFile_GetCell(szPosPath, nRow, 1)
	local nY = TabFile_GetCell(szPosPath, nRow, 2)
	if nMapId then
		NewWorld(nMapId, nX/32, nY/32)
	else
		SetPos(nX/32, nY/32)
	end
end



function Game:new()
	local tb = {}
	for key, value in self do 
		tb[key] = value
	end
	return tb
end


function Game:AssociateMap(nMapId)
	self.tbMapList = self.tbMapList or {}
	self.tbMapList[nMapId] = 1
end


function Game:RegMap(szType, varFun, ...)
	
	for nMapId, bFlag in self.tbMapList do
		if bFlag then
			
			local nRegId = EventSys:GetType(szType):Reg(nMapId, varFun, unpack(arg))
			
			self.tbRegId = self.tbRegId or {}
			self.tbRegId[szType] = self.tbRegId[szType] or {}
			tinsert(self.tbRegId[szType], nRegId)
		end
	end	
end

function Game:UnRegAll()
	if self.tbRegId then
		for szType, tbId in self.tbRegId do
			for i=1, getn(tbId) do
				for nMapId, _ in self.tbMapList do
					EventSys:GetType(szType):UnReg(nMapId, tbId[i])
				end
				
			end
		end
	end
end

function Game:RegAll()
	
	self:UnRegAll()
	self.pPlayer = DynamicExecute(self.Player.szPath, "getglobal", self.Player.szClassName)
	self:RegMap("LeaveMap", self.pPlayer.OnLeaveMap, self.pPlayer)
	self:RegMap("EnterMap", self.pPlayer.OnEnterMap, self.pPlayer)
end



function Game:SetForbitItem()
	local szMapType = self.szMapType
	for nMapId, bFlag in self.tbMapList do
		if bFlag then
			set_MapType(nMapId, szMapType)
		end
	end
	for i=1, getn(self.tbForbitItemType) do
		
		if self.tbForbitItemType[i] == "MATE" then
			for nMapId, bFlag in self.tbMapList do
				if bFlag then
					FORBITMAP_LIST[nMapId] = 1
				end
			end
			
		end
		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end


function Game:Start()
	
	self:RegAll()
	self:AddAllTrap()
	self:AddANpc("怪 1", "\\setting\\xxx.xx")
end

function Game:WritePlayerLog(nFloor, szMsg)
	WriteLog(format("[%s] [%dt层]\t%s\tAccount:%s\tName:%s\t%s","天池秘境", nFloor,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szMsg))
end

function Game:WriteLog(nFloor, szMsg)
	WriteLog(format("[%s][%dt层]\t%s\t\t\t%s.","天池秘境", nFloor,GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end

--Game:AssociateMap(20)
--Game:SetForbitItem()
--Game:Start()