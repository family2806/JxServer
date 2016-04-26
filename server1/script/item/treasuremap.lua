
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务藏宝图物品使用处理文件
-- Edited by peres
-- 2005/10/19 PM 14:22

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

Include("\\script\\task\\random\\treasure_head.lua");  -- 藏宝图鉴赏功能
Include("\\script\\activitysys\\g_activity.lua")			--活动编辑器
Include("\\script\\activitysys\\playerfunlib.lua")		--活动编辑器

function main(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);

	if nRow==0 or nRow==nil then
		Msg2Player("<color=Orange>这张藏宝图已经破旧不堪了，没任何用途了。<color>");
		return 1;
	end;

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local nMapState = GetItemMagicLevel(nIndex, 2);

local nResult = 0;
local picLink = "";

	if nMapState==0 then
		Msg2Player("<color=Orange>你对着藏宝图在这里东挖西凿，一无所获……还是去龙泉村找傅雷书指教指教吧！<color>");
		return 1;
	else
		picLink = "<link=image:"..picPath..">藏宝图的信息：<link>花了大把大把的银子打点后，你终于在傅雷书的指点下依稀在这张残缺不全的藏宝图中辨认出了宝藏的大致位置。凭着你以前丰富的阅历和敏锐的观察力，你发现这似乎是<color=yellow>"..strInfo.."<color>。";
		Describe(picLink, 2,
				 "开始挖掘/#useTreasureMap("..nIndex..")",
				 "关闭/OnExit");
		return 1;
	end;

end;

function useTreasureMap(nIndex)

local nResult = MapCheckTreasurePos(nIndex);
local nDelResult = 0;

	if nResult==1 then
		
		-- 如果成功挖出东西了，则将该物品删除
		nDelResult = RemoveItemByIndex(nIndex);
		
		if nDelResult==1 then
			UseTreasurePos();
			
			G_ACTIVITY:OnMessage("FinishCangBaoTu");
			
			return 1;
		else
			Msg2Player("<color=Orange>你对着藏宝图在这里东挖西凿，一无所获……<color>");
			return 1;	
		end;
		
	elseif nResult==0 then
		Msg2Player("<color=Orange>你对着藏宝图在这里东挖西凿，一无所获……<color>");
		return 1;
	elseif nResult==2 then
		Msg2Player("<color=yellow>你对藏宝图所描绘的东西一头雾水，这图是真是假还是去<color><color=green>龙泉村<color><color=yellow>找<color><color=green>傅雷书<color><color=yellow>鉴定一下吧！<color>");
		return 1;
	end;
		
end;


function OnExit()

end;