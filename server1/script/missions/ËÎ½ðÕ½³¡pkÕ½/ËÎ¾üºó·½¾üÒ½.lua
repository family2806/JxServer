--��ԭ���� �ν�ս�� �ξ��������ҽ
--���� 2004-10-14

function main(sel)
if (GetCurCamp() == 1) then
	SetFightState(0)
	Say("Tham gia tr�n chi�n h�y t� ch�m s�c b�n th�n, mua thu�c kh�ng?", 2, "Mua thu�c/yes", "Kh�ng mua/no")
else
	Talk(1,"","C� gi�n �i�p")
end;
end;

function yes()
Sale(53)
end;

function no()
end;