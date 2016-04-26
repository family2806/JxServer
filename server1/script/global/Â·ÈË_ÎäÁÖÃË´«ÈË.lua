--提供福缘领取的NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007年春节活动
Include([[\script\event\springfestival07\head.lua]]);
--武林令活动
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- 凡是涉及到活动的武林盟传人对话皆插入到此数组 -- 佩雷斯 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>江湖纷争风起云涌，诸位应严守武林正义，造福苍生，如此方有望成为一代大侠，受众人所景仰。");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"解放日活动/nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk,"帮会战开启/tongWar_Start");
	end;
	
---	tinsert(aryTalk, "前往名人堂/honor_hall_enter");
	
---	tinsert(aryTalk, "前往明月镇/autumn_enter");
	
	tinsert(aryTalk, "领取在线福缘/OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "领取组队在线福缘/OnGain_Team");
	end;
	
	tinsert(aryTalk, "领取你的在线声望点数/W33_prise");
	
	tinsert(aryTalk, "查询你当前可换取福缘的累积时间/OnQueryTime");
	
	tinsert(aryTalk, "关于福缘/OnAbout");
	
	tinsert(aryTalk, "取消/OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--领取玩家本人的福缘点数
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "你尚未充值，请充值后再来找我吧。", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "你已进入防沉迷模式,请下线休息养足谨慎再来找我吧!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "侠士是初出江湖吧，这里是一点小礼物，请收下。", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "你闯荡江湖的时日还不够，请晚些再来找我吧。", 0 );
	elseif( nResult == 1 ) then
		Say( "你闯荡江湖已久，劳苦功高，这是你应得的奖励，且收好吧。", 0 );
	end
end

--领取玩家队伍所有成员的福缘点数
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "你尚未充值，请充值后再来找我吧。", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "你已进入防沉迷模式,请下线休息养足谨慎再来找我吧!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "侠士是初出江湖吧，这里是一点小礼物，请收下。", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "你们闯荡江湖已久，劳苦功高，这是你们应得的奖励，且收好吧 。", 0 );
	else
		Say( "你们闯荡江湖的时日还不够，请晚些再来找我吧。", 0 );
	end
end

--查询当前可换取福缘的累积在线时间
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "你尚未充值，请充值后再来找我吧。", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "侠士是初出江湖吧，这里是一点小礼物，请收下。", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#>从上次领取福缘到目前为止，你共积累了<color=yellow>"..timeToString( nFYTotalTime ).."<#><color>的在线时间。", 0 );
end

--关于福缘
function OnAbout()
	Talk( 3, "", "福缘点数：通过累积在线时间来兑换的一种虚拟点数，可以用来与襄阳的神秘商人柳乙兑换各种特殊物品。", "福缘兑换：累积两小时以上在线时间后，去各大城市找武林盟传人即可兑换。一天内如果两次成功兑换福缘，有额外奖励。累积在线时间4小时以内，每小时兑换1点福缘，4小时以上，前4小时每小时兑换1点，之后每两小时兑换1点。组队时，队伍中任意一个成员可以帮全队队员领取福缘。", "限制条件：坐牢期间不增加可换取福缘的在线时间。" );
end


function W33_prise()				-- 在线时间送声望任务

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","武林盟传人：你的努力我都看在眼里，深为你的成长进步而欣慰。继续好好加油吧！")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("你的声望上升了1点。")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("你的声望上升了2点。")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("你的声望上升了3点。")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("你的声望上升了4点。")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("你的声望上升了5点。")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("你的声望上升了6点。")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("你的声望上升了7点。")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("你的声望上升了8点。")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("你的声望上升了9点。")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("你的声望上升了10点。")
	end

else

	Say("武林盟传人：你现在的条件还不足以领取声望哦。为了自己的理想，好好加油吧。努力闯出一片自己的天空来。",0)

end

end



--取消
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#>小时"..nMinute.."<#>分"..nSecond.."<#>秒";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end