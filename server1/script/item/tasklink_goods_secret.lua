
-- �����ͼ�Լ�ɽ�����ͼ��Ƭ����ű�
-- Edited by peres
-- 2004/12/25 ʥ��������

IncludeLib("BATTLE");
Include("\\script\\task\\newtask\\newtask_head.lua"); 
Include("\\script\\task\\newtask\\map_index.lua"); -- ���ڻ�ȡ��ͼ����Ϣ
Include("\\script\\task\\newtask\\lib_setmembertask.lua"); -- ����ѭ���ı���ѵ��������

function PickUp( nItemIndex, nPlayerIndex )

local nPreservedPlayerIndex = PlayerIndex
local nMemCount = GetTeamSize()

	if (nMemCount == 0) then
	
		AddMapValues();
	
	else
	
		for i = 1, nMemCount do -- �����￪ʼѭ������ÿ�����
		
			PlayerIndex = GetTeamMember(i);
		
			AddMapValues();

		end
	
		PlayerIndex = nPreservedPlayerIndex; -- ѭ��������������黹����� ID
	
	end
	
	return 0

end


-- ���ݸ�������������Ҳ�ͬ���͵ĵ�ͼ־
function AddMapValues()

local myMapID, myMapName, myMapX, myMapY -- ���ڻ�ȡ��ͼ־��Ϣ�ı���
local myTaskType = nt_getTask(1021)
local nWorldMaps = nt_getTask(1027) -- ������������ж��ٸ�ɽ�����ͼ
local myMapNum = nt_getTask(1025) -- �ж���������ж����ŵ�ͼ־

myMapID = SubWorldIdx2ID( SubWorld )

	if (myTaskType == 4) then
		
		myMapName, myMapX, myMapY = tl_getMapInfo(myMapID)
		
		if (myMapName == 0) or (myMapName == nil) then -- ��ֹ���ַ�����
			myMapName = ""
		end
		
		-- ���������һ��ǰ��ͼ�ĵ�ͼ־
		if (nt_getTask(1031) == myMapID) then
				
			if (GetByte(nt_getTask(1032),1) == 2) then
			
				myMapNum = myMapNum + 1
				nt_setTask(1025,myMapNum)
				Msg2Player("���õ�һ��"..myMapName.."��ͼ��־�������ڹ��� "..myMapNum.." �š�");
				
				return 0
				
			end
			
		end
		
		-- ���������һ��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("���õ�һ��ɽ�����ͼ��Ƭ�������ڹ��� "..nWorldMaps.." �����ͼ��Ƭ��");
		
	else
		-- ���������һ��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("���õ�һ��ɽ�����ͼ��Ƭ�������ڹ��� "..nWorldMaps.." �����ͼ��Ƭ��");
	end


end