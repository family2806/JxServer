Include("\\script\\event\\shengdan_jieri\\200911\\plant.lua")

TIME_START	= 1800		-- 活动时间从18:00开始
TIME_END	= 2300		-- 活动时间在23:00结束
DATE_START	= 091216	-- 活动开始日期
DATE_END	= 100125	-- 活动结束日期

function main()
	local CurrentDate = tonumber(GetLocalDate("%y%m%d"))
	local CurrentTime = tonumber(GetLocalDate("%H%M"))
	if (CurrentDate < DATE_START) then
		Msg2Player("装饰圣诞树活动还未开始嘛.")
		return 1
	elseif (CurrentDate >= DATE_END) then
		Msg2Player("装饰圣诞树活动已结束.")
		return 1
	elseif (CurrentTime < TIME_START or CurrentTime >= TIME_END) then
		Msg2Player("装饰圣诞树活动从每天的18:00到23:00进行.")
		return 1
	elseif (CheckCondition() == 0 or PlantTree() == 0) then
		return 1
	else
		return 0
	end
end

