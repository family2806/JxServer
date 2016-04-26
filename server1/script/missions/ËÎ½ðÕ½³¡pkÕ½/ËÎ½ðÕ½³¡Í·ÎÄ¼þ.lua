FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
MAX_S_COUNT = 100;
MAX_J_COUNT = 100;
TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 60 * 60  * FRAME2TIME; -- 交战时间为1小时

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_SJTASKID = 20;
MS_J_DEATHCOUNT = 3; --任务中记录金玩家伤亡数量的变量ID
MS_S_DEATHCOUNT = 4; --任务中记录宋玩家伤亡数量的变量ID

MS_S_SIGHCOUNT  = 5;--任务中宋方共报名的人数
MS_J_SIGHCOUNT  = 6;--任务中金方共报名的人数
MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

MS_S_NPCDEATH = 8; -- 任务中记录宋战斗Npc死亡的数量的任务变量ID
MS_J_NPCDEATH = 9; -- 任务中记录金战斗Npc死亡的数量的任务变量ID

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方

MS_S_SHOWKING = 11; --0 means uncondition, 1 means condition but time no come ,2 mean all condition is ok ,and have showed.
MS_J_SHOWKING = 12;
MS_FIRSTSHOW = 13; --1 means Song , 2 means Jing


SJTASKID = 230; 	--记录玩家当前任务ID
SJTASKVLAUE = 231; 	--记录玩家当前任务的值,记录所属方,宋为1，金为2
SJTASKKEY = 232; 	--记录玩家当前任务的key号
SJKILLNPC = 233; 	--记录玩家杀Npc数量
SJKILLPK = 234; 	--记录玩家PK玩家数量

MS_TOTALPK = 250;	--记录玩家打死其它玩家的总次数
MS_TOTALKO = 251;	--记录玩家在PK战役中被打死的总次数

MS_SHOWKINGCOUNT = 100; --某方Npc伤亡数量，当伤亡数量超过该值时，则主将可能出现
MS_PKCOUNT	= 50;--某方玩家伤亡数量,当数量超过该值，则主将可能出现


GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- 报名时间为半小时
SHOWKINGTIME1 = 3600 * FRAME2TIME / TIMER_1 ;
SHOWKINGTIME2 = 4200 * FRAME2TIME / TIMER_1;

MS_SIGN_MONEY = 3000; --报名费


sj_aryItems = {
	{ "仙草露", {6,1,71,1,0,0}, 20 },
	{ "加跑丸", {6,0,2,1,0,0}, 5 },
	{ "高中丸", {6,0,5,1,0,0}, 5 },
	{ "高闪丸", {6,0,4,1,0,0}, 5 },
	{ "长命丸", {6,0,1,1,0,0}, 5 },
	{ "飞速丸", {6,0,6,1,0,0}, 5 },
	{ "毒防丸", {6,0,10,1,0,0}, 5 },
	{ "冰防丸", {6,0,7,1,0,0}, 5 },
	{ "火防丸", {6,0,9,1,0,0}, 5 },
	{ "雷防丸", {6,0,8,1,0,0}, 5 },
	{ "大力丸", {6,0,3,1,0,0}, 30 },
	{ "烟花", {6,0,11,1,0,0}, 1 },
	{ "玫瑰花雨", {6,0,20,1,0,0}, 2 },
	{ "心心相映符", {6,1,18,1,0,0}, 5 },
		}
-------------------------------------------------------------------------
function GameOver()
idx = 0;

for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1,idx, 0);
	if (idx == 0) then 
 		break
 	end;
	if ( GetMSIdxGroup(1, idx) == 2) then --jing
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(100,45)
--		SetFightState(1)
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 1585,3215);
	else				--song
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0)
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(78,33)
--		SetFightState(1)
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 886,4499);
	end;
end;


end;
-------------------------------------------------------------------------
-------------战斗取消的话，归还玩家的报名费------------------------------
function GiveBackBonus()
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, 0);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(MS_SIGN_MONEY);
 	end;
end;
end
-------------------------------------------------------------------------
function WinBonus(WinGroup, LoserGroup)
resultstr = "";
LCount = GetMissionV(LoserGroup + 4);
WCount = GetMissionV(WinGroup + 4);

