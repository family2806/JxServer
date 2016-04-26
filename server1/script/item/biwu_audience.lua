--Include("\\script\\missions\\finalmatch\\wl_watchmatch.lua")
--Include("\\script\\missions\\finalmatch\\head.lua")
--GetExtPoint(1) == date(%y%m%d)	--050704
--PayExtPoint(extpoint, count);
GUANFANGRENYUAN = 5555
ZHANDIJIZHE = 4444
function main( nItemIdx )
SetLogoutRV(1);		--����������Ϊһ��������
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("����ô�ñ��˵Ĺ��ڿ����գ�", 0)
		return
	end
	
	local matchtype = GetGlbValue( GLB_CURMATCHTYPE )
	local matchphase = GetGlbValue( GLB_MATCHPHASE )
	if ( matchtype == 0 ) then
		Say("��ǰ������δ���У���Ҫ��ս��ȵ�������ʼ�����˽���ڿ���ʹ����", 3, "���ʹ�ù��ڿ�/#wl_onaudiencehelp(1)", "��ѯ���ڿ���ʹ������/wl_getdeadline", "�����Ի�/OnCancel")
		return 1
	end

	local messages = {
		"�������ϯ/#want2audience("..matchtype..")",
		"ָ����ɫ��/watch_role",
		"ָ��ս����/watch_league",
		"���������ֲ���ս��/watch_zone",
		"���ʹ�ù��ڿ�/#wl_onaudiencehelp(1)",
		"��ѯ���ڿ���ʹ������/wl_getdeadline",
		"ʲôҲ����/OnCancel"
	};
	local curmapid = SubWorldIdx2ID( SubWorld )
	local flag = wl_mapid2watchnum( curmapid )
	if ( flag ) then
		tinsert( messages, 1, "����������ڱ�����ѡ��/watch_rand_currently" )
	end
	Say("����Ը������¼��ַ�ʽ��ѯ���������й�ս��", getn( messages ), messages )
	return 1
end

-- �ۿ�ĳ����ɫ����
function watch_role()
	-- �ж��Ƿ��Ѿ��ڹ�սģʽ
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_role", "", 1, 20, "��������ҽ�ɫ��");
	end
end


