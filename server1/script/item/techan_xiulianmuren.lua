IncludeLib("SETTING"); --����SETTING�ű�ָ���
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				-- ��¼���һ��ʹ������Byte1
									-- ��¼�������ʹ�õĴ���Byte2
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--�����ͼ����
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
	
	if (n_cur_date ~= n_my_date) then						-- ���ʹ��ʱ���ǽ��죬��ʼ��ʹ�ô�������
		n_my_date =  n_cur_date;
		n_my_value = SetByte(n_my_value, 1, n_cur_date);
		
		n_my_count = 0;
		n_my_value = SetByte(n_my_value, 2, 0);
		
		SetTask(TSK_MAXCOUNT, n_my_value);
	end
	
	
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("�˵�ͼ�㲻��ʹ�ô˵���.")
		return 1
	end
	
	
	
	if (n_my_count >= 100) then
		Msg2Player("����ʹ����������Ѿ�����100��������ʹ��.");
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
			Msg2Player("��������ô�ܽ��������أ�����ȥҰ��ɡ�")
			return 1
		end
		local nParam1 = GetItemParam(nItemIndex, 2)	--����ľ��ʱ������ʹ�õȼ�
		--local nParam2 = GetItemParam(nItemIndex, 3)
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		--local key = random(1,100000)
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."������ľ��",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, nParam1)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("��������һ������ľ�ˣ��Ͽ���������ɡ�")
			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		-- ����ʹ�ô�������
			--SetTask(1740, key)
		end
		return 0
	else
		Msg2Player("����ľ��ֻ����Ұ��ʹ�á�")
		return 1
	end
end