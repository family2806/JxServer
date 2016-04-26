-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	游戏推广员系统
-- Include("\\script\\misc\\spreader\\spreader.lua")
---------------------------------------------------------------------------

IncludeLib("SPREADER")

Include("\\script\\global\\systemconfig.lua") -- 系统配置
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")		--领取丢失黄金装备

function main()
	game_spreader()
end
function game_spreader()
	if (SWITCH_SPREADER ~= 1) then
		Talk(1, "", "<color=green>通告<color>: 该功能不能打开!");
		return 0;
	end
	local szOp = 
	{
		"输入cd-key 激活账号/gsp_input_cdkey",
		"获得奖励! /gsp_phase_prize",
		-- "领取黄金师徒卡/gsp_accept_goldcard",
		"相关公告.../gsp_about",
		"赔偿给占城帮会/about_castellan_remedy",
		"给人物取名/about_rename_role",
		"给帮会取名/about_rename_tong",
		"当转向新的服务器时，玩家更名/rename_role_tranfer",
		"顺便路过/gsp_cancel",
		"收回已失去的黄金装备!/restore_golditem",
	};
	
	if (SYSCFG_REGION_VERSION	== SC_REGION_VER_CN) then -- 大陆版本
		Say("欢迎进入<color=green>通告<color>, 有什么需要帮助的吗?", 7,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[8]);
	elseif (SYSCFG_REGION_VERSION	== SC_REGION_VER_VN) then -- 越南版本
		Say("有什么需要帮助的吗?", 3,
			szOp[7],
			szOp[9],
			szOp[8]);
	else
		Say("有什么需要帮助的吗?", 1,
			szOp[8]);	
	end
end

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		Msg2Player("你未领取促销活动的奖励，现在送你.");
		gsp_newaccount_gift_core();
		nValue = nValue + 1; -- 此步可做可不做
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "该账号已激活，不用输入cd-key. 但是，你可能领不到黄金师徒卡，请联系Vinagame."
		Talk(1, "", "<color=green>Th玭g c竜<color>:"..szError);
		gsp_writeLog(szError);
		return -1;
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY_PAY) then
		szError = "该账号已激活，不用输入cd-key. 谢谢你的支持"
		Talk(1, "", "<color=green>通告<color>:"..szError);
		-- gsp_writeLog(szError);
		return -1;
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "请输入cd-key:");
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>通告<color>, 请看正式网页.");
end

function gsp_cancel()
end

