--  GetGlbValue(9)  ��¼ʱ��hour
--  GetGlbValue(8)  ��¼��ȡ����
--  GetTask(615)    ��¼һСʱ���Ƿ��������
--  ʥ����������ÿСʱÿ̨��������13�����ÿ��ÿСʱֻ����ȡһ��
--  �˻��12��22�ճ�����1��11��


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("����ʥ��������һ��Ը��ͻȻ�������϶���һ����������Ķ���",2,"������˼���������ƿ�/present","�һ���ר����Ը��/no")
	else
		Say("��ң���Ư����ʥ����ѽ�����������Ըһ����ʵ�֣�",0)
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
		AddLocalNews("* * *ʥ����������ʥ�����Ϸ��˺ö������ҿ�ȥ����ѽ* * *")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("* * *ʥ����������ʥ�����Ϸ��˺ö������ҿ�ȥ����ѽ* * *")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("��Ҫ̰��Ŷ���ѻ����ø��������Ѱ�",0)
	else
		Say("�ö���գ�۾ͱ������ˣ���һ��Сʱ����������������",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("�ۣ���һ��õ�廨Ŷ����Ҫ�����͸�������ˡ�")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("�ף���һ���̻�Ҳ�������Ÿ���ҿ��ɡ�")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("Ŷ����һ����ɽ��¶�أ���Ը���ܸ��Ҵ������ˡ�")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("����һ���ٹ�¶��������Ҫ���ء�")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("����һ���𻨾��ޣ���Ҫȥ������һ���������ζ�ľƣ�")
	end

end

function no()
end
