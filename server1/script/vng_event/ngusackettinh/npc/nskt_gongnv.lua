Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\ngusackettinh\\npc\\nskt_compose_item.lua")

tbNSKT_gongnv = {}

function tbNSKT_gongnv:addDialog(tbDialog)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	if ((nCurDay >= tbNSKT_head.nStartDay) and (nCurDay < tbNSKT_head.nItemExpiredTime)) then
		tbDialog:AddOptEntry("五彩结晶活动",tbNSKT_gongnv.main,{tbNSKT_gongnv})
	end			
end

function tbNSKT_gongnv:main()	
	local tbMainDialog = 	self:createDiaglog()
	tbMainDialog.szTitleMsg = "冬天到了，我却还未准备什么，目前我正需要一棵松树来装饰圣诞夜，如果你帮助我，我将给你礼物"
	if (tbNSKT_head:isActive() == 1)then
		tbMainDialog:AddOptEntry("介绍活动", tbNSKT_gongnv.description, {tbNSKT_gongnv})
		tbMainDialog:AddOptEntry("合成结晶", tbNSKT_gongnv.crystalCompose, {tbNSKT_gongnv})
	end	
	tbMainDialog:AddOptEntry("幸运星活动", tbNSKT_gongnv.luckyStarActivity, {tbNSKT_gongnv})
	tbMainDialog:AddOptEntry("换马翻羽", tbNSKT_gongnv.horseAward, {tbNSKT_gongnv})
	tbMainDialog:Show()			
end

function tbNSKT_gongnv:description()	
	local tbDescDialog =	self:createDiaglog()
	tbDescDialog.szTitleMsg = "圣诞快到了，大家正忙于准备，为什么你还在这里？快去主页看看参加的形式吧"
	tbDescDialog:AddOptEntry("返回", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbDescDialog:Show()
end

function tbNSKT_gongnv:crystalCompose()
	local tbComposeDialog =	self:createDiaglog()
	tbComposeDialog.szTitleMsg = "结晶很漂亮，好像藏有很多惊喜"
	tbComposeDialog:AddOptEntry("三色结晶", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"三色结晶"})
	tbComposeDialog:AddOptEntry("四色结晶", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"四色结晶"})
	tbComposeDialog:AddOptEntry("五色结晶", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"五色结晶"})
	tbComposeDialog:AddOptEntry("返回", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbComposeDialog:Show()	
end

function tbNSKT_gongnv:luckyStarActivity()
	local tbStarActDialog =	self:createDiaglog()
	tbStarActDialog.szTitleMsg = "圣诞树真是漂亮，你送给我吗?"
	tbStarActDialog:AddOptEntry("送", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"星星"})
	tbStarActDialog:AddOptEntry("返回", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbStarActDialog:Show()	
end

function tbNSKT_gongnv:horseAward()
	local tbHorseAwardDialog =	self:createDiaglog()
	tbHorseAwardDialog.szTitleMsg = "有2中换取翻羽方式<enter>使用期限6个月的翻羽: <color=red>60<color> 令牌<enter>无使用期限翻羽: <color=red>200<color> 令牌"	
	tbHorseAwardDialog:AddOptEntry("换有使用期限翻羽", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"翻羽"})
	tbHorseAwardDialog:AddOptEntry("换无使用期限翻羽", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"无使用期限翻羽"})
	tbHorseAwardDialog:AddOptEntry("返回", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbHorseAwardDialog:Show()		
end

function tbNSKT_gongnv:createDiaglog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbNSKT_gongnv:onCancel()
end