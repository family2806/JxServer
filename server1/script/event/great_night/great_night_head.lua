--黄金之果活动头文件，所有的入口函数都在这里了

Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\misc\\eventsys\\type\\map.lua")

--Include("\\script\\lib\\gb_taskfuncs.lua");	 				-- By 廖志山辉煌之种;
--Include("\\script\\lib\\gb_modulefuncs.lua"); 				-- By 廖志山辉煌之种;

--所有数据放到这个表里
tbFruitData = {
	N_FRUIT_START_DATE = 2011042800,--活动开始日期
    N_FRUIT_END_DATE = 2011052900,--活动结束日期(含)
    SZ_FRUIT_MAP_NAME = "战龙洞",
    N_FRUIT_MAP_ID = 959,
    --生长黄金之果的位置
    TB_FRUIT_POS = 
    {
--    	{959,1437,3057},
--    	{959,1477,3084},
--    	{959,1458,3066},
    },
    --生长黄金之果的时间
    TB_FRUIT_TIME = {1315, 1335, 1900, 1920},
    --server start的时候，根据TB_FRUIT_TIME生成
    TB_FRUIT_TIME_MAP = {},--{[1315]=1, [1335]=1, [1900]=1, [1920]=1}
    
    gnSeedTimerId = 0,--生成黄金之核的TimerId
    gnFruitTimerId = 0,--黄金之核变黄金之果的TimerId
    
    TB_ENTER_POS = 
    {
    	{959,1690,3154},
    	{959,1427,2995},
    	{959,1552,2988},
    },
    
    --本文件地址
    SZ_THIS_FILE = "\\script\\event\\great_night\\great_night_head.lua",
    
    SZ_PLAYER_SCRIPT = "\\script\\event\\great_night\\player_map_script.lua",
    
    --记录今天的日期,如果日期不等，重新生成任务时间表
    nTodayDate = 0
    
    --引用player_map_script.lua玩家表
    --pPlayer=nil,
}

t = tbFruitData--给数据表取个好用的别名

--黄金之果服务器启动的回调
function OnGreatNightServerStart()

	--生成任务时间表
	_GenFrutTimeMap();

	local worldidx = SubWorldID2Idx(t.N_FRUIT_MAP_ID)
	if (worldidx < 0) then	--如果地图不在该组服务器上，不用管了
		return
	end;
	
	--删除新增的两水洞地图中的NPC和Trap
	ClearMapNpc(t.N_FRUIT_MAP_ID)
	ClearMapTrap(t.N_FRUIT_MAP_ID)
	
	_AddOutNpc()--加载出口NPC
	
	_RegPlayerMapScript()--注册双龙洞地图玩家脚本
	
	--启动定时器
--	if t.gnSeedTimerId and t.gnSeedTimerId ~= 0 then
--		DelTimer(t.gnSeedTimerId)
--	end
--	t.gnSeedTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 18, "OnTimer", 0)
end

--定时回调
function OnTimer()
	return 0--黄金之种由GC控制产生
--	local nCurDateTime = tonumber(GetLocalDate("%m%d%H%M%S"))
--	--print(format("OnTimer(%d)", nCurDateTime))
--	local nCurTime = mod(nCurDateTime, 100^3)-- tonumber(GetLocalDate("%H%M%S"))
--	if CheckFruitDate() == 1 then
--		local nDate = floor(nCurTime / 100^3)--tonumber(GetLocalDate("%Y%m%d"))
--    	if nDate ~= t.nTodayDate then
--    		t.nTodayDate = nDate
--    		_GenFrutTimeMap()--到第二天了 重新生成时间表
--    	end
--    	local nCurHM = floor(nCurTime / 100)
--    	if t.TB_FRUIT_TIME_MAP[nCurHM] and t.TB_FRUIT_TIME_MAP[nCurHM] > 0 then
--    		t.TB_FRUIT_TIME_MAP[nCurHM] = 0
--    		_GenFruit(1)--产生黄金之核
--    	end
--	end
--	return _GetNextTimerTime(nCurTime)
end