-- 领取阶段奖励
function gsp_phase_prize()
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	if (GetByte(nValue, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>通告<color>: 你未使用 cd-key 激活该账号，不能领奖。详情请看网页上的信息.");
		return 0;
	end
	
	local nLevel = GetLevel();
	local nBonus = 0;
	local nPrizeLevel = 0;
	local nBit = 0;
	-----------------
	if (nLevel < 30) then
		Talk(1, "", "<color=green>通告<color>: 目前你的等级为"..GetLevel().."级，未领奖.<enter>当你达到30, 40, 50, 80 级后到这领奖。加油! <enter><enter><color=green>说明<color>: 允许使用<color=yellow>黄金师徒卡<color>.");
		return 0;
	end
	if (nLevel >= 30 and GetBit(nValue, GSP_TASKID_TAG_BIT_30BONUS) == 0) then
		nPrizeLevel = 30;
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		nBonus = 300000; -- 30W
	-----------------
	elseif (nLevel >= 40 and GetBit(nValue, GSP_TASKID_TAG_BIT_40BONUS) == 0) then
		nPrizeLevel = 40;
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		nBonus = 400000; -- 40W
	-----------------
	elseif (nLevel >= 50 and GetBit(nValue, GSP_TASKID_TAG_BIT_50BONUS) == 0) then
		nPrizeLevel = 50;
		nBit = GSP_TASKID_TAG_BIT_50BONUS;
		nBonus = 1000000; -- 100W
	end
	-----------------
	if (nBonus > 0) then
		Earn(nBonus);
	elseif (nLevel >= 80 and GetBit(nValue, GSP_TASKID_TAG_BIT_80BONUS) == 0) then
		nPrizeLevel = 80;
		nBit = GSP_TASKID_TAG_BIT_80BONUS;
		if (gsp_prize_skills90() == 0) then -- 学会90级技能 = 0:学习失败
			nPrizeLevel = 0;
			nBit = 0;
		end
	end
	-----------------
	
	if (nPrizeLevel ~= 0) then
		print("Value:"..nValue)
		nValue = SetBit(nValue, nBit, 1); -- 设置领取标记
		print("Value:"..nValue)
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
		Talk(1, "", "<color=green>通告<color>: 你获得"..nPrizeLevel.."本阶段的奖励，再努力点哦");
	else
		Talk(1, "", "<color=green>通告<color>: 你已领奖，加油哦!");
	end
end

-- CDKEY检验结果返回处理
function gsp_cdkey_verify_result(nResult)

	local szMsg = 
	{
		"当发生错误时，请联系GM!",
		"cd-key 无效，请输入对的cd-key!",
		"cd-key 正确，账号已激活，恭喜进入通告!",
		"失败：账号已使用10个小时，不能再登录!",
		"失败：该账号已激活，不能再登录了!"
	};
	local nSel = 1;
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2;
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3;
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4;
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 5;
	end

	gsp_writeLog(szMsg[nSel].." result: "..nResult);
	Msg2Player(szMsg[nSel]);
	Talk(1, "", " [<color=green>通告<color>]"..szMsg[nSel]);

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
		gsp_config_for_join();
	end
	
	return 1;
end

-- 加入系统，配置相关信息
function gsp_config_for_join()
	-- 设置CDKEY激活
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, GSP_ACCOUNT_TYPE_CDKEY - nValue);
	
	gsp_accept_goldcard();
end

-- 接受黄金师徒卡
function gsp_accept_goldcard()
	-- 设置角色类型 for spreader
	SetTask(GSP_TASKID_ROLEREINFO, 0); -- 先清零，有无必要？
	local nTaskValue = 0;
	nTaskValue = SetByte(nTaskValue, GSP_TASKID_TAG_BYTE_ROLETYPE, GSP_TASKID_ROLETYPE_CDKEY);
	SetTask(GSP_TASKID_ROLEREINFO, nTaskValue);
	--print("GSP_TASKID_ROLEREINFO:"..nTaskValue);
	-- 更改扩展点数据
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1);
	
	-- 送黄金师徒卡，标记黄金徒弟
	AddItem(6, 1, 441, 1, 0, 0); -- 黄金师徒卡
	SetTask(TKID_GOLD_APPRENTICE, 1); -- 标记角色为黄金徒弟
	
	local szMsg = "你获得 <color=yellow>师徒黄金卡<color>! 用它来拜师，你和师傅都会获得很多奖励!"; 
	Msg2Player(szMsg);
	Talk(1, "", "<color=green>通告<color>:"..szMsg);
	-- gsp_writeLog("获得黄金师徒卡");
end

------------------
-- 90级技能
SKILLS_90 = {
	{	{318,1},{319,1},{321,1}}, --少林
	{	{322,1},{323,1},{325,1}}, --天王
	{	{339,1},{302,1},{342,1},{351,0}}, --唐门
	{	{353,1},{355,1},{390,0}}, --五毒
	{	{328,1},{380,1},{332,0}}, --峨嵋
	{	{336,1},{337,1}}, --翠烟
	{	{357,1},{359,1}}, --丐帮
	{	{361,1},{362,1},{391,0}}, --天忍
	{	{365,1},{368,1}}, --武当
	{	{372,1},{375,1},{394,0}}, --昆仑
}

function gsp_prize_skills90()
	local faction = GetLastFactionNumber()
	if(faction ~= -1) then
		for i=1,getn(SKILLS_90[faction+1]) do
			-- 没有学过，才加上，否则会清掉原来的级别
			if (HaveMagic(SKILLS_90[faction+1][i][1]) == -1) then
				AddMagic(SKILLS_90[faction+1][i][1],SKILLS_90[faction+1][i][2])
			end
		end
		Msg2Player("恭喜你已超过 <color=green>通告的挑战<color>, 可以领悟90级技能 ")
		AddGlobalNews("大家一起祝贺"..GetName().."顺利通告通告的挑战，可以领悟本门的90级技能.")
		return 1;
	end
	Msg2Player("你未加入门派，不能领悟90级技能!")
	Talk(1, "", "你未加入门派，不能领悟90级技能!");
	return 0;
end

