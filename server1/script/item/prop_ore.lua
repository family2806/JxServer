-- ���Կ�ʯ
-- Fanghao_Wu 2004.12.15

IncludeLib( "ITEM" );
IncludeLib( "FILESYS" );
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

FILE_MAGIC_INDEX = "magicattriblevel_index.txt";

loadItemTabFiles( FILE_MAGIC_INDEX );

function main( nItemIdx )
	Talk( 2, "", "������ԭʯ������ȡװ������Ӧλ���ϵ���ɫ���ԡ������<color=yellow>������ԭʯ<color>����ȡʱԭʯ������������Ҫ��װ��������������ͬ", "�ڸ��������������ɽ�����ɫװ�����ƽ�װ��������صĸ��ֲ�����" );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 1 ) then
		strDesc = strDesc.."�������ԣ�"..toSeries( nSeries ).."\n";
	end
	strDesc = strDesc.."<color=blue>���ԣ�"..getMagicDesc( nItemIdx ).."\n";
	strDesc = strDesc.."<color=blue>����Ʒ�ʣ�<color=yellow>"..nLevel.."\n";
	strDesc = strDesc.."<color=orange>����Ƕװ�����ͣ�"..getMagicFitEquip( nItemIdx );
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