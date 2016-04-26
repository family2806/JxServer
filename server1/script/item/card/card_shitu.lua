IncludeLib("SETTING")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\shitu.lua")

Include("\\script\\task\\newtask\\map_index.lua")
Include("\\script\\lib\\common.lua")

tb_teaminfo_master = {"pid","level","name"}
tb_teamtask_master = {TKID_DICHUAN_APPRENTICE_COUNT}

function CheckAndAddMaster(masters, player)
	local degree = GetPlayerDegree(player.pid)
	if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
		local num = GetApprenticeNum(player.name)
		if(not num) then
			return
		end
		if (num < ComputeMasterLoad(player.task[TKID_DICHUAN_APPRENTICE_COUNT])) then
			masters[getn(masters) + 1] = player.name
		end
	end
end

--���ҿ��Գ�Ϊʦ������
function FindMaster()
	print("Call FindMaster")
	local masters = {}
	/*
	local _,others = getTeamInfo(PlayerIndex,{"pid","level","name"},{TKID_DICHUAN_APPRENTICE_COUNT})
	if(not others) then
		return nil
	end
	for i=1,getn(others) do
		local degree = GetPlayerDegree(others[i].pid)
		if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
			local num =GetApprenticeNum(others[i].name)
			if(not num) then
				return nil
			end
			if(num < ComputeMasterLoad(others[i].task[TKID_DICHUAN_APPRENTICE_COUNT])) then
				tinsert(masters,others[i].name)
			end
		end
	end
	*/
	traversalTeam(PlayerIndex, CheckAndAddMaster, masters, tb_teaminfo_master, tb_teamtask_master)
	if (getn(masters) < 1) then
		return nil
	else
		return masters
	end
end

tb_teaminfo_apprentice = {"level","name"}

function CheckAndAddApprentice(apps, player)
	if (player.level < 80) then
		local job = GetLeagueJob(player.name)
		if(not job) then
			apps[getn(apps) + 1] = player.name
		end
	end
end

--���ҿ��Գ�Ϊͽ�ܵ���
function FindApprentice()
	print("Call FindApprentice")
	/*
	local _,others = getTeamInfo(PlayerIndex,{"level","name"})
	if(not others) then
		return nil
	end
	local apps = {}
	for i=1,getn(others) do
		if(others[i].level < 80) then
			local job = GetLeagueJob(others[i].name)
			if(not job) then
				tinsert(apps,others[i].name)
			end
		end
	end
	*/
	local apps = {}
	traversalTeam(PlayerIndex, CheckAndAddApprentice, apps, tb_teaminfo_apprentice)
	
	if (getn(apps) < 1) then
		return nil
	else
		return apps
	end
end

