Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\missions\\bw\\bwhead.lua");


szCaptainName = {};
function main()
do Talk(1, "", "擂台暂未开放.") return end
	--设置返回点
	x,y,z = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, x);
	SetTask(BW_SIGNPOSX, y);
	SetTask(BW_SIGNPOSY, z);
	szCaptainName = bw_getcaptains(); --获取两队队长的名字；

	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local MemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("这是给江湖人士单打或组队比赛的擂台比赛场，现在还没有人报名比赛，阁下想报名吗？<color=yellow>现在擂台免费开放<color>", 3, "好吧!/OnRegister", "比赛该规则是什么?/OnHelp", "我想一下!/OnCancel");
	elseif (ms_state == 1) then
		Say("这是擂台场，现在队<color=yellow>"..szCaptainName[1].."<color> 和队<color=yellow>"..szCaptainName[2].."<color> 比赛<color=yellow>"..MemberCount.." vs "..MemberCount.."<color>, 你有什么要求吗?",4,"我是选手，想上擂台./OnShowKey", "我是选手，想进入赛场./OnEnterMatch", "我想看这场比赛./OnLook", "我对比赛没有兴趣./OnCancel")
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	SubWorld = OldSubWorld;
end;

function OnRegister()
	--报名
	if (GetTeamSize()  ~= 2) then
		Say("想报名比赛要是<color=yellow>队长<color> 双方，你的队伍好像人不够<color=yellow>2<color>人.", 0);
		return
	end;

	if (IsCaptain() ~= 1) then 
		ErrorMsg(5)
		return
	end;

	Say("阁下想擂台比赛, 双方最多多少人?", 9, "离开!/OnCancel", "1 vs 1/#SignUpFinal(1)", "2 vs 2/#SignUpFinal( 2 )", "3 vs 3/#SignUpFinal( 3 )","4 vs 4/#SignUpFinal( 4 )","5 vs 5/#SignUpFinal( 5 )","6 vs 6/#SignUpFinal( 6 )","7 vs 7/#SignUpFinal( 7 )","8 vs 8/#SignUpFinal( 8 )");
end;

function SignUpFinal(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("想要报名比赛应该是 <color=yellow>队长<color> 双方，你的队伍好像不够<color=yellow>2<color> 人.", 0);
		return
	end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return
	end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	ms_state = GetMissionV(MS_STATE);

	if (ms_state ~= 0) then 
		ErrorMsg(8)
		return
	end
	OpenMission(BW_MISSIONID);
	local x = GetTask(BW_SIGNPOSWORLD);
	if x == 80 then
		SetMissionS(CITYID,"扬州")
	elseif x == 78 then
		SetMissionS(CITYID,"襄阳")
	else
		SetMissionS(CITYID,"成都")
	end;
	
	local key = {};
	key = bw_getkey();
	SetMissionV(MS_TEAMKEY[1], key[1]);
	SetMissionV(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		SetMissionS(i, GetName());
		szCaptainName = bw_getcaptains(); --获取两队队长的名字；
		if (MemberCount > 1) then
			Msg2Player("阁下上场的队形是: <color=yellow> ["..key[i].."]<color>, 请告诉给队员。成员见到公平司输入进场数字后便可上场.");			
			local szMsg = format("公平司: 你在 %s和%s之间登记比赛，赶快入场，比赛在 %d分钟后正式开始。比赛号是:<color=yellow>[%d]<color=>, 把这个数字通报给队员，要用这个数字上场.",MemberCount, MemberCount, floor(GO_TIME/3),key[i])
			Say(szMsg,0)
			
		end
		branchTask_BW1()	--和任务相关，参加了比赛进行计数
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMissionV(MS_MAXMEMBERCOUNT, MemberCount)
	SubWorld = OldSubWorld;
	str = "<#> 现在"..GetMissionS(CITYID)..szCaptainName[1].."队<#> 比赛和"..szCaptainName[2].."对<#>, 比赛擂台准备开始比赛，双方队长是"..szCaptainName[1].."<#>和"..szCaptainName[2].."<#>. 擂台免费开放，欢迎各位观看比赛.";
	--AddGlobalNews(str);
	local szMsg = format("你已登记在%s和%s之间比赛, 赶快上场，%d分钟后比赛正式开始.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function bw_getkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	--保证key1 key2>0, key1 ~= key2
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function OnHelp()
	Talk(5, "",	"比赛擂台是相互切磋和对双方最公平的地方.",	"想参加擂台比赛，要先到我这里报名.",	"交了保证金之后，报名参加擂台比赛就完成了，由于赛场有界限，因此在有人比赛时候别人不能报名!",	format("公平司: 登记成功之后，双方可以到准备区，准备时间是 <color=yellow>%d<color> 分, 准备时间结束后，比赛将正式开始!", floor(GO_TIME/3)) , 	format("公平司: 比赛时间是<color=yellow>%d<color> 分, 如果在 %d分钟还没有确定赢的队，比赛为和局.", floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3), floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3) ));
end;

function OnEnterMatch()
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2])) then 
		OnJoin(0)	--这里号码什么都可以 the only param stand for the group ID;
	else
		Say("请输入这次的擂台比赛序号上场.",2, "好了，等我上去/OnEnterKey", "忘记序号了，等我问问队长/OnCancel")
	end;
	SubWorld = OldSubWorld;
