--������ ������ ·��7����Ϊ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("����Ϊ�����ǰ������Ǹ�С�ط�,���ϰ��յ����ӹ��õ�Ҳ���֡�",0)
return
end;

if (i == 1) then
Say("����Ϊ��������������ǵ�����,���û�����������е�,��Щ̰����������֪Ҫ��ôѹե�����ϰ�����!",0)
return
end;

if (i == 2) then
Say("����Ϊ�����ϰ�������,��������������Ǵ�Ӣ��,��ú�!������������С���Ӷ��������������!",0)
end;

end;

