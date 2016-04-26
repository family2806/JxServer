-- 中秋活动兑换月饼材料定时器

-- INTERVAL_TIME   = 30	    -- 每半个小时触发
-- VARV_BASEINDEX  = 100    -- 使用的起始全局变量
-- DELAY_TIME      = 15     -- 延迟兑换时间

-- INTERVAL_TIME   = 30    -- 每半个小时触发
INTERVAL_TIME   = 5    -- 每半个小时触发
VARV_LASTCITY   = 100   -- 上次兑换材料的城市
VARV_BASEINDEX  = 101   -- 使用的起始全局变量
-- DELAY_MIN_TIME  = 15    -- 延迟兑换时间（分钟）
DELAY_MIN_TIME  = 2    -- 延迟兑换时间（分钟）
START_HOUR_TIME = 9     -- 兑换起始时间（小时）


function IncMinute(hour, minute, inc)
	hour = mod(hour + floor(inc/60), 24)
	minute = mod(minute + mod(inc,60), 60)
    return hour, minute
end

-- function GetNextTime()
--     -- 下一个半点触发定时器
--     local hour = tonumber(date("%H"))
--     local minute = tonumber(date("%M"))
--     if (minute >= 0 and minute < 30) then
--         return hour, 30
--     else
--         return IncHour(hour, 1), 0
--     end
-- end

function GetNextTime()
    -- 下一个半点触发定时器
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    return IncMinute(hour, minute, 1)
end

-- 兑换材料的城市
tbl_cities = {
    {1,     "凤翔"},
    {11,    "成都"},
    {37,    "汴京"},
    {78,    "襄阳"},
    {80,    "扬州"},
    {162,   "大理"},
    {176,   "临安"}, 
};

-- 可兑换的材料{每次可兑换数目, 每天可兑换次数}
tbl_material = {
    {1000, 12},     -- 蛋
    {100, 6},       -- 杏仁
    {50, 6},        -- 花生
    {10, 6},        -- 椰丝
};

-- 材料名字
tbl_material_names = {
    "鸡蛋",
    "杏仁",
    "豆蓉",
    "椰子饭",
};

-- 初始化可兑换材料的每天可兑换次数
function InitMaterial()
    for i = 1, getn(tbl_material) do
        SetGblInt(VARV_BASEINDEX + i, tbl_material[i][2])
    end
end

-- 获取可兑换材料数目
function GetMaterialCount(typeid)
    return tbl_material[typeid][1];
end

-- 选择本次要兑换的材料
function SelectMaterial()
    local index = random(1, getn(tbl_material))
    local count = GetGblInt(VARV_BASEINDEX + index)
    if (count ~= 0) then
        SetGblInt(VARV_BASEINDEX + index, count - 1)
        return index
    end
    
    for i = 1, getn(tbl_material) do
        if (i ~= index) then
            count = GetGblInt(VARV_BASEINDEX + i)
            if (count ~= 0) then
                SetGblInt(VARV_BASEINDEX + i, count - 1)
                return i
            end
        end
    end
    return nil
end

function TaskShedule()
	TaskName("中秋换做饼材料");	

	-- 设置间隔时间
	TaskInterval(INTERVAL_TIME);

	-- 设置触发时间
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("中秋换做饼材料，定时启动时间为%d:%d...", h, m));

	-- 执行30次
	TaskCountLimit(0);
	
	-- 初始化
	InitMaterial()
end

-- 打印材料数量
function PrintMaterialCount()
    for i = 1, getn(tbl_material_names) do
        OutputMsg(format("%s: %d left",
            tbl_material_names[i],
            GetGblInt(VARV_BASEINDEX + i)))
    end
end

-- 关闭上次的兑换材料活动
function CloseLastExchange()
    -- 关闭兑换材料
    local lastcity = GetGblInt(VARV_LASTCITY)
    if (lastcity ~= nil and lastcity ~= 0) then
        local mapid = tbl_cities[lastcity][1]
        local cityname = tbl_cities[lastcity][2]
    	OutputMsg(format("中秋换做饼材料活动% 已关闭...", cityname))
        -- 触发GameServer上的脚本
        local cmd = format("dw ExchangeMoonCakeMaterial(%d,0,0,0)", mapid)
        GlobalExecute(cmd); 
        DelGblInt(VARV_LASTCITY)
    end
end

-- 保存上次的兑换材料活动
function SaveLastExchange(lastcity)
   SetGblInt(VARV_LASTCITY, lastcity)
end

function TaskContent()
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    
    -- 每天一次初始化材料可兑换次数
    if (hour == START_HOUR_TIME and minute < 30) then
        InitMaterial()
    end
    
    if (hour >= START_HOUR_TIME) then
        local typeid = SelectMaterial()             -- 材料类别
        local city = random(1, getn(tbl_cities))    -- 随机选择城市
        local minute = random(1, DELAY_MIN_TIME)    -- 延迟兑换时间（分钟）
        local mapid = tbl_cities[city][1]
        local cityname = tbl_cities[city][2]

        if (typeid == nil) then
        	OutputMsg("中秋换做饼材料活动发生错误...")
        else
    	    -- 触发GameServer上的脚本
            CloseLastExchange()
            SaveLastExchange(city)

     	    local cmd = format("dw ExchangeMoonCakeMaterial(%d,%d,%d,%d)",
                mapid,                      -- 所在地图
                minute,                     -- 延迟兑换时间
                typeid,                     -- 材料类别
                GetMaterialCount(typeid));  -- 每次可兑换数目
            GlobalExecute(cmd)
        	OutputMsg(format("中秋换做饼材料活动 % 已开始...", cityname));
            
            OutputMsg(cmd);
            PrintMaterialCount()
        end
  	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
