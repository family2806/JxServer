Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_gardener = {}

function main()
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	tbVNGWD2011_gardener:MainDialog()	
end

function tbVNGWD2011_gardener:MainDialog()
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return
	end
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbMainDialog:AddOptEntry("送面包", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "送面包"})
	tbMainDialog:AddOptEntry("换玫瑰花束", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "合成玫瑰花束"})
	tbMainDialog:AddOptEntry("买花线", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "买花线"})
	tbMainDialog:Show()			
end
