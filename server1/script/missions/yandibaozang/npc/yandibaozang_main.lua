-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc\\golditem.lua")
Include("\\script\\missions\\yandibaozang\\npc\\yandituteng.lua")
Include("\\script\\missions\\yandibaozang\\yandiduihuan.lua")
--YDBZ_DATE_START = 13	--	��ʼʱ��
--YDBZ_DATE_END = 23		--	����ʱ��
ID_PRISONMAN = 96; 		-- �ж��Ƿ������ε� ID
function main()
--	Say("�ù�����ʱ���ر���",0)
--	do return end
--	if gb_GetModule("YANDIBAOZANG_TALK") ~= 1 then
--		Say("�Բ��𣬴˹�����ʱ�رգ�����ʱ�侴���ע�ٷ����档",0)
--		return
--	end
	local tbarytalk = {
	"<dec><npc>���¹ؿڵķ����������ݣ���boss���µ�ͼ��������������챦�����ʺ�ֻ���׵۱��ز��еĻƽ�װ��������װ��������?",
	"��������/YDBZ_view_player",
--	"�׵ۻƽ�ͼ�׶һ�/YDBZ_golditem",
--	"�׵�ͼ�ڶһ�/YDBZ_tradeYandiTuTeng",
--	"���뻻�׵�����YDBZ_tradeYandiLingQi",
--	"���뻻��Գ��/YDBZ_tradeXuanYuanLing",
--	"��Ҫ�����׵ۻƽ�װ��/yandiduihuan_main",
--	"�����׵ۻƽ�װ��˵��/yandiduihuan_shuoming",
	"�׵۱��س���/YDBZ_about",
	"��ֻ���������/NoChoice",
	}
	if YDBZ_check_ready_state() == 1 then
		tinsert(tbarytalk,2,"�����μ�/YDBZ_want_play")
		tinsert(tbarytalk,3,"��ս��Ա/YDBZ_member_play")
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
	Say("���µ���ӷ��Ͻ����׵۱��ص�������",0)
end