TotalMoney = (LCount + WCount) * MS_SIGN_MONEY * 0.9 
Winner = GetMSPlayerCount(1, WinGroup);
if (Winner > 0) then
	Bonus = TotalMoney / Winner;
else 
	Bonus = MS_SIGN_MONEY;
end;

MaxNpc_idx = 0;
MaxPK_idx = 0;
MaxNpc_c = 0;
MaxPK_c = 0;
sj_itemcount = getn(sj_aryItems)
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, WinGroup);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(Bonus + MS_SIGN_MONEY);
   		AddLeadExp(500);				-- By Dan(统率经验从1000改为500)
   		AddRepute(3);					-- By Dan(声望从20改为3)
   		Msg2Player("恭喜贵方获得胜利！你的名望增加3点，统领经验增加500点!")


		randitem = random(1, sj_itemcount);
		if (randitem > 0) then
			local szItemName = sj_aryItems[randitem][1];
			local arySelItemID =  sj_aryItems[randitem][2];
			AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
			Msg2Player("恭喜你获得<#>"..szItemName);
		end;
		
   		
   		if (GetTask(SJKILLNPC) > MaxNpc_c) then 
   			MaxNpc_idx = pidx
			MaxNpc_c = GetTask(SJKILLNPC)
   		end;
   		
   		if (GetTask(SJKILLPK) > MaxPK_c) then 
   			MaxPK_idx = pidx;
			MaxPK_c = GetTask(SJKILLPK)
   		end;
 	end;
end;


-----------杀Npc最多的人得到一件装备
if (MaxNpc_idx > 0) then 
	PlayerIndex = MaxNpc_idx ;
	sex = GetSex();
	if (sex == 0) then --男装
	--给衣服 ,参数为0,2,0-13(0,6 男, 7,13女),8-9,0-4,70-99
		p1 = random(0,6);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> 你杀NPC敌人最高分数为"..GetName().."<#>, 你杀死了"..MaxNpc_c.."<#> 敌人!";
	else
	--给衣服 ,参数为0,2,0-13(0,6 男, 7,13女),8-9,0-4,70-99
		p1 = random(7,13);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> 你杀NPC敌人最高分数为"..GetName().."<#>,你杀死了"..MaxNpc_c.."<#> 敌人!";
	end;
	AddRepute(30)
	Msg2Player("你获得30点名望值和一套装备 !");
end;

-----------PK人数最多的人得到一把武器
if (MaxPK_idx > 0) then
	PlayerIndex = MaxPK_idx ;
	--p1 = random(0,5);
	--p2 = random(8,9);
	--p3 = random(0,4);
	--p4 = random(70,99);
	--AddItem(0,0,p1,p2,p3,p4,7,7,7,0,0,0);
	--Msg2Player("你获得了一把武器!");
	AddRepute(15)
	AddLeadExp(5000);				-- By Dan(统率经验从1000改为500)
	Msg2Player("恭喜，在此次战役中，你是拥有PK值最高的人，获得15点名望值，统领经验增加5000点!")
	resultstr = resultstr .."<#>。PK玩家最高者为"..GetName().."<#>,数量:"..MaxPK_c;
end;

return resultstr;

end;

-------------------------------------------------------------------------
function SJ_JoinJ()
LeaveTeam()
AddMSPlayer(1,2);
SetCurCamp(2);
SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);
SetPos(47584/32, 106880/32);
SetPunish(0);
--SetRevPos(100,45)
SetRevPos(44,50)
SetTempRevPos(44, 1573*32 ,3874 * 32);
SetCreateTeam(0);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 2);
str = GetName().."<#>加入了金方阵营";
Msg2MSAll(1,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\missions\\宋金战场pk战\\主角死亡1.lua");

--此为玩家交了报名费，正式加入队伍是提示对话

Talk(2, "", "金国的勇士，欢迎你的到来！现在宋军尚未出现，大家先稍事休息。", "发现宋军后，大家要听从首领号令，先取宋军主将首级者有重赏!");
end;
-------------------------------------------------------------------------

function SJ_JoinS()
LeaveTeam()
AddMSPlayer(1,1);
SetCurCamp(1);
SetTaskTemp(200,1);
SetFightState(0);
str = GetName().."<#>加入了宋方阵营";
SetDeathScript("\\script\\missions\\宋金战场pk战\\主角死亡.lua");
SetLogoutRV(1);
SetCreateTeam(0);
SetPunish(0)
--SetRevPos(78,33)
SetRevPos(44,49)
SetPos(31168/32, 133472/32);
SetTempRevPos(44, 1515 * 32, 3980 * 32);
Msg2MSAll(1,str);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 1);
SetPKFlag(1)
ForbidChangePK(1);
Talk(2,"","你好，欢迎你加入宋军，现在金兵尚未出现，大家先稍事休息。","一旦前方号角吹响，战斗就会开始。");
end;

