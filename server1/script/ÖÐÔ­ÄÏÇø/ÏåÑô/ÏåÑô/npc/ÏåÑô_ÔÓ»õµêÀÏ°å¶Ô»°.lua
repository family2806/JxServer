--description: ��ԭ���� ������ �ӻ����ϰ�Ի�	�䵱��20������
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+40) and (HaveItem(66) == 1) then
		Talk(2, "", "����԰����޲����������?", "�Ҷ������䵱ɽժ��Ҷ�����Ƕ������<color=Red><color> �������ˣ�˭���԰��ҾȾ���?!","���˽������Ұ��㴫���ͬ��!")
		SetTask(5, 20*256+50)
		DelItem(66)
		AddNote("�������ҵ��ӻ����ϰ壬֪�����Ķ��ӱ�Ұ��<color=red>���Ƕ����<color> ������. ")
		Msg2Player("�������ҵ��ӻ����ϰ壬֪�����Ķ��ӱ�Ұ��<color=red>���Ƕ����<color> ������. ")
	elseif (UTask_wd == 20*256+50) then
		if (HaveItem(67) == 1) then
			Talk(3,"","�͹��Ǿ��Ҷ��ӵĶ��ˣ���Ҫʲô��������˵!","��������޸����������?","û���⣬Ϊ�˱��������֮�����Ҳ���Ǯ!")
			DelItem(67)
			AddEventItem(68)
			Msg2Player("�·����޺�. ")
			SetTask(5, 20*256+80)
			AddNote("�ӻ����ϰ��ò�˿���޺����·�. ")
		else
			Say("�Ҷ������䵱ɽժ��Ҷ�����Ƕ������<color=Red><color> �������ˣ�˭���԰��ҾȾ���?!", 2, "��ֻ����һЩ��������/yes", "��֪����. /no")
		end
	elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 0) then		-- ���߶���
		AddEventItem(68)
		Talk(1,"","�n ���ˣ������ǵ�����!")
	else
		local Buttons = store_sel_extend();
		Say("�ӻ����ϰ壺����Ҫ���ô�£��ǳԵģ����ģ������õģ�", getn(Buttons), Buttons);
	end
end;

function yes()
	Sale(11)  			--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;
