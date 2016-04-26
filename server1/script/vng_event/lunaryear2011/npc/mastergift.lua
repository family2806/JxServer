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
	tbDialog:AddOptEntry("�ʹ���", tbMasterGift.getGift, {tbMasterGift, strFaction})
end

function tbMasterGift:getGift(strFaction)
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "�㲻������ʹ����Ʒ��Ҫ��50���������ѳ�ֵ")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = "���� ",
--			["tianwang"] = "������",
--			["tangmen"] = "����",
--			["wudu"] = "�嶾��",
--			["emei"] = "��ü",
--			["cuiyan"] = "������",
--			["gaibang"] = "ؤ��",
--			["tianren"] = "���̽�",
--			["wudang"] = "�䵱",
--			["kunlun"] = "����",
--		}
--	if GetFaction() ~= strFaction then
--		Talk(1, "", format("�㲻�� <color=red>%s<color>����, ��������Ҳ����ա������ȥ����ʦ����.", tbFactionList[strFaction]))
--		return
--	end
	if CalcItemCount(-1, 6, 1, 30089, -1) < 1 then
		Talk(1, "", "��˵����Ʒ���ң���ô����?")
		return
	end
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(self.TSK_DAY_LIMIT) >= nCurDay then
		Talk(1, "", "���������ģ����ǽ������Ѹ��������ˣ��Լ������ð�.")
		return
	end	
	if ConsumeEquiproomItem(1, 6, 1, 30089, 1) == 1 then
		SetTask(self.TSK_DAY_LIMIT, nCurDay)
		local tbExp = {nExp=10000000}
		tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][�����ű�]")
		Talk(2, "", "�����Ǻóԣ�лл�㣬ף����������.", "�a ллʦ�� ")
	end
end