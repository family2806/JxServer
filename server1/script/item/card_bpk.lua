-- Created by tsh 2004-12-09
-- 帮派卡
-- 获得随机六张卡

szTitle="<#>请选择祝福语："
Bless=
{
	"<#>天天经验千千万，金子元宝猩红石，放满一箱又一箱。",
	"<#>没有什么比帮派友情更温暖、帮里的帅哥美女让我珍惜。",
	"<#>兄弟姐妹就是在你伤心时安慰你、在你开心时一同分享的人。",
	"<#>祝帮派的各位兄弟姐妹一年开开心心,一生快快乐乐,一世平平安安",
	"<#>祝帮派的各位兄弟姐妹天天龙马精神,月月身体健康,年年财源广进。",
	"<#>帮会是避风的港湾、你们是鼓风的海岸，来到这个帮派是我最大的幸福。",
}

ITEM_TASK_TEMP=25
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=136

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("你现在正在进行其他祝福，请稍候再试。");
		return 1
	end

	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("你没有加入帮派，无法使用帮派卡。")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return 1;
	end

	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "取消/QueryWiseManCancel"

	Say(szTitle, getn(Bless) + 1, FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--先不删除玩家的卡片，在实际发送了祝福时再删（临时记录下来装备编号）
	return 1;
end

function PlayerSelect(nSelect)
	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("你没有加入帮派，无法使用帮派卡。")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return
	end
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
			szMsg = GetName().."<#>对"..TongName.."<#>帮派说："..Bless[nSelect + 1]
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

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end