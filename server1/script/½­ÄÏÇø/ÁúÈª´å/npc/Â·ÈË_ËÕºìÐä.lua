-- ��Ȫ�塡·�ˡ��պ���
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(203) == 1 then
		allbrother_0801_FindNpcTaskDialog(203)
		return 0;
	end
	Talk(1,"","�Ҵ�С����Ͳ��ã���������ʦ���������书���������Ѿ�ѧ�����书����Ҳ���±��˺��ˡ�")
end;
