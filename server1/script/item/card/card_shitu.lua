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

--查找可以成为师父的人
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

--查找可以成为徒弟的人
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

--得到徒弟列表界面
function ShoutuList(apps)
	local str = "查看下列玩家的情况，选择一个合适的作为你的徒弟："
	local btn = {}
	-- local apps = FindApprentice()
	if(not apps) then
		Msg2Player("没有合适的徒弟人选。")
		return
	end
	for i=1,getn(apps) do
		tinsert(btn,"查看 "..safeshow(apps[i]).." 的信息/#XuanTudi('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"关闭/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_ShoutuList()
	local apps = FindApprentice()
	ShoutuList(apps)
end

--得到可以做师父的人员列表
function BaishiList(masters)
	print("Call BaishiList()")
	local str = "查看下列玩家的情况，选择一个合适的作为你的师父："
	local btn = {}
	-- local masters = FindMaster()
	if(not masters) then
		print("Master can not found.")
		return
	end
	for i=1,getn(masters) do
		tinsert(btn,"查看 "..safeshow(masters[i]).." 的信息/#XuanShifu('"..safestr(masters[i]).."')")
	end
	tinsert(btn,"关闭/Quit")
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

--了解能够成为徒弟的人选的信息
function XuanTudi(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."已经不知所踪。")
		return
	end
	-- local app = getPlayerInfo(pid,{"level","sex"},{TKID_MASTER_COUNT},{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local app = getPlayerInfo(pid, tb_playerinfo_tudi, tb_playertask_tudi, tb_playertemp_tudi)
	local str = safeshow(playerName)..":"..sex2Word(app.sex).."<enter>"
	if(app.level <= 25) then
		str = str.."目前等级在26级以下，"
	elseif(app.level < 50) then
		str = str.."目前等级在50级以下，"
	elseif(app.level < 65) then
		str = str.."目前等级在65级以下，"
	elseif(app.level < 75) then
		str = str.."目前等级在75级以下，"
	elseif(app.level < 80) then
		str = str.."目前等级在80级以下，"
	else
		str = str.."目前等级在80级以上，"
	end
	if(app.task[TKID_MASTER_COUNT] ==0) then
		str = str.."还没有拜过师父，"
	else
		str = str.."已经拜过"..tostring(app.task[TKID_MASTER_COUNT]).."个师父，"
	end
	if(FALSE(GetShituLeagueId(playerName))) then
		UpdatePlayerSelfLilian(pid)
	end
	if(GetPlayerLilianCount(pid)==0) then
		str = str.."此前没有完成过任何江湖历练。"
	else
		str = str.."已经完成了"..tostring(GetPlayerLilianCount(pid)).."件江湖历练。"
	end
	if(app.tasktmp[TTKID_APPRENTICE_FLAG]==FileName2Id(GetName())) then
		str = str.."<enter>目前已经申请拜你为师，请使用<color=green>师徒卡<color>中的<color=yellow>收徒弟<color>功能回应。"
	end
	if(app.tasktmp[TTKID_RECRUIT_FLAG] == FileName2Id(GetName())) then
		str = str.."<enter>目前已经申请收他(她)为徒，正在等待他(她)的回应。"
	end
	/*
	local btn = {
		"收 "..safeshow(playerName).." 为徒/#Shoutu('"..safestr(playerName).."')",
		"返回/ShoutuList",
		"关闭/Quit"
	}
	Say(str,getn(btn),btn)
	*/
	Say(str,
		3,
		"拜 "..safeshow(playerName).." 为师/#Shoutu('"..safestr(playerName).."')",
		"返回上一步/CallBack_ShoutuList",
		"关闭/Quit")	
	return
end

tb_playerinfo_shifu = {"sex"}
tb_playertask_shifu = {TKID_APPRENTICE_COUNT, TKID_DICHUAN_APPRENTICE_COUNT, TKID_ZHIXI_APPRENTICE_COUNT, TKID_NORMAL_APPRENTICE_COUNT}

function XuanShifu(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."已经不知所踪。")
		return
	end
	-- local master = getPlayerInfo(pid,{"sex"},{TKID_APPRENTICE_COUNT,TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local master = getPlayerInfo(pid, tb_playerinfo_shifu, tb_playertask_shifu)
	local btn = {
		"拜 "..safeshow(playerName).." 为师/#Baishi('"..safestr(playerName).."')",
		"返回/BaishiList",
		"关闭/Quit"
	}
	local str = safeshow(playerName)..":"..sex2Word(master.sex).."<enter>"
	st_print("XuanShifu(): "..GetName().."master: "..str);
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid) and FALSE(master.task[TKID_APPRENTICE_COUNT])) then
		str = str.."到目前为止，还没做过师父。"
		Say(str,getn(btn),btn)
		return
	end
	str = str.."到目前为止，已经收过"..tostring(master.task[TKID_APPRENTICE_COUNT]).."个徒弟，"
	str = str.."其中，成功的带出"..tostring(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."个嫡传弟子，"
	str = str..tostring(master.task[TKID_ZHIXI_APPRENTICE_COUNT]).."个直系弟子，"
	str = str..tostring(master.task[TKID_NORMAL_APPRENTICE_COUNT]).."个普通弟子。"
	str = str.."目前，"..playerName.."一共可以带"..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."个徒弟，"
	str = str.."并且，现已收了"..tostring(GetApprenticeNum(playerName)).."个徒弟。"
	Say(str,getn(btn),btn)
	return
end

function Baishi(master) --徒弟触发
	print("Call Baishi("..tostring(master)..").")
	local pid = SearchPlayer(master)
	if(FALSE(pid)) then
		Msg2Player("对不起，"..master.."已经不知所踪。")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_FLAG,FileName2Id(master))
	if(GetTaskTemp(TTKID_APPRENTICE_FLAG)==GetTaskTemp(TTKID_RECRUIT_FLAG)) then
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		--检查师父的土地容量
		local load = ComputeMasterLoad(callPlayerFunction(pid,GetTask,TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(master)
		if(not appNum) then
			print("异常，master突然还没有拜师。")
			return
		end
		if(load <= appNum) then --人数已满，不能再拜师
			Msg2Player(master.."现在已经带了太多的徒弟，再也顾不上你了。")
			sendMessage(pid,"你现在已经带了太多的徒弟，再也顾不上"..GetName().."了。")
			return
		end
		Msg2Player(master.."已经答应收你为徒，正在等待系统建立你们的师徒关系。")
		sendMessage(pid,"你已经答应收"..GetName().."为徒，正在等待系统建立你们的师徒关系。")
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		--AddGlobalNews("恭喜"..GetName().."拜入"..master.."的门下，成为"..master.."的弟子。")
		UpdatePlayerSelfLilian(PlayerIndex)
		BuildRelationship(GetName(),master)
		return
	end
	Msg2Player("你打算拜"..master.."为师，正在等待回应...")
	sendMessage(pid,GetName().."打算拜你为师，请使用<color=green>师徒卡<color>中的<color=yellow>收徒弟<color>功能回应。")
	return
end

tb_playertemp_shoutu = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

function Shoutu(apprentice) --师父触发
	print("Call Shoutu("..tostring(apprentice)..").")
	local pid = SearchPlayer(apprentice)
	if(FALSE(pid)) then
		Msg2Player("对不起，"..apprentice.."已经不知所踪。")
		return
	end
	
	if checkTudiLimit()~=1 then
		Say("你的徒弟已经离线!", 0);
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
		print("thu nh薾  t? ")
		local load = ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(GetName())
		if(not appNum) then
			print("异常，本人突然没有拜师")
			return
		end
		if(load <= appNum) then --人数已满，不能再拜师
			Msg2Player("你现在已经带了太多的徒弟，再也顾不上"..apprentice.."了。")
			sendMessage(pid,GetName().."现在已经带了太多的徒弟，再也顾不上你了。")
			return
		end
		
		-- 写入徒弟数据
		writeTudiLimit();
		
			Msg2Player("你现在已经带了太多的徒弟，再也顾不上"..apprentice.."了。")
			sendMessage(pid,GetName().."现在已经带了太多的徒弟，再也顾不上你了。")
		callPlayerFunction(pid,SetTaskTemp,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTaskTemp,TTKID_RECRUIT_FLAG,0)
		--AddGlobalNews("恭喜"..apprentice.."拜入"..GetName().."的门下，成为"..GetName().."的弟子。")
		UpdatePlayerSelfLilian(pid)
		BuildRelationship(apprentice,GetName())
		return
	end
	
	-- 写入徒弟数据
	writeTudiLimit();
	
	Msg2Player("你打算收"..apprentice.."为徒，正在等待回应...")
	sendMessage(pid,GetName().."打算收你为徒，请使用<color=green>师徒卡<color>中的<color=yellow>拜 "..GetName().." 为师<color>功能回应。")
	return
end

function MasterDialog()
	local btn = {}
	local masterName = GetName()
	local num = GetApprenticeNum(masterName)
	if(not num) then 
		print("异常，我的身份咋能是没拜师呢，应该是师父啊。")
		return
	end
	if(FindApprentice() and 
		num < ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))) then
		tinsert(btn,"收徒弟/ShoutuList")
	end
	if(GetEnableChushiApps(masterName)) then
		tinsert(btn,"徒弟出师/ChushiList")
	end
	if(GetHaveNewLilianApps(masterName)) then
		tinsert(btn,"查看徒弟的江湖历练/LilianList")
	end
	if(num > 0 ) then
		tinsert(btn,"查看徒弟信息/TudiInfoList")
		tinsert(btn,"解除师徒关系/BreakTuList")
	end
	tinsert(btn,"查看自己的信息/SfChaShifu")
	tinsert(btn,"了解师徒卡/AboutShituCard")
	tinsert(btn,"关闭/Quit")
	local str = "请选择师父相关的操作："
	Say(str,getn(btn),btn)
	return
end

function BreakTuList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("你尚无任何徒弟。")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,"解除与 "..safeshow(apps[i]).." 的师徒关系/#ShiConform('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"返回/MasterDialog")
	tinsert(btn,"关闭/Quit")
	local str = "你想解除与哪个徒弟的师徒关系？"
	Say(str,getn(btn),btn)
	return
end

function ShiConform(appName)
	Say("你确定要解除与"..safeshow(appName).."之间的师徒关系吗？",
		2,
		"确定/#BreakShituLeague('"..safestr(appName).."')",
		"取消/BreakTuList")
	return
end

function TuConform()
	local playerName = GetName();
	local btn = {
		"确定/#BreakShituLeague('"..safestr(playerName).."')",
		"取消/ApprenticeDialog"
	}
	
	local masterName = GetMaster(playerName)
	if (masterName == nil) then
		local lid = GetShituLeagueId(playerName)
		if(TRUE(lid)) then -- 师父不存在，但战队存在
			Say("你的师父失踪了，你决定强行解除与他的师徒关系吗？",getn(btn),btn)
		else
			print("师徒关系不存在。")
		end
	else		
		Say("你确定要解除与"..safeshow(masterName).."的师徒关系吗？",getn(btn),btn)
	end
	return
end

function TudiInfoList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("你尚无任何徒弟。")
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
			tinsert(btn,"查看 "..safeshow(apps[i]).." (黄金弟子) 的相关信息/#TudiInfo('"..safestr(apps[i]).."')")
			else
			tinsert(btn,"查看 "..safeshow(apps[i]).." 的相关信息/#TudiInfo('"..safestr(apps[i]).."')")
			end
		end
	end
	tinsert(btn,"返回/MasterDialog")
	tinsert(btn,"关闭/Quit")
	local str = "你想查看哪个徒弟的相关信息？"
	Say(str,getn(btn),btn)
	return
end

--查看徒弟历练时的徒弟列表
function LilianList()
	local apps = GetHaveNewLilianApps(GetName())
	if(not apps) then
		Msg2Player("目前为止，还没有任何徒弟有新的江湖历练。")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."已经新完成了"..apps[i][2].."件历练任务/#ChaLilian('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"返回/MasterDialog")
	tinsert(btn,"关闭/Quit")
	local str = "你想查看哪个徒弟的江湖历练？"
	Say(str,getn(btn),btn)
	return
end

tb_playerinfo_lilian = {TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG}

function ChaLilian(appName) --师父触发
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."不知所踪。")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_LILIAN_FLAG]=1})
	-- local appinfo = getPlayerInfo(appIdx,nil,nil,{TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG})
	local appinfo = getPlayerInfo(appIdx, nil, nil, tb_playerinfo_lilian)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]==appinfo.tasktmp[TTKID_MASTER_LILIAN_FLAG] and appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]~=0) then
		Msg2Player("你答应开始查看"..appName.."的江湖历练。")
		sendMessage(appIdx,GetName().."答应开始查看你的江湖历练。")
		setPlayerTaskTemp(appIdx,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(appIdx)
		PayLilianBonus(appIdx,PlayerIndex)
		return
	end
	Msg2Player("你要求查看"..appName.."的江湖历练，正在等待他(她)的复命...")
	sendMessage(appIdx,GetName().."要求查看你的江湖历练，请使用<color=green>师徒卡<color>中的<color=yellow>向师父复命<color>功能回应。")
	return
end

function FuLilian(masterName) --徒弟调用
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player(masterName.."不知所踪。")
		return
	end
	SetTaskTemp(TTKID_SELF_LILIAN_FLAG,1)
	if(GetTaskTemp(TTKID_SELF_LILIAN_FLAG)==GetTaskTemp(TTKID_MASTER_LILIAN_FLAG) and GetTaskTemp(TTKID_SELF_LILIAN_FLAG)~=0) then
		Msg2Player("你答应向"..masterName.."复命，开始让他(她)查看你的江湖历练。")
		sendMessage(masterIdx,GetName().."答应向你复命，你开始查看他(她)的江湖历练。")
		setPlayerTaskTemp(PlayerIndex,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(PlayerIndex)
		PayLilianBonus(PlayerIndex,masterIdx)
		return
	end
	Msg2Player("你要求向"..masterName.."复命，正在等待他(她)查看你的江湖历练。")
	sendMessage(masterIdx,GetName().."要求向你复命，请使用<color=green>师徒卡<color>中的<color=yellow>查看徒弟的江湖历练<color>功能回应。")
	return
end

function SendBaiShiBidding()
	local mapid, x, y = GetWorldPos();
	local myMapName, myMapX, myMapY = tl_getMapInfo(mapid);
	local str = "新玩家["..GetName().."]天资过人，颇具慧根，现面向全世界觅良师一名，"
	if (myMapName ~= 0) then
		x = floor(x / 8);
		y = floor(y / 16);
		AddLocalNews(str.."有意者请到["..myMapName.."]("..x..", "..y..")");
	else
		AddLocalNews(str.."有意者请与其联系");
	end
	
	-- 标记：2 - 发过拜师公告
	SetTask(TKID_GOLD_APPRENTICE, 2);
end

function ApprenticeDialog()
	print("Call ApprenticeDialog")
	local btn = {}
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"向全世界发拜师公告/SendBaiShiBidding")
	end
	
	if(lvl < 80) then
		tinsert(btn,"获取师父给你的能力/GetAbility")
	else
		local master = GetMaster(GetName())
		if(TRUE(SearchPlayer(master))) then
			tinsert(btn,"出师/TudiChushi")
		end
	end
	if(TRUE(HaveNewLilian(PlayerIndex))) then
		tinsert(btn,"向师父复命/Fuming")
	end
	tinsert(btn,"查看学艺情况/ChaSelfInfo")
	tinsert(btn,"了解师父信息/TdChaShifu")
	tinsert(btn,"解除师徒关系/TuConform")
	tinsert(btn,"了解师徒卡/AboutShituCard")
	-- VN_MODIFY_20060427
	-- 关闭黄金师徒卡(说明)
	-- tinsert(btn,"了解黄金师徒卡(特性说明)/AboutShituGoldCard")
	tinsert(btn,"关闭/Quit")
	local str = "请选择徒弟相关操作："
	Say(str,getn(btn),btn)
	return	
end

function ChushiList()
	local apps = GetEnableChushiApps(GetName())
	if(not apps) then
		Msg2Player("目前没有合适的弟子可以出师。")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."["..apps[i][2].."级]目前已经可以出师/#ShiChushi('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"返回/MasterDialog")
	tinsert(btn,"关闭/Quit")
	local str = "你想想让哪个徒弟出师？"
	Say(str,getn(btn),btn)
	return
end

function ShiChushi(appName)
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."不知所踪，看来暂时不能让他(她)出师。")
		return
	end
	local app = getPlayerInfo(appIdx,{"level"})
	if(app.level <80) then
		Msg2Player(appName.."的能力还不足以达到出师的水平，还是再等两年吧。")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_CHUSHI]=1})
	app = getPlayerInfo(appIdx,nil,nil,{TTKID_APPRENTICE_CHUSHI,TTKID_MASTER_CHUSHI})
	if(app.tasktmp[TTKID_MASTER_CHUSHI]== app.tasktmp[TTKID_APPRENTICE_CHUSHI] and app.tasktmp[TTKID_APPRENTICE_CHUSHI]~=0) then
		Msg2Player(appName.."已经青出于蓝，你非常欣慰，决定让"..appName.."出师。")
		sendMessage(appIdx,GetName().."已经答应让你出师，你终于可以闯一番新天地了。")
		AddGlobalNews("恭喜"..appName.."学艺已成，从"..GetName().."门下出师。")
		OutShituLeague(appName,GetName())
		return
	end
	Msg2Player("你觉得"..appName.."悟性甚高，转眼间已没什么好教他(她)的了，决定让他(她)出师，"..appName.."考虑中...")
	sendMessage(appIdx,GetName().."觉得你青出于蓝，转眼间，已没什么好教你的了，决定让你出师，正在等待你的决定...")
	return
