Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ExpType = SimpleType:new("nExp")
ExpType.pFun = AddOwnExp
--Fix 如果数字太大，显示就会出错- Modified By DinhHQ - 20110926
ExpType.szMsgFormat = "达到经验不能叠加%s"
ExpType:Reg()

Exp_tlType = SimpleType:new("nExp_tl")
Exp_tlType.pFun = tl_addPlayerExp
--Fix 如果数字太大，显示就会出错 - Modified By DinhHQ - 20110926
Exp_tlType.szMsgFormat = "获得叠加经验%s."
Exp_tlType:Reg()