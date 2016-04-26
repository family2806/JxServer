----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	周末活动：卫国战争之烽火连城
--			功能：报名点报名官
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
CD_SIGNNPCNAME = "守城将军"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "宋方"
		defencemap = tbDEFENCE_MAPID[1]
		defencesidx = SubWorldID2Idx( defencemap )
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "金方"
		defencemap = tbDEFENCE_MAPID[2]
		defencesidx = SubWorldID2Idx( defencemap )
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."守城将军"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": 小鬼从哪里来？不想活了啊？等级还不够!"..CD_LEVEL_LIMIT.."级，跑到前线，你以为这是哪里？不要乱走，否则，怎么死的都不知道!")
		Msg2Plalyer("最大等级"..CD_LEVEL_LIMIT.."级才能参加卫国战争.")
		return
	end
	local oldSubWorld = SubWorld
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": 前方战场发生问题，暂时不能进入.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":没有事禀报，不要来打扰我!", 0)
		Msg2Player("卫国烽火连城"..cityname.."守城活动还未开始.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	local time = GetMissionV(MS_SMALL_TIME)
	SubWorld = oldSubWorld
	
	if (time >= CALLBOSS_ZHUSHUAI) then
		Say(CD_SIGNNPCNAME..":我的援军已被敌军打撒，不能到这里了!", 2, "聚集点/OnCancel", "论功行赏/cd_awardforpayout")
		return
	end
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": 你是谁 ", CD_SIGNNPCNAME..": 啊，你想帮我抗敌？你真是爱国。我军兵力已足，你好心一片，但是，请你还是回去吧。")
		Msg2Player("参加卫国战争的人数已够<color=yellow>"..MAX_MEMBERCOUNT.."<color>人，不能进入战场了.")
		return
	end
	
--	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--不允许报名
--		Say(CD_SIGNNPCNAME.."：卫国战争之烽火连城活动一天只能参加一场，你还是好好养精蓄锐，下次再来吧。", 0)
--	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--允许报名
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then	--允许报名
		Say(CD_SIGNNPCNAME..": 李儿，你小子快去叫信使来这，敌军又打到了。你是谁？现在是什么时候？有人正在进攻我的城池，你还延迟军机，将被杀头，知道吗?", 3, "将军，我来帮守城!/#want2joincd1("..defencemap..")", "论功行赏/cd_awardforpayout", "厖 (你不说什么，只是笑了一声就走了) /laughtoleave")
		cd_clear_lastsumexp();		--清除上次计算的累计经验值
	else
		Say(CD_SIGNNPCNAME..": 额，你不是进入战场了吗？难道是我眼花了？<enter>好了，你准备进去吧！", 3, "我想加入/#sure2joincd("..defencemap..")", "论功行赏/cd_awardforpayout", "我只是路过/OnCancel")
	end
end

function sure2joincd(defencemap)
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": 前方战场出现问题，暂时不能进去.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	local time = GetMissionV(MS_SMALL_TIME)
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	if (time >= CALLBOSS_ZHUSHUAI) then
		SubWorld = oldSubWorld
		return
	end
	if (memcount >= MAX_MEMBERCOUNT) then
		SubWorld = oldSubWorld
		return
	end
	local randkey = GetMissionV( MS_RANDKEY )
	local nday = tonumber(date("%m%d"))
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then
		if (Pay(FIRE_JOINUP_FEE) == 1) then
			SetTask( TASKID_FIRE_DAY,  nday)
			SetTask( TASKID_FIRE_KEY,  randkey)
		else
			Say(CD_SIGNNPCNAME..": 怎么了，你没有带"..floor(FIRE_JOINUP_FEE / 10000).." 万两，我不能给你进去。准备好钱了再来找我!", 0);
			return -1;
		end;
	end;
	cd_setsign_levelexp();
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1(defencemap)
	Say(CD_SIGNNPCNAME..": 啊，你想帮我抗敌？哎呀，这几个不像一般的士兵，他们武艺高强，骑马很厉害，还知道放暗器。", 1, "将军，你没事吗？/#want2joincd2("..defencemap..")")
end

function want2joincd2(defencemap)
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SetTask(TSKID_PLAYER_ZHANGONG,0) --清空战功值
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": 行了，不用多说，但是，我感觉他们的来历很可疑，在战斗时，如果你捡到书信，就带来给我看，我将重赏你。参加守城的人数为<color=yellow>"..cd_membercount.."<color>人。首先要交10万报名费，准备好了吗?", 2, "对!/#sure2joincd("..defencemap..")", "让我先准备一下!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME.."我不怕他们，要让他们知道中原人士的厉害")
end

function cd_awardforpayout()
	if (camp == 1) then
		Talk(1, "", format("%s: 听着，大家要全力以赴地战斗.", CD_SIGNNPCNAME))
	else
		Talk(1, "", format("%s: 南蛮军还未泄气，我们决心夺取战利品，士兵们要抛头颅洒热血才行。各位勇士决战吧。", CD_SIGNNPCNAME))
	end;
end;

function OnCancel()
end