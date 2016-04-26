STARTHOUR = 20;
STARTMIN = 0;

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--设置方案名称
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 20点00分开战
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id  Account|RoleName

function TaskContent()
	OutputMsg("----------------取黄金彩票GoldLottery ---------------------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) ~= 820) then
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	RecordString = szMainString.."0819" 
	ResultString = szResultString.."0819"
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0,0,"ii")
	
	if (result > 0 ) then
		OutputMsg("黄金彩票中奖ID 08-19 "..P2.."-"..P1)
		NotifySDBRecordChanged(ResultString, 0, 0, 1)
	else
		GenGoldLottery(RecordString, ResultString)
	end

	OutputMsg("--------------------------------------------");
end

function GenGoldLottery(RdString, RsString)
	nCount , key1, key2 = GetRecordCount(RdString,0,0,0,0);
	OutputMsg("GoldLottery Count "..nCount);
	if (nCount > 0) then
		nRand =	random(1, nCount)
		bFound , P1,P2 = GetRecordInfoFromNO(RdString, 0, 0, 0, 0, nRand)
		if(bFound == 1) then
			bResult , m = GetCustomDataFromSDB(RdString, P1, P2, "i");		
			str = format("黄金彩票奖励ID为 %d-%d", P1, P2);
			success = SaveCustomDataToSDBOw(RsString , 0, 0, "ii", P1,P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			strNews = format("dw AddLocalNews ( [ [黄金彩票中奖在%d 日 %d 月已开，号码为[%d-%d]. 请中奖玩家快去礼官处领奖!]], 1) ", P2,P1)
			GlobalExecute(strNews);
			OutputMsg(str);
		else
			OutputMsg("检查资料有误，未找到中奖者")
		end
	else
		OutputMsg("无人中奖，所以没有奖励.")
	end
end;
