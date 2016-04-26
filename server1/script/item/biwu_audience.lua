--Include("\\script\\missions\\finalmatch\\wl_watchmatch.lua")
--Include("\\script\\missions\\finalmatch\\head.lua")
--GetExtPoint(1) == date(%y%m%d)	--050704
--PayExtPoint(extpoint, count);
GUANFANGRENYUAN = 5555
ZHANDIJIZHE = 4444
function main( nItemIdx )
SetLogoutRV(1);		--断线与死亡为一个重生点
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("你怎么拿别人的观众卡用勒！", 0)
		return
	end
	
	local matchtype = GetGlbValue( GLB_CURMATCHTYPE )
	local matchphase = GetGlbValue( GLB_MATCHPHASE )
	if ( matchtype == 0 ) then
		Say("当前比赛还未进行，想要观战需等到比赛开始。先了解观众卡的使用吗？", 3, "如何使用观众卡/#wl_onaudiencehelp(1)", "查询观众卡的使用期限/wl_getdeadline", "结束对话/OnCancel")
		return 1
	end

	local messages = {
		"进入观众席/#want2audience("..matchtype..")",
		"指定角色名/watch_role",
		"指定战队名/watch_league",
		"按区服划分查找战队/watch_zone",
		"如何使用观众卡/#wl_onaudiencehelp(1)",
		"查询观众卡的使用期限/wl_getdeadline",
		"什么也不做/OnCancel"
	};
	local curmapid = SubWorldIdx2ID( SubWorld )
	local flag = wl_mapid2watchnum( curmapid )
	if ( flag ) then
		tinsert( messages, 1, "随机查找正在比赛的选手/watch_rand_currently" )
	end
	Say("你可以根据以下几种方式查询比赛并进行观战。", getn( messages ), messages )
	return 1
end

-- 观看某个角色比赛
function watch_role()
	-- 判断是否已经在观战模式
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_role", "", 1, 20, "请输入玩家角色名");
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
		Say("你查询的角色名为“"..rolename.."”的选手，当前不在比赛场内，请选择其他选手观看比赛。", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_league()
	-- 判断是否已经在观战模式
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_league", "", 1, 20, "请输入战队名");
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
		Say("你查询的战队名为“"..leaguename.."”的战队当前没有在比赛场地内，不能对该战队进行观战，请选择其他战队观战。", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_zone()
	local opp = {}
	opp = get_zone(0)
	Say("你要查找哪个区服的本日比赛的战队？", getn(opp), opp)
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
		str = "你刚刚查找的战队名为 "..name.." ，请使用观众卡或向观众席官员再次查询。"
	else
		str = "你刚刚查找的选手名为 "..name.." ，请使用观众卡或向观众席官员再次查询。"
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
"使用观众卡后，观众可用以下四种方式查询比赛并进行观看：1、指定角色名；2、指定战队名；3、根据区服划分查找战队；4、随机查询正在比赛的选手。查询的角色或者战队必须为当日比赛的战队，并且该战队当前正在比赛中。",
"在观众模式中，如果查询的角色或战队当前允许被观战，即该角色或战队当前正在比赛中，即可进入观战模式。当观战的角色退出比赛，下线或死亡，则退出观战模式；玩家也可自己选择退出观战模式。退出后，玩家可查找其他角色或战队进行观战。",
"在观战模式中，如果想要观战的角色或战队不是当前地图能够观看的，则会先把玩家传送到相应的观众席，然后玩家需要再一次查找一遍该角色或战队，以确定是允许被观战的角色或战队，才能进入观战模式。",
}
function wl_onaudiencehelp(count)
	if ( count >= getn( OnAudience ) ) then
		Say(OnAudience[getn( OnAudience )], 1, "关闭/OnCancel")
	else
		local ncount = count + 1
		Say(OnAudience[count], 2, "下一页/#wl_onaudiencehelp("..ncount..")", "关闭/OnCancel")
	end
end


function wl_getdeadline()
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("你怎么拿别人的观众卡用勒！", 0)
		return 1
	end

	Say("现在观众可以在武林大会期间的任意时间进入武林大会服务器，不受观众入场券使用期限的限制。", 0)
end
function want2audience( matchtype )
	if ( matchtype == 9999 ) then
		Say("本日的比赛是门派单项赛，观众席与对应门派比赛为：", 6, "观众席1（少林、天王）/#want2watchseat(1)", "观众席2（唐门、五毒）/#want2watchseat(2)","观众席3（翠烟、峨嵋）/#want2watchseat(3)","观众席4（丐帮、天忍）/#want2watchseat(4)","观众席5（武当、昆仑）/#want2watchseat(5)", "不用了/OnCancel")
	elseif( matchtype == 11 ) then
		Say("本日的比赛是双人赛，开放了以下三个观众席，你要去：", 4, "观众席1/#want2watchseat(1)", "观众席2/#want2watchseat(2)","观众席3/#want2watchseat(3)", "不用了/OnCancel")
	elseif( matchtype == 12 ) then
		Say("本日的比赛是五行团队赛，开放了以下六个观众席，你要去：", 7, "观众席1/#want2watchseat(1)", "观众席2/#want2watchseat(2)","观众席3/#want2watchseat(3)","观众席4/#want2watchseat(4)","观众席5/#want2watchseat(5)", "观众席6/#want2watchseat(6)","不用了/OnCancel")
	elseif( matchtype == 13 or matchtype == 14 ) then
		Say("本日的比赛是团队赛，开放了以下四个观众席，你要去：", 5, "观众席1/#want2watchseat(1)", "观众席2/#want2watchseat(2)","观众席4/#want2watchseat(4)","观众席5/#want2watchseat(5)","不用了/OnCancel")
	elseif( matchtype == 15 ) then
		Say("本日的比赛是区服团体赛，开放了一下六个观众席，你要去：", 7, "观众席1/#want2watchseat(1)", "观众席2/#want2watchseat(2)","观众席3/#want2watchseat(3)","观众席4/#want2watchseat(4)","观众席5/#want2watchseat(5)", "观众席6/#want2watchseat(6)","不用了/OnCancel")
	else
		Say("观众席现在关闭整修，请稍候再进入。", 0)
	end
end
function want2watchseat(position)
	local watchmap = WL_TABWATCHMAPS[position][1]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player("你到达了观众席，请使用观众卡或向观众席官员查询比赛")
end