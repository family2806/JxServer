if (not __TONGRANDOMTASK_H__) then
	__TONGRANDOMTASK_H__ = 1;

Include([[\script\tong\tong_statistics.lua]]);

tab_Workshop = {[1] = "兵甲", [2] = "天工", [3] = "面具", [4] = "试炼", [5] = "天意", [6] = "礼物", [7] = "活动"};

TASK_LP_ITEMID = 1744;			--临时记录令牌的物品ID。
TASK_LP_COUNT = 1745;			--记录需要荐书的数量。
TASK_LP_ZONGGUANIDX = 1746;		--记录是那个总管。
TASK_LP_ZONGGUANLEVEL = 1756;	--记录写荐书总管需要的级别。
TASK_LP_TIMESLIMIT = 2566--每天完成100次上限：byte1：次数；byte2：日期；byte3：月份
--襲 ch豱h nhi謒 v? r鱝 pk - Modified by DinhHQ - 20110810
--DAILY_MAX_TIMES = 2  -- 更改每天完成任务的上限为2次   by wangjingjun IB shop 调整
DAILY_MAX_TIMES = 100
PER_ASSIGNMENT_PK = 1 -- 每个任务减少pk值1点 by wangjingjun IB shop 调整

TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--记录写荐书总管的帮会。

--检查是否是相应总管的对话
function rwlp_taskcheck(nTongID, nWorkshopID)
	local nWKSPType = TWS_GetType(nTongID, nWorkshopID);
	if (nWKSPType ~= GetTask(TASK_LP_ZONGGUANIDX)) then --总管不对
		return 2;
	end
	if (0 == rwlp_mapcheck()) then --在公共帮会地图
		return 0;
	end;
	return 1;
end;

--和各大总管的对话
function rwlp_dedaojianshu(nTongID, nWorkshopID)
	local nCount = rwlp_getjuanshucount();
	local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).."级<color>";
	local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."坊总管<color>";
	if (nCount >= GetTask(TASK_LP_COUNT)) then	-- 如果任务已经完成，直接返回
		Say("你的已经收集了<color=yellow>"..nCount.."<color>个荐书，已经足够了。赶紧回去交给贵帮天意坊总管吧。", 0)
		return
	end;
	if (rwlp_tongcheck() == 0) then
		Say("本帮长老已经给你写过荐书了，你再到别帮试试吧。", 0);
		Msg2Player("该帮会长老已经帮助过你了。你共获得了<color=yellow>"..nCount.."封<color>荐书，你总共要收集<color=yellow>"..GetTask(TASK_LP_COUNT).."封<color>荐书");
		return
	end;
	
	if (rwlp_workshopcheck() == 0) then
		Say("老夫和贵帮"..szZGName.."素有交情，只是本总管管辖的作坊不够"..szLevel.."，你到其他帮会去看看吧。你共要收集的<color=yellow>"..GetTask(TASK_LP_COUNT).."封<color>荐书，目前你已经收集了<color=yellow>"..rwlp_getjuanshucount().."<color>封。", 0);
		Msg2Player("该帮会的"..szZGName.."不够"..szLevel.."，不能给你荐书。");
		return 0;
	end;
	
	add_a_juanshu();
	Say("听闻贵帮<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."<color>总管正在为赶考缺少荐书而心忧，老夫跟京城的官员有一些交往，把这封<color=yellow>荐书<color>带过去相信会有一些帮助。", 0);
	Msg2Player("你获得了第<color=yellow>"..(nCount + 1).."封<color>荐书，你总共要收集<color=yellow>"..GetTask(TASK_LP_COUNT).."封<color>荐书");
end;

tab_MapforAll = {586, 587, 688, 589, 590, 591, 592, 593, 594, 595, 596, 597};
--检测是否在公共帮会地图
function rwlp_mapcheck()
	local ww = GetWorldPos();
	if (ww <= 597) then
		return 0
	end;
	return 1;
end;

--看看是否为已经领过的帮会
function rwlp_tongcheck()
	if (0 == rwlp_mapcheck()) then
		return 0;
	end;
	ww = GetWorldPos()
	for i = 1, getn(TASK_LP_IDX) do
		if (ww == GetTask(TASK_LP_IDX[i]) ) then
			return 0
		end;
	end;
	return 1;
end;

--检查作坊的等级是否合格
function rwlp_workshopcheck()
	local ww = GetWorldPos();
	local tab_work = {};	--符合等级条件的作坊所在地图
	tab_work = get_tongmap_list(GetTask(TASK_LP_ZONGGUANIDX), GetTask(TASK_LP_ZONGGUANLEVEL));
	for i = 1, getn(tab_work) do
		if (ww == tab_work[i]) then
			return 1;
		end;
	end;
	return 0;
end;

function add_a_juanshu()
	local nCount = rwlp_getjuanshucount();
	if (nCount == 9) then
		Say("你已经找到9封荐书了。可以回去交任务了。", 0);
		return 0;
	end;
	ww = GetWorldPos();
	nt_SetTask(TASK_LP_IDX[nCount + 1], ww);
	return 1;
end;

function rwlp_getjuanshucount()
	for i = 1, getn(TASK_LP_IDX) do
		if (0 == GetTask(TASK_LP_IDX[i]) ) then
			return i - 1;
		end;
	end;
	return 9;
end;

function rwlp_cleartask()
	for i = 1, getn(TASK_LP_IDX) do
		nt_SetTask(TASK_LP_IDX[i], 0);
	end;
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, 0);
	nt_SetTask(TASK_LP_COUNT, 0);
	nt_SetTask(TASK_LP_ZONGGUANIDX, 0);
end;

function nt_SetTask(nTaskID, nTaskValue)
	if (nTaskID <= 0) then
		return
	end;
	SetTask(nTaskID, nTaskValue);
	SyncTaskValue(nTaskID);
end;

function OnCancel()
	
end;

end; --// end of __TONGRANDOMTASK_H__