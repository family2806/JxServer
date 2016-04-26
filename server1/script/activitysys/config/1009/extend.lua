Include("\\script\\activitysys\\config\\1009\\head.lua")
Include("\\script\\activitysys\\config\\1009\\variables.lua")
Include("\\script\\activitysys\\config\\1009\\award_ext.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\log.lua")

local tbItemOtherAward = {
	["mutaibeo"] = {
			[100] 	= "使用100风衣帽",
			[200] 	= "使用200风衣帽",
			[300] 	= "使用300风衣帽",
			[400] 	= "使用400风衣帽",
			[500] 	= "使用500风衣帽",
			[600] 	= "使用600风衣帽",
			[700] 	= "使用700风衣帽",
			[800] 	= "使用800风衣帽",
			[900] 	= "使用900风衣帽",
			[1000] 	= "使用1000风衣帽",
			[1100] 	= "使用1100风衣帽",
			[1200] 	= "使用1200风衣帽",
			[1300] 	= "使用1300风衣帽",
			[1400] 	= "使用1400风衣帽",
			[1500] 	= "使用1500风衣帽o",
			[1600] 	= "使用1600风衣帽",
			[1700] 	= "使用1700风衣帽",
			[1800] 	= "使用1800风衣帽",
			[1900] 	= "使用1900风衣帽",
			[2000] 	= "使用2000风衣帽",
	},		
	["mutudo"] = {
			[100] 	= "使用100自由帽",
			[200] 	= "使用200自由帽",
			[300] 	= "使用300自由帽",
			[400] 	= "使用400自由帽",
			[500] 	= "使用500自由帽",
			[600] 	= "使用600自由帽",
			[700] 	= "使用700自由帽",
			[800] 	= "使用800自由帽",
			[900] 	= "使用900自由帽",
			[1000] 	= "使用1000自由帽",
			[1100] 	= "使用1100自由帽",
			[1200] 	= "使用1200自由帽",
			[1300] 	= "使用1300自由帽",
			[1400] 	= "使用1400自由帽",
			[1500] 	= "使用1500自由帽",
			[1600] 	= "使用1600自由帽",
			[1700] 	= "使用1700自由帽",
			[1800] 	= "使用1800自由帽",
			[1900] 	= "使用1900自由帽",
			[2000] 	= "使用2000自由帽",
	},		
}

function pActivity:DropItemRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %ITEM_SKILL_PIECE, "Drop Material Bag", 1)
end

function pActivity:UseHatDirt()
	local tbAward2000 = %tbAward_Ext["award2000"];
	local tbAward = %tbAward_Ext["awardnomal"];
	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_USING)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_USING) == 1 then
		Msg2Player("使用物品已达上限，不能再使用了");
		return
	end
	local tbItemLog = %tbItemOtherAward["mutaibeo"]
	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_USING, 1)	
	if tbItemLog[nCount + 1] then
		local tbAward = %tbAward_Ext["awardspecial"];
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		if  (nCount + 1) == 2000 then
			tbAwardTemplet:Give(tbAward2000, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		end
	else
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "使用风衣帽"})
	end
end

function pActivity:UseHatFreedom()
	local tbAward2000 = %tbAward_Ext["award2000"]
	local tbAward = %tbAward_Ext["awardspecial"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_USING)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_USING) == 1 then
		Msg2Player("使用物品已达上限，不能再使用了");
		return
	end
	local tbItemLog = %tbItemOtherAward["mutudo"]
	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_USING, 1)	
	if tbItemLog[nCount + 1] then
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		if  (nCount + 1) == 2000 then
			tbAwardTemplet:Give(tbAward2000, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1]} )
		end
	end
end
--function pActivity:UseHatPeace()
--	local tbAward = %tbAward_Ext["awardnomal"];
--	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_PEACE_USING)
--	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_PEACE_USING) == 1 then
--		Msg2Player("使用物品已达上限，不能再使用了");
--		return
--	end
--	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_PEACE_USING, 1)	
--	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "使用和平帽"})
--end

