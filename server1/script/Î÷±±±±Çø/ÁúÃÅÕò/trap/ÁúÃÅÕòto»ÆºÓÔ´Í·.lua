--�������� ������to�ƺ�Դͷ
--TrapID���������� 1

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(122, 1612, 3328);
		AddTermini(182);
	else
		Talk(1,"","ǰ��Σ�գ����ǻ�ȥ���¹���!")
	end
end;