-- 福缘露（大）
-- Fanghao_Wu 2004.9.6

Include( "\\script\\global\\fuyuan.lua" )

function main()
	if( FuYuan_Add( 50 ) ~= 1 ) then
		Msg2Player( "您暂时还不能使用福缘露，请先去各大城市武林盟传人处开启福缘功能。" );
		return 1;
	end	
end