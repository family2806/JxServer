--��ԭ���� ������ ·��16��Ա��Ի�
-- edit by С�˶��

Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(183) == 1 then
		allbrother_0801_FindNpcTaskDialog(183)
		return 0;
	end
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,2)
		Describe("��Ա�⣺���ﵽ�ˣ���Ҫ�ռ���6 <color=red>��������Ƭ<color>�ϳ�һ�������Ļ��������ң��ҽ�����һ�� <color=red>���¹���<color>.",2,"�����¹����±�/makeItemUI","˳��·��/NoChoice")
	else
		Describe("���ѽ�ȫ���Ҳ����׸���͢�ˣ��������ѣ�ƥ��������ֻ�ǹ�������֮������ɳ���ϵ��µ�սʿ��ȣ���������ʲô��",1,"֪����/NoChoice")
	end
end;
