
-- ====================== 文件信息 ======================

-- 剑侠情缘online 越南版完美安邦脚本头文件
-- Edited by bel
-- 2008/05/07 AM 11:02

-- ======================================================

IncludeLib("ITEM");						-- 物品库支持
IncludeLib("TASKSYS");					-- 任务系统库支持
Include("\\script\\lib\\equipex.lua");	-- 读入生成相似装备支持的头文件
Include("\\script\\task\\system\\task_debug.lua");		-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_head.lua");		-- 读入WriteTaskLog信息

ID_EQUIPEX_TASK		= 2536;             -- 记录安邦任务的流程
ID_EQUIPEX_FINISH	= 2540;             -- 记录安邦任务的完成状态
ID_EQUIPEX_TOTAL  	= 2541;             -- 记录安邦任务是否全部完成
ID_EQUIPEX_TASK_RANDOMSEED	= 2539;  	-- 记录黄金的随机种子

GLB_EQUIPEX_CLOSE 	= 1244  			-- 紧急关闭用的临时变量
TASK_CHECKITEM_NUM 	= 202;				-- 用于临时记录的物品 ID 总数
TAKS_CHECKITEM_MAX 	= 20;				-- 用于临时记录的物品 ID 最大数
TASK_CHECKITEM_START 		= 203;		-- 用于临时记录的物品 ID 起始变量号
NUM_PAY_TOPITEMTOPERFECT	= 1000;		-- 极品的安邦打造成完美的收费，单位（万）
NUM_PAY_PERFECTITEM_REVERT 	= 500;


-- 普通的安邦索引
aryItem = {
	--   完美的序号  普通的序号  完美的文字描述   普通的文字描述   需要固定的属性
	[1]	= {211, 165, "完美的安邦之菊花石指环", "安邦之菊花石指环", 105},
	[2] = {213, 167, "完美的安邦之鸡血石戒指", "安邦之鸡血石戒指", 102},
	[3] = {210, 164, "完美的安邦之冰晶石项链", "安邦之冰晶石项链", 114},
	[4] = {212, 166, "完美的安邦之田黄石玉佩", "安邦之田黄石玉佩", 101},
}

-- 极品的安邦索引
aryTopItem = {
	--   完美的序号  普通的序号  完美的文字描述   普通的文字描述
	[1]	= {425, 409, "[完美] 极品 安邦之菊花石指环", "[极品] 安邦之菊花石指环"},
	[2] = {427, 411, "[完美] 极品 安邦之鸡血石戒指", "[极品] 安邦之鸡血石戒指"},
	[3] = {424, 408, "[完美] 极品 安邦之冰晶石项链", "[极品] 安邦之冰晶石项链"},
	[4] = {426, 410, "[完美] 极品 安邦之田黄石玉佩", "[极品] 安邦之田黄石玉佩"},	
}

aryNeedItem = {
	--      物品名称          总类  分类  细类  等级  五行  黄金  数量  随机种子记录
	[1] = {{"2 菊花石",        4,   963,    1,   -1,   -1,    0,   2,    0},
		   {"1 冰石结晶",      4,   967,    1,   -1,   -1,    0,   1,    0},
		   {"10 蓝水晶",       4,   238,    1,   -1,   -1,    0,   10,   0},
		   {"安邦之菊花石指环", 0,   0,      0,   -1,   -1,  165,   1,    1}},
		   	
	[2] = {{"2 冰禅子 ",        4,   965,    1,   -1,   -1,    0,   2,    0},
		   {"3 鸡血石",        4,   966,    1,   -1,   -1,    0,   3,    0},
		   {"10 绿水晶",       4,   240,    1,   -1,   -1,    0,   10,   0},
		   {"安邦之鸡血石戒指 ", 0,   0,      0,   -1,   -1,  167,   1,    1}},
		   	
	[3] = {{"2 玛瑙",          4,   964,    1,   -1,   -1,    0,   2,    0},
		   {"1 天石碎片",      4,   968,    1,   -1,   -1,    0,   1,    0},
		   {"5 紫水晶",        4,   239,    1,   -1,   -1,    0,   5,    0},
		   {"1 神秘矿石",      6,   1,    398,   -1,   -1,    0,   1,    0},
		   {"安邦之冰晶石项链", 0,   0,      0,   -1,   -1,  164,   1,    1}},
		   	
	[4] = {{"10 田黄石",       4,   969,    1,   -1,   -1,    0,   10,   0},
		   {"1 信使金牌",     6,   1,    888,   -1,   -1,    0,   1,    0},
		   {"1 8级玄晶",       6,   1,    147,    8,   -1,    0,   1,    0},
		   {"安邦之田黄石玉佩", 0,   0,      0,   -1,   -1,  166,   1,    1}},
}


