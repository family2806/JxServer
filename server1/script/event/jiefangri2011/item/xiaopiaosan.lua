--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")
function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("Â–“£…¢", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("Â–“£…¢", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	CastSkill(1052, 1)
	Msg2Player("ƒ„“— π”√1Â–“£…¢")
	return 0
end
