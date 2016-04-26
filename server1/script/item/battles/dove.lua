Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("BATTLE")

function EatMedicine()
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("此道具只能在宋金战场内使用");
			return -1
		end
	end
	nowmissionid = BT_GetData(PL_RULEID);	--获取当前MISSIONID
	curcamp = GetCurCamp();
	X = floor( X / 8 );
	Y = floor( Y / 16 );
	string = "<#><color=yellow>"..GetName().."<#><color><color=pink>：“我现在的坐标是<color=yellow>("..X.."<#>，"..Y.."<#>)<color>速来助我一臂之力。”";
	Msg2MSGroup( nowmissionid, string, curcamp );
	Msg2Player("你使用了一个信鸽，通报了战友你现在的坐标。");
end
