--��ԭ���� ������ ·��6����ţ�Ի�


Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)

i = random(0,2)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_taokan()
	else
		if (i == 0) then
Say("����ţ�����˳ǣ������ߣ���Զ�����䵱ɽ��",0)
		return
		end;
		
		if (i == 1) then
Say("����ţ����˵�䵱�ɵ������Ǹ��õ����ˣ��������ǲ��ǵõ��˾��ܹ��������ϡ�",0)
		return
		end;
		
		if (i == 2) then
Say("����ţ��Ҫ���������а�ʮ�������������䵱ɽ��ʦѧ��ȥ�ˡ�",0)
		end;
	end
end;

