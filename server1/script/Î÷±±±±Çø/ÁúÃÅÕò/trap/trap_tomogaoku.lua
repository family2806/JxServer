--�������� ������toĪ�߿�
--TrapID��

function main(sel)
	if (GetLevel() >= 5) then
		SetFightState(1);
		NewWorld(340,1853,3446);
		AddTermini(225);
	else
		Talk(1,"","ǰ��Σ�գ����ǻ�ȥ���¹���!")
	end
end;