--��ԭ���� ����� ����ϰ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(204) == 1 then
		allbrother_0801_FindNpcTaskDialog(204)
		return 0;
	end

Say("�Ȳ������彡�����͹����һ����?",0)

end;
