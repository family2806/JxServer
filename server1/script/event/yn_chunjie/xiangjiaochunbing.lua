CHUNBING_MAX_EXP = 300000000
TAB_EXPVALUE = {10000,15000,20000}
TSK_XIANGJIAO = 1310
function main()
	local eatexp = GetTask(TSK_XIANGJIAO)
	if (eatexp >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> ���ѳԹ���ı��ˣ������ٳ���!")
		return 1
	end
	
	local ran_exp = TAB_EXPVALUE[ random(getn(TAB_EXPVALUE)) ]
	if ( ran_exp + eatexp > CHUNBING_MAX_EXP ) then
		ran_exp = CHUNBING_MAX_EXP - eatexp
	end
	AddOwnExp(ran_exp)
	Msg2Player("<#> ����� "..ran_exp.."����ֵ.")
	SetTask(TSK_XIANGJIAO, eatexp + ran_exp)
	
	if(GetTask(TSK_XIANGJIAO) >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> ���ѳԹ���ı��ˣ������ٳ���!")
	else
		Msg2Player("<#>  �������Զ�Ա�������"..(CHUNBING_MAX_EXP-GetTask(TSK_XIANGJIAO)).."�i�m kinh nghi�m.")
	end
end