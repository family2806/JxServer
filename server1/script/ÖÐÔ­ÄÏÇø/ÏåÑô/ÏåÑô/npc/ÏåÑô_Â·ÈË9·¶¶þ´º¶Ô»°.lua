--��ԭ���� ������ ·��9�������Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

function main(sel)
	if allbrother_0801_CheckIsDialog(184) == 1 then
		allbrother_0801_FindNpcTaskDialog(184)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Say("����������ɩ������̫�����ˣ��ҵ��¸����Ǽ���һ������ȥ���ȾȾȼ���",0)
return
end;

if (i == 1) then
Say("����������Ҷ��ǽַ��������æ��Ӧ�õġ�",0)
end;

end;

