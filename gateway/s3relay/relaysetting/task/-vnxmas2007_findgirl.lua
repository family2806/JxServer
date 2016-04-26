--圣诞活动，找寻圣诞少女
--2007-11-24
--by 小浪多多

Include("\\RelaySetting\\Task\\vnxmas2007_head.lua")

function TaskShedule()
	TaskName("找寻圣诞少女活动");
	TaskInterval(20);
	local tb_xmas_time = tb_xmas2007_strattime
	local nhour = tonumber(date("%H"))
	local nstarth = 0
	if nhour >= 23 then
		nstarth = 8
	else
		for ni,nh in tb_xmas_time do
			if nh >= nhour then
				nstarth = nh
				break
			end
		end
	end
	local nmin = xmas2007_findgirl_returnmin()
	if nmin == 60 then
		nstarth = nstarth + 1
		nmin = 0
	end
	TaskTime(nstarth, nmin)
	OutputMsg(format("找寻圣诞少女活动时间为 %s:%s...",nstarth,nmin))
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"))
	if ndate < 07120800 or ndate > 08011324 then
		return 
	end
	local nhm = tonumber(date("%H%M"))
	
	if nhm >= 800 and nhm <= 900 then
		--通过pass
	elseif nhm >= 1500 and nhm <= 1600 then
		--通过pass
	elseif nhm >= 2200 and nhm <= 2300 then
		--通过pass
	else
		return
	end
	local ni = 0
	local tbmap = {}
	for nmapid,nitem in tb_xmas2007_city do
			ni = ni + 1
			tbmap[ni] = nmapid 
	end
	tbmap = YDBZ_get_randomlist(tbmap,ni)
	for ngirl=1,3 do 
		local selectmapid = tbmap[ngirl]
		GlobalExecute(format("dwf \\script\\event\\vnchristmas2007\\findgirl\\findgirl.lua xmars2007_findgirl([[%s]],[[%s]])",ngirl,selectmapid));
	end
	local szMsg = format("[寻找神秘少女]圣诞少女白儿，冬儿，雪儿已出现，快去见冰儿报名参加活动.")
	GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
end
function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
