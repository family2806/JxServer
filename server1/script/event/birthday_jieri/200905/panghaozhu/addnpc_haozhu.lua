-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 刷新胖豪猪
-- 文件名　：addnpc_haozhu.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-31 09:31:39

-- ======================================================

Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\lib\\file.lua");

local tbBD0905_haozhu_pos = {
	{nMapID = 1, szMapName = "凤翔府",szPosPath = "\\settings\\maps\\city_out\\1.txt"},
	{nMapID = 11, szMapName = "成都府",szPosPath = "\\settings\\maps\\city_out\\11.txt"},
	{nMapID = 37, szMapName = "汴京府", szPosPath = "\\settings\\maps\\city_out\\37.txt"},
	{nMapID = 78, szMapName = "襄阳府", szPosPath = "\\settings\\maps\\city_out\\78.txt"},
	{nMapID = 80, szMapName = "扬州府", szPosPath = "\\settings\\maps\\city_out\\80.txt"},
	{nMapID = 162, szMapName = "大理", szPosPath = "\\settings\\maps\\city_out\\162.txt"},
	{nMapID = 176, szMapName = "临安府", szPosPath = "\\settings\\maps\\city_out\\176.txt"},
	{nMapID = 174, szMapName = "龙泉村", szPosPath = "\\settings\\maps\\village_out\\174.txt"},
	{nMapID = 121, szMapName = "龙门镇", szPosPath = "\\settings\\maps\\village_out\\121.txt"},
	{nMapID = 153, szMapName = "石鼓镇", szPosPath = "\\settings\\maps\\village_out\\153.txt"},
	{nMapID = 101, szMapName = "稻香镇", szPosPath = "\\settings\\maps\\village_out\\101.txt"},
	{nMapID = 99, szMapName = "永乐镇", szPosPath = "\\settings\\maps\\village_out\\99.txt"},
	{nMapID = 100, szMapName = "朱仙镇", szPosPath = "\\settings\\maps\\village_out\\100.txt"},
	{nMapID = 20, szMapName = "江津村", szPosPath = "\\settings\\maps\\village_out\\20.txt"},
	{nMapID = 53, szMapName = "巴陵县", szPosPath = "\\settings\\maps\\village_out\\53.txt"},
}

-- 参数：刷新地图ID，刷新个数
function birthday0905_addnpc_haozhu(n_count)
	local n_mapid = 0;
	local n_worldidx = SubWorldID2Idx(n_mapid);
	
	if (n_count > 0) then
		
		local tbNpc = {nNpcId = 1431, nLevel = 30, szName = "狩猎胖豪猪",nIsboss = 1,
						szDeathScript = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua",
						szScriptPath = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua"};
		
		for i = 1, getn(%tbBD0905_haozhu_pos) do
			
			local n_mapid = %tbBD0905_haozhu_pos[i].nMapID;
			local n_worldidx = SubWorldID2Idx(n_mapid);
			if (n_worldidx >= 0) then
				ClearMapNpcWithName(n_mapid, "狩猎胖豪猪");
			
				for k = 1, n_count do
					local nPosX, nPosY = GetRandomAData(%tbBD0905_haozhu_pos[i].szPosPath);
					WriteLog(date().."	"..n_mapid..","..nPosX..","..nPosY);
					basemission_CallNpc(tbNpc, n_mapid, (nPosX * 32 + (32-k*2)), (nPosY * 32 + (k*2-32)) );
				end
			end
			
		end
	else
		print("birthday0905_addnpc_haozhu Error! Fail Param!!")
	end
		
end

