-- 粮食包
IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	local npcidx = GetLastDiagNpc();
	
	-- 该旗同时被另一个人拿走了，则不再操作
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end;
	
	-- 不是在进行中
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("flagobj Event error, because Mission no Start, yet");
		return 
	end
	
	-- 玩家已经在运粮时，不能拿七另一袋
	if (BT_GetData(PL_PARAM3) ~= 0) then
		Msg2Player("您正在运一包粮食,不能再多运其他包了。");
		return
	end
	
	-- 无论哪方遗留的粮食包，都可以运送——当然是运回本方大营
	BT_SetData(PL_PARAM3, 1);
	
	Msg2Player("您正在扛一包粮食，快点运到本方阵营.");
	if (GetCurCamp() == 1) then
		ChangeOwnFeature(0,0,1341);	-- 改变玩家形象为运粮包的样子
	else
		ChangeOwnFeature(0,0,1342);	-- 改变玩家形象为运粮包的样子
	end
	
	local W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe 宋<color=yellow>%s<color=0x00FFFF> 在 <color=yellow>%d, %d<color=0x00FFFF> 夺得粮食包, 正返回<color=yellow>本营",
										GetName(),X1,Y1))
		AddSkillState(460, 1, 0, 1000000 ) --颜色光环，分辩敌我
	else
		Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t筰 <color=yellow>%d, %d<color=0x9BFF9B> 夺得粮食包, 正返回<color=yellow>本营",
										GetName(),X1,Y1))
		AddSkillState(461, 1, 0, 1000000 ) --颜色光环，分辩敌我
	end
		
	AddSkillState(656,30,0,100000) --降玩家的速度
	
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