function wl_sure2watch_role(rolename,position,matchtype)
oldSubWorld = SubWorld
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	
	local bpassed = 0
	bpassed = wl_findroleinmatchmap( rolename,tab_matchmap )
	if ( bpassed == 0 ) then
		Say("���ѯ�Ľ�ɫ��Ϊ��"..rolename.."����ѡ�֣���ǰ���ڱ������ڣ���ѡ������ѡ�ֹۿ�������", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_league()
	-- �ж��Ƿ��Ѿ��ڹ�սģʽ
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_league", "", 1, 20, "������ս����");
	end
end

function wl_sure2watch_lgname(leaguename,position,leaguetype)
oldSubWorld = SubWorld
	local matchtype = leaguetype - 10
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	local lid = LG_GetLeagueObj( leaguetype, leaguename )
	local lgcount = LG_GetMemberCount(lid)
	local lgmem = {}
	local rolename = ""
	local bpassed = 0
	for i = 0, lgcount - 1 do
		lgmem[ getn(lgmem)+1 ] = LG_GetMemberInfo( lid, i )
	end
	for i = 1, getn( lgmem ) do
		bpassed = wl_findroleinmatchmap( lgmem[i],tab_matchmap )
		if ( bpassed == 1 ) then
			rolename = lgmem[i]
			break
		end
	end
	if ( bpassed == 0 ) then
		Say("���ѯ��ս����Ϊ��"..leaguename.."����ս�ӵ�ǰû���ڱ��������ڣ����ܶԸ�ս�ӽ��й�ս����ѡ������ս�ӹ�ս��", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_zone()
	local opp = {}
	opp = get_zone(0)
	Say("��Ҫ�����ĸ������ı��ձ�����ս�ӣ�", getn(opp), opp)
end

function wl_sure2go_seat(rolesignmap, name, flag)
	local str = ""
	local position = wl_getwatchmap( rolesignmap )
	if( not position ) then
		print("the signmap of role who the play want to watch is not exist!!!!mapid =="..rolesignmap)
		return
	end
	local num = random(1, 2)
	local watchmap = WL_TABWATCHMAPS[position][num]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	if ( flag == 1 ) then
		str = "��ող��ҵ�ս����Ϊ "..name.." ����ʹ�ù��ڿ��������ϯ��Ա�ٴβ�ѯ��"
	else
		str = "��ող��ҵ�ѡ����Ϊ "..name.." ����ʹ�ù��ڿ��������ϯ��Ա�ٴβ�ѯ��"
	end
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player(str)
	Say(str, 0)
end

function wl_mapideqmapid( mapid1, mapid2 )
	local flag = 0
	for i = 1, getn( WL_TABWATCHMAPS ) do
		for j = 1, getn( WL_TABWATCHMAPS[i] ) do
			if ( WL_TABWATCHMAPS[i][j] == mapid1 ) then
				flag = i
				break
			end
		end
	end
	if ( flag == 0 ) then
		return
	end
	for i = 1, getn( WL_TABWATCHMAPS[ flag ] ) do
		if( WL_TABWATCHMAPS[ flag ][ i ] == mapid2 ) then
			return i
		end
	end
	return nil
end


OnAudience = {
"ʹ�ù��ڿ��󣬹��ڿ����������ַ�ʽ��ѯ���������йۿ���1��ָ����ɫ����2��ָ��ս������3�������������ֲ���ս�ӣ�4�������ѯ���ڱ�����ѡ�֡���ѯ�Ľ�ɫ����ս�ӱ���Ϊ���ձ�����ս�ӣ����Ҹ�ս�ӵ�ǰ���ڱ����С�",
"�ڹ���ģʽ�У������ѯ�Ľ�ɫ��ս�ӵ�ǰ������ս�����ý�ɫ��ս�ӵ�ǰ���ڱ����У����ɽ����սģʽ������ս�Ľ�ɫ�˳����������߻����������˳���սģʽ�����Ҳ���Լ�ѡ���˳���սģʽ���˳�����ҿɲ���������ɫ��ս�ӽ��й�ս��",
"�ڹ�սģʽ�У������Ҫ��ս�Ľ�ɫ��ս�Ӳ��ǵ�ǰ��ͼ�ܹ��ۿ��ģ�����Ȱ���Ҵ��͵���Ӧ�Ĺ���ϯ��Ȼ�������Ҫ��һ�β���һ��ý�ɫ��ս�ӣ���ȷ����������ս�Ľ�ɫ��ս�ӣ����ܽ����սģʽ��",
}
function wl_onaudiencehelp(count)
	if ( count >= getn( OnAudience ) ) then
		Say(OnAudience[getn( OnAudience )], 1, "�ر�/OnCancel")
	else
		local ncount = count + 1
		Say(OnAudience[count], 2, "��һҳ/#wl_onaudiencehelp("..ncount..")", "�ر�/OnCancel")
	end
end


function wl_getdeadline()
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("����ô�ñ��˵Ĺ��ڿ����գ�", 0)
		return 1
	end

	Say("���ڹ��ڿ��������ִ���ڼ������ʱ��������ִ������������ܹ����볡ȯʹ�����޵����ơ�", 0)
end
function want2audience( matchtype )
	if ( matchtype == 9999 ) then
		Say("���յı��������ɵ�����������ϯ���Ӧ���ɱ���Ϊ��", 6, "����ϯ1�����֡�������/#want2watchseat(1)", "����ϯ2�����š��嶾��/#want2watchseat(2)","����ϯ3�����̡����ң�/#want2watchseat(3)","����ϯ4��ؤ����̣�/#want2watchseat(4)","����ϯ5���䵱�����أ�/#want2watchseat(5)", "������/OnCancel")
	elseif( matchtype == 11 ) then
		Say("���յı�����˫������������������������ϯ����Ҫȥ��", 4, "����ϯ1/#want2watchseat(1)", "����ϯ2/#want2watchseat(2)","����ϯ3/#want2watchseat(3)", "������/OnCancel")
	elseif( matchtype == 12 ) then
		Say("���յı����������Ŷ�����������������������ϯ����Ҫȥ��", 7, "����ϯ1/#want2watchseat(1)", "����ϯ2/#want2watchseat(2)","����ϯ3/#want2watchseat(3)","����ϯ4/#want2watchseat(4)","����ϯ5/#want2watchseat(5)", "����ϯ6/#want2watchseat(6)","������/OnCancel")
	elseif( matchtype == 13 or matchtype == 14 ) then
		Say("���յı������Ŷ����������������ĸ�����ϯ����Ҫȥ��", 5, "����ϯ1/#want2watchseat(1)", "����ϯ2/#want2watchseat(2)","����ϯ4/#want2watchseat(4)","����ϯ5/#want2watchseat(5)","������/OnCancel")
	elseif( matchtype == 15 ) then
		Say("���յı�����������������������һ����������ϯ����Ҫȥ��", 7, "����ϯ1/#want2watchseat(1)", "����ϯ2/#want2watchseat(2)","����ϯ3/#want2watchseat(3)","����ϯ4/#want2watchseat(4)","����ϯ5/#want2watchseat(5)", "����ϯ6/#want2watchseat(6)","������/OnCancel")
	else
		Say("����ϯ���ڹر����ޣ����Ժ��ٽ��롣", 0)
	end
end
function want2watchseat(position)
	local watchmap = WL_TABWATCHMAPS[position][1]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player("�㵽���˹���ϯ����ʹ�ù��ڿ��������ϯ��Ա��ѯ����")
end