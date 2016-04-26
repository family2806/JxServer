IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 30 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("<color=yellow>你当前同伴的<color=blue>“朝阳烈焰”<color>技能修炼度已达100%，但需要同伴<color=blue>"..requirlevel.."<color>级才能升级");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,573,uplevel);
	Msg2Player("<color=yellow>你当前同伴的<color=blue>“朝阳烈焰”<color>技能修炼度已达100%，升华为<color=blue>"..uplevel.."<color>级");
end