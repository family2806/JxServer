-------------------------------------------------------------------------
-- FileName		:	·��_۪��ˮ.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 14:40:10
-- Desc			:	����90�����񣿣�
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
Uworld126 = nt_getTask(126)
Uworld1002 = nt_getTask(1002)
	Say(" ������������Ҫ������ϧ�Ҹ�.",3,"��������������/branch_branchliqiushui","������90������/tasknpc_nity","������!/no")
end

function tasknpc_nity()
Uworld126 = nt_getTask(126)
	if (Uworld126 == 10) and (HaveItem(391) == 1) then
		Talk(4,"Uworld126_lose","۪С�㣬������","�o��˼��Ҳ�к�ڵ�һ�죿̫���ˣ��Ҳ�������������.","��������ִ������˵��ʿ�����չ�Ŀ���,�ѵ����ܸ��ι���һ��������  ","�������᣿���뿪�ҵ�ʱ���и��һ������Ҳ���˵�ˣ���û�¾�ȥ�����ţ���ϲ��˵��Щ.")
	elseif (Uworld126 == 10) then			-- û������
		Talk(3,"","۪С�㣬������","ʲô��?","���������ڶ�˼��������.")
	elseif (Uworld126 == 30)then
   	Talk(3,"Uworld126_cant","۪С��",".....","����Ҫ��ȥ���ι����Ұ취����.")
   elseif (Uworld126 == 60)then
   	Talk(12,"Uworld126_beleive","۪С�㣬������! ","��ʲô����ʲô������˵.","�ι���.","����ô��?","�ι�����Ϊ�����������˴�����ˣ�����Σ��!","�㲻���鹹�ˣ��Ҿ��Բ�������!","�������Լ��ڽ����������������Ҳ�ƭ����..","�ѵ�?....˼�ɡ����������ˣ�����������������Щ�꣬�ҵ�����Ҳ���ˣ��кܶ��ޣ���û���书�����ǿ����Լ�.","���������ԭ�����Ͳ���������.","�⼸����˯���ţ���������������������������?","���� ","�һ����ϵ�������еĳ�޶��ѽ���!")	
   elseif (Uworld126 > 10) and (Uworld126 < 60) then				-- �����е�ȱʡ�Ի�
   	Talk(1,"","�Һ�˼��û���κθ������㲻�ö�˵! ")
   else
   	Talk(1,"","������������һ�����ף�������Υ���Ź�.....")
   end
end

function Uworld126_lose()
	DelItem(391)
	nt_setTask(126,20)
	Msg2Player("����֮��۪��ˮû��һ��ж��������ȥ��������������.")
	AddNote("����֮��۪��ˮû��һ��ж��������ȥ��������������.")
end

function Uworld126_cant()
	nt_setTask(126,40)
	Msg2Player("۪��ˮ����Ȱ�棬�������ȥ�Ҷ�˼��.")
	AddNote("۪��ˮ����Ȱ�棬�������ȥ�Ҷ�˼��.")
end

function Uworld126_beleive()
	nt_setTask(126,70)
	Msg2Player("۪��ˮ���ﻹ�ж�˼�ɣ�����ȥ�������һ�棬�ƻ��ɹ�.")
	AddNote("۪��ˮ���ﻹ�ж�˼�ɣ�����ȥ�������һ�棬�ƻ��ɹ�.")
end

function branch_branchliqiushui()
	Uworld1002 = nt_getTask(1002)
   	liqiushui()
end

function no()
end