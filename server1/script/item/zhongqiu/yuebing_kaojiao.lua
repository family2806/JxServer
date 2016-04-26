MOONCAKE_MAX_EXP = 100000000
function main()
	local tbEXP = {10000, 30000, 50000}
	local eatexp = GetTask(1568)
	if (eatexp >= MOONCAKE_MAX_EXP) then
		Msg2Player("<#>你已经吃了太多月饼了")
		return 1
	end
	
	local rannum = random(getn(tbEXP))
	local mooncake_addexp = tbEXP[rannum]
	if ( mooncake_addexp + eatexp > MOONCAKE_MAX_EXP ) then
		mooncake_addexp = MOONCAKE_MAX_EXP - eatexp
	end
	AddOwnExp(mooncake_addexp)
	SetTask(1568, eatexp + mooncake_addexp)
	if(GetTask(1568) >= MOONCAKE_MAX_EXP) then
		Msg2Player("<#>你已经吃了太多月饼了")
	else
		Msg2Player( "<#>你还可以通过食用中秋月饼获得<color=yellow>"..(MOONCAKE_MAX_EXP - GetTask(1568)).."<#><color>点经验" )
	end
	WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", use yuebing_kaojiao, get "..mooncake_addexp.." experience")
end
