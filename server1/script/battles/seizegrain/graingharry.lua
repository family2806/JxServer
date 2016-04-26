IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

-- 运粮车
-- Param3	粮车阵营
-- Param4	粮车剩余粮食包的数量

function main()
	local npcidx = GetLastDiagNpc();
	local ncount = GetNpcParam(npcidx, 4);
	local ngharry_camp = GetNpcParam(npcidx, 3);
	local n_gharry_x = GetNpcParam(npcidx, 1);
	local n_gharry_y = GetNpcParam(npcidx, 2);
	-- 该旗同时被另一个人拿走了，则不再操作
	if (ncount == 0 ) then
		return
	end;
	
	-- 不是在进行中
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("graingharry Event error, because Mission no Start, yet");
		return 
	end
	
	local n_player_camp = GetCurCamp();
	local W,X1,Y1 = GetWorldPos();
	X1 = floor(X1 / 8);
	Y1 = floor(Y1 / 16);
	
	if (ngharry_camp == GetCurCamp()) then	-- 同属阵营的 可以搬运
	-- 玩家已经在运粮时，不能拿另一袋
		if (BT_GetData(PL_PARAM3) ~= 0) then
			Msg2Player("您正运输一包粮食, 不能再运输其他粮食了");
			return
		end
		-- 减少一个粮车中粮食包的数量
		ncount = ncount - 1;
		SetNpcParam(npcidx,4,ncount);
		--1341
		--1342
		if (ngharry_camp == 1) then
			ChangeOwnFeature(0,0,1341);	-- 改变玩家形象为运粮包的样子
		else
			ChangeOwnFeature(0,0,1342);	-- 改变玩家形象为运粮包的样子
		end
		
		BT_SetData(PL_PARAM3, 1);
		
		Msg2Player("您正在扛一包粮食，快点运到<color=yellow>本营<color> 本方.");
		
		if (n_player_camp == 1) then
			Msg2MSAll(MISSIONID, format("<color=0x00FFFF>宋方<color=yellow>%s<color=0x00FFFF>在<color=yellow>%d, %d<color=0x00FFFF> 夺得粮包，正返回<color=yellow>本营",
										GetName(),X1,Y1))
			AddSkillState(460, 1, 0, 1000000 ) --颜色光环，分辩敌我
		else
			Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>金方<color=yellow>%s<color=0x9BFF9B> 在 <color=yellow>%d, %d<color=0x9BFF9B> 夺得粮包，正返回<color=yellow>本营",
											GetName(),X1,Y1))
			AddSkillState(461, 1, 0, 1000000 ) --颜色光环，分辩敌我
		end
		
		AddSkillState(656,30,0,100000) --降玩家的速度
	else									-- 对立阵营的火石烧毁
		local n_flint = CalcItemCount(3, 6, 1, 1763,-1);	-- 背包中的火石数量
		if (n_flint > 0) then
			ConsumeItem(-1,1,6,1,1763,-1);	-- 删除玩家一个火石
			ncount = 0;						-- 销货粮食车
			SetNpcParam(npcidx, 4, 0);
			delnpcsafe(npcidx);
			n_new_npcidx = sf_addgharry(ngharry_camp, n_gharry_x, n_gharry_y, 1);
			if (n_new_npcidx > 0) then
				AddNpcSkillState(n_new_npcidx, 705, 1,0, 10080)
				
				if (n_player_camp == 1) then
					Msg2MSAll(MISSIONID, format("<color=0x00FFFF>宋方<color=yellow>%s<color=0x00FFFF> 在 <color=yellow>%d, %d<color=0x00FFFF> 已烧毁一粮车.",
												GetName(),X1,Y1));
				else
					Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>金方 <color=yellow>%s<color=0x9BFF9B> 在 <color=yellow>%d, %d<color=0x9BFF9B> 已烧毁一粮车.",
												GetName(),X1,Y1));
				end
			end
			return 0;
		else
			Msg2Player("需要<color=yellow>火石<color> 才能烧毁粮车.");
		end
	end
	
	if (ncount <= 0)  then
		delnpcsafe(npcidx);
	end
end;


-- 死亡
function OnDeath( nNpcIndex )
	local State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	--如果是死于其它Npc则不统计排行
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end;
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK5, GetCurCamp()))-- 加积分 烧毁相当于杀一个大将
	
	BT_SortLadder();
	BT_BroadSelf();
end;
