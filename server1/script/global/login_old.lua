-- 登录脚本
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) 添加自动更新技能功能
Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\systemconfig.lua") -- 系统配置

Include("\\script\\missions\\autohang\\function.lua")		-- for 挂机功能
Include("\\script\\global\\skills_table.lua")				-- 自动更新技能
Include("\\script\\task\\newtask\\newtask_head.lua")	

-- LLG_ALLINONE_TODO_20070802 待确认
Include ("\\script\\event\\newbielvlup\\event.lua")
Include("\\script\\event\\qingming\\event.lua")
Include("\\script\\event\\playerlvlup\\event_temp.lua")

Include("\\script\\shitu\\shitu.lua")
Include("\\script\\global\\titlefuncs.lua")
IL("TITLE");

function main_old()
	check_update()					-- 技能更新、门派加标识（2004-05-31）
	patchShituProcess(PlayerIndex)
-- login_enterthd()				-- 自动进入挂机地图	
	login_check_dupe()
	--GetNewBulletin()
	check_townpotol()
	title_loginactive()
	if (SYSCFG_PARTNER_OPEN) then
		SyncPartnerMasterTask();  -- 同步同伴剧情任务变量
	end
end

------------------
-- 第一次延时同步的数据，在此添加
function delaysync_1()
	GetNewBulletin();
	return 0;
end

-- 第二次延时同步的数据，在此添加
function delaysync_2()
	SyncTaskValue(1082)		--同步Boss杀手任务变量到客户端
	messenger_copytaskvalue()  --同步信使任务的任务变量
	SyncPartnerMasterTask()    -- 同步同伴剧情任务
	return 0;
end

-- 第三次延时同步的数据，在此添加
function delaysync_3()
	GetAllCitySummary();
	SyncTaskValue(1569)	--中秋月饼
	return 1;
end


-------------------------------------------
function check_townpotol()
	if (GetTask(1505) == 1) then
		DisabledUseTownP(0)
		SetTask(1505,0)
	end
end

function login_enterthd()
	mapList = {235, 236, 237, 238, 239, 240, 241};
	MapCount = getn(mapList);

	-- 若已在挂机地图，则不用再进了
	nCurSWID = SubWorldIdx2ID();
	for i = 1, MapCount do
		if (nCurSWID == mapList[i]) then
			return 0;
		end
	end
	
	nMapID = random(1, MapCount);
	aexp_gotothd(mapList[nMapID]);
end;

-- 检测是否有复制装备标记，并发擎告
function login_check_dupe()
	local nValue = GetTask(156);
	if (nValue > 0) then
		Say("<color=red>在您身上发现复制出来的物品，已被系统清除。我们有详细的跟踪记录。若您对此有异议，请与客服联系。多谢支持！<color>", 1, "关闭此警告/dupe_warning");

		SetTask(156, nValue - 1);
	end
end

function dupe_warning()
	Msg2Player("在您身上发现复制出来的物品，已被系统清除。我们有详细的跟踪记录。若您对此有异议，请与客服联系。多谢支持！");
end

function messenger_copytaskvalue()
	
	SyncTaskValueMore(1201, 1247, 1)
	--for i = 1201, 1247 do 
	--	SyncTaskValue(i)
	--end
end

function no()
end;

-- 同步同伴剧情任务变量
function SyncPartnerMasterTask()

local i=0;

	SyncTaskValue(1262);
	SyncTaskValue(1256);
	
	-- 同步同伴随机任务
	SyncTaskValue(1301);
	SyncTaskValue(1302);
	SyncTaskValue(1303);
	SyncTaskValue(1304);
	SyncTaskValue(1305);
	SyncTaskValue(1306);
	
	-- 同步任务引擎所用的变量
	for i=2000, 2300 do
		SyncTaskValue(i);
	end;

end;

--加入旧的Login main函数
if login_add then login_add(main_old, 0) end
--加入旧的分步同步函数
if login_add then login_add(delaysync_1, 1) end
if login_add then login_add(delaysync_2, 2) end
if login_add then login_add(delaysync_3, 3) end
