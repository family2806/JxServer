-- ��ԭ���� ���ݸ� ҩ���ϰ�Ի����嶾40������
-- Update��Dan_Deng �����嶾����2003-10-12��

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(142) == 0) then 		--������
		Say("��������ļ۸�Ϊ500������!",
			4,
			"������/L40_buy_yes",
			"����/yes",
			"�������ƻ�Ԫ��¶ /refine",
			"������/no")
	else
		Say("ҩ���ϰ壺�����ҩ�Ļ����ʵ�����ΰٲ���",
			3,
			"����/yes",
			"���ƻ�Ԫ��¶/refine",
			"������/no")
	end
end;

function L40_buy_yes()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(142)
		AddNote("������.")
		Msg2Player("������.")
	else
		Talk(1,"","����۶����ˣ����ҳ�ȥ!")
	end
end;

function yes()
Sale(96);  			--�������׿�
end;

function no()
end;
