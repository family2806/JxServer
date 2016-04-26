Include("\\script\\vng_lib\\files_lib.lua")
IncludeLib("SETTING")
local tbVngFactionName = 
{
[-1]="δ����",
 [0]="������",
 [1]="������",
 [2]="����",
 [3]="�嶾��",
 [4]="������",
 [5]="������",
 [6]="ؤ��",
 [7]="���̽�",
 [8]="�䵱��",
 [9]="������",
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