-- �ٰ���·�ˡ��ƹ�
-- by��Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
	i = random(0,6)
	Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 ~= 0 ) then
		branch_zuihan()
	else
		if (i == 0) then
			Talk(1,"","T�u qu�  t�n trung ph�n r��u , r��u d�ch tinh khi�t trong su�t , m�i th�m ng�t nh� �c , nh�p kh�u thu�n h�u mi�n nhu m� cam li�t , h�n v� nh� nh�ng khoan kho�i , tr� v� ch� du tr��ng . ")
		elseif (i == 1) then
			Talk(1,"","T�u qu�  mi�n tr�c ki�m nam xu�n , r��u d�ch trong su�t trong su�t , h��ng th�m n�ng n�c , m�i r��u thu�n h�u , thu�n c�ng tr� v� ng�t , r��u th� ��y ��n , m�i th�m hi�p �i�u , thanh li�t t�nh tho�i m�i , d� h��ng du tr��ng . ")
		elseif (i == 2) then
			Talk(1,"","T�u qu�  Thi�m T�y t�y ph��ng r��u , r��u d�ch thanh l��ng trong su�t , thu�n h��ng ph�n ph��ng , thanh m� kh�ng ��m , n�ng m� kh�ng di�m , tr� v� ch� tho�i m�i , phong c�ch ��c bi�t . c� chua m� kh�ng s�p , kh� m� kh�ng ni�m , h��ng kh�ng gay m�i , cay kh�ng sang h�u , u�ng sau tr� v� cam  v� l�u m� di ph��ng chi hay . ")
		elseif (i == 3) then
			Talk(1,"","T�u qu�  tu�n ngh�a t�p r��u , r��u d�ch trong su�t trong su�t , m�i th�m u nh� th� th�ch , v�a c� ��i kh�c r��u ��ch n�ng n�c h��ng th�m , l�i c� ti�u kh�c r��u ��ch nhu mi�n  thu�n c�ng  tr� v� ng�t , c�n c� ��m nh� th� th�ch ��ch m�i thu�c c�ng ngon mi�ng ��ch vi chua , nh�p kh�u thu�n c�ng n�ng n�c , u�ng sau cam tho�i m�i v� tr��ng . ")
		elseif (i == 4) then
			Talk(1,"","T�u qu�  Qu� Ch�u mao ��i , r��u ch�t tinh l��ng trong su�t , h�i c� m�u v�ng , t��ng h��ng thu�n ph�c u �c , l�m ng��i ta say m� , s��ng nghi ng� kh�ng u�ng , m�i th�m x�ng v�o m�i , vui v� s��ng u�ng , mi�ng ��y sinh h��ng , u�ng sau ly kh�ng , l�u h��ng l�n h�n , k�o d�i kh�ng ti�u tan . kh�u v� u nh� nh�n nh�i , r��u th� ��y ��n thu�n h��ng , tr� v� ch� du tr��ng , mao h��ng kh�ng d�t . ")
		elseif (i == 5) then
			Talk(1,"","T�u qu�  t�u qu� ta tr�n ��i l�n nh�t t�m nguy�n ch�nh l� u�ng li�n thi�n h� r��u ngon , ch� c�n c� th� ��t n�y t�m nguy�n , d� ch�t kh�ng ti�c . ")
		else
			Talk(1,"","T�u qu�  ph�i bi�t , ph�m r��u ch�nh l� cu�c s�ng m�t lo�i ch� cao ��ch c�nh gi�i , ai  n�i ng��i c�ng kh�ng hi�u . ")
		end
	end
end;
