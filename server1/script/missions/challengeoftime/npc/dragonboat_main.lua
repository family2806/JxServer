Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\lib\\log.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function want_playboat()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 0
	if (IsCaptain() ~= 1) then
		Say("对不起！只有队长才有资格报名参加‘挑战时间任务’",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say("对不起！参加‘挑战时间任务’最少要有<color=red>4<color> 人!",0)
		return
	end
	if(GetLevel() < 50) then
		Say("对不起！50级以下不能参加‘挑战时间任务.",0);
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if(GetLevel() < 50) then
			Say("对不起！50级以下不能参加‘挑战时间任务.",0);
			Msg2Team("对不起！你的队伍中有人低于50级，不能参加‘挑战时间任务.");
			return
		end
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" 不好意思！你队伍中有人超过<color=red>90级<color>,请检查后再报名!",0)
				Msg2Team("你队伍中有人在90级以上，请检查之后再报名!");
				return
			else
				Say("不好意思！你队伍中有人超过<color=red>90级<color>, 请检查后再报名!",0)
				Msg2Team("你队伍中有人在90级以上，请检查之后再报名!");
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "初级挑战时间任务"
	else
		strlevel = "高级挑战时间任务"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say("此区域"..strlevel.."已开始. 没有地方了",0)
			return
		else
			Say("此区域"..strlevel.."赛龙舟报名阶段，还有<color=red>"..freeboat.."<color>一块免费版图，时间挑战要交<color=red>1 万<color> 银两, 你要参加吗?",2, "是的！我想代理我们队参加./dragon_join", "不需要/onCancel")
			return
		end
	else
		Say("不好意思！此区域"..strlevel.."现在没有挑战时间任务.报名在<color=red>每个整点<color>开始，是".. TIME_SIGNUP .."分，请注意系统通知.",0)
		return
	end
	
end

function dragon_join()
	local blevel = 0
	local havesword = 0
	local nNowDate = tonumber(GetLocalDate("%y%m%d"));
	if (GetLevel() >= 90) then
		blevel = 1
	end
	if(GetTask(1551) == nNowDate) then
		if (GetTask(1550) <= 0) then
			Say("聂弒尘: 今天的挑战任务已经完成了，明天再来吧.",0);
			return
		end
	end
	if (IsCaptain() ~= 1) then
		Say("不好意思！要队长才有资格报名参加挑战时间任务",0)
		return
	end
	if(GetLevel() < 50) then
		Say("不好意思！50级以下不能参加挑战时间任务.",0);
		return
	end
	if (GetTeamSize() < 4) then
		Say("不好意思！参加挑战时间任务’的队最少要有<color=red>4<color> 人!",0)
		return
	end
	
	if (GetCash() < 10000) then
		Say("参加挑战时间任务要<color=red>1万两<color>. 准备够钱再来吧!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
		if(GetTask(1551) == MemberNowDate) then
			if(GetTask(1550) <= 0) then
				Say("每天只能参加1次挑战时间任务。你队参加的次数已经够了！明天再来吧！",0);
				Msg2Team("每天只能参加1次挑战时间任务。你队参加的次数已经够了！明天再来吧！");
				return
			end
		end
		if(GetLevel() < 50) then
			Say("不好意思！50级以下不能参加挑战时间任务.",0);
			Msg2Team("不好意思！你队伍中有人低于50级，不能参加‘挑战时间任务.");
			return
		end
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" 不好意思！你的队伍中有人超过<color=red>90级<color>, 请检查后再报名!",0)
				Msg2Team("你的队伍中有人在90级以上，请检查后再报名!");
				return
			else
				Say("不好意思！你的队伍中有人超过<color=red>90级<color>, 请检查后再报名!",0)
				Msg2Team("你的队伍中有人在90级以上，请检查后再报名!");
				return
			end
		end
		
		havesword = 0
		if (blevel == 0) then
			for i=20,80,10 do
				if(havesword > 1) then
					break
				else
					havesword = CalcEquiproomItemCount( 6, 1, 400, i ) + havesword
				end
			end	
		else
			havesword = CalcEquiproomItemCount( 6, 1, 400, 90 )
		end
		if (havesword < 1 and blevel == 0) then
			Say("聂弒尘: 请见谅，参加初级挑战时间任务的成员要有一个不论90级以上还是以下的五行杀手锏，请准备好之后来见我",0)
			Msg2Team("你的组队中有人没有不论90级以上还是以下的五行杀手锏，请检查之后再报名参加!")
			return
		elseif (havesword < 1 and blevel == 1) then
			Say("聂弒尘: 请见谅，参加高级挑战时间任务的成员要有一个不论90级以上还是以下的五行杀手锏，请准备好之后来见我",0)
			Msg2Team("你的组队有人没有不论90级以上还是以下的五行杀手锏，请检查之后再报名参加!")
			return
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					--print("plal"..tabplayer[i])
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				SetMissionS(VARS_TEAMLEADER_FACTION,GetLastFactionNumber())
				SetMissionS(VARS_TEAMLEADER_GENDER,GetSex())
				
				-- DEBUG
				--print(format("%s从(%d,%d,%d)位置进入时间的挑战任务地图", GetName(), w, x, y));

				Pay(10000)
				

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					
					-- 调整闯关 by wangjingjun 2011.03.01
					if (blevel == 0) then
						for i=20,80,10 do
							if(CalcEquiproomItemCount( 6, 1, 400, i ) > 0) then
								ConsumeEquiproomItem( 1, 6, 1, 400, i)
								break
							end
						end
					else
						ConsumeEquiproomItem( 1, 6, 1, 400, 90)
					end
					
					--print("player"..PlayerIndex)

					-- 在这里判断是否有越狱企图
					w,x,y = GetWorldPos();
					if w==208 then
					else
						local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
						if(GetTask(1551) ~= MemberNowDate) then
							SetTask(1550,COUNT_LIMIT);  
							SetTask(1551,MemberNowDate);					
						end
						SetTask(1550,GetTask(1550)-1);
						JoinMission(MISSION_MATCH, 1)
					end
					
					G_ACTIVITY:OnMessage("SignUpChuangguan", tabplayer[i], blevel + 1)
					--记 log 各种性能 key - Modified By DinhHQ - 20120410
					PlayerFunLib:AddTaskDaily(3079, 1)
					if PlayerFunLib:GetTaskDailyCount(3079) > 1 then
						tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiThuPhi")
					else
						tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiMienPhi")
					end
				end
				
				local ndate = tonumber(GetLocalDate("%H"))
				if ndate <= 22 and ndate >= 10 and blevel == 1 then
					SetMissionV(VARV_BATCH_MODEL,1)
				else
					SetMissionV(VARV_BATCH_MODEL,0)
				end
				
				tbLog:PlayerActionLog("EventChienThang042011","BaoDanhVuotAi")-- 报名日志				
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "初级挑战时间任务"
	else
		strlevel = "高级挑战时间任务"
	end
	Say("不好意思！现在区域 <color=red>"..strlevel.."<color>已经没有位置了. 请等一下!",0)
end