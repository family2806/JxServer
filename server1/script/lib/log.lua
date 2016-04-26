IncludeLib("ITEM");

local tbFactionNumber2Name = 
{
-- [-1]="白名新手",
[-1]="白名新手",
 [0]="少林派",
 [1]="天王帮",
 [2]="唐门",
 [3]="五毒教",
 [4]="峨嵋派",
 [5]="翠烟门",
 [6]="丐帮",
 [7]="天忍教",
 [8]="武当派",
 [9]="昆仑派",
}

function _WritePlayerLog(szTitle, szMsg)
	
	local szTime = GetLocalDate("%H:%M\t%d/%m/%Y")		
	local szLog = format("[%s]\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s",
		szTitle,
		szTime,
		GetServerName(),			-- 服务器名字
		GetAccount(),		-- 帐号
		GetName(),			-- 角色名
		GetLastFactionNumber(),		-- 门派
		GetLevel(),			-- 等级
		GetTong(),			-- 帮会
		szMsg)
	WriteLog(szLog)
end

function getItemInfo(nItemIdx)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIdx);
	local nQuality = GetItemQuality(nItemIdx);
	if (nQuality == 1) then
		nDetailType = GetGlodEqIndex(nItemIdx) - 1;
	end
	local szPlatinaLvl = "nil";
	if (nQuality == 4) then
		szPlatinaLvl = tostring(GetPlatinaLevel(nItemIdx));
		nDetailType = GetPlatinaEquipIndex(nItemIdx) - 1;
	end;
	local arynMagLvl = GetItemAllParams(nItemIdx);
	local szDes = format("{4,%0.0f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d}:%s,GET_TIME:%0.0f,PLA_LVL:%s", 
							ITEM_GetItemRandSeed(nItemIdx), nQuality, 
							nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, 
							arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6],
							GetItemName(nItemIdx),GetItemGenTime(nItemIdx),szPlatinaLvl);
	return szDes;
end;

tbLog = {}
function tbLog:TabFormatLog(...)
	local szLog = arg[1]
	for i=2, getn(arg) do
		szLog = format("%s\t%s", szLog, tostring(arg[i]))
	end
	WriteLog(szLog)
end

IncludeLib("SETTING")

function tbLog:PlayerAwardLog(szEventName, szAction, szAwardName, szCode, nAmount)
	local nTransLifeCount = 0
	if ST_GetTransLifeCount then
		nTransLifeCount = ST_GetTransLifeCount()
	end
	self:TabFormatLog(
		GetAccount() or "",
		GetName() or "",
		szEventName or "",
		GetLevel() or 0,
		nTransLifeCount,
		szAction or "",
		szAwardName or "",
		szCode or "",
		nAmount or 0,
		GetTongName() or "",
		GetWorldPos() or 0
	)
end


function tbLog:PlayerActionLog(szKeyLog, ...)
	self:TabFormatLog(
		GetLocalDate("%H:%M") or "",		-- 时间	
		GetLocalDate("%d/%m/%Y") or "",		-- 日期
		GetServerName(),					-- 服务器
		GetAccount() or "",					-- 帐号
		GetName() or "",					-- 名字
		%tbFactionNumber2Name[GetLastFactionNumber()] or "",				-- 门派
		GetLevel() or 0,					-- 等级
		GetTongName() or "",				-- 帮会
		szKeyLog or "",
		unpack(arg)						-- 根据不同情况需要传入的参数
	
	)
end
	