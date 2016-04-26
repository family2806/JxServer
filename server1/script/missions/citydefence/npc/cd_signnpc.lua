----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ������㱨����
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
CD_SIGNNPCNAME = "�سǽ���"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "�η�"
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "��"
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."�سǽ���"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": С�������������������𣿵ȼ���������"..CD_LEVEL_LIMIT.."�����ܵ�ǰ����������Ϊ�������ģ���Ҫ���ܣ���Ȼ�Ļ���ô���Ķ���֪��!")
		Msg2Plalyer("�ȼ�����"..CD_LEVEL_LIMIT.."���ſ��Բμ�����ս��.")
		return
	end
	local oldSubWorld = SubWorld
	signmap = SubWorldIdx2ID( SubWorld )
	defencemap = signmap - 2
	defencesidx = SubWorldID2Idx( defencemap )
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..":ǰ��ս���������⣬��ʱ���ܽ�ȥ.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":û��ʲôҪ����ľͲ�Ҫ������!", 0)
		Msg2Player("�����������"..cityname.."�سǻ��δ��ʼ.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	SubWorld = oldSubWorld
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..":����˭?", CD_SIGNNPCNAME..":����������ҶԿ����ˣ������ǰ������Ҿ��ı������㣬�������ܺã����������ȥ�ɡ�")
		Msg2Player("���ڲμ���������ս���������Ѿ���"..MAX_MEMBERCOUNT.."�ˣ����ܽ���ս��.")
		return
	end
	
	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--��������
		Say(CD_SIGNNPCNAME..": ��������ս���1��ֻ�ܲμ�һ�Σ��´�������!", 0)
	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--������
		Say(CD_SIGNNPCNAME..": �������С�ӸϿ�ȥ����ʹ�������о��ִ�����ˣ�Ŷ������˭��������ʲôʱ���ˣ������ڹ��ҵĳ��ˣ���Ҫ��й¶������Ҫ��նͷ��֪����",2,"������������æ�سǣ�/want2joincd1", "��(��û��˵ʲô��ֻ��Ц��һ��) /laughtoleave")
	else
		Say(CD_SIGNNPCNAME..": �����㲻����ս�������ǲ������ۻ�����enter> ���ˣ���׼����ȥ��!", 2, "�������/sure2joincd", "��ֻ��·������/OnCancel")
	end
end

function sure2joincd()
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ǰ��ս���������⣬��ʱ���ܽ�ȥ.", 0)
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
	Say(CD_SIGNNPCNAME..":��������Ҫ�������ǿ��У���ѽ����Щ�˲�����ͨ��ʿ�����������ո�ǿ����������������Ű�����", 1, "��������û�°�?/want2joincd2")
end

function want2joincd2()
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": ���ˣ���Ҫ��˵����֮�Ҿ��������������ɣ�ս���ڼ�������˼����žʹ����ҿ����������ͣ��μ��سǵ�������<color=yellow>"..cd_membercount.."<color>��. ��׼������ս������?", 2, "�ǵ�!/sure2joincd", "����׼��һ��!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME..": (���µ�ð��")
end

function OnCancel()
end