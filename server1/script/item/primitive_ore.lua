-- ԭʼ���Կ�ʯ
-- Fanghao_Wu 2004.1.28

Include( "\\script\\lib\\string.lua" );

function main()
	Talk( 2, "", "������ԭʯ������ȡװ������Ӧλ���ϵ���ɫ���ԡ������<color=yellow>������ԭʯ<color>����ȡʱԭʯ������������Ҫ��װ��������������ͬ", "�ڸ��������������ɽ�����ɫװ�����ƽ�װ��������صĸ��ֲ�����" );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 0 ) then
		strDesc = strDesc.."�������ԣ�"..toSeries( nSeries ).."\n";
	end
	return strDesc;
end