--�õ�ͽ���б����
function ShoutuList(apps)
	local str = "�鿴������ҵ������ѡ��һ�����ʵ���Ϊ���ͽ�ܣ�"
	local btn = {}
	-- local apps = FindApprentice()
	if(not apps) then
		Msg2Player("û�к��ʵ�ͽ����ѡ��")
		return
	end
	for i=1,getn(apps) do
		tinsert(btn,"�鿴 "..safeshow(apps[i]).." ����Ϣ/#XuanTudi('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"�ر�/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_ShoutuList()
	local apps = FindApprentice()
	ShoutuList(apps)
end

--�õ�������ʦ������Ա�б�
function BaishiList(masters)
	print("Call BaishiList()")
	local str = "�鿴������ҵ������ѡ��һ�����ʵ���Ϊ���ʦ����"
	local btn = {}
	-- local masters = FindMaster()
	if(not masters) then
		print("Master can not found.")
		return
	end
	for i=1,getn(masters) do
		tinsert(btn,"�鿴 "..safeshow(masters[i]).." ����Ϣ/#XuanShifu('"..safestr(masters[i]).."')")
	end
	tinsert(btn,"�ر�/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_BaishiList()
	local masters = FindMaster()
	BaishiList(masters)
end

tb_playerinfo_tudi = {"level","sex"}
tb_playertask_tudi = {TKID_MASTER_COUNT}
tb_playertemp_tudi = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

--�˽��ܹ���Ϊͽ�ܵ���ѡ����Ϣ
function XuanTudi(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."�Ѿ���֪���١�")
		return
	end
	-- local app = getPlayerInfo(pid,{"level","sex"},{TKID_MASTER_COUNT},{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local app = getPlayerInfo(pid, tb_playerinfo_tudi, tb_playertask_tudi, tb_playertemp_tudi)
	local str = safeshow(playerName)..":"..sex2Word(app.sex).."<enter>"
	if(app.level <= 25) then
		str = str.."Ŀǰ�ȼ���26�����£�"
	elseif(app.level < 50) then
		str = str.."Ŀǰ�ȼ���50�����£�"
	elseif(app.level < 65) then
		str = str.."Ŀǰ�ȼ���65�����£�"
	elseif(app.level < 75) then
		str = str.."Ŀǰ�ȼ���75�����£�"
	elseif(app.level < 80) then
		str = str.."Ŀǰ�ȼ���80�����£�"
	else
		str = str.."Ŀǰ�ȼ���80�����ϣ�"
	end
	if(app.task[TKID_MASTER_COUNT] ==0) then
		str = str.."��û�аݹ�ʦ����"
	else
		str = str.."�Ѿ��ݹ�"..tostring(app.task[TKID_MASTER_COUNT]).."��ʦ����"
	end
	if(FALSE(GetShituLeagueId(playerName))) then
		UpdatePlayerSelfLilian(pid)
	end
	if(GetPlayerLilianCount(pid)==0) then
		str = str.."��ǰû����ɹ��κν���������"
	else
		str = str.."�Ѿ������"..tostring(GetPlayerLilianCount(pid)).."������������"
	end
	if(app.tasktmp[TTKID_APPRENTICE_FLAG]==FileName2Id(GetName())) then
		str = str.."<enter>Ŀǰ�Ѿ��������Ϊʦ����ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>��ͽ��<color>���ܻ�Ӧ��"
	end
	if(app.tasktmp[TTKID_RECRUIT_FLAG] == FileName2Id(GetName())) then
		str = str.."<enter>Ŀǰ�Ѿ���������(��)Ϊͽ�����ڵȴ���(��)�Ļ�Ӧ��"
	end
	/*
	local btn = {
		"�� "..safeshow(playerName).." Ϊͽ/#Shoutu('"..safestr(playerName).."')",
		"����/ShoutuList",
		"�ر�/Quit"
	}
	Say(str,getn(btn),btn)
	*/
	Say(str,
		3,
		"�� "..safeshow(playerName).." Ϊʦ/#Shoutu('"..safestr(playerName).."')",
		"������һ��/CallBack_ShoutuList",
		"�ر�/Quit")	
	return
end

tb_playerinfo_shifu = {"sex"}
tb_playertask_shifu = {TKID_APPRENTICE_COUNT, TKID_DICHUAN_APPRENTICE_COUNT, TKID_ZHIXI_APPRENTICE_COUNT, TKID_NORMAL_APPRENTICE_COUNT}

function XuanShifu(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."�Ѿ���֪���١�")
		return
	end
	-- local master = getPlayerInfo(pid,{"sex"},{TKID_APPRENTICE_COUNT,TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local master = getPlayerInfo(pid, tb_playerinfo_shifu, tb_playertask_shifu)
	local btn = {
		"�� "..safeshow(playerName).." Ϊʦ/#Baishi('"..safestr(playerName).."')",
		"����/BaishiList",
		"�ر�/Quit"
	}
	local str = safeshow(playerName)..":"..sex2Word(master.sex).."<enter>"
	st_print("XuanShifu(): "..GetName().."master: "..str);
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid) and FALSE(master.task[TKID_APPRENTICE_COUNT])) then
		str = str.."��ĿǰΪֹ����û����ʦ����"
		Say(str,getn(btn),btn)
		return
	end
	str = str.."��ĿǰΪֹ���Ѿ��չ�"..tostring(master.task[TKID_APPRENTICE_COUNT]).."��ͽ�ܣ�"
	str = str.."���У��ɹ��Ĵ���"..tostring(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."���մ����ӣ�"
	str = str..tostring(master.task[TKID_ZHIXI_APPRENTICE_COUNT]).."��ֱϵ���ӣ�"
	str = str..tostring(master.task[TKID_NORMAL_APPRENTICE_COUNT]).."����ͨ���ӡ�"
	str = str.."Ŀǰ��"..playerName.."һ�����Դ�"..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."��ͽ�ܣ�"
	str = str.."���ң���������"..tostring(GetApprenticeNum(playerName)).."��ͽ�ܡ�"
	Say(str,getn(btn),btn)
	return
end

function Baishi(master) --ͽ�ܴ���
	print("Call Baishi("..tostring(master)..").")
	local pid = SearchPlayer(master)
	if(FALSE(pid)) then
		Msg2Player("�Բ���"..master.."�Ѿ���֪���١�")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_FLAG,FileName2Id(master))
	if(GetTaskTemp(TTKID_APPRENTICE_FLAG)==GetTaskTemp(TTKID_RECRUIT_FLAG)) then
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		--���ʦ������������
		local load = ComputeMasterLoad(callPlayerFunction(pid,GetTask,TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(master)
		if(not appNum) then
			print("�쳣��masterͻȻ��û�а�ʦ��")
			return
		end
		if(load <= appNum) then --���������������ٰ�ʦ
			Msg2Player(master.."�����Ѿ�����̫���ͽ�ܣ���Ҳ�˲������ˡ�")
			sendMessage(pid,"�������Ѿ�����̫���ͽ�ܣ���Ҳ�˲���"..GetName().."�ˡ�")
			return
		end
		Msg2Player(master.."�Ѿ���Ӧ����Ϊͽ�����ڵȴ�ϵͳ�������ǵ�ʦͽ��ϵ��")
		sendMessage(pid,"���Ѿ���Ӧ��"..GetName().."Ϊͽ�����ڵȴ�ϵͳ�������ǵ�ʦͽ��ϵ��")
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		--AddGlobalNews("��ϲ"..GetName().."����"..master.."�����£���Ϊ"..master.."�ĵ��ӡ�")
		UpdatePlayerSelfLilian(PlayerIndex)
		BuildRelationship(GetName(),master)
		return
	end
	Msg2Player("������"..master.."Ϊʦ�����ڵȴ���Ӧ...")
	sendMessage(pid,GetName().."�������Ϊʦ����ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>��ͽ��<color>���ܻ�Ӧ��")
	return
end

tb_playertemp_shoutu = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

function Shoutu(apprentice) --ʦ������
	print("Call Shoutu("..tostring(apprentice)..").")
	local pid = SearchPlayer(apprentice)
	if(FALSE(pid)) then
		Msg2Player("�Բ���"..apprentice.."�Ѿ���֪���١�")
		return
	end
	
	if checkTudiLimit()~=1 then
		Say("���ͽ���Ѿ�����!", 0);
		return
	end;
	
	setPlayerTaskTemp(pid,{[TTKID_RECRUIT_FLAG]=FileName2Id(GetName())})
	-- local appinfo = getPlayerInfo(pid,nil,nil,{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local appinfo = getPlayerInfo(pid,nil,nil,tb_playertemp_shoutu)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_APPRENTICE_FLAG]==appinfo.tasktmp[TTKID_RECRUIT_FLAG]) then
		callPlayerFunction(pid,SetTask,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTask,TTKID_RECRUIT_FLAG,0)
		print("thu nh�n �� t? ")
		local load = ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(GetName())
		if(not appNum) then
			print("�쳣������ͻȻû�а�ʦ")
			return
		end
		if(load <= appNum) then --���������������ٰ�ʦ
			Msg2Player("�������Ѿ�����̫���ͽ�ܣ���Ҳ�˲���"..apprentice.."�ˡ�")
			sendMessage(pid,GetName().."�����Ѿ�����̫���ͽ�ܣ���Ҳ�˲������ˡ�")
			return
		end
		
		-- д��ͽ������
		writeTudiLimit();
		
			Msg2Player("�������Ѿ�����̫���ͽ�ܣ���Ҳ�˲���"..apprentice.."�ˡ�")
			sendMessage(pid,GetName().."�����Ѿ�����̫���ͽ�ܣ���Ҳ�˲������ˡ�")
		callPlayerFunction(pid,SetTaskTemp,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTaskTemp,TTKID_RECRUIT_FLAG,0)
		--AddGlobalNews("��ϲ"..apprentice.."����"..GetName().."�����£���Ϊ"..GetName().."�ĵ��ӡ�")
		UpdatePlayerSelfLilian(pid)
		BuildRelationship(apprentice,GetName())
		return
	end
	
	-- д��ͽ������
	writeTudiLimit();
	
	Msg2Player("�������"..apprentice.."Ϊͽ�����ڵȴ���Ӧ...")
	sendMessage(pid,GetName().."��������Ϊͽ����ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>�� "..GetName().." Ϊʦ<color>���ܻ�Ӧ��")
	return
end

function MasterDialog()
	local btn = {}
	local masterName = GetName()
	local num = GetApprenticeNum(masterName)
	if(not num) then 
		print("�쳣���ҵ����զ����û��ʦ�أ�Ӧ����ʦ������")
		return
	end
	if(FindApprentice() and 
		num < ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))) then
		tinsert(btn,"��ͽ��/ShoutuList")
	end
	if(GetEnableChushiApps(masterName)) then
		tinsert(btn,"ͽ�ܳ�ʦ/ChushiList")
	end
	if(GetHaveNewLilianApps(masterName)) then
		tinsert(btn,"�鿴ͽ�ܵĽ�������/LilianList")
	end
	if(num > 0 ) then
		tinsert(btn,"�鿴ͽ����Ϣ/TudiInfoList")
		tinsert(btn,"���ʦͽ��ϵ/BreakTuList")
	end
	tinsert(btn,"�鿴�Լ�����Ϣ/SfChaShifu")
	tinsert(btn,"�˽�ʦͽ��/AboutShituCard")
	tinsert(btn,"�ر�/Quit")
	local str = "��ѡ��ʦ����صĲ�����"
	Say(str,getn(btn),btn)
	return
end

function BreakTuList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("�������κ�ͽ�ܡ�")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,"����� "..safeshow(apps[i]).." ��ʦͽ��ϵ/#ShiConform('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"����/MasterDialog")
	tinsert(btn,"�ر�/Quit")
	local str = "���������ĸ�ͽ�ܵ�ʦͽ��ϵ��"
	Say(str,getn(btn),btn)
	return
end

function ShiConform(appName)
	Say("��ȷ��Ҫ�����"..safeshow(appName).."֮���ʦͽ��ϵ��",
		2,
		"ȷ��/#BreakShituLeague('"..safestr(appName).."')",
		"ȡ��/BreakTuList")
	return
end

function TuConform()
	local playerName = GetName();
	local btn = {
		"ȷ��/#BreakShituLeague('"..safestr(playerName).."')",
		"ȡ��/ApprenticeDialog"
	}
	
	local masterName = GetMaster(playerName)
	if (masterName == nil) then
		local lid = GetShituLeagueId(playerName)
		if(TRUE(lid)) then -- ʦ�������ڣ���ս�Ӵ���
			Say("���ʦ��ʧ���ˣ������ǿ�н��������ʦͽ��ϵ��",getn(btn),btn)
		else
			print("ʦͽ��ϵ�����ڡ�")
		end
	else		
		Say("��ȷ��Ҫ�����"..safeshow(masterName).."��ʦͽ��ϵ��",getn(btn),btn)
	end
	return
end

function TudiInfoList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("�������κ�ͽ�ܡ�")
		return
	end
	local btn={}
	local pid = 0;
	local state = 0;
	for i=1,getn(apps) do
		pid = SearchPlayer(apps[i])
		if (pid > 0) then
			state = callPlayerFunction(pid,GetTask,TKID_GOLD_APPRENTICE);
			if (state == 1 or state == 2) then
			tinsert(btn,"�鿴 "..safeshow(apps[i]).." (�ƽ����) �������Ϣ/#TudiInfo('"..safestr(apps[i]).."')")
			else
			tinsert(btn,"�鿴 "..safeshow(apps[i]).." �������Ϣ/#TudiInfo('"..safestr(apps[i]).."')")
			end
		end
	end
	tinsert(btn,"����/MasterDialog")
	tinsert(btn,"�ر�/Quit")
	local str = "����鿴�ĸ�ͽ�ܵ������Ϣ��"
	Say(str,getn(btn),btn)
	return
end

--�鿴ͽ������ʱ��ͽ���б�
function LilianList()
	local apps = GetHaveNewLilianApps(GetName())
	if(not apps) then
		Msg2Player("ĿǰΪֹ����û���κ�ͽ�����µĽ���������")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."�Ѿ��������"..apps[i][2].."����������/#ChaLilian('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"����/MasterDialog")
	tinsert(btn,"�ر�/Quit")
	local str = "����鿴�ĸ�ͽ�ܵĽ���������"
	Say(str,getn(btn),btn)
	return
end

tb_playerinfo_lilian = {TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG}

function ChaLilian(appName) --ʦ������
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."��֪���١�")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_LILIAN_FLAG]=1})
	-- local appinfo = getPlayerInfo(appIdx,nil,nil,{TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG})
	local appinfo = getPlayerInfo(appIdx, nil, nil, tb_playerinfo_lilian)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]==appinfo.tasktmp[TTKID_MASTER_LILIAN_FLAG] and appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]~=0) then
		Msg2Player("���Ӧ��ʼ�鿴"..appName.."�Ľ���������")
		sendMessage(appIdx,GetName().."��Ӧ��ʼ�鿴��Ľ���������")
		setPlayerTaskTemp(appIdx,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(appIdx)
		PayLilianBonus(appIdx,PlayerIndex)
		return
	end
	Msg2Player("��Ҫ��鿴"..appName.."�Ľ������������ڵȴ���(��)�ĸ���...")
	sendMessage(appIdx,GetName().."Ҫ��鿴��Ľ�����������ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>��ʦ������<color>���ܻ�Ӧ��")
	return
end

function FuLilian(masterName) --ͽ�ܵ���
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player(masterName.."��֪���١�")
		return
	end
	SetTaskTemp(TTKID_SELF_LILIAN_FLAG,1)
	if(GetTaskTemp(TTKID_SELF_LILIAN_FLAG)==GetTaskTemp(TTKID_MASTER_LILIAN_FLAG) and GetTaskTemp(TTKID_SELF_LILIAN_FLAG)~=0) then
		Msg2Player("���Ӧ��"..masterName.."��������ʼ����(��)�鿴��Ľ���������")
		sendMessage(masterIdx,GetName().."��Ӧ���㸴�����㿪ʼ�鿴��(��)�Ľ���������")
		setPlayerTaskTemp(PlayerIndex,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(PlayerIndex)
		PayLilianBonus(PlayerIndex,masterIdx)
		return
	end
	Msg2Player("��Ҫ����"..masterName.."���������ڵȴ���(��)�鿴��Ľ���������")
	sendMessage(masterIdx,GetName().."Ҫ�����㸴������ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>�鿴ͽ�ܵĽ�������<color>���ܻ�Ӧ��")
	return
end

function SendBaiShiBidding()
	local mapid, x, y = GetWorldPos();
	local myMapName, myMapX, myMapY = tl_getMapInfo(mapid);
	local str = "�����["..GetName().."]���ʹ��ˣ��ľ߻۸���������ȫ��������ʦһ����"
	if (myMapName ~= 0) then
		x = floor(x / 8);
		y = floor(y / 16);
		AddLocalNews(str.."�������뵽["..myMapName.."]("..x..", "..y..")");
	else
		AddLocalNews(str.."��������������ϵ");
	end
	
	-- ��ǣ�2 - ������ʦ����
	SetTask(TKID_GOLD_APPRENTICE, 2);
end

function ApprenticeDialog()
	print("Call ApprenticeDialog")
	local btn = {}
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"��ȫ���緢��ʦ����/SendBaiShiBidding")
	end
	
	if(lvl < 80) then
		tinsert(btn,"��ȡʦ�����������/GetAbility")
	else
		local master = GetMaster(GetName())
		if(TRUE(SearchPlayer(master))) then
			tinsert(btn,"��ʦ/TudiChushi")
		end
	end
	if(TRUE(HaveNewLilian(PlayerIndex))) then
		tinsert(btn,"��ʦ������/Fuming")
	end
	tinsert(btn,"�鿴ѧ�����/ChaSelfInfo")
	tinsert(btn,"�˽�ʦ����Ϣ/TdChaShifu")
	tinsert(btn,"���ʦͽ��ϵ/TuConform")
	tinsert(btn,"�˽�ʦͽ��/AboutShituCard")
	-- VN_MODIFY_20060427
	-- �رջƽ�ʦͽ��(˵��)
	-- tinsert(btn,"�˽�ƽ�ʦͽ��(����˵��)/AboutShituGoldCard")
	tinsert(btn,"�ر�/Quit")
	local str = "��ѡ��ͽ����ز�����"
	Say(str,getn(btn),btn)
	return	
end

function ChushiList()
	local apps = GetEnableChushiApps(GetName())
	if(not apps) then
		Msg2Player("Ŀǰû�к��ʵĵ��ӿ��Գ�ʦ��")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."["..apps[i][2].."��]Ŀǰ�Ѿ����Գ�ʦ/#ShiChushi('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"����/MasterDialog")
	tinsert(btn,"�ر�/Quit")
	local str = "���������ĸ�ͽ�ܳ�ʦ��"
	Say(str,getn(btn),btn)
	return
end

function ShiChushi(appName)
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."��֪���٣�������ʱ��������(��)��ʦ��")
		return
	end
	local app = getPlayerInfo(appIdx,{"level"})
	if(app.level <80) then
		Msg2Player(appName.."�������������Դﵽ��ʦ��ˮƽ�������ٵ�����ɡ�")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_CHUSHI]=1})
	app = getPlayerInfo(appIdx,nil,nil,{TTKID_APPRENTICE_CHUSHI,TTKID_MASTER_CHUSHI})
	if(app.tasktmp[TTKID_MASTER_CHUSHI]== app.tasktmp[TTKID_APPRENTICE_CHUSHI] and app.tasktmp[TTKID_APPRENTICE_CHUSHI]~=0) then
		Msg2Player(appName.."�Ѿ������������ǳ���ο��������"..appName.."��ʦ��")
		sendMessage(appIdx,GetName().."�Ѿ���Ӧ�����ʦ�������ڿ��Դ�һ��������ˡ�")
		AddGlobalNews("��ϲ"..appName.."ѧ���ѳɣ���"..GetName().."���³�ʦ��")
		OutShituLeague(appName,GetName())
		return
	end
	Msg2Player("�����"..appName.."�������ߣ�ת�ۼ���ûʲô�ý���(��)���ˣ���������(��)��ʦ��"..appName.."������...")
	sendMessage(appIdx,GetName().."���������������ת�ۼ䣬��ûʲô�ý�����ˣ����������ʦ�����ڵȴ���ľ���...")
	return
