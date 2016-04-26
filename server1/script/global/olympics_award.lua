GLBID_GOLD_COUNT = 3;					--全局变量ID of 上一时段中国队获得的金牌数
GLBID_SILVER_COUNT = 4;					--全局变量ID of 上一时段中国队获得的银牌数
GLBID_BRONZE_COUNT = 5;					--全局变量ID of 上一时段中国队获得的银牌数
EXTPOINT_LAST_AWARD_DATETIME = 6;		--扩展点ID of 玩家上次领取礼品的时间

--领奖时间段 ( { 起始时间， 结束时间 } 时间格式为HHMM )
aryAwardTime = { { 1000, 1400 }, { 1900, 2000 }, { 2300, 2400 } };

--"全局变量ID of 奖牌数"的数组
arynMedalCountGlbID = { GLBID_GOLD_COUNT, GLBID_SILVER_COUNT, GLBID_BRONZE_COUNT };

--奖品数组
aryAwardItem = {{ "仙草露", {6,1,71,1,0,0,0} },	--金牌奖品
				{ "白驹丸", {6,1,74,1,0,0,0} },	--银牌奖品
				{ "烟花", {6,0,11,1,0,0,0} }};	--铜牌奖品
				
--奥运送礼	返回值（3个） 金牌数，银牌数，铜牌数； 若金牌数为负数 -1:未充卡  -2:当前不是领奖时间  -3:已领过奖
function olympics_Award()
	--未充卡
	if( IsCharged() ~= 1 ) then
		return -1;
	end
	
	local nCurrTime = tonumber( date( "%H%M" ) );
	local nAwardTimeCount = getn( aryAwardTime );
	local nCurrTimeIndex = -1;
	
	for i = 1, nAwardTimeCount do
		if( aryAwardTime[i][1] <= nCurrTime and nCurrTime < aryAwardTime[i][2] ) then
			nCurrTimeIndex = i;
			break;
		end
	end
	
	--当前不是领奖时间
	if( nCurrTimeIndex == -1 ) then
		return -2;
	end	
	
	local nCurrAwardDateTime = tonumber( date( "%m%d" )..nCurrTimeIndex );
	local nLastAwardDateTime = GetExtPoint( EXTPOINT_LAST_AWARD_DATETIME );
	
	if( nCurrAwardDateTime == nLastAwardDateTime ) then
		--已领过奖
		return -3;
	else
		local nMedalRankCount = getn( arynMedalCountGlbID );
		local arynMedalCount = {};
		
		for i = 1, nMedalRankCount do
			arynMedalCount[i] = GetGlbValue( arynMedalCountGlbID[i] );
			for j =1, arynMedalCount[i] do
				AddItem( aryAwardItem[i][2][1], aryAwardItem[i][2][2], aryAwardItem[i][2][3], aryAwardItem[i][2][4], aryAwardItem[i][2][5], aryAwardItem[i][2][6] , aryAwardItem[i][2][7]);
			end
			if( arynMedalCount[i] > 0 ) then
				Msg2Player( "你获得了"..arynMedalCount[i].."个"..aryAwardItem[i][1] );
			end
		end		
		
		--设置领奖标志
		if( nCurrAwardDateTime > nLastAwardDateTime and ( arynMedalCount[1] > 0 or arynMedalCount[2] > 0 or arynMedalCount[3] > 0 ) ) then
			AddExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nCurrAwardDateTime - nLastAwardDateTime );
		else
			PayExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nLastAwardDateTime - nCurrAwardDateTime );
		end
				
		return arynMedalCount[1], arynMedalCount[2], arynMedalCount[3];
	end	
end

--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end