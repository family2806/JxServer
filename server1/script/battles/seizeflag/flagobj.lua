IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
npcidx = GetLastDiagNpc();

--该旗同时被另一个人拿走了，则不再操作
if (GetNpcParam(npcidx, 4) == 0 ) then
	return
end;

if (GetMissionV(MS_STATE) ~= 2) then
	delnpcsafe(npcidx);
	print("flagobj Event error, because Mission no Start, yet");
	return 
end;

--固定模式时，不能拿敌方的棋
if (GetMissionV(MS_FLAGMODE) == 1) then
	if (GetNpcParam(npcidx, 3) ~= GetCurCamp()) then
		Msg2Player("你必须运送己方的帅旗！")
		return
	end
end

	if (BT_GetData(PL_PARAM1) ~= 0 or BT_GetData(PL_PARAM2) ~= 0) then
		Msg2Player("你已经是旗手了，不能再夺其它的旗子！");
		return
	end

	x = GetNpcParam(npcidx, 1);
	y = GetNpcParam(npcidx, 2);
	
	ChangeOwnFeature(0,0,643);
	
	BT_SetData(PL_PARAM1, x)
	BT_SetData(PL_PARAM2, y)


	Msg2Player("你夺到了帅旗，需要使用旗标将旗插到<color=yellow>"..floor(x/(32*8)).."，"..floor(y/(32*16)));
	W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>宋方<color=yellow>"..GetName().."<color=0x00FFFF>在<color=yellow>"..floor(X1/8).."，"..floor(Y1/16).."<color=0x00FFFF>位置夺取帅旗，目前正前往<color=yellow>"..floor(x/(32*8)).."，"..floor(y/(32*16)))
		AddSkillState(460, 1, 0, 1000000 ) --颜色光环，分辩敌我
		AddSkillState(656,30,0,100000) --降玩家的速度
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(1, PlayerIndex)
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>金方<color=yellow>"..GetName().."<color=0x9BFF9B>在<color=yellow>"..floor(X1/8).."，"..floor(Y1/16).."<color=0x9BFF9B>位置夺取帅旗，目前正前往<color=yellow>"..floor(x/(32*8)).."，"..floor(y/(32*16)))
		AddSkillState(461, 1, 0, 1000000 ) --颜色光环，分辩敌我
		AddSkillState(656,30,0,100000) --降玩家的速度
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(2, PlayerIndex)
	end
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
