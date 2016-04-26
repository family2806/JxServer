-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc\\golditem.lua")
Include("\\script\\missions\\yandibaozang\\npc\\yandituteng.lua")
Include("\\script\\missions\\yandibaozang\\yandiduihuan.lua")
--YDBZ_DATE_START = 13	--	开始时间
--YDBZ_DATE_END = 23		--	结束时间
ID_PRISONMAN = 96; 		-- 判断是否在坐牢的 ID
function main()
--	Say("该功能暂时被关闭了",0)
--	do return end
--	if gb_GetModule("YANDIBAOZANG_TALK") ~= 1 then
--		Say("对不起，此功能暂时关闭，开放时间敬请关注官方公告。",0)
--		return
--	end
	local tbarytalk = {
	"<dec><npc>闯新关口的方法，新内容，新boss，新地图，数不清的奇珍异宝，很适合只在炎帝宝藏才有的黄金装备。阁下装备好了吗?",
	"看组队情况/YDBZ_view_player",
--	"炎帝黄金图谱兑换/YDBZ_golditem",
--	"炎帝图腾兑换/YDBZ_tradeYandiTuTeng",
--	"我想换炎帝令旗YDBZ_tradeYandiLingQi",
--	"我想换玄猿令/YDBZ_tradeXuanYuanLing",
--	"我要重铸炎帝黄金装备/yandiduihuan_main",
--	"重铸炎帝黄金装备说明/yandiduihuan_shuoming",
	"炎帝宝藏出处/YDBZ_about",
	"我只想随便玩玩/NoChoice",
	}
	if YDBZ_check_ready_state() == 1 then
		tinsert(tbarytalk,2,"报名参加/YDBZ_want_play")
		tinsert(tbarytalk,3,"参战成员/YDBZ_member_play")
	end
	CreateTaskSay(tbarytalk)
end

function YDBZ_check_ready_state()
	OldSubWorld = SubWorld
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if state == 1 then
				SubWorld = OldSubWorld
				return 1
			end
		end
	end
	SubWorld = OldSubWorld
	return 0
end
function YDBZ_member_play()
	if YDBZ_checkLimit2() == 1 then
		return
	end
	YDBZ_dragon_mem_join()
end
function YDBZ_view_player()
	if YDBZ_checkLimit() == 1 then
		return
	end
	Say("阁下的组队符合进入炎帝宝藏的条件",0)
end

