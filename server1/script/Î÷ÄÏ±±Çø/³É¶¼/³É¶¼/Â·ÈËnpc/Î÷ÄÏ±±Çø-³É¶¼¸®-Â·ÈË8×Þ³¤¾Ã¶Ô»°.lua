--���ϱ��� �ɶ��� ·��8�޳��öԻ�
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_zouchangjiu()
	else
Say("�޳��ã������˵�⴨������һ����һ����Ư��������һ������Ȼ�����ú��ģ�Ҫ��������Ȣ�����š���",0)
	end
end;

