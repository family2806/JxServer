-- �ٰ���·�ˡ���Ա��
-- by��Dan_Deng(2003-09-16)
-- edit by С�˶��
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("Hoa vi�n ngo�i: Trung thu �� ��n, ch� c�n thu th�p �� 6 <color=red>m�nh tranh V�n Du<color> �� h�p th�nh 1 b�c tranh ho�n ch�nh mang ��n cho ta, ta s� t�ng l�i ��i hi�p 1 b�nh <color=red>C�ng Nguy�t Ph� Dung<color>.",2,"��i b�nh C�ng Nguy�t Ph� Dung/makeItemUI","Nh�n ti�n gh� qua th�i/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Hoa vi�n ngo�i  ta tuy kh�ng ph�i l� ng��i trong quan tr��ng , nh�ng l� trong tri�u ��i vi�n c�ng c�ng ta qu� m�c th�c , ch� c�n c� b�c , c�n s� kh�ng l�m ���c chuy�n ? ")
		else
			Talk(1,"","Hoa vi�n ngo�i  ng��i ng��i c�ng mu�n l�m quan , ph�i bi�t s� �� gian hi�m , kia c�ng ���c v�i ta nh� v�y ti�u dao t� t�i ")
		end
	end
end;
