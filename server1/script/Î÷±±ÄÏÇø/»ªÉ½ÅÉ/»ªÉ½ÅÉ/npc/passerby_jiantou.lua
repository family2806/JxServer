-- ��ɽ�ɼ�ͷ�Ի��ű�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","��˵���ִ����лƽ����񣬻�ɽ�����Ѿ���ɽ�������ˣ���һ��Ҫ����!");
	end
end
