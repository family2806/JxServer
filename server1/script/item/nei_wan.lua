-- 内普丸、内毒丸、内冰丸、内火丸、内电丸共有函数
-- 五种丸如果重复吃，之前吃过的丸的功效将消失，只保留最后吃的丸的功效
-- Fanghao_Wu 2004.9.13

aryWan = {	{"<#>内普丸", 453},
			{"<#>内毒丸", 454},
			{"<#>内冰丸", 455},
			{"<#>内火丸", 456},
			{"<#>内电丸", 457} };
			
function EatNei_Wan( eatIndex, level, statetype, time )
	local nCount = getn( aryWan );
	for i = 1, nCount do
		if( i ~= eatIndex ) then
			local nLeftTime = AddSkillState( aryWan[i][2], 1, 1, 0 );
			if( nLeftTime > 0 ) then
				Msg2Player( aryWan[i][1].."<#>功效已消失" );
			end
		end
	end
	AddSkillState( aryWan[eatIndex][2], level, statetype, time );
	Msg2Player( "<#>你吃下了"..aryWan[eatIndex][1] );
end