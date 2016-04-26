

function TaskShedule()
	--设置方案名称
	TaskName("走马花灯活动 ")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(30) --30分钟一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("走马花灯活动 ");
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	if nDate < 080905 or nDate > 081005 then --2008年09月05日至2008年10月5日24点
		return
	end
	
	local flag = 0
	if (nTime >= 1900 and nTime <= 1902) or (nTime >= 2130 and nTime <= 2132) then
		flag = 1
	elseif (nWeek == 5 or nWeek == 6 or nWeek == 0) and (nTime >= 1100 and nTime <= 1102) then
		flag = 1
	elseif (nTime >= 2000 and nTime <= 2002) or (nTime >= 2230 and nTime <= 2232) then
		flag = 2
	elseif (nWeek == 5 or nWeek == 6 or nWeek == 0) and (nTime >= 1200 and nTime <= 1202) then
		flag = 2
	end
	
	
	
	if flag == 1 then
		local tbMap = 
		{
			{nId = 121, szName = "龙门镇", tbPos = { {226,275}, {276,282} } },
			{nId = 100, szName = "朱仙镇", tbPos = { {183,203}, {229,190} } },
			{nId = 101, szName = "稻香村", tbPos = { {171,198}, {232,205} } },
			{nId = 174, szName = "龙泉村", tbPos = { {218,192}, {183,211} } },
			{nId = 53, szName = "巴陵县", tbPos = { {220,200}, {207,182} } },
			{nId = 20, szName = "江津村", tbPos = { {432,359}, {438,396} } },
			{nId = 153, szName = "石鼓镇", tbPos = { {232,180}, {189,223} } },
			{nId = 99, szName = "永乐镇", tbPos = { {189, 223}, {224,206} } },
		}
		local nMapCount = getn(tbMap)
		for i=1, 4 do
			local nIdx = random(1,nMapCount+1-i);
			
			
			local tbFnagxiang = 
			{
				[1] = "东走马灯",
				[2] = "西走马灯 ",
				[3] = "南走马灯",
				[4] = "北走马灯",
			}
			local nPosIdx = random(1, getn(tbMap[nIdx].tbPos))
			local nX = tbMap[nIdx].tbPos[nPosIdx][1] * 8
			local nY = tbMap[nIdx].tbPos[nPosIdx][2] * 16
			
			local szExec = format("dwf \\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\callnpc.lua zhongqiu0808_CallBoss(%d, %d, %d, %d, %d)", tbMap[nIdx].nId, nX, nY, i ,tonumber(nTaskState..i))
			OutputMsg(szExec);
			GlobalExecute(szExec)
			tbMap[nMapCount+1-i], tbMap[nIdx] = tbMap[nIdx], tbMap[nMapCount+1-i] --把选中的放到后面
		end		
		local szMsg = "东西南北走马灯已经出现，请各位大侠参加点灯."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	elseif flag == 2 then
		local szMsg = "走马灯点灯活动已经结束，祝各位大侠下次更加幸运."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg(szMsg);
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


