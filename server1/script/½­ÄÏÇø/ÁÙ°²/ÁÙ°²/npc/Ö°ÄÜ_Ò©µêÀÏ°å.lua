-- �ٰ���ְ�ܡ�ҩ���ϰ�
-- by��Dan_Deng(2003-09-16)

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say(10855,
		3,
		"����/yes",
		"���ƻ�Ԫ��¶/refine",
		"������/Cancel")
end;

function yes()
	Sale(12)  				--�������׿�
end