-------------------------------------------------------------------------
--Group表示对话的主管是哪方的，1为宋，2为金方
--State表示当前战役的状态
function CheckLastBattle(Group, State)

if (Group == 1) then 
	JoinFun = SJ_JoinS;
else
	JoinFun = SJ_JoinJ;
end;

local MKey = GetMissionV(MS_KEY); --当前战役的唯一Key码
local Taskid = GetTask(SJTASKID); --该战役类型的ID
local TaskV = GetTask(SJTASKVLAUE);

if (Taskid == MS_SJTASKID) then 
	local TaskKey = GetTask(SJTASKKEY)
    if (TaskKey == MKey) then 
		if (TaskV == Group) then
			JoinFun();
			if (State == 2) then
				SetFightState(1);
			end;
			Msg2Player("欢迎你再次回到战场!");
		elseif (State == 2) then
			return 2 --表示非当前阵营
		else 
			return 0
		end
		return 1;
	else
--		Say("你擅离职守来到了错误的战场！",0);
		return 0;
	end;
end;
return 0;
end;
-------------------------------------------------------------------------
function CheckGoFight()
  V1 = GetMissionV(5);
  V2 = GetMissionV(6);
  if (V1 >= MAX_S_COUNT and V2 >= MAX_J_COUNT) then
  	RunMission(1);
  end;
end;
--------------------------------------------------------------------------
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
------------------------检查是否可以让主将出现了--------------------------
function CheckShowKing(Group)

if (Group == 1) then 
	groupvalue1 = MS_S_NPCDEATH; --记录S方Npc死亡数量的参数Id
	groupvalue2 = MS_S_DEATHCOUNT;--记录S方玩家死亡数量的参数Id
else
	groupvalue1 = MS_J_NPCDEATH;
	groupvalue2 = MS_J_DEATHCOUNT;
end;

NpcDCount = GetMissionV(groupvalue1);

if (NpcDCount < MS_SHOWKINGCOUNT) then
	return 0;
end;

PlayerDCount = GetMissionV(groupvalue2);

if (PlayerDCount < MS_PKCOUNT) then
	return 0;
end;

if (Group == 1) then 
	SetMissionV(MS_S_SHOWKING, 1)
else
	SetMissionV(MS_J_SHOWKING, 1)
end;

return 1;

end;

function ShowTheKing(Group)

if (Group == 1) then 
	HideNpc("南宋将军",1);
	str1 = "情报:目前我方战事吃紧，大将军已亲自到阵前督战，誓于阵地共存亡! 将士们加油击退来犯敌军，立保大将军无碍!";
	str2 ="情报:将士们! 敌方伤亡惨重，敌方大将已经坐不住了! 将士们继续努力，杀死敌方大将!";
	Msg2MSGroup(1,str1, 1);
	Msg2MSGroup(1,str2, 2);
	str3 = "<#>宋金大战战役报告:宋方主将已在宋营中出现!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

if (Group == 2) then
	HideNpc("金国大将",1);
	str1 = "情报:目前我方战事吃紧，大将军已亲自到阵前督战，誓于阵地共存亡! 将士们加油击退来犯敌军，立保大将军无碍!";
	str2 = "情报:将士们! 敌方伤亡惨重，敌方大将已经坐不住了! 将士们继续努力，杀死敌方大将!";
	Msg2MSGroup(1,str1, 2);
	Msg2MSGroup(1,str2, 1);
	str3 = "<#>宋金大战战役报告:金国主将已在阵营出现，亲自督战!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

return 1;

end;
