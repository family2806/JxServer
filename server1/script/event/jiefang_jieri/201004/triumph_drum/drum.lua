-- ������
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\drum_npc.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\global\\judgeoffline_limit.lua");
IncludeLib("TONG");

function main(nItemIndex)
	return tbTriumphDrum:OnUse(nItemIndex);
end

-- ʹ��
function tbTriumphDrum:OnUse(nItemIndex)
	
	-- �����
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		Msg2Player("��Ϊ�ڷ�ʱ��������Կ����Ļ���");
		return 0;
	end
	
	-- �ȼ�����
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"��λ�ĵȼ�������",  "������./Cancel",});
		return 1;
	end 
	
	-- û�а��
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		CreateTaskSay({"��λ��δ������!",  "������./Cancel",});
		return 1;
	end
	
	-- û��ְλ
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		CreateTaskSay({"�������ǰ������߳���!",  "������./Cancel",});
		return 1;
	end
	
	-- ս��״̬
	if GetFightState() == 1 then
		CreateTaskSay({"���ڷ�ս����ʹ��!",  "������./Cancel",});
		return 1;
	end
	
	-- ��������
	if offlineCheckPermitRegion() ~= 1 then
		CreateTaskSay({"�������ٵĵ���ʹ��!",  "������./Cancel",});
		return 1;
	end	
	
	-- ��ʹ��ʱ��
	local nTime = tonumber(GetLocalDate("%H%M"));
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		CreateTaskSay({"���ڻʱ��ʹ��!",  "������./Cancel",});
		return 1;
	end
	
	-- �������ʹ�ù�
	local nTask_LastUseDay = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay);
	local nTask_BeUsed = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	
	if nCurDay ~= nTask_LastUseDay then 
		nTask_LastUseDay = nCurDay;
		nTask_BeUsed = 0;
	end
	
	if nTask_BeUsed >= self.nLimit_DayUse then
		CreateTaskSay({"�Ѿ���������ʹ�õĽ���",  "������./Cancel",});
		return 1;		
	end
	
	nTask_BeUsed = nTask_BeUsed + 1;
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay, nTask_LastUseDay);
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed, nTask_BeUsed);
	
	-- ���ֹ�
	tbDrumNpc:New(szTongName, nTongId);
	return 0;
end
