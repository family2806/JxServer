--�������� ������to������
--TrapID���������� 3

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1); 
		NewWorld(131, 1872, 3659);
	else
		Talk(1,"","ǰ��Σ�գ����ǻ�ȥ���¹���!")
	end
end;