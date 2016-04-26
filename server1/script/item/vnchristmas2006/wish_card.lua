-- Created by Danielsun 2006-12-07
-- 祝福卡
-- 一共有六张祝福卡,每张的祝福语都不同.

Include("\\script\\lib\\string.lua")

--<playerbless> -- [收卡人名字]
--<name> -- [发卡人名字]
tbMessage={
	["6,1,1328"] = "祝 <color=red><playerbless><color> 圣诞和新年快乐<color=red><name><color>",
	["6,1,1329"] = "<color=red><playerbless><color> 亲爱的，祝你圣诞快乐 <color=red><name><color>",
	["6,1,1330"] = "<color=red><playerbless><color> 亲爱的，祝你圣诞快乐 <color=red><name><color>",
	["6,1,1331"] = "祝你<color=red><playerbless><color> 圣诞快乐. <color=red><name><color>",
	["6,1,1332"] = "祝你 <color=red><playerbless><color> 新年快乐和幸福<color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("您目前正在发祝福语，请等一下!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("你想寄圣诞卡给朋友吗?", 2, "想/sendWish","暂时不用/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("找不到卡，请再试一次!.")
		end
	else
		Msg2Player("使用卡失败，请再试一次.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("您想祝福的人现在不在线，稍候再试!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end