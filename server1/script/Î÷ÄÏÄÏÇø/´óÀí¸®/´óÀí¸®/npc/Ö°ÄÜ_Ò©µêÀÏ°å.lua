-- ���� ְ�� ҩ���ϰ�
-- By: Dan_Deng(2003-09-16)
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

OPTIONS = {}

function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say("�ҵĵ꿿���ɽ�����������ǧ�ֲ�ҩ.",
		getn(OPTIONS),
		OPTIONS)
end;

function yes()
	Sale(12)  			--�������׿�
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "���ҷ�ҩ��/brew")
end
tinsert(OPTIONS, "����/yes")
tinsert(OPTIONS, "����������Ԫ��¶refine")
tinsert(OPTIONS, "������/Cancel")
