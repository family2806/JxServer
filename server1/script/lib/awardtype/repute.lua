Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ReputeType = SimpleType:new("nRepute")
ReputeType.pFun = AddRepute
ReputeType.szMsgFormat = "§iÈÙÓşµãÔö¼Ó%d"
ReputeType:Reg()