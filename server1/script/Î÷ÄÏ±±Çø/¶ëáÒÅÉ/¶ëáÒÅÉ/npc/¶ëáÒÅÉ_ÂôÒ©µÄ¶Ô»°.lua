--���ϱ��� ������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(208) == 1 then
		allbrother_0801_FindNpcTaskDialog(208)
		return 0;
	end
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("��ࣺ��üɽ�ϵĲ�ҩ�ɶ��ˣ����ɵ�������Щ��ҩ�Ƴ���������˵���ҩ��Ҫ��Ҫ������", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ҩƷֻ����ͬ�Ž���!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;
