--��ԭ���� �꾩�� �����ס�ֶԻ�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	
	if allbrother_0801_CheckIsDialog(190) == 1 then
		allbrother_0801_FindNpcTaskDialog(190)
		return 0;
	end
Say("�����ʦ������֮�ˣ�ԭ��Ӧ���Ĵ�Կգ����۹��£������ۿ���ɽ��֣�����Ϳ̿�����˿������࣬��������ʹ�ļ��ף�", 0);
end;