end

function TudiChushi() --ͽ�ܼ���
	local masterName = GetMaster(GetName())
	if(not masterName) then --ʦ������
		Msg2Player("��û��ʦ������ʲôʦ��")
		return
	end
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player("ʦ����֪���٣��޷���ʦ��")
		return
	end
	if(GetLevel() <80) then
		Msg2Player("����������������ʦ�������ٿ�������ɡ�")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_CHUSHI,1)
	if(GetTaskTemp(TTKID_APPRENTICE_CHUSHI)==GetTaskTemp(TTKID_MASTER_CHUSHI) and GetTaskTemp(TTKID_MASTER_CHUSHI)~=0) then
		Msg2Player("����ʦ�������������������ѧ�����ɣ����������Ż�ȥ�ˡ�")
		sendMessage(masterIdx,GetName().."������������������ڳ�ʦ�������Ż�ȥ�ˡ�")
		AddGlobalNews("��ϲ"..GetName().."ѧ���ѳɣ���"..masterName.."���³�ʦ��")
		OutShituLeague(GetName(),masterName)
		return
	end
	Msg2Player("�����ѧ���ѳɣ���"..masterName.."�����ʦ�����ڵȴ���(��)�Ļ�Ӧ...")
	sendMessage(masterIdx,GetName().."����ѧ���ѳɣ����������ʦ����ʹ��<color=green>ʦͽ��<color>�е�<color=yellow>ͽ�ܳ�ʦ<color>���ܻ�Ӧ��")
	return	
