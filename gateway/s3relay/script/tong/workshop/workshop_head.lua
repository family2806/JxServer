function DEF_FUN(nTongID, nID)
	return 1
end

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
Include("\\script\\tong\\workshop\\workshop_logic.lua")
Include("\\script\\tong\\workshop\\workshop_def.lua")
Include("\\script\\tong\\log.lua")

if (MODEL_GAMESERVER == 1) then --如果是GameServer
	Include("\\script\\tong\\addtongnpc.lua");
	Include([[\script\tong\workshop\tongcolltask.lua]]);--帮会特殊令牌头文件
end

function SVR_CheckUse(nTongID, nWorkshopID, szName)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		if (GetTask(TASK_LP_COUNT) ~= 0) then --如果有帮会特殊令牌任务
			local nRwlp = rwlp_taskcheck(nTongID, nWorkshopID);
			local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).."级<color>";
			local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."坊总管<color>";
			if (nRwlp == 2) then --如果地图是对的
				Say("你好像有特殊任务令牌任务吧，赶紧去找本帮的"..szZGName.."吧，看看他帮不帮上你的忙。", 0);
				Msg2Player("找地图内的"..szZGName.."对话。");
			elseif (nRwlp == 0) then --
				Say("你好像有特殊任务令牌任务吧，但是在公共帮会地图的总管是不会管<color=yellow>荐书<color>这些尘世的，赶紧去找别帮的"..szZGName.."吧，看看他帮不帮上你的忙。", 0);
				Msg2Player("在公共帮会地图得不到<color=yellow>荐书<color>。");
			elseif (nRwlp == 1) then --
				rwlp_dedaojianshu(nTongID, nWorkshopID);
			end;
		else
			Say("这里不是你们帮会的地盘，不能在此使用作坊", 0);
		end;
		return 0
	end
	if (nWorkshopID <= 0) then
		Say("贵帮好像尚未建立该作坊吧。", 0)
		return 0
	end	
	if (TWS_GetUseLevel(nTongID, nWorkshopID) < 1) then
		Say("该作坊目前使用等级为0，暂时不能使用", 0);
		return 0;
	end
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1) then
		Say(szName.."：咱们帮尚未开启该作坊，我说了不算，要使用的话可得找帮主或长老们开启。", 0);
		return 0;
	end	
	if TONG_GetPauseState(nTongID) ~= 0 then
		Say(szName.."：该作坊处于暂停状态。", 0);
		return 0;
	end
	return 1
end

function RL_DoLevelUp(nTongID, nID, nToLevel)
	if (logicWorkShopLevelUp(nTongID, nID, nToLevel) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local nCost = wsGetUpgradeCostFund(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	
	-- 帮会历史/事件记录、通知
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szRecord = wsGetName(eType).."升至"..nToLevel.."级";
	local szRecordPlus;
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." 将"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "upgrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1;
end

function RL_DoDegrade(nTongID, nID, nToLevel)
	--取消降级操作
	do return 0 end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	--使用等级
	if TWS_GetUseLevel(nTongID, nID) > nToLevel then
		TWS_ApplySetUseLevel(nTongID, nID, nToLevel)
	end
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nToLevel, bOpen) - 
			wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen);			
	--周维护战备基金变化
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)
	
	-- 帮会历史/事件记录、通知
	local szRecord = wsGetName(eType).."降至"..nToLevel.."级";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." 将"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
		
	cTongLog:WriteInfTB("WORKSHOP", "degrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1	
end

function RL_DoOpen(nTongID, nID)
	if (logicWorkShopOpen(nTongID, nID) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCost = wsGetOpenCost(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--周维护战备基金变化
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- 帮会历史/事件记录、通知
	local szRecord = wsGetName(eType).."重新开启";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." 将"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "open", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--周维护战备基金变化
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)	
	-- 帮会历史/事件记录、通知
	local szRecord = wsGetName(eType).."关闭";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." 将"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "close", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoDestroy(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopDestroy(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen)
	--周维护战备基金变化
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)
	
	-- 帮会历史/事件记录、通知
	local szRecord = wsGetName(eType).."拆除";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." 将"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "destroy", nTongID, {workshopid = nID, typename = wsGetName(eType), level = TWS_GetLevel(nTongID, nID)})
	
	return 1
end

function RL_DoLearn(nTongID, eType)
	if (logicWorkShopLearn(nTongID, eType) ~= 0) then
		return 0
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, 0)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, 1, 1);
	--周维护战备基金变化
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- 帮会历史/事件记录、通知
	local szRecord = "建造了"..wsGetName(eType);
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "learn", nTongID, {typename = wsGetName(eType)})
	
	return 1
end

