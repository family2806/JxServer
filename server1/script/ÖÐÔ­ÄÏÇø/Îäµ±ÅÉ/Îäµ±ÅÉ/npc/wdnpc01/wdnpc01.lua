--description: �䵱��С��ʿ��硡��ľͰ�����䵱��������
--author: yuanlan
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2004-01-12)��������������񣬸�Ϊ������������

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "wudang") then			-- ˮͰ��������
		Say("��ȡˮʱ��С�İ�ˮͰ��Ū���ˣ������<color=Red>��ˮͰ<color> ���䵽<color=Red>����<color>, ûȡ��ˮ����ȥһ����ʦ����֡�����԰��Ұ�ˮͰ��������?", 2, "ͬ�� /uworld31_get_yes", "�Ұﲻ����/uworld31_get_no")
	elseif (UTask_world31 == 5) and (HaveItem(65) == 1) then					--��ľͰ
		uworld31_prise()
	elseif (UTask_world31 < 10) then 					--��δ��ɼ�ľͰ����
		Talk(1,"","<color=Red>ˮͰ<color>����<color=Red>������<color>, ����Ҳ���<color=Red>ľͰ<?color>,�ò���ˮ����ʦ������.")
	elseif (UTask_world31 == 10) then 					--��ǰ��ɼ�ľͰ����
		UTask_world31 = SetByte(GetTask(31),1,127)
		SetTask(31,UTask_world31)
		Talk(1,"","лл���ϴΰ����û�ˮͰ�����������䵱�ɼ������ӣ��Ժ���������䵱�ɵ�����װ��.")
	elseif (GetFaction() == "wudang") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","ÿ�춼����������ˮ�����ﻹ��ʱ�����������п�������˵��������?")
	elseif (UTask_wd == 70*256) then							--�Ѿ���ʦ
		Talk(1,"","�����б��죬ʲôʱ���Ҳ��ܳ�ʦ��?")
	else
		Talk(1,"","�䵱ɽ��ͨ�����룬�ϱ����ɽ����������������72����ΰ��ÿ������������˺ܶ�!")
	end
end;

function uworld31_get_yes()
	Talk(1,"","Hay qu? <color=Red>ˮͰ color> ����<color=Red>����<color> ��.")
--	DelItem(65)									--��ֹ�ؽ��������Ҽ����������
	SetTask(31,SetByte(GetTask(31),1,5))
	AddNote("��ɽǰ���߾�������С��ʿ��磬�����񣺰�������¾���ˮͰ ")
	Msg2Player("�����񣺰�������¾���ˮͰ ")
end;

function uworld31_get_no()
	Talk(1,"","�����������˰�!")
end;

function uworld31_prise()
	DelItem(65)
	UTask_world31 = SetByte(GetTask(31),1,127)
	i = ReturnRepute(25,24,4)		-- ȱʡ����12���������ĵȼ�24����ÿ���ݼ�8%
	SetTask(31,UTask_world31)
	AddRepute(i)		-- ������
	Talk(1,"","лл������һ�ˮͰ��������ܾ��ˣ����ǰ����һ�ˮͰ���ˣ��ҷ���Ϊ�䵱�ɼ������ӣ��Ժ�����Ե��䵱��������װ��.")
	AddNote("����С��ʿ����һ�ľͰ��������ɡ���Ϊ�������ӣ���������")
	Msg2Player("����С��ʿ����һ�ľͰ��������ɡ���Ϊ�������ӣ���������"..i.."��.")
end

function no()
end;
