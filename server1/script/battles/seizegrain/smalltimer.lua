IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnTimer()
	local t = GetMissionV(MS_TIMER1_TIME) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1_TIME, t);
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "��������"
	elseif (lsf_level == 2) then
		resultstr = "�м�����"
	elseif (lsf_level == 3) then
		resultstr = "�߼����� "
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."�ν�����ģʽ����ʱ���ѵ�,ս����ʽ��ʼ!", 2);
		Msg2MSAll(MISSIONID, "�ν���ʽ��ս����ʿ�ǣ��尡!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>�ν��ս����ģʽ���ڱ����У���ҸϽ�������������������,���߿���ʹ���ν�گ��������ν�ս������������, ��ʣʱ��Ϊ"..RestMin.."����. �μ�������40������.������ 3000������ս��������������㣬��Ȼ���Լ�������!";
			str2 ="<#> ����ʣ��ʱ��Ϊ"..RestMin.."����"
		else
			str1 = resultstr.."<#>�ν��ս����ģʽ���ڱ����У���ҸϽ�������������������,���߿���ʹ���ν�گ��������ν�ս������������, ��ʣʱ��Ϊ"..RestMin.."����"..RestSec.."�롣�μ�������40������.������ 3000������ս��������������㣬��Ȼ���Լ�������!";
			str2 = "<#> ����ʣ��ʱ��Ϊ"..RestMin.."����"..RestSec.." ��"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --��ʽ��ս�ĵ�һ�δ���ʱ������ս��Npc�����ɹ�������
			sf_buildfightnpcdata()
		else
			--ÿһ���Ӳ���һ��Npc������ͨ�浱ǰ����ʳ��������
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ����ս��Npc				
			end
			
			bt_pop2signmap()	--���ں�Ӫ��fight=0��������ͻر�����
			
			if (mod(t, 3 ) == 0) then
				msstr = format("�������η�������������ı���Ϊ<color=yellow>%d:%d",BT_GetGameData(GAME_CAMP1),BT_GetGameData(GAME_CAMP2));
				Msg2MSAll(MISSIONID, msstr);
			end
		end
		
		if (t > RUNGAME_TIME) then
			local bp = mod(t - RUNGAME_TIME*2, 3*10);
			local n_b = floor((t - RUNGAME_TIME*2) / (3*10));
			
			if (bp == 0)  then
				sf_creategraingharry(n_b+1);
			end
		end
		
	end;
	
end;

function sf_creategraingharry(n_branch)
	if (n_branch > 3) then
		print("error, add grain branch is overflow !"..n_branch);
		return 0;
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area1 = BT_GetGameData(GAME_CAMP1AREA);
	local area2 = BT_GetGameData(GAME_CAMP2AREA);
	
	local flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "grainpos");
	local flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "grainpos");
	local flagposfile = {flagposfile1, flagposfile2};
	for n_camp = 1, 2 do
		local sz_file = flagposfile[n_camp]
		local count = GetTabFileHeight(sz_file) - 1;
		if (count < 9) then
			print("error, flagposfile height not enough!"..sz_file, count);
			return
		end
		
		for i = ((n_branch-1)*3+1), (n_branch*3) do
			local srcx = GetTabFileData(sz_file, i + 1, 1)
			local srcy = GetTabFileData(sz_file, i + 1, 2)
		
			sf_addgharry(n_camp, srcx, srcy, 0);
		end
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>�������ѵ��������ȥ����.");
	end
	
end