--生成任务时间表
function _GenFrutTimeMap()
	t.TB_FRUIT_TIME_MAP = {}
	for i=1,getn(t.TB_FRUIT_TIME) do
		t.TB_FRUIT_TIME_MAP[t.TB_FRUIT_TIME[i]] = 1
	end
end

--根据当前时间确定下一次定时器的长度
function _GetNextTimerTime(nCurTime)
	local nCurHM = floor(nCurTime/100)
	local nCurSec = mod(nCurTime, 100)
	local nNextHM = nCurHM + 1
	if mod(nNextHM, 100) >= 60 then
		nNextHM = (floor(nCurHM/100) + 1) * 100
	end
	local nRet = 0
	local nDateFlag = CheckFruitDate()
	if nDateFlag ~= 1 then
    	if nDateFlag == 0 then
    		--不在有效期就不用检查的那么频繁了，到下一个整点再检查一次
    		local nCurMin = mod(nCurHM, 100)
    		nRet = 60 * 60 - (nCurMin * 60 + nCurSec)
    	else
    		nRet = 0--有效期已经过了，删除定时器，不用再计时了
    	end
	elseif t.TB_FRUIT_TIME_MAP[nNextHM] then--下一分钟有任务检查频繁一点
		local nFastSec = 55
		if nCurSec < nFastSec then
			nRet = (nFastSec - nCurSec)
		else
			nRet = 1
		end
	else
		nRet = (60 - nCurSec)--到下一分钟开始的时候
	end
	return nRet*18--将秒转换成帧
end

--产生一组黄金之核
function _GenFruit(nStep)
	_ShowSeed(t.N_FRUIT_MAP_ID,t.N_FRUIT_MAP_ID, 4, 3, t.TB_FRUIT_POS, t.SZ_FRUIT_MAP_NAME, nStep)
	
	if 1== nStep then
		--5分钟之后变黄金之果
		t.gnFruitTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 5*60*18, "_GenFruit", nStep+1)
	else
		t.gnFruitTimerId = 0
	end
	return 0--如果通过定时器调用，通知定时器删除
end

function _ShowSeed(worldidx, mapid, seedlevel, count, tbPos ,szMapName, nBatch)
	--
	local nCurDate = tonumber(GetLocalDate("%m%d"))
	--种子对白
	local szScriptFile = "\\script\\activitysys\\config\\31\\npc_great_seed.lua"
	--普通果实对白
	local szGrowScriptFile = "\\script\\activitysys\\config\\31\\npc_great_fruit.lua"
	--黄金种子对白
	local szGoldFruitScriptFile = "\\script\\activitysys\\config\\31\\golden_fruit.lua";
	
	local szGoldSeedName = "黄金种子"
	local szGrowSeedName = "辉煌种子"
	local szGoldFruitName = "黄金之果实"
	local szGrowFruitName = "辉煌果实"
	
	--local nBeginNumber = gb_GetTask("辉煌之种",12)
	local nNpcTmpl = 1110
	local szNpcScriptFile = szScriptFile
	local szNpcName = "辉煌种子"
	if mod(nBatch	,2 ) == 0 then
		--如果为果实批次，则清除种子NPC
		ClearMapNpcWithName(mapid, "辉煌种子")
		ClearMapNpcWithName(mapid, szGoldSeedName);
		if seedlevel == 4  then
			nNpcTmpl = 1118
			szNpcScriptFile = szGoldFruitScriptFile
			szNpcName = szGoldFruitName
		else
			nNpcTmpl = 1111
			szNpcScriptFile = szGrowScriptFile
			szNpcName = "辉煌果实"
		end
	elseif seedlevel ==  4 then
			nNpcTmpl = 1117
			szNpcName = szGoldSeedName
	end
	--
	local nLineCount = getn(tbPos);
	--如果发放数量大于坐标数量则砍去多余的部分
	count = (nLineCount < count ) and nLineCount or  count 
	for i = 1, count do
			local nMap = tbPos[i][1]
			local nPosX = tbPos[i][2]
			local nPosY = tbPos[i][3]
			if (nil ~= nPosX and nil ~= nPosY) then
				local tbNpc = {
            		szName = szNpcName, 
            		szTitle = nil,
            		nLevel = 95,
            		nNpcId = nNpcTmpl,
            		nIsboss = 0,
            		szScriptPath = szNpcScriptFile,
            	}

            	local nNpcIndex = %basemission_CallNpc(tbNpc, nMap, nPosX*32, nPosY*32)
            	if nNpcIndex and nNpcIndex > 0 then
            		--nBeginNumber = nBeginNumber + 1
					--gb_SetTask("辉煌之种",12,nBeginNumber)
					SetNpcParam(nNpcIndex, 1, seedlevel);
					--SetNpcParam(nNpcIndex, 2, nBeginNumber*10000 +  nCurDate ); --  nCurDate --加上当前日期
					if szNpcName == szGoldFruitName or szNpcName == szGoldSeedName then
						Msg2SubWorld("<color=yellow>"..szNpcName.."<color>".."出现在"..szMapName.."("..floor(nPosX / 8)..","..floor(nPosY / 16)..").")
					end
            	end
			end;
	end;
