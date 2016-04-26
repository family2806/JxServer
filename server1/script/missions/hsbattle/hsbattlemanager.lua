--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc

Include("\\script\\missions\\hsbattle\\hshead.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\missions\\huashanqunzhan\\dailog.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
--[DinhHQ]
--20110330: change request 30/03/2011
do
	Talk(1, "", "功能暂时关闭")
	return
end
	local tbSay = 
	{
		"<dec><npc>大侠找我有什么事？",
		"华山绝顶擂台/HSBattle_Dailog_Main",
	}
	tinsert(tbSay, "华山擂台/#huashanqunzhan_SignUpMain(1)")
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay)
end;


function HSBattle_Dailog_Main()
	--设置返回点
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("目前依然没有人报名擂台单挑，义士想试试吗?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("目前依然没有任何帮会报名比赛! 义士想试试吗?", 3, "可以!/OnRegister", "帮会擂台规则是怎么样的？/OnHelp", "让我想想!/OnCancel");
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	
	SubWorld = OldSubWorld;
end


function OnHelp()
	Talk(8, "",	"帮会擂台是江湖上个帮会学习武艺的地方，这是公平比赛的地点",	"想参加帮会擂台，首先需要来见我申请，申请人需要是比赛帮会的帮主。",	"组队后，2边队长将来报名，两边帮主每人需要付1000万两. ",	"付完后，比赛申请结束。在其他2个帮会比赛的时候，不能报名",	"申请成功后，两边成员有10分钟进入斗场。然后，比赛正式开始!" ,"胜败取决于双方的积分数量。玫瑰帮会成员让对方重伤的，将获得3分，对方被扣除1分", 	"比赛结束，哪个帮会的积分高，将获得胜利!",	"此外，在比赛时，如果有一边没有比赛成员了，那胜利将属于另一方. ","战胜的帮会可以收回500万两，此外还能获得400万两赏金和12000点经验值；输的一方不能拿回已付的钱，还要被扣除14000点帮会经验值. ");
end;

function OnRegister()
--报名
	if (GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		return
	else
		if (IsCaptain() ~= 1) then 
			ErrorMsg(5)
			return
		end;
		
		OldPlayer = PlayerIndex;
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
			if (GetTongFigure() ~= TONG_MASTER or GetCash() < MS_SIGN_MONEY) then 
				PlayerIndex = OldPlayer
				ErrorMsg(2)
				return
			end;
		end;
		PlayerIndex = OldPlayer;
		
		TongIdTab = {};
		TongNameTab = {};
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
				if (Pay(MS_SIGN_MONEY) == 0) then
					WriteLog(GetTongName().."帮会交"..MS_SIGN_MONEY.."帮会擂台比赛操作费不成功!!!! ");
					PlayerIndex = OldPlayer
					ErrorMsg(3)
					return
				else
					TongNameTab[i], TongIdTab[i] =  GetTongName();
					WriteLog(TongNameTab[i].."帮会交"..MS_SIGN_MONEY.."帮会擂台比赛操作费成功! ");
				end;
		end;
		PlayerIndex = OldPlayer;
		
		OldSubWorld = SubWorld;
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then
			ErrorMsg(3) 
			return
		end;
		SubWorld = idx;
		
		OpenMission(MISSIONID);
		for i  = 1, 2 do 
			SetMissionV(MS_TONG1ID + i - 1, TongIdTab[i]);
		end;
		
		SetMissionS(1, TongNameTab[1]); --1、2两个MissionString存放帮会的名称
		SetMissionS(2, TongNameTab[2]);
		
		str = "<#> 开始帮会擂台，两边为"..TongNameTab[1].."<#> 和"..TongNameTab[2];
		AddGlobalNews(str);
		SubWorld = OldSubWorld;
		Msg2Team("各位已完成报名，请准备。10分钟后将正式开战");
		Say("各位已完成报名，请准备。10分钟后将正式开战",0);
	end;
end;

function OnReady()
	str = "<#> 目前帮会擂台正处于进入斗场阶段，请"..GetMissionS(1).."<#> 和"..GetMissionS(2).." 帮会成员<#> 快点进入斗场，准备开始比赛!";
	Say(str, 2, "我适合条件，我想进入斗场/OnJoin", "我想借此机会帮助大家变得更强大 /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("双方帮会想申请比赛，首先要建立组队后才能申请. ",0)
elseif (ErrorId == 2) then 
	Say("报名帮主需是目前队伍的队长，而且要带够500万两",0)
elseif (ErrorId == 3) then 
	Say("报名出现故障，请联系管理员 ",0);
elseif (ErrorId == 4) then 
	Say("你不是正在比赛的帮会的成员，不能进入!", 0);
elseif(ErrorId == 5) then 
	Say("报名帮主需是目前队伍的队长",0);
else
	
end;

return
end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	if (GetTongName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetTongName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 2) then
		SetFightState(1)
	elseif(ms_state == 1) then  
		SetFightState(0)
	else
		return
	end;
	SubWorld=OldSubWorld
	
end;

function OnFighting()
	str = "<#> 目前帮会擂台正在进行比赛，请"..GetMissionS(1).."<#> 和"..GetMissionS(2).."<#> 帮会成员进入比赛斗场!";
	Say(str, 2, "我符合条件，我想进入斗场/OnJoin", "我不符合条件，我不想进入! /OnCancel");
end;

function OnCancel()
end;