function YDBZ_checkLimit2()
	if GetCamp() == 0 then
			Say("你的组队有成员未加入门派，不能参加活动.",0)
			return 1
	end 
	if GetTeamSize() ~= 0 then
		Say("需要返回组队进入炎帝宝藏的门口，目前不能组队",0)
		return 1
	end
	if (GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then
		Say("等级不够参加活动",0)
		return 1
	end
		
	--检查信物
	local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--物品
	local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
	local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

	local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
	local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
	
	local g = YDBZ_LIMIT_ITEM[1][1]									--物品
	local d = YDBZ_LIMIT_ITEM[1][2]
	local p = YDBZ_LIMIT_ITEM[1][3]

	local numzimu = CalcItemCount(3,g,d,p,-1)
	local numbeibao = CalcItemCount(23,g,d,p,-1)
	if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
		Say("阁下没带英雄帖，不能参加炎帝争夺.",0)
		return 1
	end
	
	--检测参加上限
	local nweek = tonumber(GetLocalDate("%W"))			--次数
	local nday = tonumber(GetLocalDate("%d"))
	local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
	local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
	local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
	local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

	if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
			Say("本周你已参加够需要的次数了.",0)
			return 1
	elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
			Say("当日参加的次数已达最高值.",0)
			return 1
	end
	if nweek ~= noldweek then
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
	end
	if nday ~= noldday then
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
	end

	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
	
end

-- 检查英雄帖或者炎帝令参加炎帝性能- Modified - by AnhHH 20110725
function YDBZ_checkLimit()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		local tbarytalk ={
			"<dec><npc>参加炎帝宝藏闯关活动需要由队长报名才能进入.",
			"知道了/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	if (GetTeamSize() < YDBZ_TEAM_COUNT_LIMIT or GetTeamSize() > YDBZ_TEAM_COUNT_MAXLIMIT) then
		local tbarytalk ={
			"<dec><npc>组队参加炎帝宝藏最少需要<color=red>"..YDBZ_TEAM_COUNT_LIMIT.."<color> 人且不能超过<color=red>"..YDBZ_TEAM_COUNT_MAXLIMIT.."<color>. 目前组队内人数不符合要求.",
			"知道了/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	local tbplay = {}
	local noplaylv = 0
	local noitem = 0
	local nocount = 0
	local nsignweekday = 0
	local tbstr = {{},{},{},{}}
	local szstr = ""
	local	nAcc = 0
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		if GetCamp() == 0 then
			PlayerIndex = oldplayer
			Say("你的组队有成员未加入门派，不能参加活动.",0)
			return 1
		end 
		--检查等级
		if(GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then		--等级
			noplaylv = noplaylv + 1
			tbstr[1][noplaylv] = "<color=yellow>"..GetName().."<color>"
		end
		
		--检查信物
		local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--物品
		local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
		local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

		local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
		local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)		
		
		local g = YDBZ_LIMIT_ITEM[1][1]									--物品
		local d = YDBZ_LIMIT_ITEM[1][2]
		local p = YDBZ_LIMIT_ITEM[1][3]

		local numzimu = CalcItemCount(3,g,d,p,-1)
		local numbeibao = CalcItemCount(23,g,d,p,-1)
		--print(ndnumzimu + ndnumbeibao)
--		if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
--			noitem = noitem + 1
--			tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
--		end
		
		--检测参加上限
		local nweek = tonumber(GetLocalDate("%W"))			--次数
		local nday = tonumber(GetLocalDate("%d"))
		local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
		local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
		local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
		local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

		if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 1
		elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 2
		end
		if nweek ~= noldweek then
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
		end
		if nday ~= noldday then
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
		end

		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
		
		if (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) == 0) then
		--改变炎帝报名方式, 第一次可以使用英雄帖或者炎帝令- Modified By DinhHQ - 20120206
			if ((numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2]) then
				noitem = noitem + 1
				tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
			end
		elseif (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) >= 1 and YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) <= 3) then
			if ((ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2])then
				nAcc = nAcc + 1
				tbstr[4][nAcc] = "<color=yellow>"..GetName().."<color>"
			end
		end
	end
	
	PlayerIndex = oldplayer
	if noplaylv > 0 then
		local szstr1 = tbstr[1][1]
		for i=2,noplaylv do 
			szstr1 = szstr1 .. ", " .. tbstr[1][i]
		end
		szstr = szstr .. format("玩家 %s 在对内还未达到等级%s.",szstr1,YDBZ_LIMIT_PLAYER_LEVEL)
	end
	if noitem > 0 then
		local szstr1 = tbstr[2][1]
		for i=2,noitem do 
			szstr1 = szstr1 .. ", " .. tbstr[2][i]
		end
		szstr = szstr .. format("玩家 %s 没有带%s.",szstr1,YDBZ_LIMIT_ITEM[3])
	end
	if nocount > 0 then
		local szstr1 = tbstr[3][1]
		for i=2,nocount do 
			szstr1 = szstr1 .. ", " .. tbstr[3][i]
		end
		if nsignweekday == 1 then
			szstr = szstr .. format("玩家 %s 本周内参加次数达到 <color=yellow>%s 次<color>, 不能参加闯关活动",szstr1,YDBZ_LIMIT_WEEK_COUNT)	
		elseif nsignweekday == 2 then
			szstr = szstr .. format("玩家 %s 当日参加次数达到 <color=yellow>%s 次<color>, 不能参加此次活动.",szstr1,YDBZ_LIMIT_DAY_COUNT)	
		end
	end
	if (nAcc > 0) then
		local szstr1 = tbstr[4][1]
		for i = 2, nAcc do 
			szstr1 = szstr1 .. ", " .. tbstr[4][i]
		end
		szstr = szstr .. format("玩家 %s 没有带%s.",szstr1,YDBZ_LIMIT_DOUBEL_ITEM[3])
	end
	
	if noplaylv + noitem + nAcc +nocount > 0 then
		Msg2Team(szstr);
		Say(szstr,0)
		return 1 	
	end
	return 0
