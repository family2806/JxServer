--������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������
-- Update: xiaoyang(2004\4\23) ����ɼ���ʯ���񣬿��ظ�������

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	Uworld131 = GetTask(131)
	if (Uworld131 == 10) and (GetItemCount(138) >= 5) and (GetItemCount(121) >= 5) and (GetItemCount(118) >=5) then
		Talk(1,"U131_prise","��ʦ�������Ѵ��ظ��ֿ�ʯ���뿴��.","�����ʯ.....��л��!")
	elseif (GetFaction() == "shaolin") or (Uworld38 == 127) then
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >=4) and ((Uworld131 < 10) or ((GetGameTime() > Uworld131) and (Uworld131 > 255))) then
			Say("���´��ڽ����Χ����������100��������õ���������������������ʯ�����֡�Ŀǰ���������������⣬���������������²��ֿܵ�������Ҫ�����������󣬳�ͭ��.",3,"ͬ��ȥ�ռ���ʯ. /yes1","��������һЩ����/yes","���»��������£��´�����. /no")
		else
			Say("�����书�������£����ǣ����û��������ʲô����û����.", 2, "����/yes", "������/no")
		end
	else
		Talk(1,"","���������������ֻ����ͬ��")
	end
end;

function yes()
	Sale(69)
end;

function yes1()
	Talk(2,"","�����ƿ����������Ѽ����꣬����Ը��ȫ���Ը�!","�����ȱ���������Ҫ�������������Ҵ����������󣬳�ͭ��ÿ��5��.")
	SetTask(131,10)
	Msg2Player("ͬ���������ȥ�Ҵ����������󣬳�ͭ��ÿ��5��. ")
end

function U131_prise()
	for i=1,5 do
		DelItem(138)
		DelItem(121)
		DelItem(118)
	end
	SetTask(131,GetGameTime()+14400)
	i = GetReputeLevel(GetRepute()) + 2
	AddRepute(i)
	Msg2Player("����ʯ����ĩ��������������������"..i.."��.")
end

function no()
end;