function main_talk()
	
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	
	local aryTalk = {};
	
	if GetGlbValue(GLB_EQUIPEX_CLOSE)==1 then
		Say("神秘工匠 : 今天累了，明天再帮你了!", 0);
		return
	end;
	
	tinsert(aryTalk, "<dec><npc>我能帮你什么？关于完美安邦装备？ ");
	
	if nTask>=4 and nFinish==1 then
		tinsert(aryTalk, "我想你帮我制造安邦装备./ib_nexttask_talk");
	else
		tinsert(aryTalk, "我想进行完美安邦装备制造/main_task_talk");
	end;
	
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(aryTalk, "我想恢复完美安邦装备/ib_nexttask_revert");
	end;
	
--	tinsert(aryTalk, "我拥有[极品的]安邦首饰，你帮我强化吧/top_equipex_dialog");
--	tinsert(aryTalk, "我拥有[极品的]完美安邦首饰，你帮我还原吧/top_revert_dialog");
	tinsert(aryTalk, "离开/OnExit");
	
	CreateTaskSay(aryTalk);
end;


function main_task_talk()
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	if nTask==0 then
		CreateTaskSay({"<dec><npc>看你和我有缘，我帮你完成.",
					   "开始完美安邦任务/main_task_001",
					   "离开/OnExit"});
	end;
	
	if nTask>0 and nTask<=4 and nFinish==0 then
		main_task_give();
	end;
	
	if nTask>0 and nTask<4 and nFinish==1 then
		if nTask==1 then main_task_002(); end;
		if nTask==2 then main_task_003(); end;
		if nTask==3 then main_task_004(); end;
	end;
	
end;



function main_task_001()
	SetTask(ID_EQUIPEX_TASK, 1);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>首先制造{{安邦之菊花石指环}}. 快帮我去找{{2 菊花石}} 和{{1 冰石结晶}}, 和{{10 蓝水晶}}, 听说奇珍阁有卖, 你去看看，不然就少了你的 {{安邦之菊花石指环}} .",
				   "明白了/OnExit"});	
end;

function main_task_002()
	SetTask(ID_EQUIPEX_TASK, 2);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>其次制造{{安邦之鸡血石戒指 }}, 快帮我去找{{2 冰蝉子}, {{3 鸡血石}}, 和{{10 绿水晶}}. 听说奇珍阁有卖, 你去看看，不然就少了你的 {{安邦之鸡血石戒指 }}.",
				   "明白了/OnExit"});	
end;

function main_task_003()
	SetTask(ID_EQUIPEX_TASK, 3);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>其次制造{{安邦之冰晶石项链}}, 快帮我去找{{2 玛瑙}} 和{{1 天石碎片}}, 和{{5 紫水晶}} 和{{1 神秘矿石}}, 听说奇珍阁有卖, 你去看看，不然就少了你的 {{安邦之冰晶石项链}}.",
				   "明白了/OnExit"});	
end;

function main_task_004()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>最后制造{{安邦田黄石玉佩}}. 快帮我去找{{10 田黄石}}, {{1 信使金牌}} 和{{1 8级玄晶}}, 和不然就少了你的{{安邦田黄石玉佩}}.",
				   "明白了/OnExit"});	
end;

