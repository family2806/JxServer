Include("\\script\\vng_lib\\files_lib.lua")
IncludeLib("SETTING")
local tbVngFactionName = 
{
[-1]="未入派",
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
tbVngTransLog = {}
tbVngTransLog.strFolder = "vng_data/Logs/"

function tbVngTransLog:Write(strEventFolder, nPromotionID, ...)
	local strFilePath = self.strFolder..strEventFolder
	local strFileName = GetLocalDate("%Y_%m_%d_").."TransLog.txt"
	local tbLog2Write = {
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		GetAccount() or "",
		GetName() or "",
		GetLevel() or 0,
		ST_GetTransLifeCount(),
		%tbVngFactionName[GetLastFactionNumber()] or "",
		GetWorldPos() or 0,
		nPromotionID,		
	}
	for i = 1, getn(arg) do
		tinsert(tbLog2Write, arg[i])
	end
	%tbVngLib_File:Table2File(strFilePath, strFileName, "a", tbLog2Write)
end