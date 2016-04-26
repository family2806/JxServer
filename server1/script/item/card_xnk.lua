-- Created by tsh 2004-12-09
-- 新年卡
-- 获得随机六张卡

szTitle="<#>请选择祝福语："
Bless=
{
	"<#>愿片片洁白美丽的雪花带着我的祝愿飞到您的身边，祝您新年如意!",
	"<#>贺新年，庆佳节，恭喜发财；新年好，万事顺，事事如意。",
	"<#>祝新年快乐，前程似锦，吉星高照，财运亨通，合家欢乐。",
	"<#>让云捎去满心的祝福，点缀你甜蜜的梦，愿你拥有一个幸福快乐的新年！",
	"<#>祝福是份真心意，不是千言万语的表白。祝福你新年快乐。",
	"<#>满心的爱意化作真挚的祝福，祝你新年快乐!",
}

ITEM_TASK_TEMP=23
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=140

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("你现在正在进行其他祝福，请稍候再试。");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "取消/QueryWiseManCancel"

	Say(szTitle, getn(Bless), FuncBless);
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
			szMsg = GetName().."<#>对"..TargetName.."<#>说："..Bless[nSelect + 1]
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