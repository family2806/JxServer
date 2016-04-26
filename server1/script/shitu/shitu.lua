Include ("\\script\\shitu\\shitu_head.lua")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\lilian.lua")
Include ("\\script\\shitu\\chushibonus.lua")

IncludeLib("LEAGUE")
IncludeLib("TITLE")
function validateName(name)
	return not strfind(name,");")
end

function GetName()
	local name = %GetName()
	if(not validateName(name)) then
		return ""
	end
	return name
end

--------------------
function st_print(str)
	print(str)
end

--------------------
--建立apprenticeIdx,与masterIdx的师徒关系 qilei use it 
function BuildRelationship(apprenticeName,masterName)
	
	print("Call BuildRelationship("..tostring(apprenticeName)..","..tostring(masterName)..").")
	local masteridx = SearchPlayer(masterName)
	local apprenticeidx = SearchPlayer(apprenticeName)
	if (masteridx <= 0 or apprenticeidx <= 0) then
		print("player not online")
		return 0
	end
	if (haveLastShituOperation(masteridx) > 0 or haveLastShituOperation(apprenticeidx) > 0) then
		st_print("haveLastShituOperation... fail.");
		return 0
	end

	local lid,mid = GetShituLeagueId(masterName),LGM_CreateMemberObj()
	if(FALSE(lid)) then
		
		lid = LG_CreateLeagueObj()
		LG_SetLeagueInfo(lid, CONST_LEAGUETYPE_SHITU, masterName)
		print(masterName)
		LGM_SetMemberInfo(mid, masterName, CONST_LEAGUEJOB_MASTER,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		
		--记录建师徒的操作
		setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		
		LG_ApplyAddLeague(lid, "\\script\\shitu\\shitu.lua", "OnBuildShituLeague")
		LGM_FreeMemberObj(mid)	
		LG_FreeLeagueObj(lid)
		return 1
	end

	LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
	setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	LGM_ApplyAddMember(mid, "\\script\\shitu\\shitu.lua", "OnJoinShituLeague")
	LGM_FreeMemberObj(mid)
	return 1
end

function setPlayerLastShituOperation(lplayeridx, operation, data1, data2)
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx
	SetTask(TKID_LAST_SHITU_OPERATION, operation)
	SetTask(TKID_LAST_SHITU_DATA1, data1)
	SetTask(TKID_LAST_SHITU_DATA2, data2)
	st_print("setOperation: "..GetName().."(op:"..operation..") (data1:"..data1..") (data2"..data2..")");
	PlayerIndex = oldPly
end

function haveLastShituOperation(lplayeridx)
	if (lplayeridx == nil) then
		return 0
	end
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx 
	bResult = GetTask(TKID_LAST_SHITU_OPERATION)
	if (bResult > 0) then
		print("last operation is "..bResult)
	end
	PlayerIndex = oldPly
	return bResult
end

function OnBuildShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBuildShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	local lid = GetShituLeagueId(szLeagueName)
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("队伍建立或不成功")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmasterid = SearchPlayer(szLeagueName)
		if (pmasterid > 0) then
				clearLastShituOperation(pmasterid)
		end
		return 0
	end

		local num = LG_GetMemberCount(lid)
		if (num == 2) then
			for i=0,num -1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if(job == CONST_LEAGUEJOB_APPRENTICE) then --徒弟是也
					JoinShituSuccess(nLeagueType, szLeagueName, name)	
					return
				end
			end
		end

	JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)	

end

function JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("队伍不存在")
		return 0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE and name == szMemberName) then --徒弟是也
			mastername = szLeagueName
			local pappid = SearchPlayer(name)
			local pmastid = SearchPlayer(mastername)
			
			if(pappid > 0) then
				setApprenticeEnterData(pappid)
				clearLastShituOperation(pappid)
			end
			if (pmastid > 0) then
				setMasterWhenNewApprentice(pmastid)
				clearLastShituOperation(pmastid)
			end
			
			-- 为徒弟添加称号
			--callPlayerFunction(pappid, Title_AddTitle, CONST_SHITU_TU_TITLEID, 0, -1);
			--callPlayerFunction(pappid, Title_ActiveTitle, CONST_SHITU_TU_TITLEID);
			
			return 1
		end
	end
	
	return 0
