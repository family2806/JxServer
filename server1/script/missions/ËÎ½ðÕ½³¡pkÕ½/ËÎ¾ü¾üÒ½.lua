--��ԭ���� �ν�ս�� �ξ���ҽ
--����

function main(sel)
	if (GetCurCamp() == 1) then
		Say("Tham gia tr�n chi�n h�y t� ch�m s�c b�n th�n, mua thu�c kh�ng?", 2, "Mua thu�c/yes", "Kh�ng mua/no")
	else
		Talk(1,"","Gi�n �i�p ��y �? V� binh ��u r�i!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;