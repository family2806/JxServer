----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	周末活动：卫国战争之烽火连城
--			功能：报名点报名官
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
CD_SIGNNPCNAME = "守城将军"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "宋方"
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "金方"
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."守城将军"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": 小鬼从哪里来？不想活了吗？等级还不够！"..CD_LEVEL_LIMIT.."级，跑到前线来，你以为这里是哪？不要乱跑，不然的话怎么死的都不知道!")
		Msg2Plalyer("等级高于"..CD_LEVEL_LIMIT.."级才可以参加卫国战争.")
		return
	end
	local oldSubWorld = SubWorld
	signmap = SubWorldIdx2ID( SubWorld )
	defencemap = signmap - 2
	defencesidx = SubWorldID2Idx( defencemap )
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..":前方战场出现问题，暂时不能进去.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":没有什么要禀告的就不要来烦我!", 0)
		Msg2Player("卫国烽火连城"..cityname.."守城活动还未开始.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	SubWorld = oldSubWorld
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..":你是谁?", CD_SIGNNPCNAME..":啊！你想帮我对抗敌人？你真是爱国！我军的兵力充足，你的心意很好，但是请你回去吧。")
		Msg2Player("现在参加卫国连城战争的人数已经够"..MAX_MEMBERCOUNT.."人，不能进入战场.")
		return
	end
	
	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--不允许报名
		Say(CD_SIGNNPCNAME..": 卫国连城战争活动1天只能参加一次，下次再来吧!", 0)
	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--允许报名
		Say(CD_SIGNNPCNAME..": 李二！你小子赶快去叫信使过来，敌军又打过来了！哦？你是谁？现在是什么时候了？有人在攻我的城了，你要是泄露军机是要被斩头的知道吗？",2,"将军！我来帮忙守城！/want2joincd1", "啊(你没有说什么，只是笑了一声) /laughtoleave")
	else
		Say(CD_SIGNNPCNAME..": 啊？你不是上战场了吗？是不是我眼花啊？enter> 算了！你准备进去吧!", 2, "我想加入/sure2joincd", "我只是路过看看/OnCancel")
	end
end

function sure2joincd()
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": 前方战场出现问题，暂时不能进去.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	SetTask( TASKID_FIRE_DAY, tonumber(date("%m%d")) )
	SetTask( TASKID_FIRE_KEY, GetMissionV( MS_RANDKEY ) )
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1()
	Say(CD_SIGNNPCNAME..":啊！你想要帮助我们抗敌？哎呀！那些人不是普通的士兵，他们武艺高强，骑术高明，还会放暗器。", 1, "将军！你没事吧?/want2joincd2")
end

function want2joincd2()
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": 好了！不要多说，总之我觉得他们来历可疑，战斗期间如果有人捡到书信就带给我看，我有重赏！参加守城的人数是<color=yellow>"..cd_membercount.."<color>人. 你准备好上战场了吗?", 2, "是的!/sure2joincd", "我先准备一下!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME..": (害怕得冒汗")
end

function OnCancel()
end