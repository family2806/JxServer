Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070424) ~= 1) then
		Say("该原料已过期，不能用来做饼了.", 0);
		return 0;
	end;
	
	local nteam = GetTeamSize();
	if (nteam ~= 2) then
		Say("做饼原料包：只能男女组队才能一起做饼.", 0);
		return 1;
	end;
	
	local nw1, nx1, ny1 = GetWorldPos();
	local nb = 0;
	for i = 1, getn(TB_XINNIANLIHUA_AREA) do
		if (nw1 == TB_XINNIANLIHUA_AREA[i]) then
			nb = 1;
			break
		end;
	end;
	if (nb == 0) then
		Msg2Player("只能在7大城市、8个新手村和4个风景区范围内做饼.");
		return 1;
	end;
	
	--local nMaster = GetNpcParam(nNpcIdx, PRM_PAN_PLAYID);
	
	local oldPlayer = PlayerIndex;
	local bM = 0;
	local bS = 0;
	local sztreename = "";
	local szname1 = "";
	local szname2 = "";
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		
		if (i == 1) then
			bS = GetSex();
			szname1 = GetName();
		elseif (bS ~= GetSex()) then
			bS = 2;		--两个人性别不同
			szname2 = GetName();
		end;
		
	end;
	PlayerIndex = oldPlayer;
	if (bS ~= 2) then
		Say("只有男女组队才能使用该原料做饼.", 0);
		return 1;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local oldPlayer = PlayerIndex;
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		if GetTask(TSK_33_COOKIES_DATE) == nil or GetTask(TSK_33_COOKIES_DATE) == 0 then
			SetTask(TSK_33_COOKIES_DATE,nDate);
			SetTask(TSK_33_COOKIES_COUNT,0);
		end
		
		if (tonumber(GetTask(TSK_33_COOKIES_DATE)) == nDate and tonumber(GetTask(TSK_33_COOKIES_COUNT)) >= 8) then
			PlayerIndex = oldPlayer;
			Say("您已经很累了，明天才能继续做饼。每天最多只能做8次.",0);
			return 1;
		end
		
		if tonumber(GetTask(TSK_33_COOKIES_DATE)) ~= nDate and tonumber(GetTask(TSK_33_COOKIES_COUNT)) >= 8 then
			SetTask(TSK_33_COOKIES_COUNT,0);
		end
		
		if (checkcookies2007Limit() ~= 1) then
			PlayerIndex = oldPlayer;
			Say("真是不好意思，只有玩家<color=yellow>50级以上且已充值<color> 才能使用原料包做饼，其中一位侠客没有达到该条件.", 0);
			return 1;
		end;
	end
	PlayerIndex = oldPlayer;
	local oldPlayer = PlayerIndex;
	for i= 1, nteam do
		local npidx = GetTeamMember(i);
		PlayerIndex = npidx;
		local ncount = tonumber(GetTask(TSK_33_COOKIES_COUNT));
		ncount = ncount + 1;
		SetTask(TSK_33_COOKIES_COUNT,ncount);
		if ncount >=8 then
			SetTask(TSK_33_COOKIES_DATE,nDate);
		end
	end
	PlayerIndex = oldPlayer;
	
	sztreename = format("火炉 - %s v?%s", szname1, szname2);
	local _, nx, ny = GetWorldPos();
	local nNpcIdx = AddNpc(TB_PAN_NPCID[1], 1, SubWorld, (nx-1)*32, (ny-1)*32, 1, sztreename);
	if (nNpcIdx > 0) then
		local nNameId = FileName2Id(GetName());
		SetNpcParam(nNpcIdx, PRM_PAN_PLAYID, nNameId);
		SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx,PRM_PAN_EVENT), 3,1));
		SetNpcScript(nNpcIdx, "\\script\\event\\cookies2007\\pan.lua");
		SetNpcTimer(nNpcIdx, 18*30);
	else
		return 1;
	end;
end;