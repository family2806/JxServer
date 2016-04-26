
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机选取一个物品的类
-- Edited by peres
-- 2006/08/01 AM 09:52

-- I hope you still feel small when you stand beside the ocean,
-- Whenever one door closes I hope one more opens,
-- Promise me that youll give faith a fighting chance,
-- And when you get the choice to sit it out or dance.

-- ======================================================

IL("ITEM");

-- 扩展表格文件类的支持
Include("\\script\\class\\ktabex.lua");

-- 开启一个随机物品的主函数
function openRandomItem(tabItem, szBoxName)

local nRow = tabItem:countArrayRate("ItemRate");
local szName,nQuality,nGenre,nDetail,nParticular,nLevel,nGoodsFive = "", 0, 0, 0, 0, 0, 0;
local nIndex, nLimitTime = 0;
local nIsPublic = 0;

	szName      = tabItem:getCell("Name", nRow);
	nQuality    = tonumber(tabItem:getCell("Quality", nRow));
	nGenre      = tonumber(tabItem:getCell("Genre", nRow));
	nDetail     = tonumber(tabItem:getCell("Detail", nRow));
	nParticular = tonumber(tabItem:getCell("Particular", nRow));
	nLevel      = tonumber(tabItem:getCell("Level", nRow));
	nGoodsFive  = tonumber(tabItem:getCell("GoodsFive", nRow));
	
	nLimitTime  = tonumber(tabItem:getCell("LimitTime", nRow));
	
	-- 是否公告
	nIsPublic = tonumber(tabItem:getCell("IsPublic", nRow));
	
	if nQuality==1 then
		nIndex = AddGoldItem(0, nGenre);
		if nLimitTime~=nil and nLimitTime>0 then
			ITEM_SetLeftUsageTime(nIndex, nLimitTime * 60);
			SyncItem(nIndex);
		end;
	else
		AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
	end;
	
	Msg2Player("您打开了 "..szBoxName.." 得到了 <color=green>"..szName.."<color>");
	
	if nIsPublic==1 then
		AddGlobalCountNews("公告：玩家 "..GetName().." 打开 "..szBoxName.." 得到了 "..szName.."！", 1);
	end;
	
	WriteTaskLog("打开 "..szBoxName.." 得到了 "..szName);

end;

-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog("[任务系统记录]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;
