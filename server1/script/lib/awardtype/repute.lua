Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ReputeType = SimpleType:new("nRepute")
ReputeType.pFun = AddRepute
ReputeType.szMsgFormat = "�i����������%d"
ReputeType:Reg()