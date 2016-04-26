--系统接受登记，排名前十者  - Created by DinhHQ - 20110614
local nStartDate	 = 20110707;
local nCloseDate	 = 20110713;	
function TaskShedule()
	TaskName("Top 10 server - 排名 10h")
	TaskInterval(24 * 60)
	TaskTime(10, 00)
	TaskCountLimit(0)
	OutputMsg("topten server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\vng_feature\\top10\\vngtop10.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("Toplist sorted")
end
