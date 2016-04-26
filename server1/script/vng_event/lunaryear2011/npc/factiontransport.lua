Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")

function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	local tbMainDiaglog = 
		{
			"少林派/#visitMaster(2)",
			"天王帮/#visitMaster(1)",
			"唐门/#visitMaster(3)",
			"五毒教/#visitMaster(4)",
			"峨眉派/#visitMaster(5)",
			"翠烟门/#visitMaster(6)",
			"丐帮/#visitMaster(8)",
			"天忍教/#visitMaster(7)",
			"武当派/#visitMaster(9)",
			"昆仑派/#visitMaster(10)",
			"关闭/onCancel"
		}
	Say("花费10万两我将带你去见各派掌门.", getn(tbMainDiaglog), tbMainDiaglog)
end
function visitMaster(nFactionID)
--Msg2Player(nFactionID)
	if (GetCash() < 100000) then
		Talk(1, "", "好像你没带钱!")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = 2,
--			["tianwang"] = 1,
--			["tangmen"] = 3,
--			["wudu"] = 4,
--			["emei"] = 5,
--			["cuiyan"] = 6,
--			["gaibang"] = 8,
--			["tianren"] = 7,
--			["wudang"] = 9,
--			["kunlun"] = 10,
--		}
--	local strFaction = GetFaction()
--	if tbFactionList[strFaction] ~= nill then
		if Pay(100000) == 1 then
			gopos_step3(9, nFactionID)
		end
--	else
--		Talk(1, "", "你依然未入派!")
--	end
end
function onCancel()
end