function main_task_give()
	local nTask = equipexTaskState();
	
	local aryTaskNeed = {}; 
	
	if nTask>0 and nTask<=4 then
		aryTaskNeed = aryNeedItem[nTask];
	end;
	
	local szTask = "";
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		szTask = szTask.."<color=yellow>"..aryTaskNeed[i][1].."<color><enter>";
	end;
	
	local szTalk = {};
	tinsert(szTalk, "<dec><npc>你收集够了吗 <enter><enter>"..szTask);
	tinsert(szTalk, "交制造完美安邦原料/giveTaskNeedDialog");
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(szTalk, "我不想继续制造了./ib_nexttask_cancel");
	end;
	tinsert(szTalk, "离开/OnExit");
	
	CreateTaskSay(szTalk);
end;


-- 每一步任务完成时的处理
function main_task_finish()
	
	local nTask = equipexTaskState();
	local nRandomSeed = 0;
	local nGold = 0;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- 是否删除物品正确
	local i=0;

	-- 删除任务所需要的物品
	for i=1, nItem do
		nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
		
		-- 异常处理，如果有删除不成功，则直接将任务变成还没完成
		if nResult~=1 then
			Say("任务发生错误，不能完成!", 0);
			return
		end;
		
	end;
			
	if nTask>0 and nTask<=4 then
		
		nGold = aryItem[nTask][1];
		
		nRandomSeed = GetTask(ID_EQUIPEX_TASK_RANDOMSEED);
		
		-- AddItemEx 指令需要将黄金序号 -1
		AddItemEx(4, nRandomSeed, 1, 0, nGold - 1, 0, 0, 0, 0, 0);
		
		CDebug:MessageOut("制造成功1个完美安邦，号码 :"..nGold.." 随机任务:"..nRandomSeed);
		WriteTaskLog("制造成功1个完美安邦，号码:"..nGold.." 随机任务:"..nRandomSeed);
		
	end;
	
	SetTask(ID_EQUIPEX_FINISH, 1);
	
	Msg2Player("恭喜你获得: <color=yellow>"..aryItem[nTask][3].."<color>!");
	
	-- 如果所有任务均完成，则无论如何都将任务置为最后一步已经完成状态
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		SetTask(ID_EQUIPEX_TASK, 4);
	end;
	
	if nTask==4 then
		SetTask(ID_EQUIPEX_TOTAL, 1);
	end;
	
end;


function equipexTaskState()
	return GetTask(ID_EQUIPEX_TASK);
end;


function giveTaskNeedDialog()
	GiveItemUI("交给工匠", "放入需要的原料!", "checkTaskNeed", "OnExit");
end;


