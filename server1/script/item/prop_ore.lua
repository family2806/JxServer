-- 属性矿石
-- Fanghao_Wu 2004.12.15

IncludeLib( "ITEM" );
IncludeLib( "FILESYS" );
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

FILE_MAGIC_INDEX = "magicattriblevel_index.txt";

loadItemTabFiles( FILE_MAGIC_INDEX );

function main( nItemIdx )
	Talk( 2, "", "用属性原石可以提取装备上相应位置上的蓝色属性。如果是<color=yellow>暗属性原石<color>，提取时原石的五行属性需要跟装备的五行属性相同", "在各城镇铁匠处即可进行紫色装备及黄金装备铸造相关的各种操作。" );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 1 ) then
		strDesc = strDesc.."五行属性："..toSeries( nSeries ).."\n";
	end
	strDesc = strDesc.."<color=blue>属性："..getMagicDesc( nItemIdx ).."\n";
	strDesc = strDesc.."<color=blue>属性品质：<color=yellow>"..nLevel.."\n";
	strDesc = strDesc.."<color=orange>可镶嵌装备类型："..getMagicFitEquip( nItemIdx );
	return strDesc;
end

function getMagicDesc( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "DESC", "" );
	else
		return "";
	end
end

function getMagicFitEquip( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "FIT_EQUIP", "" );
	else
		return "";
	end
end