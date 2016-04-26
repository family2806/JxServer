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
	--地图禁制扔出
	if (GetMapType(SubWorld) == 1)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				local pos = GetMapEnterPos(SubWorldIdx2MapCopy(SubWorld))
				SetPos(pos.x, pos.y)
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("帮会禁地, 不能进入! 如果有任务令牌，请找帮会车夫对话.", 0)
				else
					Say("帮会禁地, 没有命令，不得进入!", 0)
				end;
			end
		end
	end
end

-- 作地图有效期及地图禁制等判断操作
function tongmap_entrance(bNoExpireWarning)
	if (GetMapType(SubWorld) == 1) then
		local _,nMyTongID = GetTongName()
		local nMapTongID = GetMapParam(SubWorld, 0)
		if (nMapTongID ~= 0) then
			local nEnterForbidden = 0;
			local nTongMapExpireState = tongmap_check_expire(nMapTongID);
			if (nTongMapExpireState == 2) then
				nEnterForbidden = 1;
				Say("帮会区域已过使用时限!", 0);
			elseif (nTongMapExpireState == 1 and nMyTongID == nMapTongID and bNoExpireWarning ~= 1) then
				Msg2Player("贵帮帮会区域已过时限<color=yellow>"..tongmap_get_expire_date(nMapTongID).."<color>!");
			elseif (nMyTongID ~= nMapTongID and TONG_GetTongMapBan(nMapTongID) == 1) then
				nEnterForbidden = 1;
				if (GetTask(TASK_LP_COUNT) > 0) then
					Say("帮会禁地, 不能进入! 如果有任务令牌，请找帮会车夫对话.", 0)
				else
					Say("帮会禁地, 没有命令，不得进入!", 0)
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