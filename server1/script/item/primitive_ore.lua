-- 原始属性矿石
-- Fanghao_Wu 2004.1.28

Include( "\\script\\lib\\string.lua" );

function main()
	Talk( 2, "", "用属性原石可以提取装备上相应位置上的蓝色属性。如果是<color=yellow>暗属性原石<color>，提取时原石的五行属性需要跟装备的五行属性相同", "在各城镇铁匠处即可进行紫色装备及黄金装备铸造相关的各种操作。" );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 0 ) then
		strDesc = strDesc.."五行属性："..toSeries( nSeries ).."\n";
	end
	return strDesc;
end