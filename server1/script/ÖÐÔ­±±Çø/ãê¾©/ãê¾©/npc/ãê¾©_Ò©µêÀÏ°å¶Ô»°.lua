--��ԭ���� �꾩�� ҩ���ϰ�Ի�
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("ҩ���ϰ壺�����ʲôҩ���У�������ġ��β����ֵġ��������ٵġ���Ѫ�����ģ���Ҫ��ʲôҩ��",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(9) 			--�������׿�
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "���ҷ�ҩ��/brew")
end
tinsert(OPTIONS, "����/yes")
tinsert(OPTIONS, "���ƻ�Ԫ��¶/refine")
tinsert(OPTIONS, "������/Cancel")