function checkTaskNeed(nCount)
	local aryTaskNeed = aryNeedItem[equipexTaskState()];

	-- 任务所需要物品的 MAP
	local aryNeed = {};
	
	-- 所需要删除物品的数组
	local aryDelItem = {};		
	
	-- 任务所需要的物品总数
	local nNeed = getTaskCollectNum();

	-- 任务所要的物品编号
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	print(-100, w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality);
	-- 玩家传进来的物品编号
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	print(1000, nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex);
	-- 如果物品需要记录随机种子，则记录序号
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- 真实的物品数量
	local nRealCount, nCheckCount = 0, 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- 如果物品数量与要找的数量不符，直接返回
	if nRealCount ~= nNeed then
		Say("放入的物品数量不正确!", 0);
		return 0;
	end;
	
	-- 构造任务所需要物品的 MAP
	for i=1, getn(aryTaskNeed) do
		
		w_Genre      = aryTaskNeed[i][2];
		w_Detail     = aryTaskNeed[i][3];
		w_Particular = aryTaskNeed[i][4];
		w_Level      = aryTaskNeed[i][5];
		w_GoodsFive  = aryTaskNeed[i][6];
		w_GoodsNum   = aryTaskNeed[i][8];
		
		w_Quality    = aryTaskNeed[i][7];
		
		nRandomSeedRecord = aryTaskNeed[i][9];
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;

		tmpNeedKey = tostring(w_Quality)..","..
					 tostring(w_Genre)..","..
					 tostring(w_Detail)..","..
					 tostring(w_Particular);
		
		-- 如果没有这个 MAP KEY 则初始化
		if aryNeed[tmpNeedKey] then
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		else
			aryNeed[tmpNeedKey]={};
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		end;
		CDebug:MessageOut("制造成的物品数量: ["..tmpNeedKey.."]:"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		CDebug:MessageOut("检查物品:"..tmpGetKey);
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
				
				CDebug:MessageOut("检查物品:"..tmpGetKey);
			
				-- 如果任务物品不需要判断五行或者等级的
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				CDebug:MessageOut("物品参数:"..tmpGetKey.."level:"..tmpLevel.."  five:"..tmpFive);
				CDebug:MessageOut("任务参数 :"..tmpGetKey.."level:"..aryNeed[tmpGetKey][j][1].."  five:"..aryNeed[tmpGetKey][j][2]);
				
				-- 如果相对应的 KEY 的五行和等级都符合的话
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- 如果符合条件的物品需要记录随机种子，则记录
					-- 记录的格式为：[任务名][随机种子序号][随子种子数]
					if aryNeed[tmpGetKey][j][5]==1 then
						
						-- 检查这件黄金是否有保质期
						local nExpiredTime = ITEM_GetExpiredTime(nIndex);
						if nExpiredTime > 0 then
							CreateTaskSay({"<dec><npc>客官放入的装备不对!",
										   "我给错了!/OnExit"});
							return
						end;
						
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTask(ID_EQUIPEX_TASK_RANDOMSEED, nRandomSeed);
					end;
										
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					CDebug:MessageOut("检查物品:"..tmpGetKey.." 通过!");
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- 清空符合条件的数组
			aryDelItem = {};
			
			Say("放入的物品不正确!", 0);
			return 0;
		end;
		
	end;
	
	-- 检查是不是所有的物品都正确
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("放入的物品不正确!", 0);
				return 0;
			end;
		end;
	end;
	
	-- 记录一共有多少个物品需要删除
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("列举需要删除的物品:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("需要删除:"..aryDelItem[i]);
	end;
	
	-- 任务完成时的处理
	main_task_finish();
	
	return 1;

end;

-- 计算一个任务所需要的物品数量
function getTaskCollectNum()
	local aryTaskNeed = aryNeedItem[equipexTaskState()];
	local nNum = 0;
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		nNum = nNum + aryTaskNeed[i][8];
	end;
	
	return nNum;
end;


-- 将一个传进来的物品索引转换成一个 STRING 的 KEY，以及返回等级和五行
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
CDebug:MessageOut("检查物品 aaa:"..nGenre..","..nDetail..","..nParticular);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- 玩家完成一套任务后可随意进行安邦的完美
function ib_nexttask_talk()
	CreateTaskSay({"<dec><npc>你获得一部完美安邦，如果你想继续制造，可以.",
				   "我想继续制造完美安邦 - 菊花石指环/#ib_nexttask_main(1)",
				   "我想继续制造完美安邦 - 鸡血石戒指/#ib_nexttask_main(2)",
				   "我想继续制造完美安邦 - 冰晶石项链/#ib_nexttask_main(3)",
				   "我想继续制造完美安邦 - 田黄石玉佩/#ib_nexttask_main(4)",
				   "让我想想./OnExit"});	
end;


-- 重新给玩家开始一个任务
function ib_nexttask_main(nSelect)
	if nSelect==1 then main_task_001(); end;
	if nSelect==2 then main_task_002(); end;
	if nSelect==3 then main_task_003(); end;
	if nSelect==4 then main_task_004(); end;
end;


-- 取消任务
function ib_nexttask_cancel()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 1);
	Msg2Player("<color=yellow>你已取消此次制造<color>!");
end;


-- 玩家要还原装备的对话
function ib_nexttask_revert()
	CreateTaskSay({"<dec><npc>什么？你觉得经过打造过后的完美的安邦首饰并不适合你？……那好吧，我可以帮你{{还原}}成{{普通的安邦首饰}}，{{属性也许会和原来的有点不一样}}，谁会知道呢！？但是你可要想清楚了，当你再想打造一件完美的安邦首饰时，可是需要花费很多的精力的！",
				   "我想还原安邦之菊花石指环/#ib_nexttask_revert_talk(1)",
				   "我想还原安邦之鸡血石戒指/#ib_nexttask_revert_talk(2)",
				   "我想还原安邦之冰晶石项链/#ib_nexttask_revert_talk(3)",
				   "我想还原安邦之田黄石玉佩/#ib_nexttask_revert_talk(4)",
				   "让我再想想/OnExit"});
end;

-- 还原的确认过程
function ib_nexttask_revert_talk(nId)
	CreateTaskSay({"<dec><npc>你真的要将这件完美的安邦首饰还原成原来的样子吗？这种活儿很累人，要不你看着办给点手工费吧，我的要求不多，{300 万两银子}就行！唉，这年头养家糊口可真不容易啊！",
				   "是的，我意已决/#ib_nexttask_revert_dialog("..nId..")",
				   "让我再想想/OnExit"});
end;


-- 弹出给予界面
function ib_nexttask_revert_dialog(nId)
	if GetCash()<3000000 then
		CreateTaskSay({"<dec><npc>这位<sex>，你确定你身上带了 {300 万两}吗？", "结束对话/OnExit"});
	else
		GiveItemUI("给予安邦首饰", "请将你的"..aryItem[nId][3].."放进去", "ib_nexttask_revert_main", "OnExit");
	end;	
end;


-- 还原的主过程
function ib_nexttask_revert_main(nCount)
	
	local nIndex = 0;
	local nQuality = 0;
	local nSelect = 0;
	local nResult = 0;
	local nCreateResult = 0;
	local aryCreateIndex = {};
	local i = 0;
	
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>我可是需要{{一件}}完美的{{安邦首饰}}就够了哦！你再检查看看？",
					   "结束对话/OnExit"});
		return
	end;
	
	nIndex = GetGiveItemUnit(nCount);
	nQuality = GetGlodEqIndex(nIndex);
	
	for i=1, 4 do
		if nQuality==aryItem[i][1] then
			nSelect = i;
			break;
		end;
	end;
	
	if nSelect==0 then
		CreateTaskSay({"<dec><npc>我可是需要{{一件}}完美的{{安邦首饰}}就够了哦！你再检查看看？",
					   "结束对话/OnExit"});
		return
	end;
	
	-- 开始产生临时装备，看看是否符合
	nCreateResult, aryCreateIndex = createLikeEquip(nIndex, aryItem[nSelect][2], aryItem[nSelect][5], 10);
	
	if nCreateResult>0 then

		-- 先删除原来的黄金装备
		nResult = RemoveItemByIndex(nIndex);
		
		-- 异常处理，删除物品不成功时
		if nResult~=1 then
			CreateTaskSay({"<dec><npc>哎呀~，你看我这是老糊涂了吧？还原居然失败了，真是不好意思，你下次再来试试看？",
						   "结束对话/OnExit"});	
			WriteTaskLog("[严重错误]还原了一件安邦首饰失败："..aryItem[nSelect][4]);
			return
		end;
		
		CDebug:MessageOut("得到了一个正确的序号："..nCreateResult);
		
		AddItemByIndex(nCreateResult);
		
		WriteTaskLog("还原了一件安邦首饰成功："..aryItem[nSelect][4]);
		
		-- 删除生成的临时装备，除了正确的那个
		for i=1, getn(aryCreateIndex) do
			if aryCreateIndex[i]~=nCreateResult then
				RemoveItemByIndex(aryCreateIndex[i]);
			end;
		end;

		CreateTaskSay({"<dec><npc>还好，总算能完整的将这件{"..aryItem[nSelect][3].."}恢复成它原来的样子，你可要拿好了！",
				       "结束对话/OnExit"});	
		-- 扣钱
		Pay(3000000);
		Msg2Player("你支付给了铁匠 <color=yellow>300 万手工费<color>！");
		       		
	else
		CreateTaskSay({"<dec><npc>哎呀~，你看我这是老糊涂了吧？还原{居然失败了}，真是不好意思，这么着吧，手工费{只收你半价}，你下次再来试试看？",
					   "结束对话/OnExit"});	
					   
		-- 删除生成的临时装备
		for i=1, getn(aryCreateIndex) do
			RemoveItemByIndex(aryCreateIndex[i]);
		end;
		
		-- 扣钱
		Pay(1500000);
		Msg2Player("你支付给了铁匠 <color=yellow>150 万手工费<color>！");

		WriteTaskLog("还原安邦首饰时失败："..aryItem[nSelect][4]);		
	end;
	
	return
	
