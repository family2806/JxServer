----���ϱ��� ����� ·��2����̫�Ի�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_wulaotai()
	else
Say("����̫������Ȼû�ж��ӣ��������˸�Т˳�ĺù�Ů���ַ���˵���������и�����",0)
	end
end;