
function talk_yulongtie()
	Say("���������ׯ����λӢ�ۺ��ܵ�����������˭���ܵõ���?",
		2,
		"��ʹ��������֮ʯ����ȡ/get_yulongtie",
		"��������/Cancel")
end

-- ��������֮ʯ��ȡ����Ӣ����
function get_yulongtie()
	if (CalcEquiproomItemCount(4, 507, 1, -1) < 1) then
		Say("��û��������֮ʯ������ȥ��ϰ��Ȼ��������?")
	else
		Say("��ȷ��ʹ��������֮ʯ�һ�����Ӣ�������뽣ڣ�Թ���?",
			2,
			"��/exchange_yulongtie",
			"��������/Cancel")	
	end
end

function exchange_yulongtie()
	if (CalcFreeItemCellCount() == 0) then
		Say("װ����λ�����.")
	elseif (CalcEquiproomItemCount(4, 507, 1, -1) >= 1 and 
		ConsumeEquiproomItem(1, 4, 507, 1, -1) == 1) then
		AddItem(6, 1, 2622, 1, 0, 0)
		Msg2Player("����һ������Ӣ����.")
	end
end