end;


-- 极品安邦完美
function top_equipex_dialog()
	CreateTaskSay({"<dec><npc>把极品安邦装备给我，我将帮你做成{{极品完美安邦装备}}, 虽然很困难, {{每次工钱"..NUM_PAY_TOPITEMTOPERFECT.."  万两}}, 同意吗?",
				   "好，请帮我/top_equipex_give",
	               "让我再想想/OnExit"});
end;

function top_equipex_give()
	if GetCash()<NUM_PAY_TOPITEMTOPERFECT*10000 then
		CreateTaskSay({"<dec><npc><sex> 你带够了 {{"..NUM_PAY_TOPITEMTOPERFECT.." 万两}} ", "结束对话/OnExit"});
	else
		GiveItemUI("交极品装备装备", "请放入极品安邦装备", "top_equipex_main", "OnExit", 1);
	end;		
end;

function top_equipex_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>我只要 {{1 极品安邦装备}}就够了，请检查!",
					   "结束对话/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	-- 检查这件黄金是否有保质期
	local nExpiredTime = ITEM_GetExpiredTime(nIndex);
	if nExpiredTime > 0 then
		CreateTaskSay({"<dec><npc>客官放入的装备不对!",
					   "我给错了!/OnExit"});
		return
	end;
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][2]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>和<sex> 放入的物品不是{{极品安邦装备}}, 请检查!",
					   "结束对话/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_TOPITEMTOPERFECT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- 获取绑定状态
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;

	-- AddItemEx 指令需要将黄金序号 -1
	-- AddGoldItem(0, aryTopItem[nAryIndex][1]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][1] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
	
	Msg2Player("你已交给工匠 <color=yellow>"..NUM_PAY_TOPITEMTOPERFECT.." 万工钱<color>!");
	Msg2Player("制造成功: <color=yellow>"..aryTopItem[nAryIndex][3].."<color>!");
	
	WriteTaskLog("制造成功:"..aryTopItem[nAryIndex][3]);
