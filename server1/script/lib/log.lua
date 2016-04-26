IncludeLib("ITEM");

local tbFactionNumber2Name = 
{
-- [-1]="��������",
[-1]="��������",
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

function _WritePlayerLog(szTitle, szMsg)
	
	local szTime = GetLocalDate("%H:%M\t%d/%m/%Y")		
	local szLog = format("[%s]\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s",
		szTitle,
		szTime,
		GetServerName(),			-- ����������
		GetAccount(),		-- �ʺ�
		GetName(),			-- ��ɫ��
		GetLastFactionNumber(),		-- ����
		GetLevel(),			-- �ȼ�
		GetTong(),			-- ���
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
		GetLocalDate("%H:%M") or "",		-- ʱ��	
		GetLocalDate("%d/%m/%Y") or "",		-- ����
		GetServerName(),					-- ������
		GetAccount() or "",					-- �ʺ�
		GetName() or "",					-- ����
		%tbFactionNumber2Name[GetLastFactionNumber()] or "",				-- ����
		GetLevel() or 0,					-- �ȼ�
		GetTongName() or "",				-- ���
		szKeyLog or "",
		unpack(arg)						-- ���ݲ�ͬ�����Ҫ����Ĳ���
	
	)
end
	