end

function FindLeagueMember(szLeagueName, nameid)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("队伍不存在")
		return "",0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if (FileName2Id(name) == nameid) then
			return name, job
		end
	end
	return "", 0
end


function OnJoinShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnJoinShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("队伍建立或不成功")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmastid = SearchPlayer(szLeagueName)
		if (pmastid > 0) then
			clearLastShituOperation(pmastid)
		end
		
		return 0
	end
	return JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
end

tb_playerinfo_setapprdata = {"name","level"}
tb_playertask_setapprdata = {TKID_MASTER_COUNT}

--初始化徒弟加入师徒社团中的数据
function setApprenticeEnterData(apprenticeIdx)
--此函数用到数据修正中
	print("Call setApprenticeJoinData("..tostring(apprenticeIdx)..").")
	-- local apprentice = getPlayerInfo(apprenticeIdx, {"name","level"}, {TKID_MASTER_COUNT})
	local apprentice = getPlayerInfo(apprenticeIdx, tb_playerinfo_setapprdata, tb_playertask_setapprdata)

	if (FALSE(haveLastShituOperation(apprenticeIdx))) then
		print("TKID_OPERATION 标识未被置位")
	end
	print("Ъng c蕄 l骳 b竔 s?:"..apprentice.level)
	print(apprentice.task[TKID_MASTER_COUNT])
------------徒弟成功拜师以后，数据在这里设置 yfeng
	local tab = {
		[TKID_MASTER_LILIAN] = 0, --徒弟在上一个师傅的带领下的江湖历练清空
		[TKID_ENTER_LEVEL] = apprentice.level,  --记录拜师时候的等级
		[TKID_MASTER_COUNT] = apprentice.task[TKID_MASTER_COUNT]+1 --拜师数量+1
	}
	
	setPlayerTask(apprenticeIdx,tab)
	clearLastShituOperation(apprenticeIdx)
	
	local masterName = GetMaster(apprentice.name)
	if(not masterName) then
		print("师傅不存在")
		return
	end
	
	sendMessage(apprenticeIdx,"恭喜你已经成功地拜"..masterName.."为师。")
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then --师傅不在线
		print("成功创建师徒关系，但是师傅不在线。")
		return
	end
	
	sendMessage(masterIdx,"恭喜你已经成功地收"..apprentice.name.."为徒。")
	return
end


--此处编写师付新加徒弟时需要的记录 qilei
--Add
function setMasterWhenNewApprentice(masterIdx)
--此函数用到数据修正中
--to add
---徒弟成功拜师以后，师傅的数据在这里设置 yfneg
	--收徒弟数多1
	print("setMasterWhenNewApprentice",masterIdx)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))
	callPlayerFunction(masterIdx,SetTask,TKID_APPRENTICE_COUNT,
		callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT)+1)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))	
	clearLastShituOperation(masterIdx)
end

--解除师徒关系 qilei use it 
function BreakShituLeague(apprentice)
	pidx = SearchPlayer(apprentice)
	
	if (pidx > 0) then 
		if (haveLastShituOperation(pidx) > 0) then
			print("no end last oper")
			return 
		end
	end
	
	print("Call BreakShituLeague("..apprentice..").")
	local lid = GetShituLeagueId(apprentice)
	if(FALSE(lid)) then
		print("师徒关系不存在。")
		return
	end
	
	local leagueName = LG_GetLeagueInfo(lid)
	
	local joinTime = LG_GetMemberJoinTime(CONST_LEAGUETYPE_SHITU, leagueName, apprentice);
	local curTime = GetCurServerTime();
	if (curTime - joinTime < CONST_BREAKSHITU_PROTECTEDTIME) then
		Say("你与"..safeshow(apprentice).."建立的师徒关系不足24小时，不能解除！", 0);
		Msg2Player("你与"..apprentice.."建立的师徒关系不足24小时，不能解除！");
		return
	end
	--最后一个参数1表示，如果清除师徒队伍的成员时，如果最终只剩一个成员（师付）时，则系统自动删除该师徒League
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, leagueName, apprentice, "\\script\\shitu\\shitu.lua", "OnBreakShituLeague", 1)
end

function OnBreakShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBreakShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("师徒关系类型异常")
		return
	end
	
	local appIdx = SearchPlayer(szMemberName)
	local masterIdx = SearchPlayer(szLeagueName)

	if (appIdx > 0) then
		sendMessage(appIdx,"你已经和"..szLeagueName.."解除了师徒关系。")
		clearLastShituOperation(appIdx)	
	end

	if (masterIdx > 0) then
		sendMessage(masterIdx,"你已经和"..szMemberName.."解除了师徒关系。")
		clearLastShituOperation(masterIdx)
	end
end

--有徒弟在出师状态，则不能出师
function IsGraduateInLeague(playerIdx)
	local apprentice = getPlayerInfo(playerIdx,nil,{TKID_APPLY_GRADUATE},nil)
	PlayerIndex = playeridx

	local lid = GetShituLeagueId(GetName())
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid,i)
		if(apprentice.task[TKID_APPLY_GRADUATE] ==FileName2Id(name)) then
			return 1
		end
	end
	return nil 
end

--出师qilei use it
tb_playertask_chushimaster = {
	TKID_LAST_SHITU_OPERATION,
	TKID_CHUSHI_MASTER_BONUS,
	TKID_DICHUAN_APPRENTICE_COUNT,
	TKID_ZHIXI_APPRENTICE_COUNT,
	TKID_NORMAL_APPRENTICE_COUNT
}

tb_playerinfo_chushiapprentice = {"name"}
tb_playertask_chushiapprentice = {
	TKID_LAST_SHITU_OPERATION,
	TKID_ENTER_LEVEL,
	TKID_CHUSHI_APPRENTICE_BONUS,
	TKID_CHUSHI_DICHUAN_BONUS,
	TKID_CHUSHI_ZHIXI_BONUS,
	TKID_MASTER_COUNT
}

function OutShituLeague(apprenticeName, masterName)
	print("Call OutShituLeague("..apprenticeName..","..masterName..").")
	local appIdx = SearchPlayer(apprenticeName)
	local masterIdx = SearchPlayer(masterName)
	
	if(FALSE(appIdx)) then
		print("у  kh玭g l猲 m筺g")
		sendMessage(masterIdx,apprenticeName.."已经不知所踪。")
		return
	end
	if(FALSE(masterIdx)) then
		print("S? ph? kh玭g l猲 m筺g")
		sendMessage(appIdx,masterName.."已经不知所踪。")
		return
	end
	
	local lidApp = GetShituLeagueId(apprenticeName)
	local lidMaster = GetShituLeagueId(masterName)
	if(FALSE(lidApp) or FALSE(lidMaster) or lidApp ~= lidMaster) then
		print("此二人师徒关系异常")
		return
	end
	
	--设置师傅的出师标识和奖励
	--如果出师标识不为0，则表示，已有徒弟申请出师，但尚未成功，此时不许其他徒弟再出师
	/*
	local master = getPlayerInfo(masterIdx,nil,
																					{TKID_LAST_SHITU_OPERATION,
																						TKID_CHUSHI_MASTER_BONUS,
																						TKID_DICHUAN_APPRENTICE_COUNT,
																						TKID_ZHIXI_APPRENTICE_COUNT,
																						TKID_NORMAL_APPRENTICE_COUNT})																						
	local apprentice = getPlayerInfo(appIdx,
																	{"name"},
																	{TKID_LAST_SHITU_OPERATION,
																	TKID_ENTER_LEVEL,
																	TKID_CHUSHI_APPRENTICE_BONUS,
																	TKID_CHUSHI_DICHUAN_BONUS,
																	TKID_CHUSHI_ZHIXI_BONUS,
																	TKID_MASTER_COUNT})
	*/
	local master = getPlayerInfo(masterIdx, nil, tb_playertask_chushimaster)
	local apprentice = getPlayerInfo(appIdx, tb_playerinfo_chushiapprentice, tb_playertask_chushiapprentice)

	if (apprentice.task[TKID_LAST_SHITU_OPERATION] ~= 0 or master.task[TKID_LAST_SHITU_OPERATION] ~= 0) then
		print("上次的操作尚未成功，不能再进行其它操作！")
		return
	end
																	
	if(FALSE(apprentice.task[TKID_MASTER_COUNT])) then
		print("mastercount no right")
