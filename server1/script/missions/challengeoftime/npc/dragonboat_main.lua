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
		Say("�Բ���ֻ�жӳ������ʸ����μӡ���սʱ������",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say("�Բ��𣡲μӡ���սʱ����������Ҫ��<color=red>4<color> ��!",0)
		return
	end
	if(GetLevel() < 50) then
		Say("�Բ���50�����²��ܲμӡ���սʱ������.",0);
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if(GetLevel() < 50) then
			Say("�Բ���50�����²��ܲμӡ���սʱ������.",0);
			Msg2Team("�Բ�����Ķ��������˵���50�������ܲμӡ���սʱ������.");
			return
		end
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" ������˼������������˳���<color=red>90��<color>,������ٱ���!",0)
				Msg2Team("�������������90�����ϣ�����֮���ٱ���!");
				return
			else
				Say("������˼������������˳���<color=red>90��<color>, ������ٱ���!",0)
				Msg2Team("�������������90�����ϣ�����֮���ٱ���!");
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
		strlevel = "������սʱ������"
	else
		strlevel = "�߼���սʱ������"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say("������"..strlevel.."�ѿ�ʼ. û�еط���",0)
			return
		else
			Say("������"..strlevel.."�����۱����׶Σ�����<color=red>"..freeboat.."<color>һ����Ѱ�ͼ��ʱ����սҪ��<color=red>1 ��<color> ����, ��Ҫ�μ���?",2, "�ǵģ�����������ǶӲμ�./dragon_join", "����Ҫ/onCancel")
			return
		end
	else
		Say("������˼��������"..strlevel.."����û����սʱ������.������<color=red>ÿ������<color>��ʼ����".. TIME_SIGNUP .."�֣���ע��ϵͳ֪ͨ.",0)
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
			Say("��s��: �������ս�����Ѿ�����ˣ�����������.",0);
			return
		end
	end
	if (IsCaptain() ~= 1) then
		Say("������˼��Ҫ�ӳ������ʸ����μ���սʱ������",0)
		return
	end
	if(GetLevel() < 50) then
		Say("������˼��50�����²��ܲμ���սʱ������.",0);
		return
	end
	if (GetTeamSize() < 4) then
		Say("������˼���μ���սʱ�����񡯵Ķ�����Ҫ��<color=red>4<color> ��!",0)
		return
	end
	
	if (GetCash() < 10000) then
		Say("�μ���սʱ������Ҫ<color=red>1����<color>. ׼����Ǯ������!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
		if(GetTask(1551) == MemberNowDate) then
			if(GetTask(1550) <= 0) then
				Say("ÿ��ֻ�ܲμ�1����սʱ��������ӲμӵĴ����Ѿ����ˣ����������ɣ�",0);
				Msg2Team("ÿ��ֻ�ܲμ�1����սʱ��������ӲμӵĴ����Ѿ����ˣ����������ɣ�");
				return
			end
		end
		if(GetLevel() < 50) then
			Say("������˼��50�����²��ܲμ���սʱ������.",0);
			Msg2Team("������˼������������˵���50�������ܲμӡ���սʱ������.");
			return
		end
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" ������˼����Ķ��������˳���<color=red>90��<color>, ������ٱ���!",0)
				Msg2Team("��Ķ�����������90�����ϣ�������ٱ���!");
				return
			else
				Say("������˼����Ķ��������˳���<color=red>90��<color>, ������ٱ���!",0)
				Msg2Team("��Ķ�����������90�����ϣ�������ٱ���!");
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
			Say("��s��: ����£��μӳ�����սʱ������ĳ�ԱҪ��һ������90�����ϻ������µ�����ɱ��ﵣ���׼����֮��������",0)
			Msg2Team("������������û�в���90�����ϻ������µ�����ɱ��ﵣ�����֮���ٱ����μ�!")
			return
		elseif (havesword < 1 and blevel == 1) then
			Say("��s��: ����£��μӸ߼���սʱ������ĳ�ԱҪ��һ������90�����ϻ������µ�����ɱ��ﵣ���׼����֮��������",0)
			Msg2Team("����������û�в���90�����ϻ������µ�����ɱ��ﵣ�����֮���ٱ����μ�!")
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
				--print(format("%s��(%d,%d,%d)λ�ý���ʱ�����ս�����ͼ", GetName(), w, x, y));

				Pay(10000)
				

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					
					-- �������� by wangjingjun 2011.03.01
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

					-- �������ж��Ƿ���Խ����ͼ
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
					--�� log �������� key - Modified By DinhHQ - 20120410
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
				
				tbLog:PlayerActionLog("EventChienThang042011","BaoDanhVuotAi")-- ������־				
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "������սʱ������"
	else
		strlevel = "�߼���սʱ������"
	end
	Say("������˼���������� <color=red>"..strlevel.."<color>�Ѿ�û��λ����. ���һ��!",0)
end