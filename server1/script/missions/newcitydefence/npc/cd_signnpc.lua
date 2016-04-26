----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ������㱨����
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
CD_SIGNNPCNAME = "�سǽ���"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "�η�"
		defencemap = tbDEFENCE_MAPID[1]
		defencesidx = SubWorldID2Idx( defencemap )
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "��"
		defencemap = tbDEFENCE_MAPID[2]
		defencesidx = SubWorldID2Idx( defencemap )
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."�سǽ���"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": С�����������������˰����ȼ���������!"..CD_LEVEL_LIMIT.."�����ܵ�ǰ�ߣ�����Ϊ���������Ҫ���ߣ�������ô���Ķ���֪��!")
		Msg2Plalyer("���ȼ�"..CD_LEVEL_LIMIT.."�����ܲμ�����ս��.")
		return
	end
	local oldSubWorld = SubWorld
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ǰ��ս���������⣬��ʱ���ܽ���.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":û������������Ҫ��������!", 0)
		Msg2Player("�����������"..cityname.."�سǻ��δ��ʼ.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	local time = GetMissionV(MS_SMALL_TIME)
	SubWorld = oldSubWorld
	
	if (time >= CALLBOSS_ZHUSHUAI) then
		Say(CD_SIGNNPCNAME..":�ҵ�Ԯ���ѱ��о����������ܵ�������!", 2, "�i�ۼ���/OnCancel", "�۹�����/cd_awardforpayout")
		return
	end
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": ����˭ ", CD_SIGNNPCNAME..": ����������ҿ��У������ǰ������Ҿ��������㣬�����һƬ�����ǣ����㻹�ǻ�ȥ�ɡ�")
		Msg2Player("�μ�����ս���������ѹ�<color=yellow>"..MAX_MEMBERCOUNT.."<color>�ˣ����ܽ���ս����.")
		return
	end
	
--	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--��������
--		Say(CD_SIGNNPCNAME.."������ս��֮������ǻһ��ֻ�ܲμ�һ�����㻹�Ǻú����������´������ɡ�", 0)
--	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--������
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then	--������
		Say(CD_SIGNNPCNAME..": �������С�ӿ�ȥ����ʹ���⣬�о��ִ��ˡ�����˭��������ʲôʱ���������ڽ����ҵĳǳأ��㻹�ӳپ���������ɱͷ��֪����?", 3, "�������������س�!/#want2joincd1("..defencemap..")", "�۹�����/cd_awardforpayout", "�� (�㲻˵ʲô��ֻ��Ц��һ��������) /laughtoleave")
		cd_clear_lastsumexp();		--����ϴμ�����ۼƾ���ֵ
	else
		Say(CD_SIGNNPCNAME..": ��㲻�ǽ���ս�������ѵ������ۻ��ˣ�<enter>���ˣ���׼����ȥ�ɣ�", 3, "�������/#sure2joincd("..defencemap..")", "�۹�����/cd_awardforpayout", "��ֻ��·��/OnCancel")
	end
end

function sure2joincd(defencemap)
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": ǰ��ս���������⣬��ʱ���ܽ�ȥ.", 0)
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
			Say(CD_SIGNNPCNAME..": ��ô�ˣ���û�д�"..floor(FIRE_JOINUP_FEE / 10000).." �������Ҳ��ܸ����ȥ��׼����Ǯ����������!", 0);
			return -1;
		end;
	end;
	cd_setsign_levelexp();
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1(defencemap)
	Say(CD_SIGNNPCNAME..": ����������ҿ��У���ѽ���⼸������һ���ʿ�����������ո�ǿ���������������֪���Ű�����", 1, "��������û����/#want2joincd2("..defencemap..")")
end

function want2joincd2(defencemap)
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SetTask(TSKID_PLAYER_ZHANGONG,0) --���ս��ֵ
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": ���ˣ����ö�˵�����ǣ��Ҹо����ǵ������ܿ��ɣ���ս��ʱ�����������ţ��ʹ������ҿ����ҽ������㡣�μ��سǵ�����Ϊ<color=yellow>"..cd_membercount.."<color>�ˡ�����Ҫ��10�����ѣ�׼��������?", 2, "��!/#sure2joincd("..defencemap..")", "������׼��һ��!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME.."�Ҳ������ǣ�Ҫ������֪����ԭ��ʿ������")
end

function cd_awardforpayout()
	if (camp == 1) then
		Talk(1, "", format("%s: ���ţ����Ҫȫ���Ը���ս��.", CD_SIGNNPCNAME))
	else
		Talk(1, "", format("%s: ��������δй�������Ǿ��Ķ�ȡս��Ʒ��ʿ����Ҫ��ͷ­����Ѫ���С���λ��ʿ��ս�ɡ�", CD_SIGNNPCNAME))
	end;
end;

function OnCancel()
end