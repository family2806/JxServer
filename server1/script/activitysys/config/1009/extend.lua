Include("\\script\\activitysys\\config\\1009\\head.lua")
Include("\\script\\activitysys\\config\\1009\\variables.lua")
Include("\\script\\activitysys\\config\\1009\\award_ext.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\log.lua")

local tbItemOtherAward = {
	["mutaibeo"] = {
			[100] 	= "ʹ��100����ñ",
			[200] 	= "ʹ��200����ñ",
			[300] 	= "ʹ��300����ñ",
			[400] 	= "ʹ��400����ñ",
			[500] 	= "ʹ��500����ñ",
			[600] 	= "ʹ��600����ñ",
			[700] 	= "ʹ��700����ñ",
			[800] 	= "ʹ��800����ñ",
			[900] 	= "ʹ��900����ñ",
			[1000] 	= "ʹ��1000����ñ",
			[1100] 	= "ʹ��1100����ñ",
			[1200] 	= "ʹ��1200����ñ",
			[1300] 	= "ʹ��1300����ñ",
			[1400] 	= "ʹ��1400����ñ",
			[1500] 	= "ʹ��1500����ño",
			[1600] 	= "ʹ��1600����ñ",
			[1700] 	= "ʹ��1700����ñ",
			[1800] 	= "ʹ��1800����ñ",
			[1900] 	= "ʹ��1900����ñ",
			[2000] 	= "ʹ��2000����ñ",
	},		
	["mutudo"] = {
			[100] 	= "ʹ��100����ñ",
			[200] 	= "ʹ��200����ñ",
			[300] 	= "ʹ��300����ñ",
			[400] 	= "ʹ��400����ñ",
			[500] 	= "ʹ��500����ñ",
			[600] 	= "ʹ��600����ñ",
			[700] 	= "ʹ��700����ñ",
			[800] 	= "ʹ��800����ñ",
			[900] 	= "ʹ��900����ñ",
			[1000] 	= "ʹ��1000����ñ",
			[1100] 	= "ʹ��1100����ñ",
			[1200] 	= "ʹ��1200����ñ",
			[1300] 	= "ʹ��1300����ñ",
			[1400] 	= "ʹ��1400����ñ",
			[1500] 	= "ʹ��1500����ñ",
			[1600] 	= "ʹ��1600����ñ",
			[1700] 	= "ʹ��1700����ñ",
			[1800] 	= "ʹ��1800����ñ",
			[1900] 	= "ʹ��1900����ñ",
			[2000] 	= "ʹ��2000����ñ",
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
		Msg2Player("ʹ����Ʒ�Ѵ����ޣ�������ʹ����");
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
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "ʹ�÷���ñ"})
	end
end

function pActivity:UseHatFreedom()
	local tbAward2000 = %tbAward_Ext["award2000"]
	local tbAward = %tbAward_Ext["awardspecial"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_HAT_USING)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbBITTSK_LIMIT_HAT_USING) == 1 then
		Msg2Player("ʹ����Ʒ�Ѵ����ޣ�������ʹ����");
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
--		Msg2Player("ʹ����Ʒ�Ѵ����ޣ�������ʹ����");
--		return
--	end
--	%tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_HAT_PEACE_USING, 1)	
--	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "ʹ�ú�ƽñ"})
--end

