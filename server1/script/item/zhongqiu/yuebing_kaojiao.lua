MOONCAKE_MAX_EXP = 100000000
function main()
	local tbEXP = {10000, 30000, 50000}
	local eatexp = GetTask(1568)
	if (eatexp >= MOONCAKE_MAX_EXP) then
		Msg2Player("<#>���Ѿ�����̫���±���")
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
		Msg2Player("<#>���Ѿ�����̫���±���")
	else
		Msg2Player( "<#>�㻹����ͨ��ʳ�������±����<color=yellow>"..(MOONCAKE_MAX_EXP - GetTask(1568)).."<#><color>�㾭��" )
	end
	WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", use yuebing_kaojiao, get "..mooncake_addexp.." experience")
end
