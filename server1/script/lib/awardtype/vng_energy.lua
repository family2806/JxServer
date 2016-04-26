Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
VngEnergyType = SimpleType:new("nVngEnergy")
VngEnergyType.pFun = AddEnergy
VngEnergyType.szMsgFormat = "获得 %d 精炼石值"
VngEnergyType:Reg()
