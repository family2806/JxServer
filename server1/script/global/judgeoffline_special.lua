--专用托管服务器
--允许服务器人数在750以下进行托管
--由城市车夫处进入（仅充值用户）

Include("\\script\\task\\partner\\train\\partner_addtrainnpc.lua")
tbAnonymValeMap = {835,836,837,838,839,840};

function GotoAnonymVale()
	if( GetExtPoint( 0 ) >= 1 ) then
		local filehigh = pt_GetTabFileHeight( jindienter_pos_file ) - 1
		local row = random(filehigh)
		local posx = pt_GetTabFileData(jindienter_pos_file, row + 1, 1)
		local posy = pt_GetTabFileData(jindienter_pos_file, row + 1, 2)
		local nmap = tbAnonymValeMap[random(getn(tbAnonymValeMap))];
		
		if (posx > 0 and posy > 0) then
			NewWorld(nmap, posx, posy)
			SetFightState(0)
		else
			print("jindienter_pos_file error row = "..row)
		end
	else
		Talk(1,"","对不起，客官需要充值才能进入<color=yellow>无名谷<color>")
	end;
end;

function AnonymVale_auto()
	local oldSubWorld = SubWorld;
	for k = 1, getn(tbAnonymValeMap) do
		local nmap = tbAnonymValeMap[k];
		local nworld = SubWorldID2Idx(nmap);
		
		if (nworld >= 0) then
			SubWorld = nworld;
			
			--车夫加到坐标（1637,3277)，(1780,3354)，(1736,3462)，(1622,3658），（1798,3636)
			for i = 1, getn(tb_jitan_pos) do
				local npcindex = AddNpc(393, 1, nworld, tb_jitan_pos[i][1] * 32, tb_jitan_pos[i][2] * 32, 1, "车夫")
				if (npcindex > 0) then
					SetNpcScript(npcindex, "\\script\\missions\\newcitydefence\\npc\\chefu.lua")
				end
			end
			
			--出口的trap
			for i = 1, pt_GetTabFileHeight(jindiexit_trap_file) - 1 do
				local x = pt_GetTabFileData(jindiexit_trap_file, i + 1, 1);
				local y = pt_GetTabFileData(jindiexit_trap_file, i + 1, 2);
				AddMapTrap(nmap, x,y, "\\script\\task\\partner\\trap\\trap_jindichukou.lua");
			end
		end;
	end;
	SubWorld = oldSubWorld;
end;