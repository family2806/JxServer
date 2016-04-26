function main()
	return 1
end

--p1 time/1-2 
-- p2 gbl /1-2
-- p3 time /3-4
--p4 gbl /3-4
function GetDesc(nItem)
	
	nP1 = GetItemParam(nItem, 1);

	nP2 = GetItemParam(nItem,2);
	nP3 = GetItemParam(nItem,3);
	nP4 = GetItemParam(nItem,4);
	nP5 = GetItemParam(nItem,5);
	nGlbId = SetByte(nP1, 3, GetByte(nP3,1))
	nGlbId = SetByte(nGlbId, 4, GetByte(nP3,2))
	
	nTime = SetByte(nP2, 3, GetByte(nP4,1))
	nTime= SetByte(nTime, 4, GetByte(nP4,2))


	nEndMonth = mod( floor( nTime/ 100000000 ), 100 );
	nEndDay = mod( floor( nTime/ 1000000 ), 100 );

	if (nP5 ~= 1000) then
		str  = format("<color=Blue> %d月%d日黄金彩票\n编号:%d-%d", nEndMonth, nEndDay,nTime,nGlbId)
	else
		str = format("<color=Yellow> 雅典盛会中国队奖牌数竞猜黄金彩票\n编号:%d-%d,兑奖日期9月1日-9月2日22：30 - 24：00" ,nTime,nGlbId);
		return str
	end

	return str.."\n兑奖时段：雅典盛会活动期间的22:30 --- 24:00";
	
end