end

function OnEnterKey()
	AskClientForNumber("OnEnterKey1", 0, 10000, "请输入比赛序号:");
end

function OnEnterKey1(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		OnJoin(1)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		OnJoin(2)
	else
		Say("不好意思！输入的序号不对，再确定一次或者去问队长，谢谢!",0)
	end
	SubWorld = OldSubWorld;
end

function OnLook()
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local str = szCaptainName[1].."队<#> 和 "..szCaptainName[2].."队 <#> 准备开始擂台比赛了，阁下觉得谁会取得最终胜利?";
	local str1 = "我想进赛场<#> xem/onwatch";
	Say(str, 2, str1, "我猜的不对，不进去了/OnCancel");
	SubWorld = OldSubWorld;
end;

function onwatch()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2]) then 
		SubWorld = OldSubWorld
		OnJoin(0)	--队长不能进行观战
	else
		OnJoin(3);	--加入到观众的
	end;
end

--to join in a fight group	group --组
function OnJoin(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) then 
		JoinCamp(1)
	elseif (GetName() == szCaptainName[2]) then 
		JoinCamp(2)
	elseif (group == 1 or group == 2) then
		local masteridx = SearchPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			JoinCamp(group)
		else
			ErrorMsg(10)
		end;
	elseif (group == 3) then
		JoinCamp(3);
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
end;

function OnFighting()
	str = "<#> 现在"..szCaptainName[1].."队<#> v和"..szCaptainName[2].."队<#> 正在比赛. ";
	Say(str, 1, "知道了. /OnCancel");
end;

function OnCancel()
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("报名参加比赛要两个人组队之后才可以报名!",0)
	elseif (ErrorId == 2) then 
		Say("参加比赛的双方没有带够银两.",0)
	elseif (ErrorId == 3) then 
		Say("报名出错，请联系GM!",0);
	elseif (ErrorId == 4) then 
		Say("你不是报名参赛选手因此不能入赛场只能观看!", 0);
	elseif (ErrorId == 5) then 
		Say("报名人必须是队长",0);
	elseif (ErrorId == 6) then 
		Say("你带的银两不够!",0);
	elseif (ErrorId == 7) then 
		Say("不好意思，你还没有报名观看比赛!",0);
	elseif (ErrorId == 8) then
		Say("不好意思！赛场之前已经有人登记了!",0);
	elseif (ErrorId == 9) then 
		Say("不好意思！比赛已经开始了，你不能交定金了!",0);
	elseif (ErrorId == 10) then 
		Say("比赛人数已满!",0);
	else
		
	end;
	return
end;