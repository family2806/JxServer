--��ԭ���� ���ݸ� ·��6��һ���Ի�

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(194) == 1 then
		allbrother_0801_FindNpcTaskDialog(194)
		return 0;
	end
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_jiangyixiao()
	else
		i = random(0,1)

			if (i == 0) then
Say("��һ�����κι��ﶼ�Ȳ����������ҵ����У����ҵ����ֻ����һ������������Ϊʲô�ܶ��Ҳ������أ�",0)
			return
			end;
			
			if (i == 1) then
Say("��һ��������Ȼ������Ҷ�����������ʵ��ġ�",0)
			end;
			
			
	end
end

