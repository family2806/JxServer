-- �ٰ���ְ�ܡ�����
-- by��Dan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)������ɫ���ƽ�װ������

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc> c�n n�y th� r�n c�a h�ng l� t� ta t� ph� kia ��ng l�a l�u l�i , �� c� ch�t ni�m ��u , � n�i n�y tr��c khi an trong th�nh c�ng h�i c� m�ng t�n , xin h�i mu�n mua ch�t g� nha ? ";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--�������׿�
end;

