Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ExpType = SimpleType:new("nExp")
ExpType.pFun = AddOwnExp
--Fix �������̫����ʾ�ͻ����- Modified By DinhHQ - 20110926
ExpType.szMsgFormat = "�ﵽ���鲻�ܵ���%s"
ExpType:Reg()

Exp_tlType = SimpleType:new("nExp_tl")
Exp_tlType.pFun = tl_addPlayerExp
--Fix �������̫����ʾ�ͻ���� - Modified By DinhHQ - 20110926
Exp_tlType.szMsgFormat = "��õ��Ӿ���%s."
Exp_tlType:Reg()