function YDBZ_checkLimit2()
	if GetCamp() == 0 then
			Say("�������г�Աδ�������ɣ����ܲμӻ.",0)
			return 1
	end 
	if GetTeamSize() ~= 0 then
		Say("��Ҫ������ӽ����׵۱��ص��ſڣ�Ŀǰ�������",0)
		return 1
	end
	if (GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then
		Say("�ȼ������μӻ",0)
		return 1
	end
		
	--�������
	local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
	local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
	local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

	local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
	local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
	
	local g = YDBZ_LIMIT_ITEM[1][1]									--��Ʒ
	local d = YDBZ_LIMIT_ITEM[1][2]
	local p = YDBZ_LIMIT_ITEM[1][3]

	local numzimu = CalcItemCount(3,g,d,p,-1)
	local numbeibao = CalcItemCount(23,g,d,p,-1)
	if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
		Say("����û��Ӣ���������ܲμ��׵�����.",0)
		return 1
	end
	
	--���μ�����
	local nweek = tonumber(GetLocalDate("%W"))			--����
	local nday = tonumber(GetLocalDate("%d"))
	local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
	local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
	local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
	local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

	if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
			Say("�������Ѳμӹ���Ҫ�Ĵ�����.",0)
			return 1
	elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
			Say("���ղμӵĴ����Ѵ����ֵ.",0)
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

-- ���Ӣ���������׵���μ��׵�����- Modified - by AnhHH 20110725
function YDBZ_checkLimit()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		local tbarytalk ={
			"<dec><npc>�μ��׵۱��ش��ػ��Ҫ�ɶӳ��������ܽ���.",
			"֪����/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	if (GetTeamSize() < YDBZ_TEAM_COUNT_LIMIT or GetTeamSize() > YDBZ_TEAM_COUNT_MAXLIMIT) then
		local tbarytalk ={
			"<dec><npc>��Ӳμ��׵۱���������Ҫ<color=red>"..YDBZ_TEAM_COUNT_LIMIT.."<color> ���Ҳ��ܳ���<color=red>"..YDBZ_TEAM_COUNT_MAXLIMIT.."<color>. Ŀǰ���������������Ҫ��.",
			"֪����/NoChoice",
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
			Say("�������г�Աδ�������ɣ����ܲμӻ.",0)
			return 1
		end 
		--���ȼ�
		if(GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then		--�ȼ�
			noplaylv = noplaylv + 1
			tbstr[1][noplaylv] = "<color=yellow>"..GetName().."<color>"
		end
		
		--�������
		local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
		local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
		local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

		local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
		local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)		
		
		local g = YDBZ_LIMIT_ITEM[1][1]									--��Ʒ
		local d = YDBZ_LIMIT_ITEM[1][2]
		local p = YDBZ_LIMIT_ITEM[1][3]

		local numzimu = CalcItemCount(3,g,d,p,-1)
		local numbeibao = CalcItemCount(23,g,d,p,-1)
		--print(ndnumzimu + ndnumbeibao)
--		if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
--			noitem = noitem + 1
--			tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
--		end
		
		--���μ�����
		local nweek = tonumber(GetLocalDate("%W"))			--����
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
		--�ı��׵۱�����ʽ��, ��һ�ο���ʹ��Ӣ���������׵���- Modified By DinhHQ - 20120206
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
		szstr = szstr .. format("��� %s �ڶ��ڻ�δ�ﵽ�ȼ�%s.",szstr1,YDBZ_LIMIT_PLAYER_LEVEL)
	end
	if noitem > 0 then
		local szstr1 = tbstr[2][1]
		for i=2,noitem do 
			szstr1 = szstr1 .. ", " .. tbstr[2][i]
		end
		szstr = szstr .. format("��� %s û�д�%s.",szstr1,YDBZ_LIMIT_ITEM[3])
	end
	if nocount > 0 then
		local szstr1 = tbstr[3][1]
		for i=2,nocount do 
			szstr1 = szstr1 .. ", " .. tbstr[3][i]
		end
		if nsignweekday == 1 then
			szstr = szstr .. format("��� %s �����ڲμӴ����ﵽ <color=yellow>%s ��<color>, ���ܲμӴ��ػ",szstr1,YDBZ_LIMIT_WEEK_COUNT)	
		elseif nsignweekday == 2 then
			szstr = szstr .. format("��� %s ���ղμӴ����ﵽ <color=yellow>%s ��<color>, ���ܲμӴ˴λ.",szstr1,YDBZ_LIMIT_DAY_COUNT)	
		end
	end
	if (nAcc > 0) then
		local szstr1 = tbstr[4][1]
		for i = 2, nAcc do 
			szstr1 = szstr1 .. ", " .. tbstr[4][i]
		end
		szstr = szstr .. format("��� %s û�д�%s.",szstr1,YDBZ_LIMIT_DOUBEL_ITEM[3])
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
				--Say("����������׵۱����Ѿ���ʼ��Ҫ��μ��������´ο�ʼʱ�䡣",0)
				--return
			--end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local	strlevel = "�׵۱��ش���"
	if (startboat == 1) then
		if (freeboat == 0) then
			local tbarytalk ={
			"<dec><npc>��������"..strlevel.." �ѿ�ʼ, û�п�λ��.",
			"֪����/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		else
			local tbarytalk ={
			-- ����֪ͨ����ʾ - Modified - by AnhHH 20110725
			"<dec><npc>��������"..strlevel.." ���뱨���׶�, ��ʼʱ��ÿ����Ա��Ҫ��<color=red>"..YDBZ_LIMIT_ITEM[2].." ��"..YDBZ_LIMIT_ITEM[3].."<color>. �ӵڶ��Σ�ÿ����ԱҪ��<color=red>"..YDBZ_LIMIT_DOUBEL_ITEM[2].." ��"..YDBZ_LIMIT_DOUBEL_ITEM[3].."<color>, ������μ�?",
			"�ǵģ���������ҵĶӲμ�./YDBZ_dragon_join",
			"����/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		end
	else
		local tbarytalk ={
			"<dec><npc>�Բ���, ��������"..strlevel.."Ŀǰû���κ��׵۱���������Բμӡ���ʼ��<color=red>14:00 �� 24:00<color>, ��ע��֪ͨ����ǰ5���ӱ���.",
			"֪����/NoChoice",
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
					
					-- �������ж��Ƿ���Խ����ͼ
					w,x,y = GetWorldPos();
					if GetTask(ID_PRISONMAN)>100 or w==208 then
						SetPK(10);
						Msg2Player("<color=red>����Ϊ����Խ������ͼ���������̷�<color><color=yellow>PK ���10!<color>");
						for i=1, 3 do
							Msg2SubWorld("<color=yellow>���: <color><color=green>"..GetName().."<color><color=yellow> ��Խ������ͼ�����ò��ץ����ͬʱ�����̷���ͨ��ȫ���¡�<color>!");
						end;
					else
						SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
						YDBZ_ready_joinmap(PlayerIndex)				
					end;
				end
				BuildATeam(1,0,tabplayer)
				SubWorld = sub
				Msg2MSAll(YDBZ_READY_MISSION,format("<color=blue>��i %s <color> �����׵۱��ش��Ů�",szteamname))
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "�׵۱��ش���"
	Say(format("Ŀǰ<color=red>%s<color> û�п�λ��. ���´ΰ�", strlevel),0);
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
					Say("��������Ӳ�����δ�����.",0)
					return
				end
				local ngroup = GetTask(YDBZ_TEAMS_TASKID)
				--SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
				if GetMSPlayerCount(YDBZ_READY_MISSION,ngroup) == 0 then
					Say("�����׵۱��صĴ���û�д�������ӣ�����ӱ����μ�",0)
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
	local	strlevel = "�׵۴��ر���"
	Say(format("Ŀǰ<color=red>%s<color> û�п�λ��. ���´ΰ�", strlevel),0);
	
end

function YDBZ_about()
	-- �ı�μӱ�����֪ͨ-Modifiled by AnhHH - 20110802
	Say(format(" ���¹ؿڵķ����������ݣ���boss���µ�ͼ��������������챦�����ʺ�ֻ���׵۱��ز��еĻƽ�װ���� <enter>ÿ�� %s, ����ǰ5���ӵ�ƼƼ�������ﱨ��.", "14:25, 16:25, 18:25, 20:25, 22:25"),0)
	
end