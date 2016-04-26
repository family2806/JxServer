Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("SETTING")
SJ_TRAPITEM_COUNT = 50
function EatMedicine(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local s_name = GetItemName(nItemIdx)
	local n_curtime = GetGameTime();		--秒
	local n_lasttime = GetTaskTemp(113);
	
	if (ST_IsRideHorse() == 1) then
		Msg2Player("骑马不能使用该物品!")
		return -1
	end;
	
	if (n_curtime <= n_lasttime) then
		Msg2Player("1秒后才能继续使用!")
		return -1
	end;
	
	if(detail == 393) then --穿心令
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 343,7);	
			Msg2Player("你使用了一个穿心令");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 343,9);	
			Msg2Player("你使用了一个穿心令");
		else
			CastSkill( 343,14);	
			Msg2Player("你使用了一个穿心令");
		end
	end
	
	if(detail == 394) then --毒刺令
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 303,5);	
			Msg2Player("你使用了一个毒刺令");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 303,8);	
			Msg2Player("你使用了一个毒刺令");
		else
			CastSkill( 303,12);	
			Msg2Player("你使用了一个毒刺令");
		end
	end	

	if(detail == 395) then --寒冰令
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill(345 ,7);	
			Msg2Player("你使用了一个寒冰令");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill(345 ,9);	
			Msg2Player("你使用了一个寒冰令");
		else
			CastSkill( 345,14);	
			Msg2Player("你使用了一个寒冰令");
		end
	end
	
	if(detail == 396) then --地火令
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 347,7);	
			Msg2Player("你使用了一个地火令");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 347,9);	
			Msg2Player("你使用了一个地火令");
		else
			CastSkill( 347,14);	
			Msg2Player("你使用了一个地火令");
		end
	end
	
	if(detail == 397) then --雷击令
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 349,7);	
			Msg2Player("你使用了一个雷击令");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 349,9);	
			Msg2Player("你使用了一个雷击令");
		else
			CastSkill( 349,14);	
			Msg2Player("你使用了一个雷击令");
		end
	end		
	
	SetTaskTemp(113, GetGameTime());	--记下最后次使用的时间
	
	if ((n_param) >= SJ_TRAPITEM_COUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> 已使用"..SJ_TRAPITEM_COUNT.."<#> 次，不能再使用了!")
	else
		SetSpecItemParam(nItemIdx,1,n_param)
		SyncItem(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> 还可以使用"..(SJ_TRAPITEM_COUNT - n_param).."<#> 次")
	end
	return -1
end

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\n可以使用<color=yellow>%d<color>次", (SJ_TRAPITEM_COUNT - n_param));
	return szDesc;
end

