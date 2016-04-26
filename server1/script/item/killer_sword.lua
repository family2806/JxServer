Include( "\\script\\lib\\string.lua" )
Include( "\\script\\event\\laborday\\labordayhead.lua" )
--加入五一节活动
--By LiuKuo 2005.4.21

if LABORDAYSWITCH then
	Include( "\\script\\event\\laborday\\laborday.lua" )
end

function main( nItemIdx )
	local nowDate = tonumber(date("%Y%m%d%H%M%S"));
	if(nowDate >= 20051006080000) then
		Msg2Player("黄金Boss任你Call活动已结束");
		return 1
	end	
	if LABORDAYSWITCH then
		local _, _, _, nLevel, nSeries = GetItemProp( nItemIdx );
		return 	CallBoss( nLevel, nSeries )
	else 
		Msg2Player("黄金Boss任你Call活动已结束");
		return 1
	end	
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local _, _, _, nLevel, nSeries = GetItemProp( nItemIdx );
	strDesc = "<enter>"..strDesc.."五行属性："..toSeries( nSeries ).."\n";
	return strDesc;
end