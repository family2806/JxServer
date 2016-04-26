Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\tongsupport.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
tbPVLBActive = {}

function tbPVLBActive:AddDialog(tbOpt)
	if tbPVLB_Check:CheckTime() ~= 1 then
		return
	end
	tinsert(tbOpt, "�������������/#tbPVLBActive:main()")
	tinsert(tbOpt, "���������ֽ���?#tbTongSupport:main()")
end

function tbPVLBActive:main()
	if self:ActiveCondition() ~= 1 then
		return
	end
	if tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1) ~= 1 then
		Talk(1, "", "����δ���£�����ϵ�������.")
		return
	end
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME) ~= 1 then
		Talk(1, "", "����δ���£�����ϵ�������.")
		return
	end
	local tbItem = {szName="��������",tbProp={6,1,30141,1,0,0},nCount=1,nExpiredTime=86400,nBindState=-2};	
	local tbTranslog = {strFolder = "201109_EventPhongVanLenhBai/", nPromID = 11, nResult = 1}
	tbAwardTemplet:Give(tbItem, 1, {"��������", "��ȡ����������Ʒ", tbTranslog})
end

function tbPVLBActive:ActiveCondition()
	local nBitVal1 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) --��code ���˺�
	local nBitVal2 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT)--�� code ���˺�
	if nBitVal1 == 0 and nBitVal2 == 0 then
		Talk(1, "", "��û�н�code�������콱�����ټ��һ��!")
		return nil
	end
	local nBitVal3 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--�����콱
	if nBitVal3 ~= 0 then
		Talk(1, "", "��ԭ�£���������ȡ�ý�����.")
		return nil
	end
	if GetRoleCreateDate() >= 20110928 then		
		return 1
	end
	local nTranLife = ST_GetTransLifeCount()
	if nTranLife == 0 then
		return 1
	end
	if nTranLife == 1 then
		return 1
	end
	if nTranLife == 2 and GetLevel() < 180 then
		return 1
	end
	Talk(1, "", "��ԭ�£����²��������μӽ�Ŀ����ȥ��Ϸ��ҳ�˽������Ϣ.")
end