IncludeLib("TONG")
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\tong\\workshop\\tongcolltask.lua")
if (GetProductRegion() == "cn_ib") then
	Include("\\script\\tong\\map\\map_management.lua");
end;


function main()
	if (GetProductRegion() == "cn_ib") then
		tongmap_entrance(1)
		return
	end;
	--��ͼ�����ӳ�
	if (GetMapType(SubWorld) == 1)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				local pos = GetMapEnterPos(SubWorldIdx2MapCopy(SubWorld))
				SetPos(pos.x, pos.y)
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("������, ���ܽ���! ������������ƣ����Ұ�ᳵ��Ի�.", 0)
				else
					Say("������, û��������ý���!", 0)
				end;
			end
		end
	end
end

-- ����ͼ��Ч�ڼ���ͼ���Ƶ��жϲ���
function tongmap_entrance(bNoExpireWarning)
	if (GetMapType(SubWorld) == 1) then
		local _,nMyTongID = GetTongName()
		local nMapTongID = GetMapParam(SubWorld, 0)
		if (nMapTongID ~= 0) then
			local nEnterForbidden = 0;
			local nTongMapExpireState = tongmap_check_expire(nMapTongID);
			if (nTongMapExpireState == 2) then
				nEnterForbidden = 1;
				Say("��������ѹ�ʹ��ʱ��!", 0);
			elseif (nTongMapExpireState == 1 and nMyTongID == nMapTongID and bNoExpireWarning ~= 1) then
				Msg2Player("����������ѹ�ʱ��<color=yellow>"..tongmap_get_expire_date(nMapTongID).."<color>!");
			elseif (nMyTongID ~= nMapTongID and TONG_GetTongMapBan(nMapTongID) == 1) then
				nEnterForbidden = 1;
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("������, ���ܽ���! ������������ƣ����Ұ�ᳵ��Ի�.", 0)
				else
					Say("������, û��������ý���!", 0)
				end
			end
			if (nEnterForbidden == 1) then
				local nTongMapTemplate = TONG_GetTongMapTemplate(nMapTongID);
				local tTongMapEnterPos = GetMapEnterPos(nTongMapTemplate);
				SetFightState(0);
				SetPos(tTongMapEnterPos.x, tTongMapEnterPos.y);
			end
		end
	end
end