-- 检查是否有原占城帮会补偿
function check_castellan_remedy()
	if (GetBit(GetTask(TASKVALUE_BLEND), 3) == 1) then
		return 1;
	end
	return 0;
end

-- 清除有原占城帮会补偿任务变量
function clear_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	value = SetBit(value, 3, 0)
	SetTask(TASKVALUE_BLEND, value)
end

-- 原占城帮会补偿
function about_castellan_remedy()
	if (check_castellan_remedy() == 1) then
		Say("<#> 由于发生障碍，所以系统处理错误你的权限。我们及时赔偿，你现在想领什么赔偿?",
			2,
			"<#> 我想领赔偿/take_castellan_remedy",
			"<#> 稍候回来领/cancel");
	else
		deny()
	end
end

-- 领取原占城帮会补偿
function take_castellan_remedy()
	Say("<#> 每个占城帮会获得赔偿奖励：60个神秘大红包(由帮助领取) 和500000000 两(直接放入帮会银库) . 请确认装备上还有空位，你想现在领吗?",
		2,
		"<#> 我想现在领/take_castellan_remedy2",
		"<#> 稍候再来领/cancel")
end

function take_castellan_remedy2()
	if (check_castellan_remedy() == 1) then
		for i = 1, 60 do
			AddItem(6, 1, 402, 0, 0, 0, 0)
		end
		local now = date("%Y-%m-%d %H:%M:%S")
		local name = GetName()
		WriteLog(now .. " 赔偿给占城帮会" .. name .. "获得60个神秘大礼包")
		Msg2Player("<#> 你获得获得60个神秘大礼包")

		tong, res = GetTong()
		if (res == 1 and tong ~= "") then
			local money = 500000000
			AddTongMoney(tong, money)
			WriteLog(now .. " 赔偿给占城帮会" .. name .. "目前帮会" .. tong .. "获得60个神秘大礼包")
			Msg2Player("<#> 你的帮会获得" .. money .. " 两")
		end
		clear_castellan_remedy()
	end
end

-- 重名玩家更改角色名对话
function about_rename_role()
	local strInfo = "<#> 您好，由于你的名字与其他玩家的名字相同，所以系统已帮您改名，你可以修改之前的名字，可以检查那个名字可以用吗？注意，你只有唯一的一次机会改名，请小心.";
	local strError= "<#> 对不起，你不能进行次操作。( 只能更改人物名字，帮会名字，占城帮会帮主名字) . 请联系GM了解详情";
	func_online_rename_role(strInfo, strError);
end

function rename_role_tranfer()
	local strInfo = "<#>你只有唯一的一次改名机会，可以先看来选择。在决定之前，请仔细看信息!";
	local strError= "<#> 你不能执行该操作。只有转向新的服务器的人才能进行。请联系服务部门了解详情!";
	func_online_rename_role(strInfo, strError);
end

-- 重名帮会更改帮会名
function about_rename_tong()
	if (check_renametong() == 1) then
		Say("<#> 您好，由于你的名字与其他玩家的名字相同，所以系统已帮您改名，你可以修改之前的名字，可以检查那个名字可以用吗？注意，你只有唯一的一次机会改名，请小心.",
			3,
			"<#> 查询帮会名是否可用/query_tongname",
			"<#>更改自己所在帮会的帮会名/change_tongname",
			"<#>我还是下次再来更改吧/cancel")
			else
		deny()
	end
end

-- 查询帮会名
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> 请输入要查询的帮会名");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- 更改帮会名
function change_tongname()
	Say("<#> 具体步骤：在与NPC的对话中输入要更改的帮会名后，如帮会名更改成功，系统会给与更改成功提示，并在系统下次维护后，更改您所在帮会的帮会名。如果更改失败，则请您重新进行上述的步骤。如果出现其他异常情况，请与客服人员联系。", 
		2,
		"<#>开始更改帮会名/change_tongname2",
		"<#>我再考虑一下/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> Xin nh藀 t猲 Bang h閕 m韎 v祇");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#>只有帮主才能更改帮会名")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#>不能修改成相同的帮会名", 1, "<#>知道了/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny()
	Say("<#> 对不起，你不能进行该操作. ( 只能改变人物名称，帮会名称，帮主名称) .请联系GM了解详情",
		1,
		"<#> 知道了!/cancel")
end
