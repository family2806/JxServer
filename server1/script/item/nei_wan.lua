-- �����衢�ڶ��衢�ڱ��衢�ڻ��衢�ڵ��蹲�к���
-- ����������ظ��ԣ�֮ǰ�Թ�����Ĺ�Ч����ʧ��ֻ�������Ե���Ĺ�Ч
-- Fanghao_Wu 2004.9.13

aryWan = {	{"<#>������", 453},
			{"<#>�ڶ���", 454},
			{"<#>�ڱ���", 455},
			{"<#>�ڻ���", 456},
			{"<#>�ڵ���", 457} };
			
function EatNei_Wan( eatIndex, level, statetype, time )
	local nCount = getn( aryWan );
	for i = 1, nCount do
		if( i ~= eatIndex ) then
			local nLeftTime = AddSkillState( aryWan[i][2], 1, 1, 0 );
			if( nLeftTime > 0 ) then
				Msg2Player( aryWan[i][1].."<#>��Ч����ʧ" );
			end
		end
	end
	AddSkillState( aryWan[eatIndex][2], level, statetype, time );
	Msg2Player( "<#>�������"..aryWan[eatIndex][1] );
end