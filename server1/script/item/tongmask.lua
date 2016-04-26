if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItem)
	local _Name, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("你不在帮会中，无法使用此道具");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER or figure == TONG_ELDER)then
		Say("<#>帮会面具可以把帮会全体在线成员变成同一模样3个小时，要使用吗？", 2, "嗯，我们要统一装扮/#yes("..nItem..")", "先不使用/no");
		return 1
	else
		Msg2Player("你既非帮主又非长老，无法使用此道具");
		return 1
	end
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("你不在帮会中，无法使用此道具");
		return 1
	end
	local figure = TONGM_GetFigure(b, GetName())
	if (figure ~= TONG_MASTER and figure ~= TONG_ELDER)then
		Msg2Player("你既非帮主又非长老，无法使用此道具");
		return 1
	end	
	local name = GetName();
	local nfeature  = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end
	TONG_ChangeAllMemberFeature(b,nfeature,194400)
	Msg2Tong(b, name.."使用了帮会面具，在线帮会成员变成了同一模样，持续3小时");
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