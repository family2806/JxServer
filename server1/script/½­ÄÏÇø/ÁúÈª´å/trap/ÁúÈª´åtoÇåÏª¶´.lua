--������ ��Ȫ��to��Ϫ��
--Trap ID�������� 106

function main(sel)
	if (GetLevel() >= 5) then	
		SetFightState(1);
		NewWorld(198, 1522, 2955);
		AddTermini(211)
	else
		Talk(1,"","ǰ��Σ��! ���ȥ����!")
	end
end;
