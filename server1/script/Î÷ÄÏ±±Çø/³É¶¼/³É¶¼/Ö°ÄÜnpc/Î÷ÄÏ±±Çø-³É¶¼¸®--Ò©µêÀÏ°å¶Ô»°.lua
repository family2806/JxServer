--���ϱ��� �ɶ��� ҩ���ϰ�Ի�

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	Say("ҩ���ϰ壺�������ʱ������һ����٢һ������ҽ������Ȣ�����ӣ�Ϊ�����Һ��ڣ�ֻ�ÿ������ҩ�ꡣ��������ˣ������˰��죬��û������Ҫ��ɶ��ҩ��",
		3,
		"����/yes",
		"���ƻ�Ԫ��¶/refine",
		"������/Cancel")
end

function yes()
	Sale(15) 		--�������׿�
end
