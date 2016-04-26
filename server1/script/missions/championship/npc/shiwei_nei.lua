Include("\\script\\missions\\championship\\head.lua")
--会场侍卫
RUN_A_TIME = 5
UP_A_TIME = 15
function main()
	local mm = RUN_A_TIME - GetMissionV(5)
	if (mm < 0) then
		local mm = UP_A_TIME - GetMissionV(5)
		Say("<#>会场侍卫: 这局比赛还有"..mm.."<#>分, 你还有什么事情吗?", 3,"门派预选赛帮助/help_tryout","我想离开这里!/out_trap","不需要!/OnCancel")
		return
	end
	Say("<#>会场侍卫: 这局比赛还有"..mm.."<#> 分将开始, 你还有什么事情吗?", 3,"门派预选赛帮助/help_tryout","我想离开这里!/out_trap","不需要!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#>会场侍卫:现在离开的话要等到下一场，你确定要离开吗? ", 2, "我想离开!/sure_trap", "不需要!/OnCancel")
		return
	end
	Say("这局比赛立即开始，你还要弃权吗?", 2,"我想离开!/sure_trap", "不需要!/OnCancel")
end;

function sure_trap()
	if (nt_gettask(CP_TASKID_ENEMY) > 0) then
		return
	end
	camp = GetCamp();
	SetCurCamp(camp);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetFightState(0)
	SetPunish(1)
	ForbidChangePK(0);
	SetPKFlag(0)
	tryout_mapid = SubWorldIdx2ID(SubWorld)
	Msg2Player("你已离开预选赛")
	DelMSPlayer(18, PlayerIndex, 1)
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
end
