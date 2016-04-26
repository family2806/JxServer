--加入某一方的Npc对应脚本
--BattleId外部的全局变量，表示当前挑战赛地图的编号(1-8)

--HaveBeginWar(CityID) -- CityID(1-7)		//现在某个城市是否已开战,返回值为一个BOOL值
--GetCityAreaName(CityID)					//取1到7的城区名称,返回值为一个字符串
--GetCityWarBothSides(CityID)				//获得攻击方与守方的帮会名,返回两个字符串,按次序分别代表攻击方和守方
--NotifyWarResult(CityID, WarResult)		//比赛结束之后，通知Relay比赛结果(WarResult为BOOL值表示攻城方是否胜利)
--GetCityWarTongCamp(TongName)				//获得参与攻城战相关活动的帮会阵营，返回INT即阵营代表值
--IsArenaBegin(ArenaID) -- ArenaID(0-7)		//获得当前各个擂台场区是否开始，返回BOOL
--GetArenaCityArea(nArenaID)				//获得当前正在进行的擂台赛是针对哪个城区,返回值为CityID
--GetArenaBothSides(ArenaID)				//获得某一场擂台赛双方的名称,返回两个字符串,按次序分别代表甲方乙方
--NotifyArenaResult(ArenaID, ArenaResult)	//通知一场擂台赛结束的比赛结果给Relay, ArenaResult为BOOL值表示的甲方是否获胜
--GetArenaLevel()							//获得当前擂台赛所在轮次，返回值 0:比赛已经结束或者尚未开始，1:第一轮，2/3/4/5以此类推
--GetArenaTotalLevel()						//获得当前擂台赛的总轮次
--GetCurArenaInfo()							//获得当前轮次的赛程
--GetArenaTotalLevelByCity(CityID)			//获得某个城市擂台赛的总轮次
--GetArenaInfoByCity(CityID, ArenaLevel)	//获得某个城市擂台赛果的数据,ArenaLevel: 0-Based

Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\lib\\common.lua")
function main()
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		WorldID = SubWorldIdx2ID(SubWorld);
		ArenaID = WorldID - 213;
		if (IsArenaBegin(ArenaID) ~= 0) then
			Tong1, Tong2 = GetArenaBothSides(ArenaID);
			Tong1 = safeshow(Tong1)
			Tong2 = safeshow(Tong2)
			Say(Tong1.."和"..Tong2.."立即准备战斗，赛场正准备着，每个人都准备好", 0);
		else
			Say("战斗时间还没有到!", 1, "知道了，我先去/OnCancel");
		end;
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(3)
	end;
end;

function OnHelp()
	Talk(8, "",	"帮会擂台是江湖上个帮会之间切磋武艺的地方！这是一个公平竞争的舞台", "想要参加帮会擂台，要先来向我申请！申请人应该是比赛帮会的帮主！", "组队之后双方队长要来报名。双方帮主每人要交I千万两定金。", "交了定金之后，比赛申请就完成了。在2个班会比赛期间不能报名", "申请成功，双方队员有10分钟加入比赛。之后比赛将正式开始!","胜负将计入双方的比赛积分。每位帮会成员将对方打重伤的将有3个积分，对方被扣除1个积分", "比赛结束，积分高的帮会将取得胜利！", "此外，比赛中有一边没有成员再比赛则胜利属于另外一边", "胜利的帮会将可以收回已缴纳的1千万两，此外，还可以得到800万两的奖励和1万2千点帮会经验。失败的帮会不能领回已缴纳的费用，还要扣除1万4千点帮会经验");
end;

function OnReady()
	V = GetMissionV(MS_NEWSVALUE);
	RestTime = (GO_TIME - V) * 20;
	
	if (RestTime < 0) then 
		RestTime=0
	end;
	
	RestMin, RestSec = GetMinAndSec(RestTime);

	str = "<#>这里正进行比赛"..GetMissionS(3).."<#>攻城挑战，现在比赛帮会是:"..GetMissionS(1).."<#> 对"..GetMissionS(2).."<#>, 入场时间还有"..RestMin.."<#> 分"..RestSec.."<#> 秒.";
	Say(str, 2, "我符合条件，想要上赛场 /OnJoin", "我不想上赛场/OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("想要申请比赛的双方帮主要先组队之后再申请比赛",0)
elseif (ErrorId == 2) then 
	Say("来报名的要是想参加比赛的帮会队长，帮主要带够1000万两",0)
elseif (ErrorId == 3) then 
	Say("报名故障，请联系管理人员！",0);
elseif (ErrorId == 4) then 
	Say("你不是比赛双方帮会的成员或者赛场中的人数已满，不能进去!", 0);
elseif(ErrorId == 5) then 
	Say("报名帮主是要现在队伍的队长",0);
else
	
end;

return
end;

function OnJoin()
	if (GetTongName() == GetMissionS(1)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(1);
		else
			Say("你加入帮会的时间太短了，不能参加战斗!", 0);
		end;
	elseif (GetTongName() == GetMissionS(2)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(2);
		else
			Say("T你加入帮会的时间太短了，不能参加战斗!", 0);
		end;
	else
		ErrorMsg(4)
	end;
end;

function OnFighting()
	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#>现在双方的人数是"..GetMSPlayerCount(MISSIONID, 1).."<#> "..GetMSPlayerCount(MISSIONID, 2).."<#>. 时间还剩余"..RestMin.."<#>分 "..RestSec.."<#>秒.";
	str = "<#>现在帮会"..GetMissionS(1).."<#>和"..GetMissionS(2).."<#>正在进行";
	Say(str..str1, 0);
end;

function OnCancel()

end;
