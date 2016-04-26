Include( "\\script\\lib\\string.lua" );
Include("\\script\\misc\\itemexchangevalue\\jinglianshixiang.lua")

function main( nItemIdx )
	return BaoxiangCompose(nItemIdx);
end

function GetDesc( nItemIdx )
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local strDesc = "";
	strDesc = format("<color=yellow>此箱中装有：<color=green>%d<color>个精炼石<color>", nCount);
	return strDesc;
end
