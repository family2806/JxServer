-- Created by tsh 2004-12-09
-- 玫瑰卡
-- 获得随机六张卡

szTitle="<#>请选择祝福语："
Message=
{
	{"<#>你是否如我一样想你","<#>花落满怀暗香盈袖，只想知道你是否如我想你一样在想我。"},
	{"<#>你是我的生命","<#>当我说你是我的灵魂和生命，不要讶异，因为你是我的生命。"},
    {"<#>雪夜里提灯的你","<#>见到你时，温暖的感觉像在雪夜里忽见灯火你就是那提灯的人。"},
    {"<#>今生与你不弃不离","<#>我在佛前求了五百年，愿能结此尘缘，与你今生相守不弃不离。"},
    {"<#>愿能与你倾心相遇","<#>别因也许会改变，不说那句美丽的誓言，愿能与你顷心相遇。"},
    {"<#>你我温柔相待，不负良缘","<#>不管相爱时间会有多久，盼你我皆能温柔相待，不负良缘。"},
    {"<#>长相思","<#>天长路远魂飞苦，梦魂不到关山难，长相思，摧心肝。"},
    {"<#>我的紫青宝剑","<#>我的紫青宝剑发出嘟~嘟的讯号，原来我的意中人是你，还跑。"},
    {"<#>你把我的心偷走","<#>鬼灵精怪的你，把我的心偷走了，让我脑海里都是你的身影。"},
}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=236

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("你现在正在进行其他祝福，请稍候再试。");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Message);
	for i=1, nSelectCount do
		FuncBless[i] = Message[i][1].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "取消/QueryWiseManCancel"

	Say(szTitle, getn(FuncBless), FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--先不删除玩家的卡片，在实际发送了祝福时再删（临时记录下来装备编号）
	return 1;

end

function PlayerSelect(nSelect)
	QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", nSelect);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx
	ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	local Level
	local Series
	local Luck
	ItemGenre,DetailType,ParticularType,Level,Series,Luck = GetItemProp(ItemIdx)
	if (ItemIdx > 0 and ItemGenre == ITEM_GENRE and DetailType == ITEM_DETAIL and ParticularType == ITEM_PARTI) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = GetName().."<#>对"..TargetName.."<#>说："..Message[nSelect + 1][2]
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("找不到卡片，请重试一次。")
		end
	else
		Msg2Player("卡片使用失败，请重试一次。")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nSelect)
	Msg2Player("你想祝福的玩家现在不在线，请稍候再试。");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end