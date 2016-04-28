Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")
function main(nItemIndex)
	local nCount = 48
	
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		Talk(1, "", " Vâ L©m liªn ®Êu ®ang nghØ kh«ng thÓ sö dông ®¹o cô ")
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1  then
		Talk(1, "", "CÊp 120 míi cã thÓ sö dông ")
		return 1
	end
	
	
	
	
	local nLeagueId = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(nLeagueId)) then
		Talk(1, "", "§¹i hiÖp cßn ch­a gia nhËp chiÕn ®éi .")
		return 1
	end
	local szLeagueName = LG_GetLeagueInfo( nLeagueId ) 
	
	 LG_GetMemberInfo(nLeagueId, 0)
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_TOTAL) < nCount then
		Talk(1, "", "ChØ cã hoµn thµnh 48 trµng liªn cuéc so tµi míi cã thÓ sö dông .")
		return 1
	end
	
	if LG_GetLeagueTask(nLeagueId, WLLS_LGTASK_USE_LingQi_COUNT) >= 18 then
		
		Talk(1, "", format("Mçi ®æi phiªn tranh tµi chØ cã thÓ sö dông %d nªn ®¹o cô ", 18))
		return 1
	end
	
	if LG_GetMemberTask(WLLS_LGTYPE, szLeagueName,  GetName(), WLLS_LGMTASK_JOB) ~= 1 then
		
		Talk(1, "", "ChØ cã liªn cuéc so tµi ®éi tr­ëng míi cã thÓ sö dông .")
		return 1	
	end
	
	
	
	
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, szLeagueName, WLLS_LGTASK_USE_LingQi_COUNT, 1)
	Talk(1, "", format("§¹i hiÖp ®· sö dông huyÕt chiÕn lÖnh kú , tr­íc m¾t c¸c h¹ cã thÓ nhiÒu tham gia %d trµng ", 4))
end