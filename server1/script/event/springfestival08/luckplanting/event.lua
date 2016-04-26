-- �ļ�������event.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-16 10:57:44
--��ȡ�ص�: �������١��������ߴ���е������ȡ
--Ҫ��ÿ��ÿ�˺�ֻ����ȡ4��
--��ȡʱ��: ÿ��21��00 �C 22��00
--��ȡʱ��: �� 2008��02��02�� �C 2008��03��02�� 24��00
--ʹ��ʱ��: �� 2008��02��02�� �C 2008��03��02�� 24��00
Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\pay.lua")

local _FormatTimeHMToSring = function(nTimeHM)
	local nMinute = floor(nTimeHM / 100)
	local nSecond = mod(nTimeHM , 100)
	szMsg = format("%02d:%02d", nMinute, nSecond)
	return szMsg
end
function luckplanting_0801_main()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	local nTimeHM	= tonumber(GetLocalDate("%H%M"))
	local nTSKV		= GetTask(TSK_luckplanting_0801)
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	if luckplanting_0801_CheckMap() ~= 1 then
		Say("������˼������Ҳ�������������ǵ����ִ����ʰ�.", 0)
		return 0;
	end
	
	--ÿ��21��00 �C 22��00
	if nTimeHM < luckplanting_0801_GiveTime_S or nTimeHM > luckplanting_0801_GiveTime_E then
		Say(format("ÿ�� %s - %s�ŷַ�����y.",%_FormatTimeHMToSring(luckplanting_0801_GiveTime_S), %_FormatTimeHMToSring(luckplanting_0801_GiveTime_E)),  0)
		return 0;
	end
	
	if GetLevel() < 80 or IsCharged() == 0 then
		Say("������˼����ĵȼ���δ��80������/���߻�δ��ֵ.", 0)
		return 0;
	end
	
	
	if not luckplanting_0801_IsActDay() then
		Say(format("�<color=yellow>%s<color>��û��ʼ.",luckplanting_0801_szActName), 0)
		return 0;
	end
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --���㲢����ʱ��
	end
	if mod(nTSKV,256) >= TSKV_luckplanting_0801 then --����
		Say(format("��������쵽<color=yellow>%d<color> ��, ����������.", TSKV_luckplanting_0801), 0)
		return 0;
	end
	local tbItem = {szName="C�y con", tbProp={6, 1, 1642, 1, 0, 0}, nExpiredTime = 20090105}
	tbAwardTemplet:GiveAwardByList(tbItem, "luckplanting")
	
	SetTask(TSK_luckplanting_0801, nTSKV+1);
end

function luckplanting_0801_IsActDay()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	return nDate >= luckplanting_0801_Time_S and nDate <= luckplanting_0801_Time_E and tbWeek[nWeek]
end

function luckplanting_0801_CheckMap()
	local tbCityMap = 
	{
		[174]	=1,
		[121]	=1,
		[153]	=1,
		[101]	=1,
		[99]	=1,
		[100]	=1,
		[20]	=1,
		[53]	=1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)]
end
         