-- �ٰ���·�ˡ�л��ү
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","T� ��i gia  ta kia �u ph�c th�t kh�ng c� l�i n�i , so v�i m�nh ��ch h�n khu� n� c�n ph�i h�n , ng�y h�m qua ta �� th��ng phong , c� ch�t n�ng r�n l�n , c�i n�y kh�ng , n�ng li�n mua cho ta thu�c �i . ")
end;
