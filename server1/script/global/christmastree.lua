--  GetGlbValue(9)  记录时间hour
--  GetGlbValue(8)  记录领取次数
--  GetTask(615)    记录一小时内是否有领过奖
--  圣诞树送礼活动，每小时每台服务器送13个礼物，每人每小时只能领取一个
--  此活动从12月22日持续到1月11日


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("你在圣诞树许了一个愿，突然发现树上多了一个闪闪发光的东西",2,"真有意思，我来瞧瞧看/present","我还是专心许愿吧/no")
	else
		Say("玩家：好漂亮的圣诞树呀，在这里许的愿一定能实现！",0)
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
		AddLocalNews("* * *圣诞老人又在圣诞树上放了好多礼物，大家快去看看呀* * *")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("* * *圣诞老人又在圣诞树上放了好多礼物，大家快去看看呀* * *")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("不要贪心哦，把机会让给其他朋友吧",0)
	else
		Say("好东西眨眼就被抢完了，请一个小时后再来试试运气吧",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("哇！是一朵玫瑰花哦，我要把它送给我最爱的人。")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("咦！是一个烟花也，我来放给大家看吧。")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("哦？是一个天山玉露呢，但愿它能给我带来好运。")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("哈！一个百果露，我正需要它呢。")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("啊？一个桂花酒噢，我要去找朋友一起分享这美味的酒！")
	end

end

function no()
end
