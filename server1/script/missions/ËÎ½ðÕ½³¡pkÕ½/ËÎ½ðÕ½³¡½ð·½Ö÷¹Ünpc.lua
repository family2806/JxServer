--接任务的Npc
--·参与的玩家等级必须大于40级；
--·宋方的玩家必须要到衡山独孤剑处报名；
--·金方的玩家必须要到汴京衙门口金国武将处报名；
--·报名时需要交纳一定的金钱；
-- Update by Dan_Deng(2003-10-23) 通过对话切换到战场外的，需要更改战斗状态为1

Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");


function main()


local State = GetMissionV(1) 

--未开始
if (State == 0 ) then 
	Say("我大军还未出发，请暂时休息等信息!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--异常情况直接退出
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--如果该玩家是已经报名过的，断线重连进来的，则扔进去
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--此句话是敌方玩家与对方的报名Npc的对话
	--比如 你们这些宋国的草民!我们大金国将士们各各善战智勇,铁骑纵横......等，有得是眼色看
	Say("我们金国，谁都骁勇善战，你们宋国人怎么能配得上是对手呢?!",0)
end

--报名时期
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--此句话是本方已报名的玩家与报名Npc的对话
    		Say("死也要忠诚于大金国，各位金国勇士!",0)
  		else
    		Say("我们金国，谁都骁勇善战，你们宋国人怎么能配得上是对手呢?!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("我们的军力目前已够消灭宋国，壮士请等下一次吧!", 0)
	return
	end;
	
	--比如,目前宋国国力不振，宋国百姓生灵涂炭，我们大金国。。。。
	Say("宋朝已到快败亡的时候了，各位想和我们一起享受荣华富贵吗？只需要达到40级以上，支持3000两就能冲锋杀敌!",2, "我参加. /Yes", "让我想想!/No");
end;

--交战时期
if (State == 2) then 
	--此为在战斗正式打响之后，其它未报名玩家与报名Npc的对话
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
  Msg2Player("欢迎你的加入，金国的勇士，赶快进入战场吧!");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
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

