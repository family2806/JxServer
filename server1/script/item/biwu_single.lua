Include("\\script\\event\\wulin_final_match\\createleague.lua")
IncludeLib("ITEM")
function main( nItemIdx )
	local curzoneid = wl_zonename2zoneid(GetTong())
	local zoneid =  ITEM_GetItemExParam(nItemIdx,1)
	if ( zoneid ~= curzoneid or zoneid == 0 ) then
		Say("这张票好像不是你所在区服的，你不能使用。", 0)
		return 1
	end
	matchtype = ITEM_GetItemExParam(nItemIdx,2)
	Say("你要报名参加赛吗？", 2, "我要组建我的"..TAB_TICKETINFO[matchtype][1].."/#wl_createleague("..matchtype..")","不，暂进不打算报名，下次吧/OnCancel")
	return 1;
end