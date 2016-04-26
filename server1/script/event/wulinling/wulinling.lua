--武林令活动
--By 小浪
--2007-03-29
Include( "\\script\\event\\wulinling\\head.lua" )

function wulinling_main()
	local aryTalk = {}
	tinsert(aryTalk,"<dec><npc>借此生日<color=yellow>武林传奇2周年之际<color> (11/06/2005 - 11/06/2007), 欢迎大家来参加武林令牌收集活动!");
	tinsert(aryTalk,"我想了解该活动/wulinling_about");
	
	if wulinling_date() == 1  then
		tinsert(aryTalk,"我来交令牌!/wulinling_give");
	end
	tinsert(aryTalk,"我想看各帮会已交的武林令牌/wulinling_query");
	tinsert(aryTalk,"我稍候回来!/OnCancel");
	
	CreateTaskSay(aryTalk);
end

function wulinling_query()
	local szary = "<dec><npc>00:00 将更新当日每个帮会已交的令牌数量以及统计排名. \n\n";
	local nDate = tonumber(WULINLING_DATE[2]..date("%M"))
	if tonumber(GetLocalDate("%Y%m%d%H%M")) > (nDate + 5) then --推迟10分钟.防止Relay延迟问题
		checkwulinlingPh();
		if WULINLING_PHTB[1][1] ~= nil then
			szary = format("活动%s 已结束，恭喜帮会<color=red>%s<color> 获得参加比赛的资格<color=yellow> 天下第一帮<color> 在5月. \n",szary,WULINLING_PHTB[1][1][1]);
		end
	end
	CreateTaskSay({ szary,
			 "我想看帮会收集的武林令牌数量/wulinling_queryMy",
			 "我想看10个帮会排名第一的武林令牌数量/wulinling_queryFirst",
			 "结束对话/OnCancel"
		 });
end

function wulinling_queryFirst()
	if tonumber(GetLocalDate("%Y%m%d%H")) < ( tonumber(WULINLING_DATE[1]) + 100 ) then
		CreateTaskSay({"<dec><npc>目前没有公布10个帮会排名第一的武林令牌数量","结束对话/OnCancel"});
		return 0;
	end
	checkwulinlingPh();
	local szary = "<dec><npc>帮会收集武林令排名\n";
	for szkey,szName in WULINLING_PHTB[1] do
		szary = format("%s 第 <color=yellow>%2s<color>: <color=red>%-25s<color> <color=yellow>%d<color><enter>",
							szary, tostring(szkey),szName[1],szName[2]);
	end
	CreateTaskSay({szary,"结束对话/OnCancel"});
end

function wulinling_queryMy()
	
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({" 对不起，大侠未加入任何帮会", "结束对话/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****判断是否创建了该社团
	checkCreatLG(szlgname);
	
	--**判断是否加入了该社团
	checkJoinLG(szlgname);
	
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	local nLgTaskPh = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH) --排名
	--local nLgMemberTaskSum = LG_GetMemberTask(WULINLING_LGTYPE, szlgname,GetName(), WULINLING_LGMEMTASK); --成员提交量
	local szPh = "";
	if nLgTaskPh == 0 or nLgTaskPh == nil then
		szPh = "<color=yellow>目前还未<color>";
	else
		szPh = format("<color=yellow>%d<color>", nLgTaskPh);
	end
	CreateTaskSay({format("<dec><npc> 参加收集结果<enter>该帮排名: %s<enter>获得总数: <color=yellow>%d<color><enter> ", szPh, nLgTaskSum),"结束对话/OnCancel"});
	
end


function wulinling_give()
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"对不起，大侠未加入任何帮会", "结束对话/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****判断是否创建了该社团
	checkCreatLG(szlgname);
	
	--**判断是否加入了该社团
	checkJoinLG(szlgname);
	
	--**提交武林令
	wulinling_process(szlgname);
	
end

function wulinling_process(szlgname)
	local nSumCount = CalcEquiproomItemCount(6,1,WULINLING_ITEM,-1);
	--print(nSumCount);
	if nSumCount == 0 then
		CreateTaskSay({"<dec><npc>大侠身上没有任何令牌!","结束对话/OnCancel"});
		return 0;
	end
	--删物品
	if ConsumeEquiproomItem(nSumCount,6,1,WULINLING_ITEM,-1) ~= 1 then
		WriteLog(format("[武林令]\t%s\tAccount:%s\tName:%s\删除物品失败：武林令",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName() ));
		CreateTaskSay({"<dec><npc>不能交武林令!","结束对话/OnCancel"});
		return 0;
	end
	--设置变量
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	if nLgTaskSum == nil then
		LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, 0 , "", "");
	end
	LG_ApplyAppendLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, nSumCount, "", "")
	LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKDATA, date("%m%d%H%M%S") , "", "");

	--LG_ApplyAppendMemberTask(WULINLING_LGTYPE, szlgname, GetName(), WULINLING_LGMEMTASK, nSumCount, "","");
	
	--LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH, 1 , "", "");
	WriteLog(format("[武林令牌]\t%s\tAccount:%s\tName:%s\t 交武林令成功。总数 %d",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(), nSumCount));
	CreateTaskSay({"<dec><npc>您已成功交" .. nSumCount .. " 武林令", "结束对话/OnCancel"});
end

function wulinling_about()
	CreateTaskSay({"<dec><npc>从<color=yellow>4月6日<color> 到<color=yellow>4月6日24时<color>, 在练功区域，从50级以上的怪物将突然掉落武林令。哪个帮会收集和交给武林传人的最多，将获得参加比赛的资格。  <color=yellow>天下第一帮<color> (看首页详细信息!","结束对话/OnCancel"});
end


function OnCancel()
	
end
