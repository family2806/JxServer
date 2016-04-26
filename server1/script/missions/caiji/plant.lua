Include("\\script\\lib\\progressbar.lua")
Include("\\script\\missions\\caiji\\head.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\awardtemplet.lua")

function calc_tool_count(szToolType)
	local tbTool = ITEM_TOOL[szToolType]
	if not tbTool then
		return 0
	end
	local tbProp = tbTool.tbProp
	return CalcEquiproomItemCount(tbProp[1],tbProp[2],tbProp[3],-1)
end

function get_progress()
	local szToolType = nil
	if calc_tool_count("platinum") > 0 then
		szToolType = "platinum"
	elseif calc_tool_count("nomal") > 0 then
		szToolType = "nomal"
	end
	if szToolType ~= nil then
		return szToolType, TOOL2PROGRESSID[szToolType]
	else
		return nil
	end
end

function on_collection(nSettingIdx, szToolType, nMapId)
	local tbTool = ITEM_TOOL[szToolType]
	if not tbTool then
		return 
	end
	local szPlantType = NPCID2PLANTTYPE[nSettingIdx]
	if not szPlantType then
		return
	end
	local tbItemPlant = ITEM_PLANT[szPlantType]
	if not tbItemPlant then
		return
	end
	
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	
	local tbProp = tbTool.tbProp
	if ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
		return Talk(1, "", format("你没有带 %s", tbTool.szName))
	end
	--给奖励  
	
	local pPlant = ITEM_PLANT[szPlantType]
	if pPlant then		
		%tbAwardTemplet:Give(pPlant, 1, {"Event_Thang6", "collect rice plant"})
		pDungeon:AddPoint(GetName(), szPlantType)
	end
end


local _OnBreak = function(nNpcIndex)
	Msg2Player("收集中断")
end

local _GetAward = function(nNpcIndex, dwNpcID, szToolType)
	if nNpcIndex == nil then
		Msg2Player("你收集失败.")
		return
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("你收集失败.")
		return
	end	
	
	if GetNpcParam(nNpcIndex, NPC_PARAM_COLLECTED) == 1 then
		Msg2Player("你收集失败.")
		return
	end
	local nMapId = GetNpcParam(nNpcIndex, NPC_PARAM_MAPID)
	
	if nMapId <= 0 then
		return
	end 
	
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	SetNpcParam(nNpcIndex, NPC_PARAM_COLLECTED, 1)
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "", "背包空间不够")
	end
	
	on_collection(nSettingIdx, szToolType, nMapId)	
	DelNpc(nNpcIndex)
end 

function main()	
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "", "背包空间不够")
	end
	
	local szToolType, nProgressBarId  = get_progress()
	if nProgressBarId then
		tbProgressBar:OpenByConfig(nProgressBarId, %_GetAward, {nNpcIndex, dwNpcIndex, szToolType}, %_OnBreak, {nNpcIndex})
	else
		Talk(1, "", format("你没有带 %s 或 %s", "铁镰刀", "白金镰刀"))
	end
	
end