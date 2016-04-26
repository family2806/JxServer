Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")

function main(sel)
	if (IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("你目前不能使用神行符！");
		return 1
	end
	
	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用神行符。");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用神行符。");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用神行符。");
		return 1
	end;

	--卫国战争之烽火连城地图，不能使用
	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("对不起，您目前所在地图属于特殊区域，无法使用神行符。");
		return 1
	end;
	
	if (GetLevel() < 5) then
		Say("5级以上的玩家才能使用神行符", 0);
		return 1
	end;
	
	Say("神行符可以设定重生点，也可以飞到你想要去的城镇。", 2, 
		"离开/no",
		--"设置重生点，下次使用土地符即可瞬间抵达。/set_backpos", 
		"使用神行之术，让你瞬间到达指定的地方/gototown");
		--"去其他地图/#tbVNGWORDPOS:GotoOtherMap()");
	return 1	
end;

tab_RevivePos = {
	[1] = {	--"成都"
		{"成都东", 6, 11},{"成都西", 7, 11},{"成都南", 8, 11},{"成都北", 9, 11},{"成都中", 5, 11}
	},
	[2] = {	--"襄阳"
		{"襄阳东", 30, 78},{"襄阳西", 32 , 78},{"襄阳南", 31, 78},{"襄阳北", 33, 78},{"襄阳中", 29, 78}
	},
	[3] = {	--"凤翔"
		{"凤翔东", 1, 1},{"凤翔西", 2, 1},{"凤翔南", 3, 1},{"凤翔北", 4, 1},{"凤翔中", 0, 1}
	},
	[4] = {	--"大理"
		{"大理北", 64, 162},{"大理中", 63, 162}
	},
	[5] = {	--"汴京"
		{"汴京东", 24, 37},{"汴京西", 25, 37},{"汴京南", 24, 37},{"汴京北", 26, 37},{"汴京中", 23, 37}
	},
	[6] = {	--"扬州"
		{"扬州东", 35, 80},{"扬州西", 38, 80},{"扬州南", 37, 80},{"扬州北", 36, 80},{"扬州中", 34, 80}
	},
	[7] = {	--"临安"
		{"临安东", 68, 176},{"临安南", 67, 176},{"临安北", 69, 176}
	},
	[8] = {	--"村庄"
		{"巴陵县", 19, 53},{"江津村", 10, 20},{"永乐镇", 43, 99},{"朱仙镇", 45, 100},{"稻香村", 47, 101},{"龙门镇", 55, 121},{"石鼓镇", 59, 153},{"龙泉村", 65, 174}
	},
	[9] = {	--"门派"
		{"天王帮", 21, 59},{"少林派", 52, 103},{"唐门", 15, 25},{"五毒教", 71, 183},{"峨嵋派", 13, 13},{"翠烟门", 61, 154},{"天忍教 ", 28, 49},{"丐帮", 53, 115},{"武当派", 40, 81},{"昆仑派", 58, 131}
	},
};
--设定重生点（选城市）
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("在此你不能使用此道具");
			return 1;
		end
	end	
	

	
	local tab_Content = {
		"离开/no",
		"成都/#setpos_step2(1)",
		"襄阳/#setpos_step2(2)",
		"凤翔/#setpos_step2(3)",
		"大理/#setpos_step2(4)",
		"汴京/#setpos_step2(5)",
		"扬州/#setpos_step2(6)",
		"临安/#setpos_step2(7)",
		"村庄/#setpos_step2(8)",
		"门派/#setpos_step2(9)"
	}
	Say("设置下次使用土地符回到的地点", getn(tab_Content), tab_Content);
end;

--选地点
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "离开/no");
	Say("设置下次使用土地符回到的地点", getn(tab_Content), tab_Content);
end;

--选地点
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("你的重生点设置成了"..tab_RevivePos[nIdx][nSubIdx][1], 0);
	Msg2Player("你的重生点设置成了"..tab_RevivePos[nIdx][nSubIdx][1]);
end;

