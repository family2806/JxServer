-- ����·�ˡ�����Ӣ
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(187) == 1 then
		allbrother_0801_FindNpcTaskDialog(187)
		return 0;
	end
	Talk(3,"","Trong nh� �ang c� kh�ch, ta �i mua v�i con c� Nh� H�i t��i s�ng v� l�m m�t m�n c� ��i l�.","��ng r�i! Mua th�m m�t �t nguy�n li�u nh� n�m h��ng, ng�c lan phi�n, m�c nh�, t�m kim c�u.")
end;
