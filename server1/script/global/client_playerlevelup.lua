--Creator:yfeng
--Date:2004-9-6
--Comm:�ͻ���������ʾ��Ϣ

STRTAB_LEVELUP={
	[2]="<#>��ϲ������2��������Ե���������ʦѧϰ�Ṧ�ˡ�",
	[5]="<#>��ϲ������5�������Ѿ������������磬����ȥ����м��������ˡ�",
	[10]="<#>��ϲ������10�������Ѿ�����һ���Ĺ��ף��������ɰ�ʦѧ���ˡ����ִ����и������ɵ���ͽ�����ǻ�������ɣ�ʦ�Ż�����������㡣���ɺ�Ϳ���������Ƶ���������ˡ�ͬʱ������Ժͱ���pk�ˣ������ڳ������̯�������ˡ�",
	[20]="<#>��ϲ������20�������Ѿ�����ǧ�ﴫ���������ڳ���Ƶ���������ˡ����ң�����������ˣ�������ж������ӡ����Ѿ��ǳ����ˣ����Խ���ˣ����������һ��ȥ����������������װɡ�ͬʱ��Ҫ���ǻ���ʦ�ţ����µ����������Ŷ��",
	[30]="<#>��ϲ������30�������ǧ�ﴫ����������ˣ�����������Ƶ���������ˡ�ͬʱ��Ҫ���ǻ���ʦ�ţ����µ����������Ŷ��",
	[40]="<#>��ϲ������40������ɲμ��ν��ս�ˣ��ν�ս��λ��������������֮�䡣ͬʱ��Ҫ���ǻ���ʦ�ţ����µ����������Ŷ��",
	[50]="<#>��ϲ������50���������ȥϴ�赺�ˣ������������ϴ��Ǳ�ܵ�ͼ��ܵ㣬������еĳ�����Դ���ȥ��ͬʱ��Ҫ���ǻ���ʦ�ţ���50������ͳ�ʦ���������Ŷ��",
	[60]="<#>���������ʦ�����ˣ�����������ѧ�����ɾ�ѧ��",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("��ͬʱ�����30�������ɣ�������а����Ӫ����")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("��ͬʱ�����30�������ɣ�������Ӫ����")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("��ͬʱ�����30�������ɣ�а����Ӫ����")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("��ͬʱ�����30����������а����Ӫ����")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("�������30����������Ӫ����")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("�������30����������Ӫ����")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("�������30����а����Ӫ����")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("��ͬʱ�����40�������ɣ�������а����Ӫ����")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("��ͬʱ�����40�������ɣ�������Ӫ����")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("��ͬʱ�����40�������ɣ�а����Ӫ����")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("��ͬʱ�����40����������а����Ӫ����")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("�������40����������Ӫ����")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("�������40����������Ӫ����")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("�������40����а����Ӫ����")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("��ͬʱ�����50�������ɣ�������а����Ӫ����")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("��ͬʱ�����50�������ɣ�������Ӫ����")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("��ͬʱ�����50�������ɣ�а����Ӫ����")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("��ͬʱ�����50����������а����Ӫ����")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("�������50����������Ӫ����")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("�������50����������Ӫ����")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("�������50����а����Ӫ����")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("��ͬʱ�����50�������ɣ�������а����Ӫ����")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("��ͬʱ�����50�������ɣ�������Ӫ����")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("��ͬʱ�����50�������ɣ�а����Ӫ����")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("��ͬʱ�����50����������а����Ӫ����")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("�������50����������Ӫ����")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("�������50����������Ӫ����")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("�������50����а����Ӫ����")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
