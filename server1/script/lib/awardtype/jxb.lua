Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
JxbType = SimpleType:new("nJxb")
JxbType.pFun = Earn
JxbType.szMsgFormat = "��� %d ������"
JxbType:Reg()







