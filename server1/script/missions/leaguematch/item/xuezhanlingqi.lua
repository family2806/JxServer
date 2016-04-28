Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")
function main(nItemIndex)
	local nCount = 48
	
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		Talk(1, "", " V� L�m li�n ��u �ang ngh� kh�ng th� s� d�ng ��o c� ")
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1  then
		Talk(1, "", "C�p 120 m�i c� th� s� d�ng ")
		return 1
	end
	
	
	
	
	local nLeagueId = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(nLeagueId)) then
		Talk(1, "", "��i hi�p c�n ch�a gia nh�p chi�n ��i .")
		return 1
	end
	local szLeagueName = LG_GetLeagueInfo( nLeagueId ) 
	
	 LG_GetMemberInfo(nLeagueId, 0)
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_TOTAL) < nCount then
		Talk(1, "", "Ch� c� ho�n th�nh 48 tr�ng li�n cu�c so t�i m�i c� th� s� d�ng .")
		return 1
	end
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_USE_LingQi_COUNT) >= 18 then
		
		Talk(1, "", format("M�i ��i phi�n tranh t�i ch� c� th� s� d�ng %d n�n ��o c� ", 18))
		return 1
	end
	
	if LG_GetMemberTask(WLLS_LGTYPE, szLeagueName,  GetName(), WLLS_LGMTASK_JOB) ~= 1 then
		
		Talk(1, "", "Ch� c� li�n cu�c so t�i ��i tr��ng m�i c� th� s� d�ng .")
		return 1	
	end
	
	
	
	
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, szLeagueName, WLLS_LGTASK_USE_LingQi_COUNT, 1)
	Talk(1, "", format("��i hi�p �� s� d�ng huy�t chi�n l�nh k� , tr��c m�t c�c h� c� th� nhi�u tham gia %d tr�ng ", 4))
end