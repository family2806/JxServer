Include( "\\script\\lib\\string.lua" );
Include("\\script\\misc\\itemexchangevalue\\jinglianshixiang.lua")

function main( nItemIdx )
	return BaoxiangCompose(nItemIdx);
end

function GetDesc( nItemIdx )
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local strDesc = "";
	strDesc = format("<color=yellow>������װ�У�<color=green>%d<color>������ʯ<color>", nCount);
	return strDesc;
end
