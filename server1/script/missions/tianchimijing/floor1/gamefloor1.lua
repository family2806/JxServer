Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor1 = Game:new()
GameFloor1.szMapType = "天池秘境第一层" --改变地图表示
GameFloor1.tbForbitItemType = --重载 违禁道具
{
	"TRANSFER","MATE"
}
GameFloor1.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor1\\playerfloor1.lua",
	szClassName = "PlayerFloor1"
}

GameFloor1.PlayerEnterTrapTime = {
}

GameFloor1.tbNpcTypeList = --npc的类型
{
	["乱怪"] = 
	{
		nNpcId = 1606,
		szName = "士长",
		nLevel = 95,
		bNoRevive = 0, --重生
		nIsboss = 0, --对话npc可以不需要这个
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster1.txt"
	},
	["晕陷怪"] =
	{--另外一个怪物
		nNpcId = 1608,
		szName = "五长",
		nLevel = 95,
		bNoRevive = 0, --重生
		nIsboss = 0, --对话npc可以不需要这个
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster2.txt"
	},	
	["后仰怪"] = 
	{--另外一个怪物
		nNpcId = 1607,
		szName = "阿李喜",
		nLevel = 95,
		bNoRevive = 0, --重生
		nIsboss = 0, --对话npc可以不需要这个
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster3.txt"
	},	
	["迟缓怪"] = 
	{--另外一个怪物
		nNpcId = 1609,
		szName = "好士",
		nLevel = 95,
		bNoRevive = 0, --重生
		nIsboss = 0, --对话npc可以不需要这个
   	szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\monster4.txt"
	},
	["机关"] = 
	{
		nNpcId = 1605,
		szName = "机关",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\skillwood.txt"
	},
	["兵器箱"]= 
	{
		nNpcId = 844,
		szName = "兵器箱",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\propsbox.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\box.lua"
	},
	["陷阱"] =
	{
		nNpcId = 1611,
		szName = "陷阱",
		nLevel = 95,
		nSeries = random(0, 4),
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\trapArea.txt"
	},
	["隐世高人"] =
	{
		nNpcId = 108,
		szName = "隐世高人",
		nLevel = 95,
		bNoRevive = 1,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\master_hand.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\floor1_masterhand.lua"
	}
}
GameFloor1.tbTrapList = 
{
	["A1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a1trap.lua",--Trap脚本的路径
	},
	["A1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["A2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\a2trap.lua",--Trap脚本的路径
	},
	["A2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\A2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["B1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b1trap.lua",--Trap脚本的路径
	},
	["B1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["B2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\b2trap.lua",--Trap脚本的路径
	},
	["B2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\B2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["D1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d1trap.lua",--Trap脚本的路径
	},
	["D1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["D2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\d2trap.lua",--Trap脚本的路径
	},
	["D2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\D2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["E1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e1trap.lua",--Trap脚本的路径
	},
	["E1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["E2"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\e2trap.lua",--Trap脚本的路径
	},
	["E2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\E2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["F1"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f1trap.lua",--Trap脚本的路径
	},
	["F1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["F2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\f2trap.lua",--Trap脚本的路径
	},
	["F2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\F2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["G1"] =
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g1trap.lua",--Trap脚本的路径
	}, 
	["G1front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G1front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["G2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2.txt",--Trap点的坐标文件
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\g2trap.lua",--Trap脚本的路径
	},
	["G2front"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\G2front.txt",--Trap点的坐标文件
		szTrapFile = ""
	},
	["隐世高人的传送点"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\masterhandtrap.txt",
		szTrapFile = ""
	},
	["ToFloor2"] = 
	{
		szPosPath = "\\settings\\maps\\tianchimijing\\floor1\\to_floor2.txt",
		szTrapFile = "\\script\\missions\\tianchimijing\\floor1\\tofloor2.lua"
	}
}

function GameFloor1:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor1:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end


GameFloor1:AssociateMap(935)
GameFloor1:SetForbitItem()

