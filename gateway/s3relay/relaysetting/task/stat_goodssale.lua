-- 定时统计数据

--------------------------------------------------------------------------
-- 统计战队信息
LGTYPE_STATINFO 			= 10000 -- 战队类型
LGNAME_STAT_GOODS_SALE 		= "stat_goodssale" -- 战队名称
LOGNAME_GOODS_SALE			= "Logs/stat_goodssale_"

---------------------------------------------------------
-- 统计项目任务变量ID定义
LG_STATITEM_TASKID_TOTAL	= 0; -- 总统计记数(LeagueMember TaskID)
LG_STATITEM_TASKID_TODAY	= 1; -- 当天统计记数(LeagueMember TaskID)
-- 1 ~ 12 12个月份的统计记数
	-- 2005年：501~512
	-- 2006年：601~612

--LG_STAT_TASKID_CURDATE		= 0; -- 当前统计日期(League TaskID)
--------------------------------------------------------------------------

function TaskShedule()
	TaskName("销售物品统计 ");
	
	-- 8*60分钟一次
	TaskInterval(8*60);
	
	-- 不设TaskTme, 则是Relay启动时就开始
	-- 0点00分开始
	TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	--OutputMsg("启动物品销售统计...");
end

function TaskContent()
	local logName = LOGNAME_GOODS_SALE..date("%Y%m%d%H%M%s")..".log";
	local szMsg = "";
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE)
	if (nLeagueID == 0) then
		--szMsg = "[Error]NotFound StatInfo:"..LGNAME_STAT_GOODS_SALE;
		--WriteStringToFile(logName, szMsg);
		return 0;
	end
	
	-- tab head
	szMsg = "ItemName\tTotal\tToDay\r\n" -- 物品名	总统计	当天统计
	WriteStringToFile(logName, szMsg);
			
	local nMemberCount = LG_GetMemberCount(nLeagueID);
	if (nMemberCount <= 0) then
		return 0;
	end
	
	OutputMsg("统计物品数量:"..nMemberCount);
	local i = 0;
	for i = 0, nMemberCount-1 do
		local szMemberName, nJob = LG_GetMemberInfo(nLeagueID, i);
		local nTotal = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TOTAL);
		local nToDay = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TODAY);
		
		szMsg = szMemberName.."\t"..nTotal.."\t"..nToDay.."\r\n"; -- 物品名	总统计	当天统计
		OutputMsg("统计物品数量:"..szMsg);
		WriteStringToFile(logName, szMsg);
	end	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
