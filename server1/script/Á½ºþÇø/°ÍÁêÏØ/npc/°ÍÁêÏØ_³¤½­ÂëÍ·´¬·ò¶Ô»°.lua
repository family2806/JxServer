--������ ������ ������ͷ����Ի�
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

CurWharf = 5;
Include("\\Script\\Global\\station.lua");
---------------------------------------------------------------
function main(sel)

if (GetLevel() >= 5) then		--�ȼ��ﵽ5��
	Say("Ta c� bi�t hi�u l� 'L�ng L� B�ch �i�u', ba ��i �i�u s�ng d�a v�o s�ng n��c! Kh�p Ba L�ng Huy�n n�y kh�ng c� ai l� ��i th�! Kh�ch quan mu�n �i ��u? ", 2, "Ng�i Thuy�n/WharfFun", "Kh�ng ng�i/OnCancel");
else		
	Say("��t Level 10 r�i h�y ��n g�p ta.", 0)
end

end;

---------------------------------------------------------------
function  OnCancel()
   Say("Kh�ng ti�n kh�ng th� ng�i thuy�n.",0)
end;

------------------------------------------------