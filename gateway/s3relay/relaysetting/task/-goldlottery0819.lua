STARTHOUR = 20;
STARTMIN = 0;

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--���÷�������
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 20��00�ֿ�ս
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id  Account|RoleName

function TaskContent()
	OutputMsg("----------------ȡ�ƽ��ƱGoldLottery ---------------------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) ~= 820) then
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	RecordString = szMainString.."0819" 
	ResultString = szResultString.."0819"
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0,0,"ii")
	
	if (result > 0 ) then
		OutputMsg("�ƽ��Ʊ�н�ID 08-19 "..P2.."-"..P1)
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
			str = format("�ƽ��Ʊ����IDΪ %d-%d", P1, P2);
			success = SaveCustomDataToSDBOw(RsString , 0, 0, "ii", P1,P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			strNews = format("dw AddLocalNews ( [ [�ƽ��Ʊ�н���%d �� %d ���ѿ�������Ϊ[%d-%d]. ���н���ҿ�ȥ��ٴ��콱!]], 1) ", P2,P1)
			GlobalExecute(strNews);
			OutputMsg(str);
		else
			OutputMsg("�����������δ�ҵ��н���")
		end
	else
		OutputMsg("�����н�������û�н���.")
	end
end;