end

function TudiChushi() --徒弟激活
	local masterName = GetMaster(GetName())
	if(not masterName) then --师父不在
		Msg2Player("你没有师父，出什么师？")
		return
	end
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player("师父不知所踪，无法出师。")
		return
	end
	if(GetLevel() <80) then
		Msg2Player("你的能力还不足与出师，还是再苦练两年吧。")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_CHUSHI,1)
	if(GetTaskTemp(TTKID_APPRENTICE_CHUSHI)==GetTaskTemp(TTKID_MASTER_CHUSHI) and GetTaskTemp(TTKID_MASTER_CHUSHI)~=0) then
		Msg2Player("经过师父多年的培养，你终于学有所成，打算自立门户去了。")
		sendMessage(masterIdx,GetName().."经过你多年培养，终于出师，自立门户去了。")
		AddGlobalNews("恭喜"..GetName().."学艺已成，从"..masterName.."门下出师。")
		OutShituLeague(GetName(),masterName)
		return
	end
	Msg2Player("你觉得学艺已成，向"..masterName.."请求出师，正在等待他(她)的回应...")
	sendMessage(masterIdx,GetName().."觉得学艺已成，向你请求出师，请使用<color=green>师徒卡<color>中的<color=yellow>徒弟出师<color>功能回应。")
	return	
