Include ("\\script\\event\\eventhead.lua")
TSK_REVIVAL_AWARD = 2306
TSK_REVIVAL_Nmsg = 2307
function onRevival_Player()
	local tbOpp = {"<#>了解江湖活动/OnHelp_Revival", "<#> 我只是来玩玩/OnCancel"}
	if (GetTask(TSK_REVIVAL_AWARD) > 0) then
		tinsert(tbOpp, 1, "<#> 领取江湖活动礼物/revival_want2takegift")
	end
	Say("<#>独孤盟主为了感谢江湖侠客们，已准备了礼物让我们来送给各位。详情请见主页<color=yellow>www.volam.com.vn<color>.", getn(tbOpp), tbOpp)
end

function revival_want2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Say("<#>独孤盟主要送给你<color=yellow>48小时双倍经验<color>,现在就领吗?",2, "是的, 我要领./revival_sure2takegift", "不！我一会再来!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Say("<#> 独孤盟主为你准备了<color=yellow>一个神秘红包, 200万经验,48小时双倍经验<color>, 现在领取吗?",2, "是的, 我要领./revival_sure2takegift", "不！我一会再来!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Say("<#> 独孤盟主为你准备了<color=yellow>一个神秘红包, 200万经验,48小时双倍经验<color>, 现在领取吗?",2, "是的, 我要领./revival_sure2takegift", "不！我一会再来!/OnCancel")

	else
		print("task error!! revival_player event")
	end
end

function revival_sure2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddItem(6,1,402,1,0,0,0)	--神秘大红包
		AddOwnExp(2000000)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddEventItem(random(540, 942))	--黄金碎片
		AddOwnExp(5000000)
	end
	Say("<#> 你的礼物分配的很仔细，请继续了解首页的其他活动!",0)
end

function OnHelp_Revival()
	revival_onhelp_1()
end
function revival_onhelp_1()
	Say("<#> 玩家的等级低于80级，一周没上网的，上网之后可到武林盟主那领48小时双倍经验的礼物", 2, "下一页/revival_onhelp_2", "知道了/OnCancel")
end
function revival_onhelp_2()
	Say("<#> 玩家的等级在80至120级之间，一个月没上网的，上网之后可到武林盟主那领一个神秘红包，200万经验和48小时双倍经验的礼物",  2,"下一页/revival_onhelp_3", "知道了/OnCancel")
end
function revival_onhelp_3()
	Say("<#> 玩家的等级在120级以上，一个月没上网的，上网之后可到武林盟主那领一个随机的黄金装备碎片，500万经验和48小时双倍经验的礼物?",1, "知道了/OnCancel")
end

function revival_login()
	local nday = tonumber(date("%d"))
	local pre_login_day = GetByte(GetTask(1075), 2)
	if (nday ~= pre_login_day) then
		SetTask(TSK_REVIVAL_Nmsg, 0)
	end
	if (GetTask(TSK_REVIVAL_Nmsg) > 3) then
		return
	end
	SetTask(TSK_REVIVAL_Nmsg, GetTask(TSK_REVIVAL_Nmsg) + 1)
	
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Msg2Player("为了感谢各位江湖人士，独孤盟主送<color=yellow>8小时双倍经验<color>. 请速到<color=yellow>礼官处<color> 领取!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Msg2Player("为了感谢各位江湖人士，独孤盟主送<color=yellow>m一个神秘红包，200万经验和48小时双倍经验<color>. 请速到<color=yellow>礼官处<color> 领取!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Msg2Player("为了感谢各位江湖人士，独孤盟主送<color=yellow>一个黄金装备碎片，500万经验和48小时双倍经验<color>. 请速到<color=yellow>礼官处<color> 领取!")
	end
end

function revival_player(key)
	if REVIVAL_PLAYER then
		if (key >= 7 and GetLevel() < 80) then
			SetTask(TSK_REVIVAL_AWARD, 1)
		elseif (key >= 30 and GetLevel() >= 80 and GetLevel() <= 120) then
			SetTask(TSK_REVIVAL_AWARD, 2)
		elseif (key >= 30 and GetLevel() > 120) then
			SetTask(TSK_REVIVAL_AWARD, 3)
		end
	else
		SetTask(TSK_REVIVAL_AWARD, 0)
	end
end
function OnCancel()
end

if REVIVAL_PLAYER then
	if login_add then login_add(revival_login, 2) end
end
