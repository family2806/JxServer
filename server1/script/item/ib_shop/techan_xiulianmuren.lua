-- 文件名　：techan_xiulianmuren.lua
-- 创建者　：wangjingjun
-- 内容　　：特殊的修炼木人，能够叠加，均为10级的试练坊木人		IB shop 调整
-- 创建时间：2011-07-15 17:32:35

IncludeLib("SETTING"); --载入SETTING脚本指令库
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				-- 记录最后一次使用日期Byte1
									-- 记录最后日期使用的次数Byte2
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end

function main(nItemIndex)
	local n_cur_date = tonumber(GetLocalDate("%d"));
	local n_my_value = GetTask(TSK_MAXCOUNT);
	local n_my_date = GetByte(n_my_value, 1);
	local n_my_count = GetByte(n_my_value, 2);
	
	if (n_cur_date ~= n_my_date) then						-- 最后使用时不是今天，初始化使用次数计数
		n_my_date =  n_cur_date;
		n_my_value = SetByte(n_my_value, 1, n_cur_date);
		
		n_my_count = 0;
		n_my_value = SetByte(n_my_value, 2, 0);
		
		SetTask(TSK_MAXCOUNT, n_my_value);
	end
	
	
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("不能在这使用物品.")
		return 1
	end
	
	
	
	if (n_my_count >= 100) then
		Msg2Player("每个玩家每天最多只能使用100个修炼木人.");
		return 1;
	end
	
	if (GetFightState() == 1) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("在这怎么能练习呢？出去外面.")
			return 1
		end
	--	local nParam1 = GetItemParam(nItemIndex, 2)	--购买木人时作坊的使用等级
		local nParam1 = 10  -- 特殊的木人，使用等级均为10级
		--local nParam2 = GetItemParam(nItemIndex, 3)
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		--local key = random(1,100000)
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."木人 ",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, nParam1)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("木人已出现，快去练习.")
			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		-- 今天使用次数计数
			--SetTask(1740, key)
		end
		return 0
	else
		Msg2Player("木人只能在战斗区域使用.")
		return 1
	end
end