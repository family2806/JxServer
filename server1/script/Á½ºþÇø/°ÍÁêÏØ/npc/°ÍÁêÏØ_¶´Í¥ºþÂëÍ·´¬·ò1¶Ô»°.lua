--������ ������ ��ͥ����ͷ����1�Ի�
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)
	Say("C� ��i ta �i�u s�ng v�i s�ng n��c!. ��ng d�nh h� kh�ng n�i n�o m� ta kh�ng bi�t! Kh�ch quan mu�n �i ��u?", 2, "�i Thi�n V��ng ��o/yes", "Kh�ng ng�i/no")
end;

function yes()
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		if (GetFaction() == "tianwang") then				--����������������ӣ���������Ǯ
			Say("Th� ra l� m�n �� c�a Thi�n V��ng Bang! ta s� ��a ng��i �i mi�n ph�", 1, "Ng�i Thuy�n/ok1")
		else	
			Say("N�i �� nguy hi�m l�m! N�u kh�ch quan mu�n �i xin cho th�m �t ti�n", 1, "Ng�i Thuy�n/ok2")
		end
	else		
		Talk(1,"","N�i �� nguy hi�m l�m! Khi n�o d�t ��n ��ng c�p h�n 10 ta s� ��a kh�ch quan �i")
	end
end;

function no()
end;

function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)					--ת��Ϊ��ս��״̬
end;

function ok2()
if (GetCash() >= 100) then							--�ο�ֵ
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--ת��Ϊ��ս��״̬	
else
	Say("Kh�ng ti�n kh�ng th� ng�i thuy�n!", 0)		
end
end;
