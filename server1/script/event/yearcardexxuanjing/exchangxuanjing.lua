function onYearCardGift()
	Say( " ", 2, "������year_GetCardGift", "�Ժ����/onCancel" )
end

function year_GetCardGift()
	local nCurEPValue = GetExtPoint( 3 );
	if( nCurEPValue >= 1 ) then
		if( nCurEPValue > 32767 ) then
			Say( "�����е��������ϵGM�����лл���μӻ!", 0 );
		else
			Say("��ȷ����ȡ�������Ʒ��(ȷ�����벻Ҫ����!) ", 2, "ȷ��/year_getgiftok", "����/no");
		end
	else
		Talk( 1, "", "�ڻ�ڼ䣬��δ��ֵ�����(����������) , ����ֵ�����ʱ�������Ʒ����Ҫ�������<color=yellow>5��<color> <color=red>6��������ʯ<color> ��<color=yellow>5 ��<color> <color=red> 7��������ʯ<color> " );
	end
end

function year_getgiftok()
	PayExtPoint( 3, 1);
	Msg2Player("���ڸ������������Ʒ����������!")
end

function no()
end