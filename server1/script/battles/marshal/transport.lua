IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\marshal\\head.lua")
Include("\\script\\battles\\modified_transport.lua")

--传送员
function main()
	Say("前线侦查: 我是前线侦查, 你有什么要说的尽管说?",2, "送我去前线!/transport", "没问题./cancel");
end

--传送
function transport()
	
	if GetMissionV(MS_TIMER1) < RUNGAME_TIME then 
		Say("前线侦查: 我是前线侦查，战事还未开始，请阁下勿急躁!",1, "我正热血沸腾，奉献区区之力报效祖国!/cancel");
		return
	end
	
	local RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
	if ( RestTime < TIME_PLAYER_REV) then
		Say((TIME_PLAYER_REV - RestTime) .. "秒后您才可以离开后营！请再等一下!", 0)
		return
	end
	
	local nArea = nil;
	local nCamp = BT_GetData(PL_BATTLECAMP);	 
	if nCamp == 1 then
		nArea = BT_GetGameData(GAME_CAMP1AREA);
	else
		nArea = BT_GetGameData(GAME_CAMP2AREA);	
	end	
	tbVNG_Transport:Dialog(nArea)

	 
end

--取消
function cancel()
	return
end