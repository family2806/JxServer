Include("\\script\\activitysys\\config\\29\\config.lua")
Include("\\script\\activitysys\\config\\29\\head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

--添加活动NPC
function pActivity:AddInitNpc()
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
--	local tbSoldierPos = {
--		{2,2613,3499,},
--	}
--	local tbSoldier = {
--		szName = "士兵", 
--		szTitle = "<npc>22/04/2011~22/05, 120级以上人士可以送兰花，米袋，衣服给我，我将厚待你周到.",
--		nLevel = 95,
--		nNpcId = 1781,--246,
--		nIsboss = 0,
--		szScriptPath = "\\script\\activitysys\\npcdailog.lua",
--	}
--	for _, tbTmpPos in tbSoldierPos do
--		local nMapId, nPosX, nPosY = unpack(tbTmpPos)
--		%basemission_CallNpc(tbSoldier, nMapId, nPosX*32, nPosY*32)	
--	end
	--print('Add 军兵')
--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
	local tbLanHuanCaoPos = {
		{153,1745,3213,},
		{153,1724,3192,},
		{153,1757,3197,},
	}
	local tbLanHuaCao = {
		szName = "野兰花粉", 
		nLevel = 95,
		nNpcId = 1782,--1407,844
		nIsboss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\29\\lanhuacao.lua",
	}
--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
	--for i=1,3 do
	--	local nMapId, nPosX, nPosY = unpack(tbLanHuanCaoPos[1])
	for i=1, getn(tbLanHuanCaoPos) do
		local nMapId, nPosX, nPosY = unpack(tbLanHuanCaoPos[i])
		tbLanHuaCao.tbNpcParam[1] = i;
		%basemission_CallNpc(tbLanHuaCao, nMapId, nPosX*32, nPosY*32)	
	end
	--print('Add 兰花草')
end	

--上交兰花
function pActivity:OnGiveLanHua()
--	if not self:CheckDate() then
--		Msg2Player(format("活动时间已过, 不能送兰花了."))
--		return
--	end
--	self:AddTaskDaily(%TSK_IDX_DAILY_GIVE_LANHUA,1)
--	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,1977,1,0,0},},1)
--	--PlayerFunLib:AddExp(20000000,1,"赠送军兵兰花获得经验")
--	tbAwardTemplet:Give({nExp_tl=20000000}, 1, {"201104送花活动", "送兰花给士兵"});
--	AddStatData("jiefangri_shangjiaolanhua")
end

function pActivity:Vng_OnGiveLanHua(nCount)
	if not self:CheckDate() then
		Msg2Player(format("活动时间已过, 不能送兰花了."))
		return
	end
	for i = 1, nCount do
		self:AddTaskDaily(%TSK_IDX_DAILY_GIVE_LANHUA,1)
		tbAwardTemplet:Give({nExp_tl=20000000}, 1, {"201104送花活动", "送兰花给士兵"});
		AddStatData("jiefangri_shangjiaolanhua")
	end
end

function pActivity:Vng_LanHua_Limit(nCount)
	local nDailyCount = PlayerFunLib:GetTaskDailyCount(1357)
	if nDailyCount + nCount > %MAX_GIVE_LANHUA_PERDAY then
		Msg2Player(format("S数量超过界限，大侠只能送<color=yellow>%d <color>兰花了.", %MAX_GIVE_LANHUA_PERDAY - nDailyCount))
		return 0
	end
	return 1
end

function pActivity:Test()
--	print(TSK_IDX_DAILY_GIVE_LANHUA)
--	print(MAX_GIVE_LANHUA_PERDAY)
--	print(self:GetTask(TSK_IDX_DAILY_GIVE_LANHUA))
end

