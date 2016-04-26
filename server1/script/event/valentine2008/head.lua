TSK_valentine2008_CollectLimit		= 1962;
TSK_valentine2008_CollectMaxLimit	= 1963;
TSK_valentine2008_ComposeExpLimit	= 1964
TSK_valentine2008_CollectExpLimit	= 1965
TSKV_valentine2008_CollectDayLimit	= 300; --活动期间，每天拾取月光宝盒数目
TSKV_valentine2008_CollectMaxLimit	= 500; --活动期间最大拾取月光宝盒数目
TSKV_valentine2008_ComposeExpLimit	= 50000000 --活动期间，玩家使用「蝴蝶簪」和「鸳鸯帕」最多可以获得5000W经验
TSKV_valentine2008_CollectExpLimit	= 20000000 --活动期间，每人通过拾取 “月下老人”获得的经验最多2000w经验。
valentine2008_Date_S = 080212;
valentine2008_Date_E = 080229; --1.	蝴蝶簪、鸳鸯帕，使用截止期到2008年2月29日24：00。
valentine2008_GetItemDate_E = 080215
valentine2008_szActName = "2008年情人节"
--2008年02月12日维修后～2008年02月１5日维护前
function valentine2008_isActPeriod()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	return nDate >= valentine2008_Date_S and nDate <= valentine2008_Date_E
end

function valentine2008_isGetItemPeriod()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	return nDate >= valentine2008_Date_S and nDate <= valentine2008_GetItemDate_E
end