-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..
Include("\\script\\missions\\yandibaozang\\npc.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\saizi.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
--�������ư�������- Modified By DinhHQ - 20110916
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")

function YDBZ_award(index,ntype,nplayindex)
	local x, y, world = GetNpcPos(index);
	for x1,y1 in YDBZ_tbaward_item[ntype] do
		for i=1,y1[2] do
			local p = random(1,100)
			if p <= y1[1] then
				if y1[4] == 0 then
					DropItem(world, x, y, -1, y1[3][1], y1[3][2], y1[3][3], y1[3][4], y1[3][5], y1[3][6], 0, 0, 0, 0, 0, 0);
				elseif y1[4] == 1 then
						local idx= 0
						local pidx,nj
						
						local oldplayer = PlayerIndex
						PlayerIndex = nplayindex
						YDBZ_DiceDice(y1[3][1],y1[3][2],y1[3][3],20,y1[6])
						PlayerIndex = oldplayer	
				end
			end
		end
	end
end

function YDBZ_fun_award_byCount(nCount, szMsg)
	nCount = nCount or 0
	if nCount <= 0 then
		return 
	end
	local tbAward = {}
	tbAward[1] = YDBZ_tbaward_item_ex[1]
	
	szMsg = szMsg or ""
	local szLogTitle = format("%s award",szMsg)
	tbAwardTemplet:Give(tbAward, nCount, {"YDBZ", szLogTitle})
end

-- 2011.03.23 ��һ�ػ��1�׵۱���
function YDBZ_fun_award_ydmibao(camp, nnpcway)
	--����������Ӱ������� - Modified By DinhHQ - 20110916
	local tbAllPlayers = {}
	
	local idx= 0
	local nCount = 1
	local pidx,nj, nTeamSize = GetTeamSize()
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0 and nCount >= 1) then
			local sMsg = format("���ص�%d",nnpcway)
			G_ACTIVITY:OnMessage("YDBZguoguan", pidx, nnpcway);
			-- ����2,4,6,8,10 �����1���׵۱���� - Modified - by AnhHH 20110724
			if (mod(nnpcway,2) == 0) then
				CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nCount, sMsg)
			end
			
			--�������ư������� - Modified By DinhHQ - 20110916
			tbAllPlayers[getn(tbAllPlayers) + 1] = pidx
			
		end
		if (idx == 0) then
			break
		end
	end
	
	--�������ư�������- Modified By DinhHQ - 20110916
	tbPVLB_PtSpprt:YDBZAward(nnpcway, tbAllPlayers)
end

function YDBZ_fun_award_exp(camp,ns)
	local idx= 0
	local pidx,nj
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
				PlayerIndex = pidx
				if ns == 1 then
					local nexp = YDBZ_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[��Ч�׵���]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s ��ϲ����һ�أ����<color=yellow>%s<color> ����",szdstr,nexp))
				elseif ns == 2 then
					local nexp = YDBZ_Faninl_AWARD_EXP
					local szdstr = ""
					if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
						 nexp = YDBZ_Faninl_AWARD_EXP * 2 
						 szdstr = "<color=yellow>[��Ч�׵���]<color>"
					end
					nexp = YDBZ_checkdoubleexp(nexp)
					AddOwnExp(nexp)
					Msg2Player(format("%s ��ϲ��ӳɹ�ɱ��һ����ŭ����boss ���<color=yellow>%s<color> ����",szdstr,nexp))					
				end
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
end
--���а�
function YDBZ_savepaihang(camp)
	
	local teamname = GetMissionS(camp)
	local nstate = GetMissionV(YDBZ_VARV_STATE)
	local laddertime = YDBZ_LIMIT_FINISH - ( ((nstate-4)* YDBZ_LIMIT_BOARDTIME) + floor(GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH)/18) )
	local bfind = 0
	--print("���а�:"..laddertime.." state:"..nstate.."relast:"..GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH))
	local nteamsum = GetMissionV(YDBZ_TEAM_SUM)
	if nteamsum < 3 then
		return laddertime
	end
	if (laddertime > YDBZ_LIMIT_FINISH or laddertime < 0) then
		return laddertime
	end
	for i = 1, 10 do 
		name , value = Ladder_GetLadderInfo(YDBZ_PAIHANG_ID, i)
		if (name  == teamname) then
			bfind = 1
			if ( laddertime > value) then
				Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime,1)
				break
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(YDBZ_PAIHANG_ID, teamname, laddertime, 1)
	end
	return laddertime
end

-- todo
-- ��40���׵��ر�������䣬�������������
function YDBZ_award_finalboss_ex(camp, nTotalCount)
	local nNum = {}
	local nSize = GetMSPlayerCount(YDBZ_MISSION_MATCH, camp)
	for i = 1, nSize do
		nNum[i] = 1
	end
	
	for i = nSize + 1, nTotalCount do                     
		local p = random(1,nSize)
		nNum[p] = nNum[p] + 1
	end
	print("�������� =" .. nSize)
	local idx, pidx
	for nj = 1, nSize do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx, camp );
		if (pidx > 0 and nNum[nj] >= 1) then
			local szMsg = format("��������")
			print(format("pidx = %d, nNum[nj] = %d", pidx, nNum[nj]))
			CallPlayerFunction(pidx,YDBZ_fun_award_byCount, nNum[nj], szMsg)
		end
		if (idx == 0) then
			break
		end
	end
	