end
function YDBZ_want_play()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	--if YDBZ_checkLimit2() == 1 then
		--return		
	--end
	if YDBZ_checkLimit() == 1  then
		return
	end
	PlayerIndex = OldPlayer
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			--print(sub)
			local state = GetMissionV(YDBZ_READY_STATE)
			--print(state)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1) then
				if GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT and GetMissionV(YDBZ_READY_TEAM_MAX) < 100 then
					freeboat = freeboat + 1
				end
			end
			--if (state > 1) then
				--Say("姑娘：本城区炎帝宝藏已经开始，要想参加请留意下次开始时间。",0)
				--return
			--end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local	strlevel = "炎帝宝藏闯关"
	if (startboat == 1) then
		if (freeboat == 0) then
			local tbarytalk ={
			"<dec><npc>城内区域"..strlevel.." 已开始, 没有空位了.",
			"知道了/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		else
			local tbarytalk ={
			-- 更换通知栏显示 - Modified - by AnhHH 20110725
			"<dec><npc>城内区域"..strlevel.." 进入报名阶段, 开始时，每个成员需要交<color=red>"..YDBZ_LIMIT_ITEM[2].." 个"..YDBZ_LIMIT_ITEM[3].."<color>. 从第二次，每个成员要交<color=red>"..YDBZ_LIMIT_DOUBEL_ITEM[2].." 个"..YDBZ_LIMIT_DOUBEL_ITEM[3].."<color>, 大侠想参加?",
			"是的，我想带领我的队参加./YDBZ_dragon_join",
			"不用/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		end
	else
		local tbarytalk ={
			"<dec><npc>对不起, 城内区域"..strlevel.."目前没有任何炎帝宝藏任务可以参加。开始从<color=red>14:00 到 24:00<color>, 请注意通知并提前5分钟报名.",
			"知道了/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return
	end

end

function YDBZ_dragon_join()
	if YDBZ_checkLimit() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			 
			if ( state == 1 and GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT ) then
					
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					--print("plal"..tabplayer[i])
				end

				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(YDBZ_READY_SIGNUP_WORLD, w)
				SetMissionV(YDBZ_READY_SIGNUP_POSX, x)
				SetMissionV(YDBZ_READY_SIGNUP_POSY, y)
				local nteammax = GetMissionV(YDBZ_READY_TEAM_MAX)
				--print(nteammax)
				SetMissionV(YDBZ_READY_TEAM,GetMissionV(YDBZ_READY_TEAM) + 1)
				SetMissionV(YDBZ_READY_TEAM_MAX,(nteammax + 1))
				local szteamname = GetName()
				SetMissionS((nteammax + 1),szteamname)
				
							
				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					--print("player"..PlayerIndex)
					
					-- 在这里判断是否有越狱企图
					w,x,y = GetWorldPos();
					if GetTask(ID_PRISONMAN)>100 or w==208 then
						SetPK(10);
						Msg2Player("<color=red>你因为有想越狱的意图，被加重刑罚<color><color=yellow>PK 变成10!<color>");
						for i=1, 3 do
							Msg2SubWorld("<color=yellow>玩家: <color><color=green>"..GetName().."<color><color=yellow> 有越狱的意图，被衙差当场抓到，同时增加刑罚。通告全天下。<color>!");
						end;
					else
						SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
						YDBZ_ready_joinmap(PlayerIndex)				
					end;
				end
				BuildATeam(1,0,tabplayer)
				SubWorld = sub
				Msg2MSAll(YDBZ_READY_MISSION,format("<color=blue>чi %s <color> 进入炎帝宝藏大门",szteamname))
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "炎帝宝藏闯关"
	Say(format("目前<color=red>%s<color> 没有空位了. 等下次吧", strlevel),0);
end


function YDBZ_dragon_mem_join()
	if YDBZ_checkLimit2() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if ( state == 1 ) then
				if GetTask(YDBZ_MISSIOM_PLAYER_KEY) ~=  GetMissionV(YDBZ_MISSION_KEY) then
					Say("大侠的组队不足这次闯关内.",0)
					return
				end
				local ngroup = GetTask(YDBZ_TEAMS_TASKID)
				--SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
				if GetMSPlayerCount(YDBZ_READY_MISSION,ngroup) == 0 then
					Say("进入炎帝宝藏的大门没有大侠的组队，请组队报名参加",0)
					return
				end
				YDBZ_ready_joinmap(PlayerIndex)
				SubWorld = sub
				local idx = 0;
				local ncapter = 0;
				local pidx;
				local tbplayer = {}
				for nj = 1, 10 do
					idx , pidx = GetNextPlayer(YDBZ_READY_MISSION, idx, ngroup);
					if (pidx > 0) then
							tbplayer[nj] = pidx
							PlayerIndex = pidx
							if GetName() == GetMissionS(ngroup) then
									ncapter = nj
							end
					end;
					if (idx <= 0) then
						break;
					end;
				end
				if ncapter > 0 then
					tbplayer[1],tbplayer[ncapter] = tbplayer[ncapter],tbplayer[1]
				end
				BuildATeam(1,0,tbplayer)
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "炎帝闯关宝藏"
	Say(format("目前<color=red>%s<color> 没有空位了. 等下次吧", strlevel),0);
	
end

function YDBZ_about()
	-- 改变参加报名的通知-Modifiled by AnhHH - 20110802
	Say(format(" 闯新关口的方法，新内容，新boss，新地图，数不清的奇珍异宝，很适合只在炎帝宝藏才有的黄金装备。 <enter>每天 %s, 请提前5分钟到萍萍姑娘那里报名.", "14:25, 16:25, 18:25, 20:25, 22:25"),0)
	
end