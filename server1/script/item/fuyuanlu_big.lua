-- ��Ե¶����
-- Fanghao_Wu 2004.9.6

Include( "\\script\\global\\fuyuan.lua" )

function main()
	if( FuYuan_Add( 50 ) ~= 1 ) then
		Msg2Player( "����ʱ������ʹ�ø�Ե¶������ȥ������������˴��˴�������Ե���ܡ�" );
		return 1;
	end	
end