end

function YDBZ_award_finalboss(camp)
	local idx= 0
	local pidx,nj
	local nplaynum = 0
	
	-- ɱ���׵��������boss - Modified - by DinhHQ 20120314
	local tbAward = YDBZ_tbaward_item[4]
	local szLogTitle = "GietBossCuoiTinhNangViemDe"
	local oldplayer = PlayerIndex
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
		if (pidx > 0) then
			PlayerIndex = pidx
			tbAwardTemplet:Give(tbAward, 1, {"YDBZ", szLogTitle})
			nexp = YDBZ_checkdoubleexp(20e6)
			AddOwnExp(nexp)
			Msg2Player(format("<color=yellow>��ϲ����׵۴���, ���<color>%s ����<color=yellow>.<color>",nexp))
		end
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = oldplayer
--	local oldplayer = PlayerIndex
--	for nj = 1, 10 do
--		idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,camp );
--		if (pidx > 0) then
--				PlayerIndex = pidx
--				nplaynum = nplaynum + 1
--				--AddOwnExp(YDBZ_AWARD_EXP)
--				local tbawarditem = {}
--				local y = YDBZ_tbaward_item[4]
--				local nitem = 0
--				for nx,ny in y do 
--					local ncount = 0
--					for i=1,ny[2] do
--						local p = random(1,100)
--						if p <= ny[1] then
--							nitem = nitem + 1
--							local ndoubel = 1
--							if ny[6] == 1 then 
--								if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--									ndoubel = 2 
--								end
--							end
--							for nx =1 ,ndoubel do
--								local nidx = AddItem(ny[3][1], ny[3][2], ny[3][3], ny[3][4], ny[3][5], ny[3][6]);
--								YDBZ_sdl_writeLog("�����׵۱��عؿ�",format("����ʱ���1 %s",GetItemName(nidx)))
--							end
--							ncount = ncount + ndoubel
--							--tbawarditem[nx]={}
--							--tbawarditem[nx][1] = ny[5]
--						end
--					end
--					if ncount > 0 then
--						tbawarditem[nitem] = {}
--						tbawarditem[nitem][1] = ny[5]
--						tbawarditem[nitem][2] = ncount
--					end
--					
--				end
--				local szstr = ", <color=yellow> ���<color>"
--				for nx,ny in tbawarditem do
--					szstr = szstr .. ny[2] .."��"..ny[1]
--					if nx ~= getn(tbawarditem) then
--						szstr = szstr .."<color=yellow>, <color>" 
--					end
--				end
--				local nexp = YDBZ_KILLLASTBOSS_EXP
--				local szdstr = ""
--				if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
--							nexp = YDBZ_KILLLASTBOSS_EXP * 2 
--							szdstr = "<color=yellow>[��Ч�׵���]<color>"
--				end
		--		nexp = YDBZ_checkdoubleexp(nexp)
--				AddOwnExp(nexp)
--				Msg2Player(format("%s<color=yellow>��ϲ����׵۴���, ���<color>%s ���� %s<color=yellow>.<color>",szdstr,nexp,szstr))
--				Msg2Player(format("��ϲ��λ�����ɹ������׵�, <color=yellow>30 ��<color>���Ƴ����ص�ͼ."))
--		end
--		if (idx == 0) then
--			break;
--		end;
--	end
	SetMissionV(YDBZ_STATE_SIGN,4)
	local pname = GetMissionS(camp)
	local nmapid = SubWorldIdx2ID(SubWorld)
	broadcast(format("��ϲ��� %s �ѳɹ������׵�, ����ޱȷ����",pname))
	local ntime = YDBZ_savepaihang(camp)
	--print(pname,nplaynum,nmapid,camp,ntime)
	local szstr = format("[�����׵۱���] ʱ��%s, ս��%s ��ʣ����%s, ��ͼ���� %s, ��ӪΪ%s ɱ���boss��ʣ��ʱ��%s ��",GetLocalDate("%y-%m-%d %H:%M:%S"),pname,nplaynum,nmapid,camp,ntime) 
	WriteLog(szstr)
--	PlayerIndex = oldplayer
	StopMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH);	
	StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE3 * 18)
	--
	--CloseMission(YDBZ_MISSION_MATCH)
