Include("\\script\\activitysys\\config\\1005\\main_func.lua")
function main(nItemIdx)
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "���²��������μӽ�Ŀ.")
		return 1
	end
	if tbPVLB_Check:CheckTime() ~= 1 then
		Talk(1, "", "Ŀǰ���ǽ�Ŀ����ʱ��.")
		return 1
	end
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return 1
	end
	tbPVLB_Main:MainDialog()
	return 1
end