--���ϱ��� �ɶ��� ·��13����֥�Ի�
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
Say("����֥���������ڳ��ŵ��һվ��һ���գ�̫�����ˣ���Ҫ����ò˸����������ӡ�",0)
	end
end;