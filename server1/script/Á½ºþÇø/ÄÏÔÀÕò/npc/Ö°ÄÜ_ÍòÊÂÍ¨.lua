--����ͨ�����ű�(BlackBay.03.12.30)

Include([[\script\event\mid_autumn06\fairy_of_midautumn06.lua]]);

function main(sel)
	local tab_Content = {
		"��20000�����ӻ�һ���˵���Ϣ/Query2", 
		"��3000�����ӻ�һ���˵���Ϣ/Query3", 
		"����/Nothing"
	};
	
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "����/au06_entrance_fairy");
	end;
	Say("�Ҿ�������ͨ��û��ʲô��֪���ġ�����Ҫ��ʲô?", getn(tab_Content), tab_Content);
end;

--�������������������� QueryWiseMan �ĺ������˺���֪ͨ�ͻ�������һ�����ֲ��ύһ�β�ѯ
--��ѯ�ɹ���ϵͳ�ص���һ������ָ���Ļص�����������ѯʧ�ܣ�ϵͳ�ص���һ������ָ���Ļص�������
--�ص�����ԭ����ο����涨���������������WisemanCallBack��AbsentCallBack
function Query1()
	if (GetCash() >= 100000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 100000)
	else
		Nothing()
	end
end;

function Query2()
	if (GetCash() >= 20000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 20000)
	else
		Nothing()
	end
end;

function Query3()
	if (GetCash() >= 3000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 3000)
	else
		Nothing()
	end
end;

function Nothing()
	Talk(1, "", "�㲻�����ҿ���Ц��?")
end;

--�˺���Ϊ�ɹ���ѯ��Ϣ�Ļص����������������Ͳ���˳������ı�
function WisemanCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	if MapName == "" then
			Say("�Բ���, "..TargetName.."��������������<color=red>�����������<color>, ���ǲ�֪��ҽ���ľ���λ��, �����Ҿ�ֻ���۰�.",0)
			Pay(MoneyToPay / 2)
			return
	elseif (MoneyToPay == 3000) then
		Say("C�i kia "..TargetName.."������<color=red> "..MapName.."<color>���߿�㣬���������ĵط��ҾͲ�����. ",1,"��л/no")
	elseif (MoneyToPay == 20000) then
		Say("�Ǹ�"..TargetName.."������<color=red> "..MapName.."<color>,����λ�ÿ�����<color=red> ( "..nPosX..", "..nPosY..")<color>, �����Ҫ�����Ļ��Ϳ��. ",1,"��л/no")
	elseif (MoneyToPay == 100000) then
		SexString = "Nam"
		if (nSex ~= 0) then
			SexString = "N?"
		end
		Say("�Ǹ�"..TargetName.."����!"..PlayerLevel.."����"..SexString..",���ڵ�λ����<color=red>"..MapName.."("..nPosX..", "..nPosY..")<color> ����״.,��. ���� "..nWorldRank.."��., PKֵ "..PKValue..". ��Ҫ�����Ļ��Ϳ��. ",1,"�a t?/no")
	end
	Pay(MoneyToPay)
end;

--�˺���Ϊʧ�ܲ�ѯ(Ҳ���ǲ�����)��Ϣ�Ļص����������������Ͳ���˳������ı�
function AbsentCallBack(TargetName, MoneyToPay)
	Say("������˼, "..TargetName.."�����ڲ�����, ��֪��������, ��ѯ����ֻ��һ�룬�Ǻ�. ",0)
	Pay(MoneyToPay / 2)
end;

function no()
end
