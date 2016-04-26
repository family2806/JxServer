CHUNBING_MAX_EXP = 300000000
TAB_EXPVALUE = {10000,15000,20000}
TSK_XIANGJIAO = 1310
function main()
	local eatexp = GetTask(TSK_XIANGJIAO)
	if (eatexp >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> 您已吃过多的饼了，不能再吃了!")
		return 1
	end
	
	local ran_exp = TAB_EXPVALUE[ random(getn(TAB_EXPVALUE)) ]
	if ( ran_exp + eatexp > CHUNBING_MAX_EXP ) then
		ran_exp = CHUNBING_MAX_EXP - eatexp
	end
	AddOwnExp(ran_exp)
	Msg2Player("<#> 您获得 "..ran_exp.."经验值.")
	SetTask(TSK_XIANGJIAO, eatexp + ran_exp)
	
	if(GetTask(TSK_XIANGJIAO) >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> 您已吃过多的饼了，不能再吃了!")
	else
		Msg2Player("<#>  您还可以多吃饼来补充"..(CHUNBING_MAX_EXP-GetTask(TSK_XIANGJIAO)).."甶觤 kinh nghi謒.")
	end
end