end

function Fuming()
	local masterName = GetMaster(GetName())
	FuLilian(masterName)
	return
end

function GetAbility()
	if(GetLevel()>80) then
		Msg2Player("��ı����Ѿ�ѧ�ò���ˣ��Ͳ�Ҫ������ʦ������������ˡ�")
		return
	end
	AddSkillState(531,10,1,30*60*18)
	AddSkillState(461,1, 1,30*60*18)
	Msg2Player("��ʹ����ʦ�������30���Ӿ��鷭����������")
	return
end

function TudiInfo(appName)  --ʦ����ͽ����Ϣ
	local pid = SearchPlayer(appName)
	if(FALSE(pid)) then
		Msg2Player(appName.."��֪���٣��޷��õ���(��)����Ϣ��")
		return
	end
	local sex = callPlayerFunction(pid,GetSex)
	local str
	if(FALSE(sex)) then --��
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\003.spr>"
	end
	str = str..appName.."<link>:"..sex2Word(sex).."<enter>"
	local joinLvl = callPlayerFunction(pid,GetTask,TKID_ENTER_LEVEL)
	str = str.."������(��)"..tostring(joinLvl).."����ʱ������(��)Ϊͽ��"
	local masterCount = callPlayerFunction(pid,GetTask,TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."������(��)��������ʦ��"
		if(joinLvl<=25) then
			str = str.."��(��)�����<color=yellow>�մ�<color>���ӡ�"
		else
			str = str.."��(��)�����<color=green>ֱϵ<color>���ӡ�"
		end
	else
		str = str.."��ǰ����(��)�Ѿ��ݹ�"..tostring(masterCount-1).."����Ϊʦ��˭֪�����޼����գ�����������������(��)��"
	end
	local appLvl = callPlayerFunction(pid,GetLevel)
	if(appLvl<80) then
		str = str.."������(��)�ĵȼ�����"..tostring(appLvl).."���ˡ�<enter>"
	else
		str = str.."������(��)�Ѿ�"..tostring(appLvl).."���ˡ����������(��)��ȥ�Լ������ˡ�<enter>"
	end
	local lilianCount = GetPlayerLilianCount(pid)
	local newllc = HaveNewLilian(pid)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str..appName.."�����������<color=yellow>"..newllc.."<color>�������������񣬵�����鿴��<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."��ĿǰΪֹ��"..appName.."��һ���޳ɡ�"
		end
	else
		local masterllCount = GetPlayerMasterLilianCount(pid)
		if(FALSE(masterllCount)) then --��û�����κ�����
			if(TRUE(newllc)) then
				str = str.."Ŀǰ"..appName.."�����������<color=yellow>"..newllc.."<color>�������������񣬵�����鿴��<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."��ǰ��"..appName.."�������"..lilianCount.."��������������"
			str = str.."������������£���û������κν�����������<enter>"
		else
			if(TRUE(newllc)) then
				str = str..appName.."�����������<color=yellow>"..newllc.."<color>�������������񣬵�����鿴��<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."��ǰ��"..appName.."�������"..lilianCount.."��������������"
			str = str.."��������������ɵ�������<color=green>"..masterllCount.."<color>������������<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(pid))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(pid))
	if(unfinishedLilian) then
		str = str.."��(��)Ŀǰ����<color=red>"..getn(unfinishedLilian).."<color>������û�����㸴�����ֱ��ǣ�<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."��(��)�Ѿ���������еĽ�����������"
	end
	local btn = {
		"����/TudiInfoList",
		"�ر�/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"�鿴"..appName.."���������"..newllc.."������/#ChaLilian('"..safestr(appName).."')")
	end
	Describe(str,getn(btn),btn)
	return
end

function ChaSelfInfo() --ͽ�ܲ��Լ�����Ϣ
	local str
	if(FALSE(GetSex())) then --��
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\003.spr>"
	end
	str = str..GetName().."<link>:"..sex2Word(GetSex()).."<enter>"
	
	local master = GetMaster(GetName())
	master = master or ""
	str = str.."����"..tostring(GetTask(TKID_ENTER_LEVEL)).."����ʱ�򣬰�����ʦ"..master.."�����£�"
	local masterCount = GetTask(TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."��(��)�����������ʦ��"
	else
		str = str.."��ǰ�����Ѿ��ݹ�"..tostring(masterCount-1).."����Ϊʦ��˭֪���������ʣ����޼����ա�"
	end
	local myLvl = GetLevel()
	if(myLvl<80) then
		str = str.."������ĵȼ��Ѿ�������"..tostring(myLvl).."���ˡ�<enter>"
	else
		str = str.."�������Ѿ�"..tostring(myLvl).."���ˡ��ﵽ�˳�ʦ��Ҫ��<enter>"
	end
	local lilianCount = GetLilianCount()
	local newllc = HaveNewLilian(PlayerIndex)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str.."�������������<color=yellow>"..newllc.."<color>�������������񣬵�����ʦ��������<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."��ĿǰΪֹ���㻹һ���޳ɡ�"
		end
	else
		local masterllCount = GetMasterLilianCount()
		if(FALSE(masterllCount)) then --δ�����������������  
			if(TRUE(newllc)) then
				str = str.."Ŀǰ�������������<color=yellow>"..newllc.."<color>�������������񣬵�����ʦ��������<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."��ǰ�����������"..lilianCount.."��������������"
			str = str.."������ʦ�������£��㻹û������κν�����������<enter>"
		else
			if(TRUE(newllc)) then
				str = str.."�������������<color=yellow>"..newllc.."<color>�������������񣬵�����ʦ��������<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."��ǰ�����������"..lilianCount.."��������������"
			str = str.."������ʦ����������ɵ�������<color=green>"..masterllCount.."<color>������������<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(PlayerIndex))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(PlayerIndex))
	if(unfinishedLilian) then
		str = str.."�㻹��<color=red>"..getn(unfinishedLilian).."<color>������û�и��������ֱ��ǣ�<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."���Ѿ���������еĽ�����������"
	end
	local btn = {
		"����/ApprenticeDialog",
		"�ر�/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"��"..newllc.."����������ʦ������/Fuming")
	end
	Describe(str,getn(btn),btn)
	return
end

function SfChaShifu()
	local btn = {
		"����/MasterDialog",
		"�ر�/Quit"
	}
	local str = safeshow(GetName()).."��"..sex2Word(GetSex()).."<enter>"
	local lid = GetShituLeagueId(GetName())
	if(FALSE(lid) and FALSE(GetTask(TKID_APPRENTICE_COUNT))) then
		str = str.."��ĿǰΪֹ����û����ʦ����"
		Say(str,getn(btn),btn)
		return
	end
	str = str.."��ĿǰΪֹ���Ѿ��չ�"..GetTask(TKID_APPRENTICE_COUNT).."��ͽ�ܣ�"
	str = str.."���У��ɹ��Ĵ���"..GetTask(TKID_DICHUAN_APPRENTICE_COUNT).."���մ����ӣ�"
	str = str..GetTask(TKID_ZHIXI_APPRENTICE_COUNT).."��ֱϵ���ӣ�"
	str = str..GetTask(TKID_NORMAL_APPRENTICE_COUNT).."����ͨ���ӡ�"
	str = str.."Ŀǰ����һ�����Դ�"..ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT)).."��ͽ�ܣ�"
	str = str.."���ң���������"..tostring(GetApprenticeNum(GetName())).."��ͽ�ܡ�"
	Say(str,getn(btn),btn)
	return
end

function TdChaShifu()
	local masterName = GetMaster(GetName())
	if(not masterName) then
		Msg2Player("��Ŀǰ��û��ʦ����")
		return
	end
	local btn = {
		"����/ApprenticeDialog",
		"�ر�/Quit"
	}
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Say("���ʦ�� "..safeshow(masterName).." Ŀǰ�ټ�ȫ�ޣ����޷��˽⵽��(��)�������",getn(btn),btn)
		return
	end
	local master = getPlayerInfo(masterIdx,{"sex"},{TKID_APPRENTICE_COUNT,
		TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local str = safeshow(masterName).."��"..sex2Word(master.sex).."<enter>"
	str = str.."��ĿǰΪֹ���Ѿ��չ�"..master.task[TKID_APPRENTICE_COUNT].."��ͽ�ܣ�"
	str = str.."���У��ɹ��Ĵ���"..master.task[TKID_DICHUAN_APPRENTICE_COUNT].."���մ����ӣ�"
	str = str..master.task[TKID_ZHIXI_APPRENTICE_COUNT].."��ֱϵ���ӣ�"
	str = str..master.task[TKID_NORMAL_APPRENTICE_COUNT].."����ͨ���ӡ�"
	str = str.."Ŀǰ��"..safeshow(masterName).."һ�����Դ�"..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."��ͽ�ܣ�"
	str = str.."���ң���������"..tostring(GetApprenticeNum(masterName)).."��ͽ�ܡ�"
	Say(str,getn(btn),btn)
	return
end

--�õ�����������ͽ���б�
function GetHaveNewLilianApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local num = HaveNewLilian(pid)
			if(TRUE(num)) then
				tab[getn(tab) + 1] = {apps[i],num}
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

--�õ����Գ�ʦ��ͽ�ܵ��б�
function GetEnableChushiApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local lvl = callPlayerFunction(pid,GetLevel)
			if(lvl>=80) then
				tinsert(tab,{apps[i],lvl})
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

function DefaultDialog()
	local btn = {}
	local szOp = {
		"�˽�ʦͽ��/AboutShituCard",
		"�˽�ƽ�ʦͽ��(����˵��) /AboutShituGoldCard",
		"�ر�/Quit"
	};
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"��ȫ���緢��ʦ����/SendBaiShiBidding")
	end
	
	tinsert(btn, szOp[1])
	-- VN_MODIFY_20060427
	-- �رջƽ�ʦͽ��(˵��)
	--tinsert(btn, szOp[2])
	tinsert(btn, szOp[3])
	
	local str = "ʦͽ�������޽�ʦͽ��ϵ������ʹ����ص�ʦͽ���ܡ�����㻹û��ʦͽ��ϵ�����ȸ����������ӣ�Ȼ����ʹ��ʦͽ����"
	Say(str,getn(btn),btn)
	return
end

Quit = function() end

function AboutShituCard()
	local str =
		"���������У�80�����£�����80��������ң�ʹ��<color=green>ʦͽ��<color>�����԰�80�������ϣ���80���������Ϊʦ����<enter>"..
		"һ�����֮���ʦͽ��ϵȷ����ʦ����Ҫ��һ����ְ��ָ����Э��ͽ�����һϵ�е�<color=yellow>��������<color>���񣬲���ͽ�ܴ���80�����ʦ����ʦ������ɹ�����һ��ͽ�ܡ�<enter>"..
		"���������У�һ��ͽ��ͬʱֻ����һ��ʦ����һ��ʦ��ͬʱ�����ն��ͽ�ܡ����һ��25������25�������£����Ҵ�û�аݹ�ʦ����ң��ɹ�����һ��ʦ�������£������Ҿ��Ǹ�ʦ����<color=yellow>�մ�����<color>�������25�����ϣ�����25��������ң�����һ��ʦ�������£������Ҿ��Ǹ�ʦ����<color=yellow>ֱϵ����<color>�����һ����ǰ�Ѿ��ݹ�ʦ��������ǰʦ�������ʦͽ��ϵ����ң�����һ��ʦ�������£������Ҿ��Ǹ�ʦ����<color=yellow>��ͨ����<color>��<enter>"..
		"<enter>��Ϊͽ�ܵ�������<enter>"..
		"1��80�����£�����80���������<enter>"..
		"2������ĳ��ʦ��������<enter>"..
		"<enter>��Ϊʦ����������<enter>"..
		"1��80�������ϣ���80���������<enter>"..
		"2������ĳ��ʦ����ͽ��<enter>"..
		"<enter>ʦͽ���Ļ��;����<enter>"..
		"1���´����Ľ�ɫ���������Դ�ʦͽ��<enter>"..
		"2���Ѵ����Ľ�ɫ��������г���<enter>"
	Describe(str,2,"����/main","�ر�/Quit")
	return
end

function AboutShituGoldCard()
	local str =
		"<color=yellow>�ƽ�ʦͽ��<color>��������ͨʦͽ���Ĺ����⣬�������������ԣ�<enter>"..
		"  1.����ȫ���緢һ�ι��棬Ѱ��ʦ���������ʦ<enter>"..
		"  2.��ʦ��������ͽ�ܿɶ�����50%��ʦ��20%�ľ��齱��<enter>"..
		"  3.�ƽ�ʦͽ���Ķ��⽱��ֻ��ͽ��ʹ��ʱ��Ч<enter>"..
		"  4.�ƽ�ʦͽ�����ܶ������ϣ����ܽ��׸��������<enter>"..
		"<enter>�ƽ�ʦͽ���Ļ�ȡ;����<enter>"..
		"  1.ʹ��cd-key�����ʺż���<color=green>��ɽ�ƹ�Աϵͳ<color>�����ɻ�<color=yellow>�ƽ�ʦͽ��<color>һ��<enter>"..
		"  2.ͬһ�ʺ�ֻ��һ����ɫ���Ի�ȡ<color=yellow>�ƽ�ʦͽ��<color>"
		
	Describe(str,2,"����/main","�ر�/Quit")
	return
end


-- �������֮���Ƿ��Ѿ����� 5 ��ͽ��
function checkTudiLimit()
	
	-- �ڴ��ж��Ƿ񳬹��� 7 �� 5 ��ͽ�ܵ�����
	local nNowTime = GetCurServerTime();
	local nOldTime = GetTask(ID_SHITU_LIMIT_DATE);  -- ��һ����ͽ�ܵļ�¼
	local nNowCount = GetTask(ID_SHITU_LIMIT_NUM);
	
		if nNowTime - nOldTime<CONST_SHITU_LIMIT_TIME then
			-- ��������˴�������
			if nNowCount>=5 then
				return 0;
			else
				return 1;
			end;
		else
			-- ��������� 7 �죬�����ñ���
			SetTask(ID_SHITU_LIMIT_NUM, 0);
			return 1;
		end;
end;


-- д����ͽ�ܵ�����
function writeTudiLimit()
	
	-- �ڴ˼�����ͽ�ܵ����Ƽ�¼
	SetTask(ID_SHITU_LIMIT_NUM, GetTask(ID_SHITU_LIMIT_NUM) + 1);	
	
	-- ����ǵ�һ����ͽ�����¼����
	if GetTask(ID_SHITU_LIMIT_NUM)==1 then
		SetTask(ID_SHITU_LIMIT_DATE, GetCurServerTime());
	end;
	
end;


function main()
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("��ᱱ��������-�ķ�ƪ�꣬80�����²���ʹ��ʦͽ��.", 0);
		return 1
	end;
	local degree = GetPlayerDegree(PlayerIndex)
	
	if(degree == CONST_DEGREE_PREAPPRENTICE) then
		local masters = FindMaster()
		if(not masters) then
			DefaultDialog()
			return 1
		end
		BaishiList(masters)
		return 1
	end
	if(degree == CONST_DEGREE_PREMASTER) then	
		local apps = FindApprentice()
		if(not apps) then
			DefaultDialog()
			return 1
		end
		ShoutuList(apps)
		return 1
	end
	if(degree == CONST_DEGREE_MASTER) then
		MasterDialog()
		return 1
	end
	if(degree == CONST_DEGREE_APPRENTICE) then
		ApprenticeDialog()
		return 1
	end
	return 1
end
