Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")

function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	local tbMainDiaglog = 
		{
			"������/#visitMaster(2)",
			"������/#visitMaster(1)",
			"����/#visitMaster(3)",
			"�嶾��/#visitMaster(4)",
			"��ü��/#visitMaster(5)",
			"������/#visitMaster(6)",
			"ؤ��/#visitMaster(8)",
			"���̽�/#visitMaster(7)",
			"�䵱��/#visitMaster(9)",
			"������/#visitMaster(10)",
			"�ر�/onCancel"
		}
	Say("����10�����ҽ�����ȥ����������.", getn(tbMainDiaglog), tbMainDiaglog)
end
function visitMaster(nFactionID)
--Msg2Player(nFactionID)
	if (GetCash() < 100000) then
		Talk(1, "", "������û��Ǯ!")
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
--		Talk(1, "", "����Ȼδ����!")
--	end
end
function onCancel()
end