-------------------------------------------------------------------------
-- FileName		:	newaccount.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-06 22:15:37
-- Desc			:	新手推广帐号
-- Include("\\script\\misc\\spreader\\neaccount.lua")
---------------------------------------------------------------------------

Include("\\script\\misc\\spreader\\head.lua")

-- 是否有新手推广
function gsp_haveprize_newaccount()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		return 1;
	end;
	
	return 0;
end

function gsp_newaccount_gift()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then	
		Say("新手开户卡：<color=red>西山居十周年庆典普及风暴<color>, 您要领取新手开户卡的赠品吗？", 3, "是的，我要领取/gsp_newaccount_gift_core", "等一会再领/gs_newaccount_cancel", "关于新手开户卡.../gs_newaccount_about");
	elseif (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER_PAY) then
		Talk(1, "", "新手开户卡：您的赠品已领取。一个帐号只能领一次。");
	else
		Talk(1, "", "新手开户卡：您的帐号不是新手开户卡帐号，不能领取赠品。");
	end
end

-- 赠送一
function gsp_newaccount_gift_core()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1); -- 修改扩展点已领取标记	
		
		AddItem(0,10,2,1,random(0,4),0,0); -- 白马
		Earn(10000); -- 1w两
		Msg2Player("您获得了劣白马一匹和银子1万两");
		Talk(1, "", "新手开户卡：您获得劣白马一匹和银子1万两，祝您在剑侠情缘网络版中快乐地游戏");
		return 1;
	end
end

function gs_newaccount_cancel()
end

function gs_newaccount_about()
	Talk(1, "", "新手开户卡：若您使用<color=red>西山居十周年庆典普及风暴<color>发放的新手开户卡帐号(一般以KS开头)，可在礼官处领取一份礼物，助您踏出闯荡江湖的第一步。");
end
