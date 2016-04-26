Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\lib\\awardtemplet.lua")

if not tbMasterGift then
	tbMasterGift = {}
end	
tbMasterGift.TSK_DAY_LIMIT = 2760

function tbMasterGift:addDialog(tbDialog, strFaction)
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("送春饼", tbMasterGift.getGift, {tbMasterGift, strFaction})
end

function tbMasterGift:getGift(strFaction)
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "你不足条件使用物品，要求50级以上且已充值")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = "少林 ",
--			["tianwang"] = "天王帮",
--			["tangmen"] = "唐门",
--			["wudu"] = "五毒教",
--			["emei"] = "峨眉",
--			["cuiyan"] = "翠烟门",
--			["gaibang"] = "丐帮",
--			["tianren"] = "天忍教",
--			["wudang"] = "武当",
--			["kunlun"] = "昆仑",
--		}
--	if GetFaction() ~= strFaction then
--		Talk(1, "", format("你不是 <color=red>%s<color>弟子, 这个礼物我不敢收。快带回去给你师傅吧.", tbFactionList[strFaction]))
--		return
--	end
	if CalcItemCount(-1, 6, 1, 30089, -1) < 1 then
		Talk(1, "", "你说送礼品给我，怎么不见?")
		return
	end
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(self.TSK_DAY_LIMIT) >= nCurDay then
		Talk(1, "", "你真是有心，但是今天你已给我送礼了，自己留着用吧.")
		return
	end	
	if ConsumeEquiproomItem(1, 6, 1, 30089, 1) == 1 then
		SetTask(self.TSK_DAY_LIMIT, nCurDay)
		local tbExp = {nExp=10000000}
		tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][送掌门饼]")
		Talk(2, "", "饼真是好吃，谢谢你，祝你新年幸运.", " 谢谢师傅 ")
	end
end