--description: ������ͨ���� ���������
--author: yuanlan	
--date: 2003/3/7
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(8) == 1 then
		allbrother_0801_FindNpcTaskDialog(8)
		return 0;
	end
	UTask_tm = GetTask(2)
	UTask_wu = GetTask(10)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 0) and (GetLevel() >=10) and (GetFaction() ~= "tangmen") then		--������������
		Say("Ҫ����뱾�ţ����봳��<color=Red>������<color>����Ҫ������?", 2, "����/enroll_get_yes", "���� /no")
	elseif (Uworld37 > 0) and (Uworld37 < 20) then			--������
		Talk(1,"","���õ�<color=Red>��ɫ����<color> ��Ҫ���<color=Red>��һ����Ĵ����<color> .")
--����õ�<color=Red>��ɫ����<color>�����ȥ�ڶ�����һ��<color=Red>ׯ��<color>�����һ��<color=Red>��ɫ����<color>�ڵ����ص�<color=Red>ׯ��<color>���ϡ��õ��������Ⱥ󽻸�<color=Red>���ڵ�ׯ��<color>���������ǹ��ء�
--	elseif (GetFaction() == "tangmen") then			--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","����ׯ������Ҷ���ͬ���ֵܣ��㲻���ٴ���������������ˣ�")
	elseif (UTask_tm >= 70*256) then						--�Ѿ���ʦ
		Talk(1,"","�����԰���������������£�������˭Ҳ����С�������ǣ��պ����߽������ɲ�Ҫ���˱��ŵ�����! ")
	else
		Talk(1,"","���Ų���ӭİ�����������.")
	end
end;

function enroll_get_yes()
	Talk(2, "", "�õ� <color=Red>�������������<color> �� <color=Red><color> �����أ�Ȼ�󽻸����ڵ��ˣ��������ǹ���.", "���õ�<color=Red>��ɫ����<color> ��Ҫ���<color=Red>��һ����Ĵ����<color> , <color=Red>��ɫ����<color> ����ȥ�ڶ�����һ��<color=Red>ׯ��<color>, <color=Red>��ɫ����<color>�ڵ����ص�<color=Red>ׯ��<color>����.")
	Uworld37 = SetByte(GetTask(37),1,20)
	SetTask(37,Uworld37)
	AddNote("�������ؼ�����׳����������<color=red>��������<color>, ���������õ��������������. ")
--	AddNote("�����ż����������񣺴��������ز��õ��ࡢ�ס����������ȡ�")
end;

function no()
end;
