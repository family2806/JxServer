--特殊任务令牌文件
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main(nItem)
	_, nTongID = GetTongName();
	if (nTongID <= 0) then
		Say("你目前不在<color=yellow>帮会<color>中，无法使用帮会特殊任务令牌。", 0);
		Msg2Player("你目前不在<color=yellow>帮会<color>中，无法使用帮会特殊任务令牌。");
		return 1;
	end;
	local nCount = GetTask(TASK_LP_COUNT);
	SetTask(TASK_LP_ITEMID, nItem); --获取令牌等级
	
	if (nCount > 0) then
		Say("<color=green>任务令牌<color>：您当前有还未完成的随机任务，你确定要接受新的任务吗？", 2,
			"是的，我要放弃之前的随机任务/cancelformertask",
			"不了，还是等等吧/OnCancel");
		return 1;
	else
		wanttask()
		return 1;
	end;
end;

--取消一个任务令牌任务。
function cancelformertask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		rwlp_cleartask();
		Say("你已经取消了<color=yellow>特殊任务令牌<color>任务。", 0);
		Msg2Player("你已经取消了<color=yellow>特殊任务令牌<color>任务。");
	end;
end;

-- 接受令牌任务
function wanttask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		Say("你已经有一个特殊任务令牌任务了，不能接新任务了。", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nItem, nResult;
	
	nItem = GetTask(TASK_LP_ITEMID);
	nLevel = GetItemParam(nItem, 3);
	nWorkshopIdx = GetItemParam(nItem, 4);
	nCount = GetItemParam(nItem, 5);
	if (not nCount or nCount == 0) then
		nResult = init_task()
		nLevel = GetItemParam(nItem, 3);
		nWorkshopIdx = GetItemParam(nItem, 4);
		nCount = GetItemParam(nItem, 5);
	end;
	
	local szContent = "<color=yellow>"..nLevel.."<color>级以上不同帮会的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>，";
	if (nResult == 0) then
		Say("本来需要你去造访几位"..szContent.."但是很可惜目前所有帮会的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊<color>等级都不足，所以还是请你下次再试试吧。", 0);
		Msg2Player("暂时没有足够多的"..szContent.."请下次再尝试。");
		return
	end;
	
	szContent = "<color=yellow>"..nCount.."<color>位"..szContent;
	Say("本帮的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>最近心绪不佳，原本打算上京赶考，求取一个功名。没成想京官要求，出仕举子需要有当地名士的荐书。越是名望满京师之人，考取功名的机会就越大。麻烦你为他去找"..szContent.."获得他们的荐书。", 2,
	"好，我一定尽力而为/#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 1)",
	"这个任务太难了，我不做了/#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 0)");
end;

--初始化一个任务
function init_task()
	local nLPLvl = GetItemParam(GetTask(TASK_LP_ITEMID), 1); -- 令牌的等级
	
	local nLevel, nWorkshopIdx, nCount;
	nLevel = 1;
	nWorkshopIdx = random(1, 7); -- 随机一个作坊
	
	if (nLPLvl == 1) then
		nLevel = random(1, 3);
	elseif (nLPLvl == 2) then
		nLevel = random(4, 6);
	elseif (nLPLvl == 3) then
		nLevel = random(7, 8);
	end;
	
	nCount = random(1, 9);
	local nMax = get_workshop_count(nWorkshopIdx, nLevel);
	if (not nMax) then
		nMax = 0;
	end;
	if (nCount > nMax) then
		nCount = nMax;
	end;
	
	local nItem = GetTask(TASK_LP_ITEMID);
	SetSpecItemParam(nItem, 3, nLevel);
	SetSpecItemParam(nItem, 4, nWorkshopIdx);
	SetSpecItemParam(nItem, 5, nCount);
	SyncItem(nItem);
	if (nCount > 0) then
		return 1;
	end;
	return 0;
end;

function lp_confirm(nLevel, nWorkshopIdx, nCount, bOK)
	local szContent = "<color=yellow>"..nCount.."<color>位<color=yellow>"..nLevel.."<color>级以上不同帮会的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>";
	
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	
	if (bOK == 1) then
		Say("本帮的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>最近心绪不佳，原本打算上京赶考，求取一个功名。没成想京官要求，出仕举子需要有当地名士的荐书。越是名望满京师之人，考取功名的机会就越大。麻烦你为他去找"..szContent.."获得他们的荐书。", 1, "我知道了/lp_confirmtwo");
	else
		Say("本帮的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>希望你为他去找"..szContent.."获得他们的荐书。你真的没有时间吗？",2 ,"我还是接收这个任务吧/lp_confirmtwo", "我确实不要接收这个任务/OnCancel");
	end;
end;

function lp_confirmtwo()
	local nItem = GetTask(TASK_LP_ITEMID);

	local nCount = GetItemParam(nItem, 5);
	local nWorkshopIdx = GetTask(TASK_LP_ZONGGUANIDX);
	local nLevel = GetTask(TASK_LP_ZONGGUANLEVEL);
	
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) ~= 1) then
			return
		end;
	end;

	nt_SetTask(TASK_LP_COUNT, nCount);
	Msg2Player("你接收了去与<color=yellow>"..nCount.."<color>个<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>对话，获得荐书的任务，<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊<color>的等级必须为<color=yellow>"..nLevel.."<color>级。");
end;