function SVR_CheckLevelUp(nTongID, nID, nToLevel)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopLevelUp(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("该作坊已达当前最大等级，想提高作坊等级需要更高的帮会建设等级！")
	elseif (nRet == 2) then
		Msg2Player("帮会建设基金不足，不能升级该作坊。")
	elseif (nRet == 3) then
		Msg2Player("帮会处于暂停状态，不能升级作坊！")	
	elseif (nRet == 4) then
		Msg2Player("升级后战备基金低于周维护战备基金，不能升级该作坊！")	
	end	
	return 0
end

function SVR_DoLevelUp(nTongID, nID, nToLevel)
		--使用等级
	Say("你现在可以立即提升作坊使用等级为当前作坊等级，要设定吗？", 2, "是的/#SetUSeLevel("..nTongID..","..
		nID..")", "不了/cancel")
	return 1
end

function SetUSeLevel(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	if nLevel > 0 then
		TWS_ApplySetUseLevel(nTongID, nID, nLevel)
		TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
	end
	Msg2Player("作坊使用等级已调整为作坊当前等级！")
end

function SVR_CheckOpen(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopOpen(nTongID, nID)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
	elseif (nRet == 2) then
		Msg2Player("帮会处于暂停状态，不能开启作坊！")
	elseif (nRet == 3) then
		Msg2Player("帮会建设基金不足，不能开启该作坊！")
	elseif (nRet == 4) then
		Msg2Player("开启后战备基金低于周维护战备基金，不能开启该作坊！")	
	end
	return 0
end

function SVR_DoOpen(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckClose(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	return 1
end

function SVR_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckDestroy(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDestroy(nTongID, nID)
	if (nRet == 0) then
		return 1
	end	
	return 0
end

function SVR_DoDestroy(nTongID, nID)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		DelNpc(npcid)
		TWS_GetBuildingNpc(nTongID, nID, 0)
	end
	return 1
end

function SVR_CheckLearn(nTongID, eType)
	if nTongID == 0 then
		return 0
	end
	local nRet = logicWorkShopLearn(nTongID, eType)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("贵帮作坊数量已达当前上限，想建更多的作坊需要提高帮会建设等级！")	
	elseif (nRet == 2) then
		Msg2Player("贵帮已经有这个作坊了！")
	elseif (nRet == 3) then
		Msg2Player("帮会处于暂停状态，不能建造作坊！")
	elseif (nRet == 4) then
		Msg2Player("建设基金不足，不能建立该作坊！")
	elseif (nRet == 5) then
		Msg2Player("建立后战备基金将低于周维护战备基金，不能建立该作坊！")	
	end
	return 0
end

--DoLearn是GS作坊创建完后才调用的
function SVR_DoLearn(nTongID, nWorkshopID)
	local eType = TWS_GetType(nTongID, nWorkshopID)
	if (eType == 0)then
		_dbgMsg("SVR_DoLearn: ERRORRORORR")
		return 0
	end
	local nMapID = TONG_GetTongMap(nTongID)
	--无帮会地图或非动态地图
	if (nMapID < DYNMAP_ID_BASE)then
		return 1
	end
	nMapID = SubWorldID2Idx(nMapID)
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	--地图不在此服务器
	if (nMapID < 0 or nMapCopy <= 0)then
		return 1
	end
	local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
	_dbgMsg("add building npcid:"..npcid)
	if (npcid > 0)then
		TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
	end
	return 1
end 

function SVR_CheckDegrade(nTongID, nID, nToLevel)
	--取消降级操作
	do return 0 end
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("作坊已达最低等级，不能再降级！")
	end
	return 0	
end

function SVR_DoDegrade(nTongID, nID, nToLevel)
	return 1
end 

SET_USELEVELSET_R = DEF_FUN
SET_USELEVELSET_G_1 = DEF_FUN
function SET_USELEVELSET_G_1(nTongID, nID)
	SetULConfirm(nTongID, nID)
	return 0
end

function SetULConfirm(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCurLevelSet = TWS_GetUseLevelSet(nTongID, nID)
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
	if nCurLevelSet <= 0 then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nCurLevel)then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nUpperLevel) then	
		nCurLevelSet = nUpperLevel
	end
	local eType = TWS_GetType(nTongID, nID)
	Say("<#>当前<color=yellow>"..wsGetName(eType).."<color>实际等级为<color=blue>"..
		nLevel.."<color>级，使用等级为<color=blue>"..nCurLevel.."<color>级\n经过调整的使用等级设定，"..
		"将在下次<color=red>周维护<color>后生效。当前该使用等级设定为<color=blue>"..nCurLevelSet.."<color>级，"..
		"你要将下周生效的使用等级设定调整为多少？",3,"1~5级/#SetUseLevelSet("..nTongID..","..nID..",1)",
		"6~10级/#SetUseLevelSet("..nTongID..","..nID..",2)", "我要离开/cancel")
end

function SetUseLevelSet(nTongID, nID, nFlag)
	if nFlag == 1 then
		Say("请选择一个等级：", 6, "1级/#SUS_Chose("..nTongID..","..nID..",1)", "2级/#SUS_Chose("..nTongID..","..nID..",2)",
			"3级/#SUS_Chose("..nTongID..","..nID..",3)", "4级/#SUS_Chose("..nTongID..","..nID..",4)",
			"5级/#SUS_Chose("..nTongID..","..nID..",5)", "返回/#SetULConfirm("..nTongID..","..nID..")")
	elseif nFlag == 2 then
		Say("请选择一个等级：", 6, "6级/#SUS_Chose("..nTongID..","..nID..",6)", "7级/#SUS_Chose("..nTongID..","..nID..",7)",
			"8级/#SUS_Chose("..nTongID..","..nID..",8)", "9级/#SUS_Chose("..nTongID..","..nID..",9)",
			"10级/#SUS_Chose("..nTongID..","..nID..",10)", "返回/#SetULConfirm("..nTongID..","..nID..")")
	end
end

function SUS_Chose(nTongID, nID, nLevel)
	local nWsLevel = TWS_GetLevel(nTongID, nID)
	if (nLevel > nWsLevel)then
		Say("所选的使用等级不能大于当前作坊等级", 1, "知道了/cancel")
		return
	end
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))	
	if (nLevel > nUpperLevel)then
		Say("贵帮目前作坊使用等级上限为：<color=red>"..nUpperLevel.."<color>级，所选的使用等级不能超过此值", 1, "知道了/cancel")
		return
	end
	local eType = TWS_GetType(nTongID, nID)
	local szMsg = "<color=white>"..GetName().."<color>将<color=red>"..wsGetName(eType)..
	"<color>使用等级设定为<color=green>"..nLevel.."<color>级，".."该调整将在下次周维护后生效"
	Msg2Tong(nTongID, szMsg)
	-- 帮会事件记录
	TONG_ApplyAddEventRecord(nTongID, GetName().."将"..wsGetName(eType).."使用等级设定为"..nLevel.."级");
	TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
end

SET_USELEVEL_R = DEF_FUN
SET_USELEVEL_G_1 = DEF_FUN
function SET_USELEVEL_G_2(nTongID, nID, nToLevel)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		if nToLevel > 0 then
			local eType = TWS_GetType(nTongID, nID)
			ChangeNpcFeature(npcid, 0, 0, building_figure[eType][nToLevel])
		else
			DelNpc(npcid)
			TWS_SetBuildingNpc(nTongID, nID, 0)
		end	
	elseif nToLevel > 0 then
		local nMapID = TONG_GetTongMap(nTongID)
		local eType = TWS_GetType(nTongID, nID)
		--无帮会地图或非动态地图
		if (nMapID < DYNMAP_ID_BASE)then
			return 1
		end
		nMapID = SubWorldID2Idx(nMapID)
		local nMapCopy = TONG_GetTongMapTemplate(nTongID)
		--地图不在此服务器
		if (nMapID <= 0 or eType == 0 or nMapCopy <= 0)then
			return 1
		end
		local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
		_dbgMsg("add building npcid:"..npcid)
		if (npcid > 0)then
			TWS_SetBuildingNpc(nTongID, nID, npcid)
		end
	end
	return 1
end

function cancel()
end
	
else
-----------------如果是客户端---------------
Include("\\script\\tong\\workshop\\workshop_setting.lua")
SET_USELEVELSET_C_1 = DEF_FUN
SET_USELEVELSET_C_2 = DEF_FUN
SET_USELEVEL_C_1 = DEF_FUN
SET_USELEVEL_C_2 = DEF_FUN
end	--if结束

--默认的处理函数，要重载可重新赋值
LEARN_R		= RL_DoLearn
LEARN_G_1	= SVR_CheckLearn
LEARN_G_2	= SVR_DoLearn
LEARN_C_1	= DEF_FUN
LEARN_C_2	= DEF_FUN

REMOVE_R	= RL_DoDestroy
REMOVE_G_1	= SVR_CheckDestroy
REMOVE_G_2	= SVR_DoDestroy
REMOVE_C_1	= DEF_FUN
REMOVE_C_2	= DEF_FUN

OPEN_R		= RL_DoOpen
OPEN_G_1	= SVR_CheckOpen
OPEN_G_2	= SVR_DoOpen
OPEN_C_1 	= DEF_FUN
OPEN_C_2 	= DEF_FUN

CLOSE_R		= RL_DoClose
CLOSE_G_1	= SVR_CheckClose
CLOSE_G_2	= SVR_DoClose
CLOSE_C_1 	= DEF_FUN
CLOSE_C_2 	= DEF_FUN

UPGRADE_R	= RL_DoLevelUp
UPGRADE_G_1	= SVR_CheckLevelUp
UPGRADE_G_2	= SVR_DoLevelUp
UPGRADE_C_1 = DEF_FUN
UPGRADE_C_2 = DEF_FUN

DEGRADE_R	= RL_DoDegrade
DEGRADE_G_1	= SVR_CheckDegrade
DEGRADE_G_2	= SVR_DoDegrade
DEGRADE_C_1 = DEF_FUN
DEGRADE_C_2 = DEF_FUN

--MAINTAIN_R	 = DEF_FUN
MAINTAIN_G_1 = DEF_FUN
MAINTAIN_G_2 = DEF_FUN
MAINTAIN_C_1 = DEF_FUN
MAINTAIN_C_2 = DEF_FUN