end
--1	1 -10 AС��СBoss
--1 11-20 BС��СBoss
--1 21-30 CС��СBoss
--1 40		 �����10��boss
--1 50		 ���մ�boss
--2 1-10		 A��С��С��
--2 11-20		 B��С��С��
--2 21-30		 C��С��С��
function OnDeath(index)
	local oldworld = SubWorld
	local x, y,world = GetNpcPos(index);
	SubWorld = world
	local nband = GetNpcParam(index,1)
	local nband2 = GetNpcParam(index,2)
	--print("mon npc dead! param:"..nband)
	--print("mon npc dead! param2:"..nband2)
	local npccount = 0
	if nband == 0 then												--С��
		local nteam = floor((nband2-1)/10)+1		--����
		local npctype = nband2 - 10*(nteam-1)		--����
		local npcallsum = 0
		--print(nteam,npctype,YDBZ_NPC_ATTRIDX_COUNT,world,YDBZ_NPC_COUNT[nteam])
		npcallsum = YDBZ_map_npc[npctype][1][YDBZ_NPC_ATTRIDX_COUNT]

		local npccount = GetMissionV(YDBZ_NPC_COUNT[nteam])
		local npcway = GetMissionV(YDBZ_NPC_WAY[nteam])

		--print(npcallsum,npccount,nteam)
		if npccount + 1 == npcallsum then
			SetMissionV(YDBZ_NPC_COUNT[nteam],0)
			local file = YDBZ_map_posfiles[1][nteam][npcway+1]
			YDBZ_add_npc(file,nteam,npcway+1,2)
			if npcway + 1 == 3 or npcway + 1 == 6 then
				YDBZ_add_npc(file,nteam,npcway+1,21)
				SetMissionV(YDBZ_NPC_COUNT[nteam],2)
			else
				SetMissionV(YDBZ_NPC_COUNT[nteam],1)
			end
		else
			SetMissionV(YDBZ_NPC_COUNT[nteam],(npccount + 1))
		end

	elseif nband >= 1 and nband <= 30 then	--ǰ10С�ص�boss��		
			local nteam = (floor((nband-1)/10))+1					--����
			local npcway = nband - 10*(nteam-1)			--��
			
			local nCount = GetMissionV(YDBZ_NPC_COUNT[nteam])
			if nCount == 1 then
				SetMissionV(YDBZ_NPC_COUNT[nteam], 0)
				SetMissionV(YDBZ_NPC_WAY[nteam],npcway)
			if npcway == 10 then
				if GetMissionV(YDNZ_STATE_SIGN) ~= 0 then
					Msg2MSAll(YDBZ_MISSION_MATCH,"�ѽ�������׶Σ������ѹ�.")
					return 
					end
				end
			--print("teams:"..nteam.." way:"..npcway)
			local mapfile = YDBZ_mapfile_trap[nteam][4].."trap"..npcway..".txt"
			YDBZ_bt_clearzhangai(mapfile)
			YDBZ_fun_award_exp(nteam,1)
			
			YDBZ_fun_award_ydmibao(nteam,npcway)	-- 2011.03.23 �׵۵���
			YDBZ_award(index,2,PlayerIndex)
			local teamname = GetMissionS(YDBZ_TEAM_NAME[nteam])
			local szstr = format("<color=yellow>%s<color>�ѳɹ�����<color=yellow>��%s<color>.",teamname,npcway)
			if npcway == 10 then
				szstr = szstr .. "����ɽ�����."	
				else				
					local file = YDBZ_map_posfiles[1][nteam][npcway+1]
					YDBZ_add_npc(file,nteam,npcway+1,1)
				end
				Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
			else
				YDBZ_fun_award_exp(nteam,1)
				YDBZ_award(index,2,PlayerIndex)
				SetMissionV(YDBZ_NPC_COUNT[nteam], nCount-1) 
			end
			
	elseif nband == 40 then							--�����10��boss
			npccount = GetMissionV(YDBZ_NPC_BOSS_COUNT)
			local nteam = GetCurCamp()
			SetMissionV(YDBZ_NPC_BOSS_COUNT,npccount-1)
			YDBZ_award(index,3,PlayerIndex)
			YDBZ_fun_award_exp(nteam,2)
			if npccount-1 == 0 then
				Msg2MSAll(YDBZ_MISSION_MATCH,"�׵۱��ش����ѽ���<color=yellow>����׶�<color>, <color=yellow>10 ��<color> ���ٻ�������ӳ�Ա���������ͼ��ֻ��<color=yellow>1 ���<color> �����ٻ�����boss.")
				SetMissionV(YDBZ_STATE_SIGN,1)
				for i=1,3 do 
					local trapfile = YDBZ_mapfile_trap[i][4].."trap10.txt"
					YDBZ_bt_addZhangai(trapfile)
				end
				StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_TIME_WAIT_STATE1*18)
			end

	elseif nband == 50 then							--���մ�boss
			--local oldplayer = PlayerIndex 
			--PlayerIndex = index
			nteam = GetCurCamp()
			--print(nteam)
			YDBZ_award_finalboss(nteam)
			-- ���׵۽���ʱ���ر��׵۱��佱��- Modified - by AnhHH 20110726
		--	YDBZ_award_finalboss_ex(nteam, 40)	-- ɱ������boss����ȡ���佱�����������40�׵��ر�
			G_ACTIVITY:OnMessage("YDBZ_KillMaxBoss", YDBZ_MISSION_MATCH, nteam);
		--	PlayerIndex = oldplayer
	end
	SubWorld = oldworld
end

