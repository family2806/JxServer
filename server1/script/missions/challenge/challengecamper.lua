--CheckCondition() 需要该函数用于检查是否符合加入条件

Include("\\script\\missions\\challenge\\challengehead.lua");

function main()

	V = GetMissionV(MS_STATE);
	
	--如果报名阶段的话，通知剩余时间
	--如果战斗阶段的话，通知战斗剩余时间
	if (V == 1) then 
		V1 = GetMissionV(MS_NEWSVALUE);
		RestTime = (GO_TIME - V1) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		str = "<#> 赛场处于报名阶段，报名时间还剩:"..RestMin.."<#>分"..RestSec.."<#>秒";
		Msg2Player(str);
	elseif(V == 2) then
		gametime = (floor(GetMSRestTime(MISSIONID,11) / 18));
		RestMin, RestSec = GetMinAndSec(gametime);
		str = "<#>赛场处于战斗阶段，战斗时间还有:"..RestMin.."<#>分"..RestSec.."<#>秒";
		Msg2Player(str);
	end
	
	--扩展点6的值如果为1，表示该角色属于战区管理员。可以向Npc拿入场道具
	if (GetExtPoint(6) == 1 or GetCamp() == 6 ) then 
		Say("兄台是这里战场的管理人，我有什么可以帮你吗？", 7 ,  "拿起黄方的武器/GetYellow", "拿起紫方的武器/GetPurple" , "那请你旁边的武器/GetWhite", "丢弃你身上的所有武器/ClearItems", "上战场/GoWarCenter", "离开战场/LeaveCenter",  "我想一想/OnCancel");
		return
	end;
	
	--报名阶段	
	if (V == 1) then
		HaveCamp1 = HaveItem(350);--黄方
		HaveCamp2 = HaveItem(347);--紫方
		HaveCamp3 = HaveItem(348);--记者
		
		--如果没有任何的入场道具的话
		if (HaveCamp1 == 0 and HaveCamp2 == 0 and HaveCamp3 == 0) then 
			Say("你没有任何一种'英雄令牌'，不能进去!", 0)
			return
		end;
		if (GetTeamSize() == 0)  then
			Say("你还未组队，不能进去!",0);
			return
		end;
		
		str1 = "<#> 你的队伍有"..GetTeamSize().."<#>人! 你想加入哪边?";
		Say(str1 ,4, "我想加入黄方/JoinYellow", "我想加入紫方/JoinPurple", "我想进去参观/JoinWhite", "让我想一想/OnCancle");
	
	elseif (V == 2) then --开战阶段
		HaveCamp3 = HaveItem(348);
		if (HaveCamp3 == 1) then
			Say("你现在有叶绿英雄令. 想要参战还是离开?", 3, "到赛场中心/GoWarCenter", "离开赛场/LeaveWar", "让我想一想/OnCancel");
		end;
	elseif (V == 0) then
		Say("这次报名挑战的时间还没有到",0);
	end;
	
end;

function ClearItems()
	ClearItem(347);
	ClearItem(348);
	ClearItem(350);
end;

function ClearItem(ItemId)

Count = GetItemCount(ItemId);
if (Count >= 1) then
	for i = 1, Count do 
		DelItem(ItemId)
	end;
end;

end;


function JoinYellow()
	if (HaveItem(350) >= 1) then
		CheckAndJoinCamp(1)		
	else
		Say("你没有暗黄英雄令，不能进去!",0);
	end;
end;

function JoinPurple()
	if (HaveItem(347) >= 1) then
		CheckAndJoinCamp(2)		
	else
		Say("你没有血红英雄令，不能进去!",0);
	end;
end;

function JoinWhite()
	if (HaveItem(348) >= 1) then 
		CheckAndJoinCamp(6)
	else
		Say("你没有叶绿英雄令，不能进去!", 0);
	end;
end;


function GetYellow()
	AddEventItem(350);
end;

function GetPurple()
	AddEventItem(347);
end;

function GetWhite()
	AddEventItem(348);
end;


function OnCancel()

end;

function GoWarCenter()
	AddMSPlayer(MISSIONID, 6);
	SetCurCamp(0)
	NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3]);
end;

function LeaveCenter()
	LeaveGame(0)	
	SetCurCamp(GetCamp())
end;


function CheckAndJoinCamp(Camp)
	
	if (IsCaptain() == 0) then
		Say("你还没有组队或者不是队长，不能进入! ",0);
		return
	else
		bHaveJoin = GetMissionV(MS_S_JOINED + Camp - 1);
		if (bHaveJoin == 1) then 
			Say("现在已经有另一个队使用同一个颜色的英雄令参战了", 0);
		return
		end;
	end;
				
	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT) then
		Say("你队的人数超过限定，请调整下再进去!" , 0);
		return
	else
		OldPlayer = PlayerIndex;
		W,X,Y = GetWorldPos();
		Size = GetTeamSize();
		
		for i = 1, Size do 
			PIdx = GetTeamMember(i);
			if (PIdx > 0) then 
				PlayerIndex = PIdx;
				W1,X,Y = GetWorldPos();
				if (W1 ~= W) then 
					PlayerIndex = OldPlayer
					Say("你队里现在有一个人不在准备区，请调整之后再进去比赛!",0);
					return
				end;
			end
		end;
		
		PlayerIndex = OldPlayer;
		
		if (Camp == 1) then 
			DelItem(350);
		elseif (Camp == 2) then 
			DelItem(347)
		else
			DelItem(348)
		end

		JoinCampInTeam(Camp);
	end;
	
end;

function JoinCampInTeam(Camp)
	OldPlayer = PlayerIndex;
	local TeamTab = {};
	Size = GetTeamSize();
	Joined = 0;
	for i = 1, Size do 
		TeamTab[i] = GetTeamMember(i);
	end;
	for i = 1, Size do
		PlayerIndex = TeamTab[i];		
		if (Camp ~= 6 and GetLevel() < 30) then 
			Msg2MSAll(MISSIONID, GetName().."<#> 没有超过30级，不能参加!");
		else
			Joined = Joined + 1;
			JoinCamp(Camp)
		end;
	end;
	if (Joined >= 1) then
		SetMissionV(MS_S_JOINED + Camp - 1, 1);	
	end;

	PlayerIndex = OldPlayer;
	
end;
