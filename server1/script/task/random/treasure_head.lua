
-- = ===================== 文件信息 ======================

-- 剑侠情缘online 随机任务藏宝图实体处理文件
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

-- 任务系统库支持
IncludeLib("TASKSYS");
IncludeLib("PARTNER");

-- 排名系统支持
IncludeLib("RELAYLADDER")


-- 扩展表格文件类的支持
Include("\\script\\class\\ktabex.lua");

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

-- 读入写入 RELAY 战队数据的头文件
Include("\\script\\lib\\gb_taskfuncs.lua");

-- 读入对话字符处理文件
Include("\\script\\task\\system\\task_string.lua");

tabTreaPos = new(KTabFileEx, "\\settings\\task\\random\\trea_pos.txt", "TreaPos");
tabTreaItem = new(KTabFileEx, "\\settings\\task\\random\\trea_item.txt", "TreaItem");
tabTreaBoss = new(KTabFileEx, "\\settings\\task\\random\\trea_boss.txt", "TreaBoss");
tabTreaOldBox = new(KTabFileEx, "\\settings\\task\\random\\trea_oldbox.txt", "OldBox");

MISS_DIS_X = 6;  -- 挖宝时允许偏移的 X 轴最大值
MISS_DIS_Y = 9;  -- 挖宝时允许偏移的 Y 轴最大值

ID_USETREAMAP_TIME = 1738;  -- 储存玩家挖宝的次数

--  CALL BOSS 矩阵

-- ____________________
--|                    |
--|         01         |
--|     16  03  10     |
--| 11   06   07   08  |
--| 09  04 玩家 05  12 |
--|     13  14  15     |
--|         02         |
--|____________________|

aryBossPos = {

	[1]  = {0, -3},

	[16]  = {-2, -2},
	[3]  = {0, -2},
	[10]  = {1, -2},

	[11]  = {-2, -1},
	[6]  = {-1, -1},
	[7]  = {1, -1},
	[8]  = {2, -1},
	
	[9]  = {-2, 0},
	[4] = {-1, 0},
	[5] = {1, 0},
	[12] = {2, 0},
	
	[13] = {-1, 1},
	[14] = {0, 1},
	[15] = {1, 1},

	[2] = {0, 3},

}


-- 产生一张藏宝图
function CreateTreasureMap()

local nRow = SelectTreasurePos();

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- 将取到的相应行数写入第一个魔法属性
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- 设置默认为未鉴定
	SetItemMagicLevel(nIndex, 2, 0);
	
	-- 同步物品魔法属性
	SyncItem(nIndex)
	
	CDebug:MessageOut("产生了一张藏宝图，取到的行数为："..nRow);
	
	-- 返回藏宝图索引
	return nRow;

end;


-- 由指定的行数产生藏宝图
function CreateTreasureMapByRow(nRow)

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- 将取到的相应行数写入第一个魔法属性
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- 设置默认为未鉴定
	SetItemMagicLevel(nIndex, 2, 1);
	
end;


-- 由指定的任务编号创建一个任务卷轴
function CreateBookByNum(nNum)

local nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);

	SetItemMagicLevel(nRandomItemIndex, 1, nNum);
	
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);

	Msg2Player("您得到了<color=green>任务卷轴一个！<color>");
	CDebug:MessageOut("任务给予奖励为一个任务卷轴，其索引为："..nRandomItemIndex);

end;


-- 选择一个藏宝图的位置
function SelectTreasurePos()

local nRow = random(2, tabTreaPos:getRow());
	CDebug:MessageOut("选取到了一个宝藏位置的行数："..nRow);
	return nRow;

end;


-- 检测藏宝图的位置是否正确
function MapCheckTreasurePos(nIndex)
	
local nRow = GetItemMagicLevel(nIndex, 1);
local nIsOpen = GetItemMagicLevel(nIndex, 2);

local nMapID = tonumber(tabTreaPos:getCell("MapID", nRow));
local nMx = tonumber(tabTreaPos:getCell("WorldX", nRow));
local nMy = tonumber(tabTreaPos:getCell("WorldY", nRow));

