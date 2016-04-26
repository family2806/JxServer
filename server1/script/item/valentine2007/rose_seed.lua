Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070223) ~= 1) then
		Say("��öõ�廨�Ѵ��ʱ��̫�����Ѿ���ή�ˡ�", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("������˼��ֻ�еȼ��ﵽ<color=yellow>80��<color>���ϵ��û�������ʹ��õ�廨�ѡ�", 0);
		return 1;
	end;
	
	local nteam = GetTeamSize();
	if (nteam ~= 2) then
		Say("õ�廨�ѣ�ֻ����Ů��������Ӳ��������ҡ�", 0);
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
		Msg2Player("����õ�����������ߴ���С����ִ��Լ��Ĵ�羰���ڡ�");
		return 1;
	end;
	
	--local nMaster = GetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID);
	
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
			bS = 2;		--�������Ա�ͬ
			szname2 = GetName();
		end;
	end;
	PlayerIndex = oldPlayer;
	
	if (bS ~= 2) then
		Say("õ�廨�ѣ�ֻ����Ů��������Ӳ��������ҡ�", 0);
		return 1;
	end;
	
	sztreename = format("%s��%s��õ����", szname1, szname2);
	local _, nx, ny = GetWorldPos();
	local nNpcIdx = AddNpc(TB_ROSETREE_NPCID[1], 1, SubWorld, (nx-1)*32, (ny-1)*32, 1, sztreename);
	if (nNpcIdx > 0) then
		local nNameId = FileName2Id(GetName());
		SetNpcParam(nNpcIdx, PRM_ROSETREE_PLAYID, nNameId);
		SetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_ROSETREE_EVENT), 3,1));
		SetNpcScript(nNpcIdx, "\\script\\event\\valentine2007\\rose_tree.lua");
		SetNpcTimer(nNpcIdx, 18*30);
	else
		return 1;
	end;
end;