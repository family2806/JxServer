-- ����·�ˡ�����Ӣ
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(187) == 1 then
		allbrother_0801_FindNpcTaskDialog(187)
		return 0;
	end
	Talk(3,"","�����п��ˣ���ȥ�����������һ��������.","�����������ô���������� �ҼҳԷ�����һ���������㣬���Ǵ�����������Ĳˣ��㲻�ÿ�������")
end;
