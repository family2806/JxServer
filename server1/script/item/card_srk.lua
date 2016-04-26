-- Created by tsh 2004-12-09
-- 生日卡
-- 获得随机六张卡

szTitle="<#>请选择祝福语："
Bless=
{
	"<#>又一个美好开始，愿我祝福带给你成功的一年，生日快乐。",
	"<#>三个生日祝愿：一愿身体健康二愿幸福快乐三愿万事如意。",
	"<#>摘一片雪花串成洁白的树挂，为你生日奉献一朵亮丽心花。",
	"<#>送一份礼物表一曲心声：年年长新知岁岁更进步生日快乐。",
	"<#>愿所有快乐、幸福、好运永远围绕在你身边，生日快乐。",
	"<#>思念中我想起你的生日，真心祝福你拥有一个快乐的生日。",
}

ITEM_TASK_TEMP=27
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=137

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