--�������� ������toҩ����
--TrapID���������� 5

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(140, 2429, 3731);
		AddTermini(183);
	else
		Talk(1,"","ǰ��Σ�գ����ǻ�ȥ���¹���!")
	end
end;