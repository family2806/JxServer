--��ԭ���� ���ݸ� ��ͽ3�Ի�
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_dugun()
	else
Say("��ͽ������������Ӯ�˼��ѣ���������ˣ��治���ģ�", 0);
	end
end;




