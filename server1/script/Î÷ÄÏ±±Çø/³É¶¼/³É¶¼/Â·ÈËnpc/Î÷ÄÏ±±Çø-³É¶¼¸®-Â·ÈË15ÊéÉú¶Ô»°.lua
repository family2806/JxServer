--���ϱ��� �ɶ��� ·��15�����Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(186) == 1 then
		allbrother_0801_FindNpcTaskDialog(186)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Talk(2, "", "�ξ��ˣ������ò���������¥��Ϊ�˼���һ����ŮѦ�ζ����ģ��ഫѦ�����ڴ˼�ȡ��ˮ������ʫǩ�������������Թ���˵�ʫ�䡣", "Ѧ��һ���������Ǳ������ܱ�ֲ���񣬷�βɭɭ������ϸϸ���ļ��Դ䣬��Ȥ���������䣬ʹ�����������")
return
end;

if (i == 1) then
Say("�ξ��ˣ�������¥��Զ�����س���ò��������ɫ�������۵ף���������Ϊ֮һ����",0)
end;

end;