--		return
	end
	
	--设置出师状态
	local apprenticeTab = {
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),						--记录自已的姓名，表示自已要出师
		[TKID_LAST_SHITU_DATA2] = 0,
		[TKID_CHUSHI_APPRENTICE_BONUS] = CONST_BONUS_COUNT_APPRENTICE				--记录自已出师成功的话可以得到什么样的奖励
	}

	if(apprentice.task[TKID_MASTER_COUNT]==1) then --嫡传/直系
		if(apprentice.task[TKID_ENTER_LEVEL]>25) then --直系
			apprenticeTab[TKID_CHUSHI_ZHIXI_BONUS] = apprentice.task[TKID_CHUSHI_ZHIXI_BONUS]+1
		else --嫡传
			apprenticeTab[TKID_CHUSHI_DICHUAN_BONUS] = apprentice.task[TKID_CHUSHI_DICHUAN_BONUS]+1
		end
	else
		apprenticeTab[TKID_CHUSHI_APPRENTICE_BONUS]=0
	end
	
	
	setPlayerTask(appIdx,apprenticeTab)
	
	local masterTab =
	{
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),									--记录将要出师的徒弟姓名
		[TKID_LAST_SHITU_DATA2] = 0,
	}
		
	if(apprentice.task[TKID_MASTER_COUNT]==1) then
		if(apprentice.task[TKID_ENTER_LEVEL]<=25) then
			masterTab[TKID_DICHUAN_APPRENTICE_COUNT] = master.task[TKID_DICHUAN_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 5
		elseif(apprentice.task[TKID_ENTER_LEVEL]<50) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 4
		elseif(apprentice.task[TKID_ENTER_LEVEL]<65) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 3
		elseif(apprentice.task[TKID_ENTER_LEVEL]<75) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 2
		elseif(apprentice.task[TKID_ENTER_LEVEL]<80) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 1
		end
	else
		masterTab[TKID_NORMAL_APPRENTICE_COUNT] = master.task[TKID_NORMAL_APPRENTICE_COUNT]+1
	end
	setPlayerTask(masterIdx, masterTab)
	print("apply remove member")
	
	--最后一个参数1表示，如果清除师徒队伍的成员时，如果最终只剩一个成员（师付）时，则系统自动删除该师徒League
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, masterName, apprenticeName, "\\script\\shitu\\shitu.lua", "OnOutShituLeague", 1)
	return
end


function OnOutShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	local mastername = szLeagueName
	if (mastername ~= nil or mastername ~= "") then
		local masterIdx = SearchPlayer(mastername)
		if (masterIdx > 0) then
			if (bSucceed == 1) then		--奖励师付
				graduateForMaster(masterIdx)
			end
			clearGraduateData(masterIdx)
		end		
	end
	
	local apprenticeIdx = SearchPlayer(szMemberName)
	if (apprenticeIdx > 0) then
		if (bSucceed == 1) then			--奖励徒弟
			graduateForApprentice(apprenticeIdx)
		end
		clearGraduateData(apprenticeIdx)
	end
end

function patchShituProcess(lplayeridx)
	if (lplayeridx <= 0) then
		return
	end
	oldplayer = PlayerIndex
	PlayerIndex = lplayeridx
	local nApply_Operation = GetTask(TKID_LAST_SHITU_OPERATION)
	local nApply_Data1 = GetTask(TKID_LAST_SHITU_DATA1)
	local nApply_Data2 = GetTask(TKID_LAST_SHITU_DATA2)
	
	if (nApply_Operation == 0) then
		return
	end
	
	if (TABFUNS_PATCHSHITU[nApply_Operation] ~= nil) then
		TABFUNS_PATCHSHITU[nApply_Operation](lplayeridx,nApply_Data1, nApply_Data2)
	else
		print("have no patch funcs"..nApply_Operation)
	end
	PlayerIndex = oldplayer
end

