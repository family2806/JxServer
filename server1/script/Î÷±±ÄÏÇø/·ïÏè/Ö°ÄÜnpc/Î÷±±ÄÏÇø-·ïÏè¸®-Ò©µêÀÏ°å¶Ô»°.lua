--�������� ���踮 ҩ���ϰ�Ի�
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("ҩ���ϰ壺���������Ĳ�ҩ�в��β����޲����������������ڵ�������������ˣ������벻����Щ�����Ĳ�ҩ��",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(12) 		--�������׿�
end;

if TEACHERSWITCH then
	tinsert(OPTIONS, "������ҩ��/brew")
end
tinsert(OPTIONS, "����/yes")
tinsert(OPTIONS, "���ƻ�Ԫ��¶/refine")
tinsert(OPTIONS, "������/Cancel")
