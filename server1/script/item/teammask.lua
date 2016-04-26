function  main(nItem)
	Say("<#>队伍面具可以把队伍全体成员变成同一模样2个小时，要使用吗？", 2, "嗯，我们要统一装扮/#yes("..nItem..")", "先不使用/no");
	return 1
end

function yes(nItem)
	if(GetTeamSize() <= 0) then
		Msg2Player("你不在队伍中，无法使用此道具");
		return 1
	end
	local teamid = GetTeam();
	local name = GetName()
	local nfeature = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end	
	ChangeTeamFeature(teamid, nfeature, 129600);
	Msg2Team(name.."使用了队伍面具，队员变成了同一模样，持续2小时");
end

function GetDesc(nItem)
	local nNpcSettingIdx = GetItemParam(nItem, 1)
	local nAction = random(0, 13)
	local szSpr = GetMaskActionSpr(nNpcSettingIdx, nAction)
	if (not szSpr)then 
		return ""
	end
	return "<spr="..szSpr..">"
end

function no()
end