end;

function CheckFruitDate()
	return 1--无时间限制
--	local nDate = tonumber(GetLocalDate("%Y%m%d%H"))
--	if nDate < t.N_FRUIT_START_DATE then--注意这里没有=
--		return 0
--	elseif nDate >= t.N_FRUIT_END_DATE then--注意这里有=
--		return 2
--	else
--		return 1
--	end
--	if (nDate >= t.N_FRUIT_START_DATE and nDate <= t.N_FRUIT_END_DATE) then
--		return 1
--	end
end

--传送到新两水洞地图（采集黄金之果）
function OnGoToNewLiangShuiDong()
	if CheckFruitDate() == 1 then
		local nCount = getn(t.TB_ENTER_POS)
		local nRand = random(1,nCount)
		if nRand >= 1 and nRand <= nCount then
			NewWorld(unpack(t.TB_ENTER_POS[nRand]))
		end
	else
		Talk(1, "", "请见谅，现在不是活动时间，原谅我们无法带你去.")
	end
end

--NPC会话选项
function OnNpcTalk()
	local szMapName = t.SZ_FRUIT_MAP_NAME
	local szDesc = format("<color=yellow>%s<color>现今武林中风调雨顺，为了表示对各位江湖大侠的感谢，武林盟主独孤剑特意在<color=yellow>00:00-28-04-2011~00:00-29-05-2011<color>开启活动<color=yellow> 黄金之核<color>大规模的.<enter>", "武林盟主传人")
	szDesc = format("%s每日活动期间<color=yellow>13:15, 13:35, 19:00, 19:20<color>在<color=yellow>%s<color>版图上将出现3颗黄金种子，一段时间后各位大侠将可收获它的果实，使用时将会增加黄金之果实的功力.<enter>", szDesc, szMapName)
	szDesc = format("%s 只有通过我这才可以带你到<color=yellow>%s<color>", szDesc, szMapName)
	Describe(szDesc, 2,
		"请带我到战龙洞/OnGoToNewLiangShuiDong",
		"知道了/no"
	)
end

function no()
end

--添加双龙洞出口NPC
function _AddOutNpc()
	local nOffset = 3
	local tbNpcPos = t.TB_ENTER_POS
	local tbNpc = {
		szName = "战龙洞传送人", 
		szTitle = "<npc>我可以带你回城",
		nLevel = 95,
		nNpcId = 238,
		nIsboss = 0,
		szScriptPath = "\\script\\event\\great_night\\fruit_chukou_npc.lua",
	}
	for _, tbTmpPos in tbNpcPos do
		local nMapId, nPosX, nPosY = unpack(tbTmpPos)
		nPosX = nPosX + nOffset
		nPosY = nPosY + nOffset
		%basemission_CallNpc(tbNpc, nMapId, nPosX*32, nPosY*32)	
	end
end

--注册玩家在双龙洞地图的行为
function _RegPlayerMapScript()
	local pPlayer = DynamicExecute(t.SZ_PLAYER_SCRIPT, "getglobal", "tbPlayer")
	t.pPlayer = pPlayer
	
	t.nRegIdLeave = EventSys:GetType("LeaveMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnLeaveMap, pPlayer)
	t.nRegIdEnter = EventSys:GetType("EnterMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnEnterMap, pPlayer)
end

