Include( "\\script\\lib\\string.lua" );

function main( nItemIdx )
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local _, _, _, _, nSeries = GetItemProp( nItemIdx );
	strDesc = "<enter>"..strDesc.."ŒÂ–– Ù–‘£∫"..toSeries( nSeries ).."\n";
	return strDesc;
end