local pMap, pMx, pMy = GetWorldPos();	

	-- 如果地图都不对，则返回 0
	if pMap~=nMapID then return 0; end;
	
	-- 如果还未鉴定，则返回 2
	if nIsOpen==0 then return 2; end;

	-- 计算 X 轴误差
	if (nMx>pMx and nMx-pMx<=MISS_DIS_X) or (nMx<pMx and pMx-nMx<=MISS_DIS_X) or (nMx==pMx) then
		-- 计算 Y 轴误差
		if (nMy>pMy and nMy-pMy<=MISS_DIS_Y) or (nMy<pMy and pMy-nMy<=MISS_DIS_Y) or (nMy==pMy) then
			return 1;
		end;
	end;
	
	return 0;
		
end;



-- 使用一张藏宝图
-- 返回值：1为符合地点、0为不符合
function UseTreasurePos(nIndex)

	-- 符合地点后开始挖宝
	PayTreasure();
	
	-- 记录玩家挖宝的次数
	SetTask(ID_USETREAMAP_TIME, GetTask(ID_USETREAMAP_TIME) + 1);
	
	-- 写入排名
	Ladder_NewLadder(10237, GetName(), GetTask(ID_USETREAMAP_TIME), 1);

end;


-- 显示藏宝图的详细信息
function ShowTreasureMapInfo(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);
local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local picLink = "";

	if nIndex==0 or nIndex==nil or nRow<1 or nRow==nil then
		Say("傅雷书：唉，你这张藏宝图已经残破得不成样子了，要我这眼睛不好使的老头子怎么看啊？",0);
		return
	else
		picLink = "<link=image:"..picPath..">藏宝图的信息：<link>花了大把大把的银子打点后，你终于在傅雷书的指点下依稀在这张残缺不全的藏宝图中辨认出了宝藏的大致位置。凭着你以前丰富的阅历和敏锐的观察力，你发现这似乎是<color=yellow>"..strInfo.."<color>。";
	end;

	Describe(picLink, 1, "结束对话/OnExit");

end;


-- 检查放入的物品是否为真正的藏宝图
function CheckTreasureMap(nCount)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
local nIndex = 0;

	if nCount~=1 then
		Say("傅雷书：你都塞了些什么东西给我啊？我只要<color=yellow>一张藏宝图<color>就够了！", 0);
		return
	end;
	
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(GetGiveItemUnit(1));
	nIndex  = GetGiveItemUnit(1);
	
	if nGenre==6 and nDetail==2 and nParticular==3 then
		
		-- 如果没有鉴定的话则鉴定
		if GetItemMagicLevel(nIndex, 2)==0 then
			
			-- 扣除玩家的金钱
			if Pay(300000)==1 then
				SetItemMagicLevel(nIndex, 2, 1);
				SyncItem(nIndex);
				Msg2Player("<color=yellow>你支付给傅雷书十万两银子！<color>");
			else
				Say("傅雷书：哈哈……年轻人，钱没带够不要紧，可不能蒙我这老头子啊。这绝世珍宝可能就此与你无缘了哦！",0);
				return
			end;
			
		elseif GetItemMagicLevel(nIndex, 2)==1 then
			Say("傅雷书：这张藏宝图已经经过我的鉴定了，你应该能看得懂了吧？还不懂的话就再仔细琢磨琢磨吧！", 0);
			return
		end;
		
		ShowTreasureMapInfo(GetGiveItemUnit(1));
		return
	else
		Say("傅雷书：你都塞了些什么东西给我啊？我只要<color=yellow>一张藏宝图<color>就够了！", 0);
		return
	end;

end;


-- 产生宝藏
function PayTreasure()

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nType = SelectTreasureType();
	CDebug:MessageOut("开始挖宝，选取到的宝藏类型为："..nType);

	-- 先随机判断是否产生金钱，有 45% 的概率
	if random(1, 100)<=45 then
		SelectTreasureMoney();
	end;

	if nType==1 then   -- 道具
		
		SelectTreasureItem();
		return 1;
		
	elseif nType==2 then   -- BOSS
	
		-- 如果是非战斗状态那么只给道具
		if GetFightState()==0 then
			SelectTreasureItem();
		else
			SelectTreasureBoss();
		end;
		return 1;
	
	elseif nType==3 then   -- 神秘箱子	--by 子非鱼 2008/02/22 去除宝箱概率
		
		AddItem(6, 1, 902, 1, 0, 0, 0);
		Msg2SubWorld("玩家 <color=yellow>"..GetName().."<color> 利用藏宝图在<color=green>"..mapname.."<color>挖宝时挖到了一个<color=green>古旧的宝箱<color>！");
		return 1;
	
	end;

