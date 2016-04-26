--  GetGlbValue(9)  记录时间hour
--  GetGlbValue(8)  记录领取次数
--  GetTask(615)    记录一小时内是否有领过奖
--  圣诞树送礼活动，每小时每台服务器送13个礼物，每人每小时只能领取一个
--  此活动从12月22日持续到1月11日


function main()

	--iRand = random(1,300)
	--if ( iRand < 100 ) then
	--	Say("你在圣诞树许了一个愿，突然发现树上多了一个闪闪发光的东西",2,"真有意思，我来瞧瞧看/present","我还是专心许愿吧/no")
	--else
		Say("玩家: 圣诞树真好看！在这许愿肯定会实现!",0)
	--end

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
		AddLocalNews("***圣诞老人在圣诞树上挂了好多礼物，大家赶快去拿!***")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("***圣诞老人在圣诞树上挂了好多礼物，大家赶快去拿!***")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 12 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("不要这么贪心！给别人留点机会!",0)
	else
		Say("好东西一眨眼就被拿完了，1小时后再回来试试好运吧!",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("哦！是一束玫瑰！我想送给爱人.")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("哦！是1个礼花，我要放给大家看.")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("啊！是1瓶天山宝露！希望它可以给我带来好运.")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("哇！1瓶白果露，我正好需要它!")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("啊！1瓶桂花酒。我要找个朋友对饮!")
	end

end

function no()
end
