NA_MONEYGIFT_MAX_MONEY				=	1000000			--活动期最大允许兑换奖励金钱数
NA_MONEYGIFT_DAYMAX_MONEY			= 200000			--每日最大允许兑换奖励金钱数
NA_MONEYGIFT_SV_DAYMAX_MONEY	= 350000000	--每台服务器允许每日兑换的最大值3.5亿
NA_MONEYGIFT_MONEY						= 20000

TSK_NA_MONEYGIFT_MAXMONEY			= 1194			--当前已获得的金钱统计
TSK_NA_MONEYGIFT_DAYMAXMONEY 	= 1195			--本日获得的金钱统计
TSK_NA_MONEYGIFT_LASTDAY			= 1196			--最后一次兑换奖励的日期
TSK_NA_MONEYGIFT_ISTAKED			= 1197			--该角色是否能够兑换奖励

GTSK_NA_MONEYGIFT_SVLASTDAY		= 831				--最后一次兑换物品奖励的日期
GTSK_NA_MONEYGIFT_SVMAXMONEY	= 832				--当日礼官已兑换奖励金钱的数量

EXT_NA_MONEYGIFT_ACCT					= 2					--扩展点，三个角色参加活动
TB_MONEYGIFT_MSG = {
	"<#>您还未交证件,无法参加此活动!",
	"<#>50级以上的玩家才可以参加此活动.",
	"<#>您已有3个角色参加此活动，无法再参加了.",
	"<#>此次活动您已兑换够100万! 感谢支持!",
	"<#>今天您已兑换够20万. 明天再来!",
	"<#>真不巧! 我刚刚换完钱! 要不试试到别的城换或者明天再来.祝您开心!",
	"<#>似乎没有您的国庆礼物哦!",
}
function vm_NationalDay()
	Say("<#>国庆快乐! 快去练功, 找到国庆礼物到我这兑换有趣的礼物!", 2,
	"兑换国庆礼物/NA_want2changegift",
	"我只是随便看看/OnCancel");
end;

function NA_want2changegift()
	if (NA_istakedgift() == 0) then
		return 0;
	end;
	
	if (CalcEquiproomItemCount(6,1,1155,-1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 1155, -1)) then
		SetTask(TSK_NA_MONEYGIFT_MAXMONEY, GetTask(TSK_NA_MONEYGIFT_MAXMONEY) + NA_MONEYGIFT_MONEY);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) + NA_MONEYGIFT_MONEY);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) + NA_MONEYGIFT_MONEY);
		Earn(NA_MONEYGIFT_MONEY);
		WriteLog("[国庆活动]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." 接受"..NA_MONEYGIFT_MONEY.." 两")
		Say("<#>请收下银两. 祝您国庆快乐！", 1, "收下银两/OnCancel")
		if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
			SetTask(TSK_NA_MONEYGIFT_ISTAKED, 1);
			AddExtPoint(EXT_NA_MONEYGIFT_ACCT, 1);
		end;
	else
		Say(TB_MONEYGIFT_MSG[7], 0);
	end;
end;

function NA_istakedgift()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (GetTask(TSK_NA_MONEYGIFT_LASTDAY) ~= nDate) then
		SetTask(TSK_NA_MONEYGIFT_LASTDAY, nDate);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, 0);
	end;
	
	if (GetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY) ~= nDate) then
		SetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY, nDate);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, 0);
	end;

	if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
		if (IsCharged() ~= 1) then	--冲值
			Say(TB_MONEYGIFT_MSG[1], 0);
		elseif (GetLevel() < 50) then	--50级
			Say(TB_MONEYGIFT_MSG[2], 0);
		elseif (GetExtPoint(EXT_NA_MONEYGIFT_ACCT) >= 3) then	--3个角色
			Say(TB_MONEYGIFT_MSG[3], 0);
		else
			return 1;
		end;
		return 0;
	else
		if (GetTask(TSK_NA_MONEYGIFT_MAXMONEY) >= NA_MONEYGIFT_MAX_MONEY) then	--角色获取最大奖励
			Say(TB_MONEYGIFT_MSG[4], 0);
		elseif (GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) >= NA_MONEYGIFT_DAYMAX_MONEY) then		--每日最大奖励
			Say(TB_MONEYGIFT_MSG[5], 0);
		elseif (GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) >= NA_MONEYGIFT_SV_DAYMAX_MONEY) then	--服务器最大限制
			Say(TB_MONEYGIFT_MSG[6], 0);
		else
			return 1;
		end;
		return 0;
	end;
end;

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;