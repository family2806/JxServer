-- �ٰ���·�ˡ���Ա��
-- by��Dan_Deng(2003-09-16)
-- edit by С�˶��
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("��Ա��: �����ѵ�, ֻ���ռ��� 6 <color=red>���λ���Ƭ<color> �ϳ�һ�������Ĵ�������,�ҽ��͸�����1�� <color=red>����ܽ��<color>.",2,"�һ�����ܽ���±�/makeItemUI","ֻ��·��/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","��Ա�⣺���䲻�ǹٳ����ˣ����ǳ��д�Ա���������죬ֻҪ�����ӣ����°첻���£�")
		else
			Talk(1,"","��Ա�⣺���˶������٣�Ҫ֪����;���գ��Ǽ�������������ң���ڣ�")
		end
	end
end;
