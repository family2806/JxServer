-- ��ɽ�촬��

function main()
	Say("��������ȥ����? 500��!", 2, "��!��!/toyangzhou", "��������/no");
end

function toyangzhou()
	if( GetCash() >= 500 ) then
		NewWorld( 80,1369,3369 );
		DisabledUseTownP(0)	-- ���������뿪��ɽ�췵�����ݺ�ʹ�ûسǷ�
		SetFightState(1);
		Pay( 500 );
	else
		Talk( 1,"","����Ǯ�����ϴ�!");
	end
end

function no()
end