end

function Fuming()
	local masterName = GetMaster(GetName())
	FuLilian(masterName)
	return
end

function GetAbility()
	if(GetLevel()>80) then
		Msg2Player("你的本事已经学得差不多了，就不要再依靠师父给你的能力了。")
		return
	end
	AddSkillState(531,10,1,30*60*18)
	AddSkillState(461,1, 1,30*60*18)
	Msg2Player("你使用了师父给你的30分钟经验翻倍的能力。")
	return
end

function TudiInfo(appName)  --师父查徒弟信息
	local pid = SearchPlayer(appName)
	if(FALSE(pid)) then
		Msg2Player(appName.."不知所踪，无法得到他(她)的信息。")
		return
	end
	local sex = callPlayerFunction(pid,GetSex)
	local str
	if(FALSE(sex)) then --男
		str = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\003.spr>"
	end
	str = str..appName.."<link>:"..sex2Word(sex).."<enter>"
	local joinLvl = callPlayerFunction(pid,GetTask,TKID_ENTER_LEVEL)
	str = str.."你在他(她)"..tostring(joinLvl).."级的时候，收他(她)为徒，"
	local masterCount = callPlayerFunction(pid,GetTask,TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."你是他(她)的启蒙老师，"
		if(joinLvl<=25) then
			str = str.."他(她)是你的<color=yellow>嫡传<color>弟子。"
		else
			str = str.."他(她)是你的<color=green>直系<color>弟子。"
		end
	else
		str = str.."此前，他(她)已经拜过"..tostring(masterCount-1).."个人为师，谁知，都无疾而终，是你最终收留了他(她)。"
	end
	local appLvl = callPlayerFunction(pid,GetLevel)
	if(appLvl<80) then
		str = str.."现在他(她)的等级已有"..tostring(appLvl).."级了。<enter>"
	else
		str = str.."现在他(她)已经"..tostring(appLvl).."级了。你可以让他(她)出去自己闯闯了。<enter>"
	end
	local lilianCount = GetPlayerLilianCount(pid)
	local newllc = HaveNewLilian(pid)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str..appName.."已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着你查看：<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."到目前为止，"..appName.."还一事无成。"
		end
	else
		local masterllCount = GetPlayerMasterLilianCount(pid)
		if(FALSE(masterllCount)) then --还没复命任何历练
			if(TRUE(newllc)) then
				str = str.."目前"..appName.."已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着你查看：<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."此前，"..appName.."已完成了"..lilianCount.."件江湖历练任务，"
			str = str.."但是在你的名下，还没有完成任何江湖历练任务。<enter>"
		else
			if(TRUE(newllc)) then
				str = str..appName.."已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着你查看：<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."此前，"..appName.."还完成了"..lilianCount.."件江湖历练任务，"
			str = str.."其中在你名下完成的有如下<color=green>"..masterllCount.."<color>件江湖历练：<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(pid))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(pid))
	if(unfinishedLilian) then
		str = str.."他(她)目前还有<color=red>"..getn(unfinishedLilian).."<color>件事情没有向你复命，分别是：<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."他(她)已经完成了所有的江湖历练任务！"
	end
	local btn = {
		"返回/TudiInfoList",
		"关闭/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"查看"..appName.."，他已完成"..newllc.."件任务/#ChaLilian('"..safestr(appName).."')")
	end
	Describe(str,getn(btn),btn)
	return
end

function ChaSelfInfo() --徒弟查自己的信息
	local str
	if(FALSE(GetSex())) then --男
		str = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\003.spr>"
	end
	str = str..GetName().."<link>:"..sex2Word(GetSex()).."<enter>"
	
	local master = GetMaster(GetName())
	master = master or ""
	str = str.."你在"..tostring(GetTask(TKID_ENTER_LEVEL)).."级的时候，拜入良师"..master.."的门下，"
	local masterCount = GetTask(TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."他(她)是你的启蒙老师。"
	else
		str = str.."此前，你已经拜过"..tostring(masterCount-1).."个人为师，谁知，所遇非仁，都无疾而终。"
	end
	local myLvl = GetLevel()
	if(myLvl<80) then
		str = str.."现在你的等级已经提升到"..tostring(myLvl).."级了。<enter>"
	else
		str = str.."现在你已经"..tostring(myLvl).."级了。达到了出师的要求。<enter>"
	end
	local lilianCount = GetLilianCount()
	local newllc = HaveNewLilian(PlayerIndex)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str.."你已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着向师父复命：<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."到目前为止，你还一事无成。"
		end
	else
		local masterllCount = GetMasterLilianCount()
		if(FALSE(masterllCount)) then --未在我名下完成了任务  
			if(TRUE(newllc)) then
				str = str.."目前你已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着向师父复命：<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."此前，你已完成了"..lilianCount.."件江湖历练任务，"
			str = str.."但是在师父的名下，你还没有完成任何江湖历练任务。<enter>"
		else
			if(TRUE(newllc)) then
				str = str.."你已完成了如下<color=yellow>"..newllc.."<color>件江湖历练任务，等着向师父复命：<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."此前，你已完成了"..lilianCount.."件江湖历练任务，"
			str = str.."其中在师父的名下完成的有如下<color=green>"..masterllCount.."<color>件江湖历练：<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(PlayerIndex))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(PlayerIndex))
	if(unfinishedLilian) then
		str = str.."你还有<color=red>"..getn(unfinishedLilian).."<color>件事情没有复命过，分别是：<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."你已经完成了所有的江湖历练任务！"
	end
	local btn = {
		"返回/ApprenticeDialog",
		"关闭/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"有"..newllc.."件历练可向师父复命/Fuming")
	end
	Describe(str,getn(btn),btn)
	return
end

function SfChaShifu()
	local btn = {
		"返回/MasterDialog",
		"关闭/Quit"
	}
	local str = safeshow(GetName()).."："..sex2Word(GetSex()).."<enter>"
	local lid = GetShituLeagueId(GetName())
	if(FALSE(lid) and FALSE(GetTask(TKID_APPRENTICE_COUNT))) then
		str = str.."到目前为止，还没做过师父。"
		Say(str,getn(btn),btn)
		return
	end
	str = str.."到目前为止，已经收过"..GetTask(TKID_APPRENTICE_COUNT).."个徒弟，"
	str = str.."其中，成功的带出"..GetTask(TKID_DICHUAN_APPRENTICE_COUNT).."个嫡传弟子，"
	str = str..GetTask(TKID_ZHIXI_APPRENTICE_COUNT).."个直系弟子，"
	str = str..GetTask(TKID_NORMAL_APPRENTICE_COUNT).."个普通弟子。"
	str = str.."目前，你一共可以带"..ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT)).."个徒弟，"
	str = str.."并且，现已收了"..tostring(GetApprenticeNum(GetName())).."个徒弟。"
	Say(str,getn(btn),btn)
	return
end

function TdChaShifu()
	local masterName = GetMaster(GetName())
	if(not masterName) then
		Msg2Player("你目前还没有师父。")
		return
	end
	local btn = {
		"返回/ApprenticeDialog",
		"关闭/Quit"
	}
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Say("你的师父 "..safeshow(masterName).." 目前踪迹全无，你无法了解到他(她)的情况。",getn(btn),btn)
		return
	end
	local master = getPlayerInfo(masterIdx,{"sex"},{TKID_APPRENTICE_COUNT,
		TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local str = safeshow(masterName).."："..sex2Word(master.sex).."<enter>"
	str = str.."到目前为止，已经收过"..master.task[TKID_APPRENTICE_COUNT].."个徒弟，"
	str = str.."其中，成功的带出"..master.task[TKID_DICHUAN_APPRENTICE_COUNT].."个嫡传弟子，"
	str = str..master.task[TKID_ZHIXI_APPRENTICE_COUNT].."个直系弟子，"
	str = str..master.task[TKID_NORMAL_APPRENTICE_COUNT].."个普通弟子。"
	str = str.."目前，"..safeshow(masterName).."一共可以带"..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).."个徒弟，"
	str = str.."并且，现已收了"..tostring(GetApprenticeNum(masterName)).."个徒弟。"
	Say(str,getn(btn),btn)
	return
end

--得到有新历练的徒弟列表
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

--得到可以出师的徒弟的列表
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
		"了解师徒卡/AboutShituCard",
		"了解黄金师徒卡(特性说明) /AboutShituGoldCard",
		"关闭/Quit"
	};
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"向全世界发拜师公告/SendBaiShiBidding")
	end
	
	tinsert(btn, szOp[1])
	-- VN_MODIFY_20060427
	-- 关闭黄金师徒卡(说明)
	--tinsert(btn, szOp[2])
	tinsert(btn, szOp[3])
	
	local str = "师徒卡用来缔结师徒关系，并且使用相关的师徒功能。如果你还没有师徒关系，请先跟其他玩家组队，然后再使用师徒卡。"
	Say(str,getn(btn),btn)
	return
end

Quit = function() end

function AboutShituCard()
	local str =
		"剑网世界中，80级以下（不含80级）的玩家，使用<color=green>师徒卡<color>，可以拜80级及以上（含80级）的玩家为师父。<enter>"..
		"一旦玩家之间的师徒关系确定，师父需要尽一定的职责，指导或协助徒弟完成一系列的<color=yellow>江湖历练<color>任务，并将徒弟带到80级后出师，则师父就算成功带出一名徒弟。<enter>"..
		"剑网世界中，一个徒弟同时只能有一个师父，一个师父同时可以收多个徒弟。如果一个25级（含25级）以下，并且从没有拜过师的玩家，成功拜入一个师父的名下，则该玩家就是该师父的<color=yellow>嫡传弟子<color>；如果是25级以上（不含25级）的玩家，拜入一个师父的名下，则该玩家就是该师父的<color=yellow>直系弟子<color>；如果一个以前已经拜过师，并且与前师父解除了师徒关系的玩家，拜入一个师父的名下，则该玩家就是该师父的<color=yellow>普通弟子<color>。<enter>"..
		"<enter>成为徒弟的条件：<enter>"..
		"1、80级以下（不含80级）的玩家<enter>"..
		"2、不在某个师父的名下<enter>"..
		"<enter>成为师父的条件：<enter>"..
		"1、80级及以上（含80级）的玩家<enter>"..
		"2、不是某个师父的徒弟<enter>"..
		"<enter>师徒卡的获得途径：<enter>"..
		"1、新创建的角色：背包里自带师徒卡<enter>"..
		"2、已创建的角色：奇珍阁有出售<enter>"
	Describe(str,2,"返回/main","关闭/Quit")
	return
end

function AboutShituGoldCard()
	local str =
		"<color=yellow>黄金师徒卡<color>除具有普通师徒卡的功能外，还具有以下特性：<enter>"..
		"  1.可向全世界发一次公告，寻求师父，请求拜师<enter>"..
		"  2.向师父复命，徒弟可额外获得50%，师父20%的经验奖励<enter>"..
		"  3.黄金师徒卡的额外奖励只在徒弟使用时有效<enter>"..
		"  4.黄金师徒卡不能丢到地上，不能交易给其他玩家<enter>"..
		"<enter>黄金师徒卡的获取途径：<enter>"..
		"  1.使用cd-key激活帐号加入<color=green>金山推广员系统<color>，即可获<color=yellow>黄金师徒卡<color>一张<enter>"..
		"  2.同一帐号只有一个角色可以获取<color=yellow>黄金师徒卡<color>"
		
	Describe(str,2,"返回/main","关闭/Quit")
	return
end


-- 检测七天之内是否已经收了 5 个徒弟
function checkTudiLimit()
	
	-- 在此判断是否超过了 7 天 5 个徒弟的限制
	local nNowTime = GetCurServerTime();
	local nOldTime = GetTask(ID_SHITU_LIMIT_DATE);  -- 第一次收徒弟的记录
	local nNowCount = GetTask(ID_SHITU_LIMIT_NUM);
	
		if nNowTime - nOldTime<CONST_SHITU_LIMIT_TIME then
			-- 如果超过了次数限制
			if nNowCount>=5 then
				return 0;
			else
				return 1;
			end;
		else
			-- 如果超过了 7 天，则重置变量
			SetTask(ID_SHITU_LIMIT_NUM, 0);
			return 1;
		end;
end;


-- 写入收徒弟的限制
function writeTudiLimit()
	
	-- 在此加入收徒弟的限制记录
	SetTask(ID_SHITU_LIMIT_NUM, GetTask(ID_SHITU_LIMIT_NUM) + 1);	
	
	-- 如果是第一次收徒弟则记录日期
	if GetTask(ID_SHITU_LIMIT_NUM)==1 then
		SetTask(ID_SHITU_LIMIT_DATE, GetCurServerTime());
	end;
	
end;


function main()
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("领会北斗长生术-心法篇完，80级以下不能使用师徒卡.", 0);
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
