
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")

local AWARD_TABLE = tbAwardList["GiftAward"] 

local _limit = function()
	local tbProp = ITEM_XMAS_STOCKING.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) <= 0 then
		Talk(1, "", format("Ng­¬i kh«ng mang theo %s.", ITEM_XMAS_STOCKING.szName))
		return 1
	end	
end

local _OnBreak = function()
	Msg2Player("Thu thËp ®· bÞ gi¸n ®o¹n.")
end

local _GetAward = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	if %_limit() then
		return
	end
	
	if GetNpcParam(nNpcIndex, 4) == 1 then
		return 
	end
	SetNpcParam(nNpcIndex, 4, 1)
	local tbProp = ITEM_XMAS_STOCKING.tbProp
	ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	tbAwardTemplet:Give(%AWARD_TABLE, 1, {EVENT_LOG_TITLE, "get gift award"})
	DelNpc(nNpcIndex)
	
end 



function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	if %_limit() then
		return
	end
	tbProgressBar:OpenByConfig(13, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
end



