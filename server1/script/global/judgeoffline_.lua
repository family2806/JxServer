--用户选择离线托管时的脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006年10月30日加入限制在所有城市车夫旁和天王帮托管的脚本  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = "凤翔",
		["11"] = "成都",
		["37"] = "汴京",
		["80"] = "扬州",
		["78"] = "襄阳",
		["162"] = "大理",
		["176"] = "临安",
		["20"] = "江津村",
		["53"] = "巴陵县",
		["54"] = "南岳镇",
		["99"] = "永乐镇",
		["100"] = "朱仙镇",
		["101"] = "稻香村",
		["121"] = "龙门镇",
		["153"] = "石鼓镇",
		["174"] = "龙泉村",
		["13"] = "峨嵋",
		["25"] = "唐门",
		["49"] = "天忍",
		["59"] = "天王",
		["81"] = "武当",
		["103"] = "少林",
		["115"] = "丐帮",
		["131"] = "昆仑",
		["154"] = "翠烟",
		["183"] = "五毒",
--		["208"]	= "大牢",
		-- LLG_ALLINONE_TODO_20070802
		["235"] = "桃花岛（一）",
		["236"] = "桃花岛（二）",
		["237"] = "桃花岛（三）",
		["238"] = "桃花岛（四）",
		["239"] = "桃花岛（五）",
		["240"] = "桃花岛（六）",
		["241"] = "桃花岛（七）",
		["835"] = "无名谷(一)",
		["836"] = "无名谷(二)",
		["837"] = "无名谷(三)",
		["838"] = "无名谷(四)",
		["839"] = "无名谷(五)",
		["840"] = "无名谷(六)",
		["586"] = "公共帮会地图一",
		["587"] = "山城帮会地图",
		["588"] = "苗疆帮会地图",
		["589"] = "沙漠帮会地图",
		["590"] = "京师帮会地图",
		["591"] = "边塞帮会地图",
		["593"] = "江南帮会地图",
		["594"] = "雪岭帮会地图",
		["595"] = "公共帮会地图二",
		["596"] = "公共帮会地图三",
		["597"] = "公共帮会地图四",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<#>你在<color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color>时间段内选择离线托管，可以继续摆摊交易，但是不会获得经验值，不会自动领取福缘。这个时间段系统不会扣除你的离线托管时间，而你的可进行游戏时间则会继续计算。", 2, "你确定要进入离线托管吗?/judgecontion", "暂时不要了。/donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
--	do
--		Talk(1, "", "离线托管功能关闭")
--		return
--	end

	--如果到达这一步那么成功开始离线托管
	local tbSpareTime = {};
										--特效大白驹丸	普通大白驹丸	白驹丸
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--特效技能大白驹丸	技能大白驹丸	技能白驹丸
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--给用户提示显示到分钟
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>Ch璦 ch鋘 k?n╪g<color>";
		end
		
		local szmsg = format("你的离线托管剩余时间为:特效大白驹丸<color=red>%d<color>小时<color=red>%d<color> 分"..
	"<enter>大白驹丸<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>白驹丸<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>特效仙草露<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>技能熟练度(%s):特效技能大白驹丸<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>技能大白驹丸<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>技能白驹丸<color=red>%d<color>小时<color=red>%d<color>分"..
	"<enter>托管时如果有特效大白驹丸效果，优先按此效果给与经验并扣除其对应效果时间。", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	"开始离线托管/beginoffline",
			"选择离线托管技能/#selectofflineskill('judgecontion')",
			"开始在线托管/begin_onlinecommission",
			"结束在线托管/end_onlinecommission",
			"领取离线奖励/offlineaward",
			"我再考虑考虑/donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<#>欠费充值提醒？");
			return
		end;
		--beginoffline();
		--用户剩余的时间
		Say("<#>Th阨 gian c遪 l筰 駓 th竎 kinh nghi謒 B筩h C莡 Ho祅 c馻 b筺 l?color=red>0<color>分. Ngi c?th?s?d鬾g Чi B筩h C莡 Ho祅 c Bi謙 ho芻 l?Чi B筩h C莡 Ho祅  t╪g th阨 gian 駓 th竎 c馻 m譶h. <enter>ho芻 l?ch鋘<color=yellow> 駓 th竎 r阨 m筺g mi詎 ph?color>, c竔 n祔 ch?c?th?nh薾 頲 m閠 ch髏 輙 kinh nghi謒.",
			3,
			"开始离线托管/beginoffline",
			"领取离线奖励/offlineaward",
			"我再考虑考虑/donothing");
	end
end

-- 开始在线托管
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--判断用户剩余的时间
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>你剩余的离线托管时间为0分钟。请你使用了离线托管物品，再使用该功能。", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<#>你当前不处于在线托管状态！")
	else
		Msg2Player("开始在线托管！")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- 结束在线托管
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<#>在线托管开始！")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<#>在线托管结束！")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "Xin i hi謕 lng th?kh玭g th?s?d鬾g t譶h n╪g 駓 th竎 t筰 server c玭g c閚g")
		return 1
	end
	--首先判断用户所在的区域
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--没有在当前地图上
	if (arraymap[strmapid] == nil) then
		Say("<#>你不能在这个区域使用离线托管功能，请你到相应的特定区域（包括所有城镇、村庄以及十大门派内）使用离线托管。", 0);
		return 1
	end
	
	-- 判断是否在某些限制区域，比如说车夫、天王帮等
	if offlineCheckPermitRegion()~=1 then
		Say("<#>你不能在这个区域使用离线托管功能，请你到相应的特定区域（包括所有城镇、村庄以及十大门派内）使用离线托管。", 0);
		return 1;
	end;
	
	--判断用户的战斗状态
	if (GetFightState() ~= 0) then 
		Say("<#>你目前处于战斗状态中，无法进入离线托管状态，请你进入非战斗状态后再使用离线托管。", 0);
		return 2
	end
	
	--判断用户剩余的时间
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>你剩余的离线托管经验时间为0分钟，或者并未选择离线托管的技能，请重新确认后再使用该功能。", 0);
		return 3
	end
	
	-- 当一台服务器的人数超过800人，则不允许玩家在这台服务器内进行离线托管
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<#>现在这个地方真的是人山人海，你还是到其它的城镇、村庄或者门派再进行离线托管吧。",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- 判断是否在在线托管
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<#>你当前处于在线托管状态！", 0)
		return 1
	end
	-- 开始离线挂机
	OfflineLive(PlayerIndex);
end

--什么都不做的函数，可能多个地方调用到，修改得时候请注意
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--判断用户剩余的时间
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- 选择离线托管技能
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "请选择您需要离线托管的技能：";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr?l筰/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- 设置离线托管技能
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end