--回城
function gototown()
	
	local tab_Content = {
		"离开/no",
		"城镇/gopos_step2town",
		"村庄/#gopos_step2(8)",
		"门派/#gopos_step2(9)",
		"lv90地图/#gopos_step2lv90()",
		--更改宋金战场名字 - Modified By DinhHQ - 20120604
		"宋金/gopos_step2battle",
		--"七城大战/gopos_sevencityfield"
	}
	Say("神行符，飞到任意要去的地方。", getn(tab_Content), tab_Content);
end;


function gopos_step2town()
	local tab_Content = {
		"离开/no",
		"成都/#gopos_step2(1)",
		"襄阳/#gopos_step2(2)",
		"凤翔/#gopos_step2(3)",
		"大理/#gopos_step2(4)",
		"汴京/#gopos_step2(5)",
		"扬州/#gopos_step2(6)",
		"临安/#gopos_step2(7)",
	}
	Say("神行符，飞到任意要去的地方。", getn(tab_Content), tab_Content);
end

--神行符－－－－第二步
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "离开/no");
	Say("神行符，飞到任意要去的地方。", getn(tab_Content), tab_Content);
end;

--神行符－－－－第三步
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);
	
	if (not nPosX or not nPosY) then
		return
	end;
	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("坐好咯，我们去"..tab_RevivePos[nIdx][nSubIdx][1].."咯");
end;


tab_lv90map = {
--		{875,1576,3177	,"黑沙洞",},
		{322,1589,3164	,"长白山北麓",},
		{321,967,2313	,"长白山南麓",},
		{75,1811,3012	,"蚩尤洞迷宫",},
		{227,1588,3237	,"沙漠迷宫3",},
		{225,1474,3275	,"沙漠迷宫1",},
		{226,1560,3184	,"沙漠迷宫2",},
		{336,1124,3187	,"风陵渡",},
		{340,1845,3438	,"莫高窟",},
		{144,1691,3020	,"药王洞四层",},
		{93,1529,3166	,"荐菊洞密宫",},
		{124,1675,3418	,"轩辕洞迷宫",},
		{152,1672,3361	,"雪豹洞迷宫八层",},
--		{325,1569,3086	,"金方报名处",},
--		{325,1541,3178	,"宋方报名处",},
	}

function gopos_step2lv90(ns, ne)
	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv90map);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90map[i][4].."/#gopos_step3lv90( "..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "上一页/#gopos_step2lv90( 1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "下一页/#gopos_step2lv90( "..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "取消/no");
	Say("神行符，飞到任意要去的地方。", getn(tab_Content), tab_Content);
end


function gopos_step3lv90(nIdx)
	NewWorld(tab_lv90map[nIdx][1], tab_lv90map[nIdx][2], tab_lv90map[nIdx][3])
	SetFightState(1);
	Msg2Player("坐好咯，我们去"..tab_lv90map[nIdx][4].."咯");
end


function gopos_step2battle()
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "风云论剑艰苦残酷，你还未达到120级，请继续联系再说." );
	else
		Say ( "神行符，飞到任意要去的地方。是否要前往宋金战场？", 3, "宋军报名点/#DoRescriptFunc(1)", "金军报名点/#DoRescriptFunc(2)","嘘...我是逃兵/no" );
	end;
end

function gopos_sevencityfield()
	Say("七城大战传送，请选择要前往的城市？", 8,
		"成都战场/#goto_sevencityfield(1)",
		"襄阳战场/#goto_sevencityfield(2)",
		"凤翔战场/#goto_sevencityfield(3)",
		"大理战场/#goto_sevencityfield(4)",
		"汴京战场/#goto_sevencityfield(5)",
		"扬州战场/#goto_sevencityfield(6)",
		"临安战场/#goto_sevencityfield(7)",
		"结束/Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end

function DoRescriptFunc(nSel)
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "风云论剑艰苦残酷，你还未达到120级，请继续联系再说." );
		return
	end
	local tbsongjin_pos = {1608,3254};	--宋方坐标点
	local szstr = "宋军报名点";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "金军报名点";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "初级宋金战场" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "中级宋金战场" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "高级宋金战场" );
	end
end


function no()
end
