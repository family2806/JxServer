--������ ������ ·��2��̫�ŶԻ�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(201) == 1 then
		allbrother_0801_FindNpcTaskDialog(201)
		return 0;
	end
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ�.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","�ȿȿȣ��ҿ϶������ˣ���֪����ô���Ǹе�ͷ�ۡ��ȿȣ���֪���������ô���ˣ���Ͽ��뿪!")	 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ�.")
		return
	end

Say("��̫�ţ��ҵĶ�����������ţ�Ҳ���������ô���ˡ�������ʮ�����ʱ��ò����ˣ�ʣ����һ���������ӡ�",0)

end;

