-- �ٰ���ְ�ܡ��Ƶ��ϰ�
-- by��Dan_Deng(2003-09-16)

function main()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Qu�n r��u l�o b�n  m�i kh�ch quan b�n trong ng�i , mu�n u�ng ch�t g� r��u ? ")
	elseif (i == 1) then
		Talk(1,"","Qu�n r��u l�o b�n  ch�ng ta tr��c khi an th�nh s�n t�n r��u , h�ng n�m r��u thu� c�ng v� c� n��c th� nh�t . ch�ng ta tr��c khi an ��ch r��u c�ng n�i kh�c b�t ��ng , ch�ng c�t r��u ��ch ngu�n n��c ��n t� v�i T�y h� , v� v�y nh�p kh�u h�t s�c thanh li�t cam tho�i m�i . ")
	else
		Talk(1,"","Qu�n r��u l�o b�n  ch�ng ta T�y ti�n l�u t� n�i danh r��u g�i l� � t�y t� ng�c c�t � , kh�ch quan c� mu�n hay kh�ng n�m th� m�t ch�t ? ")
	end
end;
