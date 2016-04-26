--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")

function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("还魂丹", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("还魂丹", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	AddSkillState(462, 6, 0, 60)		-- 每半秒生命回复：增加3000点(最多恢复20000点生命) 耗时6s
	Msg2Player("你已使用1还魂丹")
	return 0
end
