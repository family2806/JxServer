Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\tongsupport.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
tbPVLBActive = {}

function tbPVLBActive:AddDialog(tbOpt)
	if tbPVLB_Check:CheckTime() ~= 1 then
		return
	end
	tinsert(tbOpt, "我想领风云令牌/#tbPVLBActive:main()")
	tinsert(tbOpt, "帮会接收新手奖励?#tbTongSupport:main()")
end

function tbPVLBActive:main()
	if self:ActiveCondition() ~= 1 then
		return
	end
	if tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1) ~= 1 then
		Talk(1, "", "材料未更新，请联系管理处解决.")
		return
	end
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME) ~= 1 then
		Talk(1, "", "材料未更新，请联系管理处解决.")
		return
	end
	local tbItem = {szName="风云令牌",tbProp={6,1,30141,1,0,0},nCount=1,nExpiredTime=86400,nBindState=-2};	
	local tbTranslog = {strFolder = "201109_EventPhongVanLenhBai/", nPromID = 11, nResult = 1}
	tbAwardTemplet:Give(tbItem, 1, {"风云令牌", "领取风云令牌礼品", tbTranslog})
end

function tbPVLBActive:ActiveCondition()
	local nBitVal1 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) --缴code 新账号
	local nBitVal2 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT)--缴 code 旧账号
	if nBitVal1 == 0 and nBitVal2 == 0 then
		Talk(1, "", "您没有交code，不能领奖，请再检查一下!")
		return nil
	end
	local nBitVal3 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--已领奖
	if nBitVal3 ~= 0 then
		Talk(1, "", "请原谅，阁下已领取该奖励了.")
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
	Talk(1, "", "请原谅，阁下不够条件参加节目，请去游戏首页了解更多信息.")
end