end;


-- 极品完美安邦还原
function top_revert_dialog()
	CreateTaskSay({"<dec><npc>还不满足{{完美安邦装备[极品]}} 吗？算了，我可以帮你 {{恢复原装}} 成{{极品安邦装备}}, {{之前一样的属性}}. {{费用为 "..NUM_PAY_PERFECTITEM_REVERT.." 万两}}, c? ng ? kh玭g?",
				   "太好了，请帮我 /top_revert_give",
	               "让我再想想/OnExit"});	
end;


function top_revert_give()
	if GetCash()<NUM_PAY_PERFECTITEM_REVERT*10000 then
		CreateTaskSay({"<dec><npc><sex> 你带够了 {{"..NUM_PAY_PERFECTITEM_REVERT.." 万两}} ", "结束对话/OnExit"});
	else
		GiveItemUI("给我完美安邦装备 [极品]", "请放入完美安邦装备[极品]", "top_revert_main", "OnExit", 1);
	end;		
	
end;


function top_revert_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>我只要 {{1 极品安邦装备[极品]}} 就可以了, 请检查!",
					   "结束对话/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	CDebug:MessageOut("完美安邦装备极品:"..nQuality);
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][1]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>和<sex> 放入的物品不是{{完美安邦装备[极品]}}, 请检查!",
					   "结束对话/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_PERFECTITEM_REVERT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- 获取绑定状态
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;
	
	-- AddGoldItem(0, aryTopItem[nAryIndex][2]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][2] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
		
	Msg2Player("你已交给工匠 <color=yellow>"..NUM_PAY_PERFECTITEM_REVERT.." 万工钱<color>!");
	Msg2Player("成功恢复原装: <color=yellow>"..aryTopItem[nAryIndex][4].."<color>!");
	
	WriteTaskLog("成功恢复原装:"..aryTopItem[nAryIndex][4]);		
end;


function OnExit()
	
end;
