-- 西山村 西山小二 对话脚本
-- 李欣 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")
Include("\\script\\task\\system\\task_string.lua"); 
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
--	Uworld1064 = nt_getTask(1064)
--	local name = GetName()
--	if	( Uworld1064 < 2) then  -- 判断没有完成西山屿任务
--		Talk(1,"","西山小二：这几日天气反复无常，我都没心思出海打鱼了。")
--	elseif ( Uworld1064 == 2 ) then   -- 判断已经完成了西山屿任务，但尚未去西山屿，并且未和西山小二对话过
--		-- Say("西山小二：你要去西山屿？可惜西山屿还没开放，暂时不能过去。不过你放心，我已经记住你了，过些日子你直接来找我好了，我带你上西山屿。",0)
--		Describe(DescLink_XiShanXiaoEr.."<#>：这位客官，找我有何贵干？是不是要买鱼呢？<enter>"
--		..name.."<#>：不是的，是不醒人士让我来找你的。<enter>西山小二：是他，我知道了。你也是去西山屿吧，走吧，我这就带你去。不过西山屿这个地方来去可不是那么方便，而且凶险异常，你要多加小心哟。<enter>",
--		2,"我们启程吧/task007","我还是过会再去吧/task006")
--	elseif ( Uworld1064 == 3) then   -- 判断已经完成了西山屿任务，且和西山小二对话过一次，但尚未去西山屿
--		Say("西山小二：你现在已经准备好去西山屿了吗？",2,"我们启程吧/task007","我还是过会再去吧/task006");
--	 end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "西山小二：大侠想去西山屿？要交100张神秘密图碎片才可以去."
	

--	tbDailog:AddOptEntry("同意！我立刻去找.", task007, {}); 
	tbDailog:AddOptEntry("暂未开放.", no, {}); 
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	tbDailog:Show();
	
end;
function task006()	
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,3)
end;
	
function task007()
	if (GetLevel() < 100) then
		Say("西山小二：100级以下不能去!",0);
		return
	end
	
	GiveItemUI("交面查费.","把密图放在下面", "task008", "no")
--	Uworld1064 = nt_getTask(1064)
--	nt_setTask(1064,0)
--	SetFightState(1);
--	NewWorld(342,1177,2410);
--	DisabledUseTownP(1)	--限制其在西山屿内使用回城符
--	SetRevPos(175,1);		--设置重生点
end;

function task008(ncount)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Talk(1,"","神秘密图不够，在检查看看!")
		return
	end
	if (scrollcount > 100) then
		Talk(1,"","我只要100张神秘密图，不用给我带来这么多")
		return
	end
	if (scrollcount < 100) then
		Talk(1,"","你交给我的神秘密图不够，再检查看看!")
		return
	end
	if (scrollcount == 100) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;
	--SetFightState(0);
	NewWorld(342,1178,2412)
	SetFightState(1);
end

function no()
end
