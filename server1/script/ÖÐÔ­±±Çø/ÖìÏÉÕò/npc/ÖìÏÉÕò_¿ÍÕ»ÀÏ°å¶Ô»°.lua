--��ԭ���� ������ ��ջ�ϰ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(202) == 1 then
		allbrother_0801_FindNpcTaskDialog(202)
		return 0;
	end
Say("�͹�����Ϣ��?",0)

end;
