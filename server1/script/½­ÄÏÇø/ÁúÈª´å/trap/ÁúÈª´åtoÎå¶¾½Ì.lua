--������ ��Ȫ��to�嶾��
--Trap ID�������� 108

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(183, 1371, 3677);
	else
		Talk(1,"","ǰ��Σ��! ���ȥ����!")
	end
end;
