--������ ��Ȫ��to����ɽ
--Trap ID�������� 5

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(179, 1618, 3292);
		AddTermini(153);
	else
		Talk(1,"","ǰ��Σ��! ���ȥ����!")
	end
end;
