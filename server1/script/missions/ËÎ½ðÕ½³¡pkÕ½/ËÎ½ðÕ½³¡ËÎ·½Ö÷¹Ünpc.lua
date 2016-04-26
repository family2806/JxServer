--接任务的Npc
--·参与的玩家等级必须大于40级；
--·宋方的玩家必须要到衡山独孤剑处报名；
--·金方的玩家必须要到汴京衙门口金国武将处报名；
--·报名时需要交纳一定的金钱；

Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function main()

local State = GetMissionV(1) 

--未开始
if (State == 0 ) then 
	Say("我大军还未出发，请暂时休息等信息!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--异常情况直接退出
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--如果该玩家是已经报名过的，断线重连进来的，则扔进去
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--此句话是敌方玩家与对方的报名Npc的对话
	Say("你等金人，侵犯我江山，杀害我同胞，我誓与你们杀个你死我活!",0)
end


--报名时期
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("国家兴亡匹夫有责，现在是我们报效祖国的时候了!",0)
  		else
    		Say("你等金人，侵犯我江山，杀害我同胞，我誓与你们杀个你死我活!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("我们的军力目前已够消灭金国，壮士请等下一次吧!", 0)
	return
	end;
	
	Say("国家兴亡匹夫有责，现在是我们报效祖国的时候了，只需要达到40级以上，支持3000两就能冲锋杀敌!",2, "我参加. /Yes", "让我想想!/No");
end;

--交战时期
if (State == 2) then 
	Say("前方正发生战争，各位乡亲请找躲避的地方",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("欢迎你的加入，宋朝的英雄，赶快进入战场吧!");
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("你不够40级或者没有带够钱",0);
end;

function No()
Say("快回去想想，时间不多了!",0);
end;
