--��ԭ���� ���ݸ� �ο�1�Ի�
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_shenfeng()
	else
Say("�οͣ��Թ����˽Զ��顣���˶�����ʫԻ��ʮ��һ�������Σ�Ӯ����¥������������ֻ����Ч�����ˣ��к��˴䣬���������ഺ��ʱ����ˡ�",0)
	end
end;


