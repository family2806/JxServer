--��ԭ���� ���ݸ� ·��17������Ի�
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_leqingqiu()
	else
Say("�������û�б�ı��£�ֻ�ܿ��򼸷��ֻ����Һ��ڣ������ѹ���˵������һ��������������", 0);
	end
end;




