--�������� ���踮 �ھ��ϰ�Ի�
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(188) == 1 then
		allbrother_0801_FindNpcTaskDialog(188)
		return 0;
	end
	
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_shuangying()
	else
		i = random(0,1)
		if (i == 0) then
Say("�ھ��ϰ壺����˫ӥ�ھ�������һ���ĺڰ������������ѣ����Ա��ڴ�����ʧ���⿿��ȫ���ǽ��������ѵ����ӣ�",0)
		else
Say("�ھ��ϰ壺���ǳ����з����ˣ������湦��ȫ���ڰ��������������������⡮���顯���֣���ʱ���浶��ǹ�Ĺ���Ҫ��Щ��", 0)
		end;
	end
end
		
		