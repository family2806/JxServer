--ʯ���� ·�� ��ү ��������Ǯ
-- By: Dan_Deng(2003-09-04)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(197) == 1 then
		allbrother_0801_FindNpcTaskDialog(197)
		return 0;
	end
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 3) then		-- ��������
		if (GetSex() == 0) then
			Say("��ô�ˣ����Ҹ���ȫɾ��������Ŀ�����ǲ��ѣ�������Ҫ��Ǯ����300����һ��Ҳ������. ",2,"�����ǻ�Ǯ/W23_pay_yes","�������� /W23_pay_no")
		else
			Say("��ô�ˣ����Ҹ���ȫɾ��������Ŀ�����ǲ��ѣ�������Ҫ��Ǯ����300����һ��Ҳ������. ",2,"�����ǻ�Ǯ/W23_pay_yes","��������/W23_pay_no")
		end
	elseif (UTask_world23 >= 6) then
		Talk(1,"","�����ˣ���Ϊ�������ǻ�Ǯ�ˣ��Ҳ������㶪������ȥ������������.")
	else				-- ������Ի�
		Talk(1,"","ǮǮǮ��ʲô����Ǯ����Ǯ�������ӣ�ûǮ������ͷ�ڹ�. ")
	end
end;

function W23_pay_yes()
	if (GetCash() >= 300) then
		Talk(2,"","��ҪС�����ˣ�����300������ȥ! ","��������Ǯ��Ȼ��˵����.")
		SetTask(23,6)
		Pay(300)
		AddNote("����Ͱ�ȫ�Ѿ�����ծ�ˣ���ȥ���������������Ϣ. ")
		Msg2Player("����Ͱ�ȫ�Ѿ�����ծ�ˣ���ȥ���������������Ϣ. ")
	else
		Talk(1,""," ����ȥ��300����! ")
	end
end

function W23_pay_no()
end
