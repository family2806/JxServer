--  GetGlbValue(9)  ��¼ʱ��hour
--  GetGlbValue(8)  ��¼��ȡ����
--  GetTask(615)    ��¼һСʱ���Ƿ��������
--  ʥ����������ÿСʱÿ̨��������13�����ÿ��ÿСʱֻ����ȡһ��
--  �˻��12��22�ճ�����1��11��


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("Ng��i � ��y c�y gi�ng sinh cho ph�p m�t nguy�n , ��t nhi�n ph�t hi�n tr�n c�y nhi�u m�t chi�u l�p l�nh ��ch �� ",2,"Th�t bi�t �i�u , ta ��n xem nh�n nh�n /present","Ta c�n l� chuy�n t�m h�a nguy�n �i /no")
	else
		Say("Nh� ch�i  th�t l� ��p ��ch c�y gi�ng sinh nha , � ch� n�y cho ph�p ��ch nguy�n nh�t ��nh c� th� th�c hi�n ",0)
	end

end

function present()

	local nLastTime = GetGlbValue(9)
	local nQuantity = GetGlbValue(8)
	local Utask615 = GetTask(615)
	local nHour = tonumber( date( "%m%d%H" ) )
	local nMinute = tonumber( date( "%M") )
	
	if ( nLastTime == 0 and mod( nHour , 100 ) ~= 0 and nMinute < 30 ) then
		SetGlbValue(9,nHour - 1)
		SetGlbValue(8,0)
		AddLocalNews("* * * �ng gi� n� en l�i �ang c�y gi�ng sinh th��ng th� th�t l� nhi�u l� v�t , m�i ng��i mau �i xem m�t ch�t nha * * *")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("* * * �ng gi� n� en l�i �ang c�y gi�ng sinh th��ng th� th�t l� nhi�u l� v�t , m�i ng��i mau �i xem m�t ch�t nha * * *")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("Kh�ng mu�n l�ng tham nga , �em c� h�i nh��ng cho nh�ng b�ng h�u kh�c �i ",0)
	else
		Say("Th� t�t nh�y m�t li�n b� c��p xong r�i , xin/m�i m�t canh gi� sau tr� l�i th� m�t ch�t v�n kh� �i ",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("Oa  l� m�t ��a hoa h�ng nga , ta mu�n �em n� ��a cho ta th�ch nh�t ng��i c�a . ")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("Di  l� m�t ph�o b�ng c�ng , ta t�i �� cho m�i ng��i xem �i . ")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("Nga ? l� m�t Thi�n S�n ng�c l� ��y , ch� mong n� c� th� cho ta mang ��n may m�n . ")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("H�c  m�t tr�m qu� l� , ta �ang c�n n� ��y . ")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("A ? m�t hoa qu� r��u oh , ta mu�n �i t�m b�ng h�u c�ng nhau chia x� c�i n�y m� v� ��ch r��u ")
	end

end

function no()
end
