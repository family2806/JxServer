Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")
function main(nItemIndex)
	local nCount = 48
	
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		Talk(1, "", "����ʱ����Ϣ����ʹ�øõ���")
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1  then
		Talk(1, "", "120���ѳ�ֵ�߲���ʹ��")
		return 1
	end
	
	
	
	
	local nLeagueId = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(nLeagueId)) then
		Talk(1, "", "������δ����ս��.")
		return 1
	end
	local szLeagueName = LG_GetLeagueInfo( nLeagueId ) 
	
	 LG_GetMemberInfo(nLeagueId, 0)
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_TOTAL) < nCount then
		Talk(1, "", "ֻ�����48����������ʹ��.")
		return 1
	end
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_USE_LingQi_COUNT) >= 18 then
		
		Talk(1, "", format("ÿ�ֱ���ֻ��ʹ��%d�õ���", 18))
		return 1
	end
	
	if LG_GetMemberTask(WLLS_LGTYPE, szLeagueName,  GetName(), WLLS_LGMTASK_JOB) ~= 1 then
		
		Talk(1, "", "ֻ�������ӳ�����ʹ��.")
		return 1	
	end
	
	
	
	
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, szLeagueName, WLLS_LGTASK_USE_LingQi_COUNT, 1)
	Talk(1, "", format("������ʹ��Ѫս���죬Ŀǰ���¿��Զ�μ�%d ��", 4))
end