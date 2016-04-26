
-- ====================== 文件信息 ======================

-- 剑侠情缘online 奇珍阁限制判断脚本
-- Edited by peres
-- 2006/01/16 PM 12:42

-- 如果有过幸福
-- 幸福只是瞬间的片断，一小段一小段
-- 房间里的黑暗就犹如大海，童年的时候她和父母一起坐船去海岛
-- 夜晚的船在风浪里颠簸，她躺在小小的铺位上感觉自己随着潮水漂向世界的尽头
-- 而那一刻，世界是不存在的
-- 只有他和她两个人。他们相爱

-- ======================================================

-- LLG_ALLINONE_TODO_20070802

Include("\\script\\global\\systemconfig.lua") -- 系统配置
Include("\\script\\trip\\define.lua")
Include("\\script\\maps\\checkmap.lua");

-- 可以进行购买的其它特殊地图 ID
aryMap = {

	11,   -- 成都
	1,    -- 凤翔
	37,   -- 汴京
	176,  -- 临安
	162,  -- 大理
	78,   -- 襄阳
	80,   -- 扬州
	
	174,  -- 龙泉
	121,  -- 龙门
	153,  -- 石鼓
	101,  -- 稻香
	99,   -- 永乐
	100,  -- 朱仙
	20,   -- 江津
	53,   -- 巴陵
	54,   -- 南岳
	175,  -- 西山
	44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374,375,376,377,378,379,380,381,382,383,384,385,386,--宋金战场后营
	323,324,325,	--宋金报名点
	221,222,223,	--攻城战，后营
	208,			--大牢(by 廖志山)
	605,606,607,	--武林第一帮后营
	608,609,610,611,612,613,		--武林第一帮准备场
	520,521,522,523,524,525,526,	-- 明月镇
--	-- 桃花岛
--	235,
--	236,
--	237,
--	238,
--	239,
--	240,
--	241,
}

OtherMap = {m_Maps = {}}

function OtherMap:Initialize()
	for i = 1, getn(aryMap) do
		self.m_Maps[aryMap[i]] = 1
	end
end

function OtherMap:AddMap(mapid)
	self.m_Maps[mapid] = 1
end

function OtherMap:DelMap(mapid)
	self.m_Maps[mapid] = nil
end

function OtherMap:Check(mapid)
	if (self.m_Maps[mapid] ~= nil) then
		return 1
	else
		return 0
	end
end
OtherMap:Initialize()

function IsShopMap(nMapID)
	if (IsCityMap(nMapID) == 1 or
		IsFreshmanMap(nMapID) == 1 or
		IsTongMap(nMapID) == 1 or
		OtherMap:Check(nMapID) == 1) then
		return 1
	else
		return 0
	end
end

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	-- 在 global\systemconfig.lua 中配置奇珍阁开关
	if SYSCFG_SHOP_OPEN ~= 1 then
		Msg2Player("<color=yellow>奇珍阁目前还没有开放哦！<color>")
		return 0
	end

	if GetTripMode() == TRIP_MODE_SERVER then
		Msg2Player("<color=yellow>奇珍阁目前还没有开放哦！<color>")
		return 0
	end
	local nMapID, _, _ = GetWorldPos()
	if (GetFightState() >= 1 or IsShopMap(nMapID) == 0) then
		Msg2Player("<color=yellow>奇珍阁只能在城市、新手村和部分特殊地图的非战斗区域内开启哦！<color>");
		return 0
	else
		return 1
	end
end
