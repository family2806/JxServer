Include("\\script\\missions\\hsbattleorigin\\hshead.lua");
Include("\\script\\missions\\csbattlelib\\cscampnpc1.lua");

function CheckCondition()
	if ( GetLevel() >= 60 ) then
		if (Pay(MS_SIGN_MONEY) == 1) then
			return 1;
		end;
 	end;
 	Say("你不足等级或者带的钱不够，不能上华山绝顶", 0);
 	return 0;
end;