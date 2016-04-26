Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")
function main(nItemIndex)
	local nCount = 48
	
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		Talk(1, "", "联赛时间休息不能使用该道具")
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1  then
		Talk(1, "", "120级已充值者才能使用")
		return 1
	end
	
	
	
	
	local nLeagueId = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(nLeagueId)) then
		Talk(1, "", "大侠还未加入战队.")
		return 1
	end
	local szLeagueName = LG_GetLeagueInfo( nLeagueId ) 
	
	 LG_GetMemberInfo(nLeagueId, 0)
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_TOTAL) < nCount then
		Talk(1, "", "只有完成48场联赛才能使用.")
		return 1
	end
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_USE_LingQi_COUNT) >= 18 then
		
		Talk(1, "", format("每轮比赛只能使用%d该道具", 18))
		return 1
	end
	
	if LG_GetMemberTask(WLLS_LGTYPE, szLeagueName,  GetName(), WLLS_LGMTASK_JOB) ~= 1 then
		
		Talk(1, "", "只有联赛队长才能使用.")
		return 1	
	end
	
	
	
	
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, szLeagueName, WLLS_LGTASK_USE_LingQi_COUNT, 1)
	Talk(1, "", format("大侠已使用血战令旗，目前阁下可以多参加%d 场", 4))
end