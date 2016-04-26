-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ˢ���ֺ���
-- �ļ�������addnpc_haozhu.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-31 09:31:39

-- ======================================================

Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\lib\\file.lua");

local tbBD0905_haozhu_pos = {
	{nMapID = 1, szMapName = "���踮",szPosPath = "\\settings\\maps\\city_out\\1.txt"},
	{nMapID = 11, szMapName = "�ɶ���",szPosPath = "\\settings\\maps\\city_out\\11.txt"},
	{nMapID = 37, szMapName = "�꾩��", szPosPath = "\\settings\\maps\\city_out\\37.txt"},
	{nMapID = 78, szMapName = "������", szPosPath = "\\settings\\maps\\city_out\\78.txt"},
	{nMapID = 80, szMapName = "���ݸ�", szPosPath = "\\settings\\maps\\city_out\\80.txt"},
	{nMapID = 162, szMapName = "����", szPosPath = "\\settings\\maps\\city_out\\162.txt"},
	{nMapID = 176, szMapName = "�ٰ���", szPosPath = "\\settings\\maps\\city_out\\176.txt"},
	{nMapID = 174, szMapName = "��Ȫ��", szPosPath = "\\settings\\maps\\village_out\\174.txt"},
	{nMapID = 121, szMapName = "������", szPosPath = "\\settings\\maps\\village_out\\121.txt"},
	{nMapID = 153, szMapName = "ʯ����", szPosPath = "\\settings\\maps\\village_out\\153.txt"},
	{nMapID = 101, szMapName = "������", szPosPath = "\\settings\\maps\\village_out\\101.txt"},
	{nMapID = 99, szMapName = "������", szPosPath = "\\settings\\maps\\village_out\\99.txt"},
	{nMapID = 100, szMapName = "������", szPosPath = "\\settings\\maps\\village_out\\100.txt"},
	{nMapID = 20, szMapName = "�����", szPosPath = "\\settings\\maps\\village_out\\20.txt"},
	{nMapID = 53, szMapName = "������", szPosPath = "\\settings\\maps\\village_out\\53.txt"},
}

-- ������ˢ�µ�ͼID��ˢ�¸���
function birthday0905_addnpc_haozhu(n_count)
	local n_mapid = 0;
	local n_worldidx = SubWorldID2Idx(n_mapid);
	
	if (n_count > 0) then
		
		local tbNpc = {nNpcId = 1431, nLevel = 30, szName = "�����ֺ���",nIsboss = 1,
						szDeathScript = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua",
						szScriptPath = "\\script\\event\\birthday_jieri\\200905\\panghaozhu\\haozhu_death.lua"};
		
		for i = 1, getn(%tbBD0905_haozhu_pos) do
			
			local n_mapid = %tbBD0905_haozhu_pos[i].nMapID;
			local n_worldidx = SubWorldID2Idx(n_mapid);
			if (n_worldidx >= 0) then
				ClearMapNpcWithName(n_mapid, "�����ֺ���");
			
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