end;


-- 选择挖出来的宝藏类型
-- 返回值：1 道具、2 BOSS、3 神秘箱子
function SelectTreasureType()

-- 各种宝藏的概率：道具、BOSS、神秘箱子，必须保证相加为 100
local aryRate = {50,50,0}	--by 子非鱼 2008/02/22 去除宝箱概率
local i,j,k = 0,0,0;
local nType = 0;

	k = random(1,100);

	for i=1, getn(aryRate) do
		j = j + aryRate[i];
		if j>=k then
			nType = i;
			break;
		end;
	end;
	
	return nType;

end;


-- 在玩家的周围产生一堆的钱
function SelectTreasureMoney()

local i=0;

	for i=1, 25 do AddMoneyObj(random(5000, 12000)); end;
	
	Msg2Player("<color=yellow>你挖到了一大堆金钱！<color>");

end;


-- 选择挖出的宝藏物品
function SelectTreasureItem()

local nRow = tabTreaItem:countArrayRate("ItemRate");

local nGoods = {"",0,0,0,0,0,0,0};

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

	nGoods[1] = tabTreaItem:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaItem:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaItem:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaItem:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaItem:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaItem:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaItem:getCell("GoodsFive", nRow));
	nGoods[8] = tonumber(tabTreaItem:getCell("Magiclevel", nRow));

	if (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("你挖到了一个<color=yellow>"..nGoods[1].."<color>！");
		AddGlobalCountNews("公告：玩家 "..GetName().." 利用藏宝图在"..mapname.."处挖到了黄金装备 "..nGoods[1].." 一件！", 2);
	else
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("你挖到了一个<color=yellow>"..nGoods[1].."<color>！");
		-- Msg2SubWorld("玩家<color=yellow>"..GetName().."<color>利用藏宝图在<color=yellow>"..mapname.."<color>处挖到了<color=yellow>"..nGoods[1].."<color>！");
	end;

end;


-- 选择生成 BOSS 在宝藏地点
function SelectTreasureBoss()

local nRow = tabTreaBoss:countArrayRate("Rate");  -- 随机取得一个 BOSS 的行数

	-- 如果取不到正确的行数则返回
	if nRow<1 or nRow==nil then
		CDebug:MessageOut("藏宝图 CALL BOSS 取到了一个不存在的行数！");
		return
	end;

local nIndex   = tonumber(tabTreaBoss:getCell("NpcIndex", nRow));  -- BOSS INDEX
local nMin     = tonumber(tabTreaBoss:getCell("NumMin", nRow));    -- 数量最小值
local nMax     = tonumber(tabTreaBoss:getCell("NumMax", nRow));    -- 数量最大值
local nFive    = tabTreaBoss:getCell("Five", nRow)

local strName  = tabTreaBoss:getCell("Name", nRow);

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nBossNum = random(nMin, nMax);

local aryOrg, aryDec = {},{};

local i,j = 0,0;


	-- 对夺宝贼的特殊处理
	if strName=="夺宝贼" then
		for i,j in aryBossPos do
			tinsert(aryOrg, i);
		end;
		
		for i=1,nBossNum do
		
--			AddNpcEx(random(nIndex, nIndex + 8),  -- 从10个山贼的索引中选一个出来
--							95,
--							random(0,4),
--							mapindex,
--							(x+aryBossPos[i][1]) *32, -- 计算 X 偏移
--							(y+aryBossPos[i][2]) *32, -- 计算 Y 偏移
--							1,
--							strName,
--							1);
			
			-- 如果表格的五行填 n 或者不填，则为随机五行
			if nFive=="n" or "" then
				nFive = random(0,4);
			else
				nFive = tonumber(nFive);
			end;
			
			AddNpcEx(random(nIndex, nIndex + 8),  -- 从10个山贼的索引中选一个出来
							95,
							nFive,
							mapindex,
							x*32, -- 计算 X 偏移
							y*32, -- 计算 Y 偏移
							1,
							strName,
							1);
		end;
					
		Msg2SubWorld("公告：玩家 <color=yellow>"..GetName().."<color> 利用藏宝图在挖宝时遇到了一群<color=green>"..strName.."<color>的阻挠！");
		return 1;
	else

		-- 如果表格的五行填 n 或者不填，则为随机五行
		if nFive=="n" or "" then
			nFive = random(0,4);
		else
			nFive = tonumber(nFive);
		end;
				
		AddNpcEx(nIndex, 95, nFive, mapindex, x*32, y*32, 1, strName, 1);
		
		-- AddGlobalCountNews("公告：玩家 "..GetName().." 利用藏宝图在"..mapname.."挖宝时遇到了"..strName.."的阻挠！", 2);
		return 1;
	end;

end;


-- 开启一个古旧的宝箱
function OpenOldBox()

local nRow = tabTreaOldBox:countArrayRate("ItemRate");
local nGoods = {"",0,0,0,0,0,0,0};
local nIsPublic = 0;

	nGoods[1] = tabTreaOldBox:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaOldBox:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaOldBox:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaOldBox:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaOldBox:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaOldBox:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaOldBox:getCell("GoodsFive", nRow));
	
	-- 是否公告
	nIsPublic = tonumber(tabTreaOldBox:getCell("IsPublic", nRow));
	
	-- 对于奥运戒子的检查
	if nGoods[1]=="雅典之魂" or nGoods[1]=="北京之梦" then
		
		-- 检查在 180 天里是否产生过奥运戒子中的任何一个
		if CheckItemEnableData(nGoods[1], 180)==1 then
			
			AddGoldItem(0, nGoods[3]);
			
			-- 写入 RELAY 当前的系统秒数
			WriteItemEnableData(nGoods[1]);
			
			WriteTaskLog("在开启宝箱时得到了一个："..nGoods[1]);
			
			Msg2SubWorld("玩家 <color=yellow>"..GetName().."<color> 打开一个古旧箱子时惊喜的发现了 <color=green>"..nGoods[1].."<color>！！！");
			
			AddGlobalCountNews("公告：玩家 "..GetName().." 打开一个古旧箱子时惊喜的发现了 "..nGoods[1].." ！！！！！", 5);
			
			return
		else
			-- 如果已经产生过的话则补偿一个屈原粽子
			AddItem(6, 1, 68, 1, 1, 0, 0);
			
			Msg2SubWorld("玩家 <color=yellow>"..GetName().."<color> 打开一个古旧箱子时惊喜的发现了<color=green>屈原粽子<color>！");
			
			WriteTaskLog("在开启宝箱时随机到了一个："..nGoods[1].."，但是因为日期限制所以补偿为屈原粽子！");
			return
		end;
		
	end;
	
	if nGoods[1]=="藏宝图" then
		CreateTreasureMap();
		Msg2Player("你得到了一个<color=yellow>藏宝图<color>！");
	elseif (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("你得到了一个<color=yellow>"..nGoods[1].."<color>！");
	elseif (nGoods[2]==0) then
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("你得到了一个<color=yellow>"..nGoods[1].."<color>！");
	end;
	
	-- 写入 LOG
	WriteTaskLog("在开启宝箱时得到了一个："..nGoods[1]);
	
	if nIsPublic==1 then
		AddGlobalCountNews("玩家 "..GetName().." 打开古旧的宝箱后惊喜地发现了 "..nGoods[1], 1);
	end;
	
end;


-- 检查一个物品是否已经达到了产出的日期界限
-- 传入参数 strItemName：物品名称
-- 传入参数 nDay：想要检查的天数
-- 返回参数 nEnable：1为可以再CALL出 0为不能CALL出了
function CheckItemEnableData(strItemName, nDay)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- 获取系统运行秒数
local nOldTime = gb_GetTask(strItemName, 1);  -- 获取之前记录的该物品产生秒数

	-- 如果两个日期相减大于所要限制的日期，则可以通过
	-- 每天有 86400 秒
	if nNowTime - nOldTime >= nDay*86400 then
		return 1;
	else
		return 0;
	end;
	
end;


-- 写入 RELAY 物品产生的日期
-- 传入参数 strItemName：物品名称
function WriteItemEnableData(strItemName)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- 获取系统运行秒数

	gb_SetTask(strItemName, 1, nNowTime);
	
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog("[任务系统记录]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;


function OnExit()

end;