function patchShitu_Join(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	
	PlayerIndex = lplayeridx
	print("Call patchShitu_Join")
	--如果玩家是师付的话，查找当前是否已经有该徒弟在队伍中了，如果有说明成功，如果没有则不成功。
	--如果玩家是徒弟的话，查找当前是否已经在该师付的队伍中了，如果有说明成功，没有则不成功。
	if (FileName2Id(GetName()) == nData1) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (GetMaster(GetName()) == GetName()) then
					local num = LG_GetMemberCount(lid)
					for i = 0, num - 1 do
						local name,job = LG_GetMemberInfo(lid, i)
						if (FileName2Id(name) == nData2) then
							bSuccess = 1
							break
						end
					end
				end
			
			end		
			
			if (bSuccess == 1) then
				setMasterWhenNewApprentice(lplayeridx)
			end
	elseif(FileName2Id(GetName()) == nData2) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (FileName2Id(GetMaster(GetName())) == nData1) then
					bSuccess = 1
				end
			end
			
			if (bSuccess == 1) then
				setApprenticeEnterData(lplayeridx)
			end
	end
	
	clearLastShituOperation(lplayeridx)
	
	PlayerIndex = oldplayer
end


function patchShitu_Graduate(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	--如果自已属于需要出师的徒弟的话
	if (FileName2Id(GetName()) == nData1) then 
		-----------------------------------------------------------------
		--if (检查当前是否已经不在任何的师徒队伍中了，或者现在已经是师付了) then
		--	如果是的话，那么说明上一次的出师操作已经成功了，则或得相应的奖励
		--else
		--如果不是的话，那么说明上一次的出师操作并没有成功，则清空操作
		--end
		------------------------------------------------------------------
		curjob = GetLeagueJob(GetName())
		if (FALSE(curjob) or curjob == CONST_LEAGUEJOB_MASTER) then
			graduateForApprentice(lplayeridx)
		end
		clearGraduateData(lplayeridx)
	else
		------------------------------------------------------------------
		--if (检查当前玩家的师徒队伍中不存在该徒弟或者自已已经不带徒弟了？)
		--	如果是的话，那么说明上一次的徒弟出师操作已成功了，则得到相应的奖励
		--else
		--	如果不是的话，那么说明上一次的出师操作并没成功，则清空操作
		--end
		-----------------------------------------------------------------

		local lid = GetShituLeagueId(GetName())
		local bSuccess = 1
		if(FALSE(lid)) then
			bSuccess = 1
		else
			local num = LG_GetMemberCount(lid)
			for i = 0, num - 1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if (FileName2Id(name) == nData1) then
					bSuccess = 0
					break
				end
			end
		end
		if (bSuccess == 1) then
			graduateForMaster(PlayerIndex)
		end			
		clearGraduateData(PlayerIndex)
	end	

	PlayerIndex = oldplayer
end

function clearGraduateData(lplayeridx)
	--local graduateDataTab = {
		--[TKID_APPLY_GRADUATE] = 0,
		--[TKID_CHUSHI_APPRENTICE_BONUS] = 0,
		--[TKID_TKID_CHUSHI_MASTER_BONUS] = 0,
	--}
	--setPlayerTask(lplayeridx,graduateDataTab)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end

function clearLastShituOperation(lplayeridx)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end


--在此处编写徒弟出师后，徒弟自已得到的奖励
--负责奖赏徒弟的函数   qilei 
function graduateForApprentice(appIdx)
	print("graduateforApprentice"..appIdx)
	--徒弟成功出师以后，徒弟的数据和奖励在这里处理 yfeng
	--这里主要发奖
--这被用到修正里面
	local num = callPlayerFunction(appIdx,GetTask,TKID_CHUSHI_APPRENTICE_BONUS)
	callPlayerFunction(appIdx,SetTask,TKID_CHUSHI_APPRENTICE_BONUS,0)
	if(FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(appIdx,num)
		sendMessage(appIdx,"恭喜你成功出师，并获得出师奖励神秘大红包"..num.."个。")
		name = callPlayerFunction(appIdx,GetName);
		WriteLog(name.."恭喜你成功出师，并获得出师奖励神秘大红包"..num.."个。")
	end
	return
	
end


--负责奖赏师付的函数   qilei
--在此处编写徒弟出师后，师付得到的奖励
function graduateForMaster(masterIdx)
--徒弟成功出师以后，师傅的数据和奖励在这里处理 yfeng
--这里主要发奖
--这被用到修正里面
	print("graduateforMaster"..masterIdx)
	local num = callPlayerFunction(masterIdx,GetTask,TKID_CHUSHI_MASTER_BONUS)
	callPlayerFunction(masterIdx,SetTask,TKID_CHUSHI_MASTER_BONUS,0)
	
	if (FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(masterIdx,num)
		sendMessage(masterIdx,"恭喜你成功带出一名徒弟，并获得相应的出师奖励神秘大红包"..num.."个。")
		name = callPlayerFunction(masterIdx,GetName);
		WriteLog(name.."恭喜你成功出师，并获得出师奖励神秘大红包"..num.."个。")
	end
	return
end;

-----------------------------------------------------------------------------------------------
--获取师徒关系的社团ID
function GetShituLeagueId(playerName)
	local lid = LG_GetLeagueObjByRole(CONST_LEAGUETYPE_SHITU,playerName)
	return lid
end

tb_playerinfo_degree = {"name","level"}
tb_playertask_degree = {TKID_APPRENTICE_COUNT}

function GetPlayerDegree(playerIdx)
	print("Call GetPlayerDegree("..tostring(playerIdx)..").")
	-- local player = getPlayerInfo(playerIdx,{"name","level"},{TKID_APPRENTICE_COUNT})
	local player = getPlayerInfo(playerIdx, tb_playerinfo_degree, tb_playertask_degree)
	local job = GetLeagueJob(player.name)
	if(job) then
		return job
	end
	if(player.level >= 80) then
		if(TRUE(player.task[TKID_APPRENTICE_COUNT])) then
			return CONST_DEGREE_MASTER
		end
		return CONST_DEGREE_PREMASTER
	end
	return CONST_DEGREE_PREAPPRENTICE
	
end
function GetLeagueJob(player)
	print("Call GetLeagueJob("..tostring(player)..").")
	local lid = GetShituLeagueId(player)
	if(FALSE(lid)) then
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(name == player) then
			return job
		end
	end
	return nil
end

function GetMaster(playerName)
	print("Call GetMaster("..tostring(playerName)..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("队伍不存在。")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_MASTER) and validateName(name) then
			return name
		end
	end
	print("Trong i ng? kh玭g c? s? ph? ")
	return nil
end

--得到playerIdx 所在的师徒社团中的徒弟个数
function GetApprenticeNum(playerName)
	print("GetApprenticeNum("..playerName..")")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then --player 不在社团中
		local pid = SearchPlayer(playerName)
		if(FALSE(pid)) then
			return nil
		end
		if(callPlayerFunction(pid,GetTask,TKID_APPRENTICE_COUNT)>0) then --playerName 是师父
			return 0
		elseif(callPlayerFunction(pid,GetLevel)>=80) then --player可以做师父
			return 0
		end
		--还没拜师的人
		print("return nil")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	return num -1
end

--得到playerName所在师徒关系中的所有徒弟列表
function GetApprentice(playerName)
	print("Call GetApprentice("..playerName..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("师徒关系不存在")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	local tab = {}
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE) and validateName(name) then
			tab[getn(tab) + 1] = name
		end
	end
	if(getn(tab)==0) then
		print("队伍中没有任何徒弟")
		return nil
	end
	return tab
end

function ShowLeague()
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				print(GetName().." no in league")
			else
				local num = LG_GetMemberCount(lid)
				for i = 0, num - 1 do
					local name,job = LG_GetMemberInfo(lid, i)
					print(name..", job"..job)
				end
			end		
end

--计算师傅可以带的徒弟数
function ComputeMasterLoad(dichuan)
	if(dichuan < 0) then dichuan = 0 end
	if(dichuan < 5) then 
		return 3
	end
	if(dichuan < 7) then
		return 4
	end
	if(dichuan < 10) then
		return 5
	end
	if(dichuan < 13) then
		return 6
	end
	if(dichuan < 17) then
		return 7
	end
	if(dichuan < 21) then
		return 8
	end
	if(dichuan < 26) then
		return 9
	end
	return 10
end

TABFUNS_PATCHSHITU = 
{
	patchShitu_Join,
	patchShitu_Graduate,
	patchShitu_Leave,
}
