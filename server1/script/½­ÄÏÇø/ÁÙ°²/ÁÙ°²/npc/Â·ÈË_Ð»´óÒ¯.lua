-- �ٰ���·�ˡ�л��ү
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","л��ү������������û��˵�����Լ����׹�Ů��Ҫ�ף����������˷磬�е㷢�գ��ⲻ�����͸�����ҩȥ�ˡ�")
end;
