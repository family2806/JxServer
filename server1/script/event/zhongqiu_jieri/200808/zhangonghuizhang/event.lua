

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function zhongqiu0808_zhangonghuizhang(nBattleLevel, i)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	local tbItem = 	{szName="Huy ch­¬ng chiÕn c«ng", tbProp={6, 1, 1818, 1, 0, 0}}
	if nDate >= zhongqiu0808_ZhanGongStartTime and nDate <= zhongqiu0808_ZhanGongEndTime then
		if zhongqiu0808_PlayerLimit() == 1 and nBattleLevel == 3  then
			if BT_GetData(PL_CURRANK) == 5 then
				Msg2Player("ËÍ´óÏÀÒ»¹ýHuy ch­¬ng chiÕn c«ng£¬ÒòÎª³É¼¨³öÉ«!")
				tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
			else
				Msg2Player("Huy ch­¬ng chiÕn c«ngÖ»ÄÜËÍ¸ø´ïµ½´ó½«³ÆºÅµÄÍæ¼Ò£¬ÏÂ´Î¸üÅ¬Á¦µãÅ¶!")
			end
		end
	end
	
	
	
end

function zhongqiu0808_gongxuanlingpai()
	local tbSay = 
	{
		"<dec><npc>Dïng 2000 ®iÓm tÝch lòy Tèng Kim ®æi 1 C«ng tr¹ng lÖnh bµi.",
		"X¸c nhËn/zhongqiu0808_gongxuanlingpai_ok",
		"Hñy bá /no"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_gongxuanlingpai_ok()
	if GetLevel() < 120 or IsCharged() ~= 1 then 
		return Say("ChØ cã nh©n vËt cÊp 120 trë lªn ®· n¹p thÎ míi cã thÓ ®æi C«ng Tr¹ng LÖnh Bµi.", 0)
	end
	
	local tbItem = 	{szName="C«ng tr¹ng lÖnh bµi", tbProp={6, 1, 1819, 1, 0, 0}}
	local nPoint = 2000
	if nt_getTask(747) < nPoint then
		Say(format("§iÄúµÄ»ý·Ö²»¹»®ñ %d, ²»ÄÜ»»È¡C«ng tr¹ng lÖnh bµi.", nPoint),0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - nPoint));
	tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
end