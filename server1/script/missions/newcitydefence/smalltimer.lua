----------------------------------------------------------------
--FileName:	smalltimer.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能：计时器，每20秒触发
--				
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
tbAddNpcCount = {750, 100, 50, 10}
tbNpcAddRadio = {90/120, 20/120, 10/120}
TOTALNPCCOUNT = 180--900
tbGuaiWu = {
	"\\settings\\maps\\newcitydefence\\guai001.txt",
	"\\settings\\maps\\newcitydefence\\guai002.txt",
	"\\settings\\maps\\newcitydefence\\guai003.txt",
}

tbAimPos = {
	"\\settings\\maps\\newcitydefence\\trappos1000.txt",
	"\\settings\\maps\\newcitydefence\\trappos2000.txt",
	"\\settings\\maps\\newcitydefence\\trappos3000.txt",
}
ZHUSHUAI_POSFILE = "\\settings\\maps\\newcitydefence\\zhushuai.txt"
WEIBING_POSFILE = "\\settings\\maps\\newcitydefence\\weibing0001.txt"
JIANGJUN_POSFILE = "\\settings\\maps\\newcitydefence\\jiangjun.txt"
tbPos_BAOTAI = {
		{1828,2663},{1832,2669},{1835,2674},{1842,2679},{2180,2711},{2183,2716},{2186,2721},{2192,2726},{2208,3010},{2214,3017},{2218,3021},{2219,3014}
}
function OnTimer()
	local t = GetMissionV( MS_SMALL_TIME ) + 1
	SetMissionV( MS_SMALL_TIME, t )
	
	local citycamp = GetMissionV( MS_CITYCAMP )
	local cityname = GetMissionS(MS_S_CD_NAME)
	
	if ( t == RUNGAME_TIME ) then	--开战时间到，提示守城开始，并刷第一批怪
		RunMission(MISSIONID)
		AddGlobalNews("卫国战争已开始, "..tbDEFENCE_ANNOUNCE[citycamp])
		Msg2MSAll( MISSIONID, "<color=yellow>敌军已开始攻城，为保卫我们的城池，各位将士冲啊!" )
		cd_writelog(cityname.."保卫\t城池\t"..GetMSPlayerCount(MISSIONID, 0))
		cd_buildfightnpc( t )
		cd_callAttackCarNpc()
		--cd_callnpc(t)
		return
	end
	
	if ( t > RUNGAME_TIME ) then
		local RestTime = (TOTAL_TIME - t * SMALL_TIME) / FRAME2TIME
		local RestMin, RestSec = GetMinAndSec(RestTime);
		
		if ( mod( t, 9 ) == 0 ) then
			cd_sendmsg2msall()		--每隔3分钟，提示当前XX类型怪，还有多少要杀
		end
		if ( mod(t, 60) == 0 and RestMin ~= 0) then
			cd_sendmsg2global()
		end
		if ( t < LASTREPORT_TIME ) then	--每隔5分钟提示结束时间，最后5分钟每分钟提示一次
			if ( mod( t, 15 ) == 0 ) then
				Msg2MSAll( MISSIONID, "守城结束时间<color=yellow>"..RestMin.."分" )
			end
		else
			if ( mod( t, 3 ) == 0 ) then
				Msg2MSAll( MISSIONID, "守城结束时间<color=yellow>"..RestMin.."分" )
			end
		end
		if (t >= CALLBOSS_ZHUSHUAI) then
			if ( t == CALLBOSS_ZHUSHUAI) then
				call_boss_zhushuai()
			end
		else
			if ( mod(t, 3) == 0 ) then
				cd_callnpc(t)			--每1分钟
			end
		end
		if ( mod( t, 15 )) == 0 then	--每隔5分钟刷三只攻城车
			cd_callAttackCarNpc()
		end
	else
		if ( mod( t, 18 ) == 0 ) then	--报名时间中，每6分钟提示报名结束时间，并发滚动消息
			RestTime = (RUNGAME_TIME - t) * SMALL_TIME / FRAME2TIME;
			RestMin, RestSec = GetMinAndSec(RestTime);
			if ( RestMin > 0 ) then
				Msg2MSAll( MISSIONID, "报名剩余时间为 <color=yellow>"..RestMin.."分" )
				AddGlobalNews("战争已开始报名，想参加吗?"..tbDEFENCE_ANNOUNCE[citycamp].."开战时间还有"..RestMin.."分")
			end
		end
	end
end

function cd_callAttackCarNpc()
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	if (citycamp == 1) then
		npccamp = 2
	end
	count_1 = cd_addsomenpc(tbTNPC_SOLDIER[npccamp][6], 3, tbGuaiWu, tbAimPos, tbSOLDIER_NAME[6], 1, nil, tbFILE_NPCDEATH[6])
	if count_1 < 3 then
		print(count_1,"火炮车少于3.")
	end
	Msg2MSAll( MISSIONID, format("<color=yellow>%s 对方正往这里进攻，大家努力反抗啊!!!<color>", tbSOLDIER_NAME[6]))
end


function cd_buildfightnpc(t)
	cd_callnpc(t)
	local count = 0
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	if (citycamp == 1) then
		npccamp = 2
	end
	local fileheight = GetTabFileHeight( WEIBING_POSFILE ) - 1
	for i = 1, fileheight do
		posx = GetTabFileData( WEIBING_POSFILE, i + 1, 1 )
		posy = GetTabFileData( WEIBING_POSFILE, i + 1, 2 )
		local npcindex = AddNpc(tbTNPC_SOLDIER[ GetMissionV(MS_CITYCAMP) ][1], 95, SubWorld, posx, posy, 1, "攻城将军", 0)
		if (npcindex > 0) then
			SetNpcDeathScript(npcindex, FILE_SHOUCHENG_DEATH[1])
			count = count + 1
			SetNpcCurCamp( npcindex, citycamp )
		end
	end
	SetMissionV(MS_SHOUCHENGWEIBING, GetMissionV(MS_SHOUCHENGWEIBING) + count)

	count = 0
	local fileheight = GetTabFileHeight( JIANGJUN_POSFILE ) - 1
	for i = 1, fileheight do
		posx = GetTabFileData(JIANGJUN_POSFILE, i + 1, 1)
		posy = GetTabFileData(JIANGJUN_POSFILE, i + 1, 2)
		local npcindex = AddNpc(tbTNPC_SOLDIER[ GetMissionV(MS_CITYCAMP) ][2], 95, SubWorld, posx, posy, 1, "守城将军", 1)
		if (npcindex > 0) then
			SetNpcDeathScript(npcindex, FILE_SHOUCHENG_DEATH[2])
			count = count + 1
			SetNpcCurCamp(npcindex, citycamp)
		end
	end
	SetMissionV(MS_SHOUCHENGWEIBING, GetMissionV(MS_SHOUCHENGWEIBING) + count)
	SetMissionV( MS_SHOUCHENGJIANGJUN, count)

	for i = 1, getn(tbPos_BAOTAI) do
		if (mod(i, 2) == 0) then
			npcid = 1119
		else
			npcid = 1120
		end
		posx = tbPos_BAOTAI[i][1] * 32
		posy = tbPos_BAOTAI[i][2] * 32
		npcindex = AddNpc(npcid, 95, SubWorld, posx, posy, 1, "神兵", 1)
		if (npcindex > 0) then
			SetNpcCurCamp(npcindex, npccamp)
		end
	end
end

function cd_callnpc(time)
	local restnpc_1 = GetMissionV( MS_RESTCOUNTNPC_1 )
	local restnpc_2 = GetMissionV( MS_RESTCOUNTNPC_1 + 1 )
	local restnpc_3 = GetMissionV( MS_RESTCOUNTNPC_1 + 2 )
	local restnpc_4 = GetMissionV( MS_RESTCOUNTNPC_1 + 3 )
--	local restnpc_5 = GetMissionV( MS_5THNPC_TCNT )

	AddNpcC_1 = floor(TOTALNPCCOUNT * tbNpcAddRadio[1])--tbAddNpcCount[1]
	AddNpcC_2 = floor(TOTALNPCCOUNT * tbNpcAddRadio[2])--tbAddNpcCount[2]
	AddNpcC_3 = floor(TOTALNPCCOUNT * tbNpcAddRadio[3])--tbAddNpcCount[3]
	
	if ( GetMissionV(MS_CITYCAMP) == 1 ) then
		npccamp = 2
	else
		npccamp = 1
	end
	if ( mod( time, 30 ) == 0 ) then
		restnpc_total = restnpc_1 + restnpc_2 + restnpc_3 + restnpc_4
		AddNpcC_4 = 12
	else
		restnpc_total = restnpc_1 + restnpc_2 + restnpc_3
		AddNpcC_4 = 0
	end
	if ( restnpc_total >= MAX_NPC_COUNT ) then
		return
	end
	
	if ( restnpc_total + TOTALNPCCOUNT > MAX_NPC_COUNT ) then
		npc_total = MAX_NPC_COUNT - restnpc_total
		AddNpcC_1 = floor( npc_total * tbNpcAddRadio[1] )
		AddNpcC_2 = floor( npc_total * tbNpcAddRadio[2] )
		AddNpcC_3 = floor( npc_total * tbNpcAddRadio[3] )
	end
	if (time == RUNGAME_TIME) then
		AddNpcC_4 = 24
	end
		count_1 = cd_addsomenpc(tbTNPC_SOLDIER[npccamp][1], AddNpcC_1, tbGuaiWu, tbAimPos, tbSOLDIER_NAME[1], 0, nil, tbFILE_NPCDEATH[1])
		SetMissionV( MS_RESTCOUNTNPC_1, GetMissionV( MS_RESTCOUNTNPC_1 ) + count_1 )

		count_2 = cd_addsomenpc(tbTNPC_SOLDIER[npccamp][2], AddNpcC_2, tbGuaiWu, tbAimPos, tbSOLDIER_NAME[2], 2, nil, tbFILE_NPCDEATH[2])
		SetMissionV( MS_RESTCOUNTNPC_1 + 1, GetMissionV( MS_RESTCOUNTNPC_1 + 1 ) + count_2 )

		count_3 = cd_addsomenpc(tbTNPC_SOLDIER[npccamp][3], AddNpcC_3, tbGuaiWu, tbAimPos, tbSOLDIER_NAME[3], 1, nil, tbFILE_NPCDEATH[3])
		SetMissionV( MS_RESTCOUNTNPC_1 + 2, GetMissionV( MS_RESTCOUNTNPC_1 + 2 ) + count_3 )

		count_4 = cd_addsomenpc(tbTNPC_SOLDIER[npccamp][4], AddNpcC_4, tbGuaiWu, tbAimPos, tbSOLDIER_NAME[4], 1, 1, tbFILE_NPCDEATH[4])
		SetMissionV( MS_RESTCOUNTNPC_1 + 3, GetMissionV( MS_RESTCOUNTNPC_1 + 3 ) + count_4 )

	cd_writelog(date("%m%d%H%M ")..format("call xiaoxiao = %d, call duizhang = %d, call xianfeng = %d, call zhujiang = %d",count_1, count_2, count_3, count_4))
end

function cd_addsomenpc(npcid, num, tbnpcfile, tbaimfile, npctitle, boss, zhujiang, npcdeathfile)
	if ( num <= 0 ) then
		return 0
	end
	local file_num = getn( tbnpcfile )
	local commonxypos = {}
	local tbpos = {}
	local count = 0
	local tolcount = 0
	local posnum = 0
	
	for i = 1, file_num do
		count = 0
		if (i == 2) then
			tolnpc = num - floor( num * 2 / file_num )
		else
			tolnpc = floor( num * 1 / file_num )
		end
		tolcount = cd_addcommonnpc(tolnpc, tbnpcfile[i], tbaimfile[i], npcid, 95, npctitle, boss, zhujiang, npcdeathfile) + tolcount
	end
	return tolcount
end

function cd_addcommonnpc(tolnpc, bornfile, aimfile, npcid, npclevel, npctitle, boss, zhujiang, npcdeathfile)
	local count_1 = 0
	local count_2 = 0
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "宋军"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "金军"
	end

	local tbborn_pos = {}
	local tbaim_pos = {}
	local bornfilehigh = GetTabFileHeight( bornfile ) - 1
	local aimfilehigh = GetTabFileHeight( aimfile ) - 1
		
	local posx = 0
	local posy = 0
	local npcindex = 0
	local s_npcid = npcid
	for j = 1, tolnpc do
		rannum_1 = random( bornfilehigh )
		posx, posy = bt_getadata(bornfile)

		aimx, aimy = bt_getadata(aimfile)
		
		if (zhujiang ~= nil) then
			s_npcid = npcid + random(0,1)
		end
--if (npctitle == "炸弹车") then
		--print(npctitle, posx, posy)
--end
		npcindex = AddNpc( s_npcid, npclevel, SubWorld, posx, posy, 1, npcname..npctitle, boss )
		if( npcindex > 0 ) then
			SetNpcCurCamp( npcindex, npccamp )
			count_2 = count_2 + 1
			SetNpcDeathScript( npcindex, npcdeathfile )
			SetNpcAI(npcindex,9,20,-1,-1,-1,-1,-1,0,aimx, aimy);
		end
	end
	return count_2
end

function cd_sendmsg2msall()
	local restnpc_1 = GetMissionV( MS_MAXCOUNTNPC_1 )
	local restnpc_2 = GetMissionV( MS_MAXCOUNTNPC_1 + 1 )
	local restnpc_3 = GetMissionV( MS_MAXCOUNTNPC_1 + 2 )
	local restnpc_4 = GetMissionV( MS_MAXCOUNTNPC_1 + 3 )
	local restnpc_5 = GetMissionV( MS_MAXCOUNTNPC_1 + 4 )
	
	local szMsg = "";
	Msg2MSAll(MISSIONID, format("目前守城增援的人数为 <color=yellow>%d 人，守城将士为 <color=yellow>%d ngi; 守城值 %d 点.",GetMSPlayerCount(MISSIONID, 0),GetMissionV(MS_SHOUCHENGWEIBING),GetMissionV(MS_HOMEDEFENCE)))
	if (GetMissionV(MS_SMALL_TIME) < CALLBOSS_ZHUSHUAI) then
		if ( restnpc_1 ~= 0 ) then
			szMsg = szMsg..tbSOLDIER_NAME[1].." <color=yellow>"..restnpc_1.."<color>ngi "
		end
		if ( restnpc_2 ~= 0 ) then
			szMsg = szMsg..tbSOLDIER_NAME[2].." <color=yellow>"..restnpc_2.."<color>ngi "
		end
		if ( restnpc_3 ~= 0 ) then
			szMsg = szMsg..tbSOLDIER_NAME[3].." <color=yellow>"..restnpc_3.."<color>ngi "
		end
		if ( restnpc_4 ~= 0 ) then
			szMsg = szMsg..tbSOLDIER_NAME[4].." <color=yellow>"..restnpc_4.."<color>ngi "
		end
	end
	if ( restnpc_5 ~= 0) then
		szMsg = szMsg..tbSOLDIER_NAME[5].." <color=yellow>"..restnpc_5.."<color>ngi "
	end
	if (szMsg == "") then
	else
		Msg2MSAll(MISSIONID, "守城战通报：目前对方兵力为"..szMsg)
	end
	cd_writelog(date("%m%d%H%M\t")..format("剩余 %s %d\t%s %d\t%s %d\t%s %d\t%s %d\t 守城卫兵%d",tbSOLDIER_NAME[1],restnpc_1,tbSOLDIER_NAME[2],restnpc_2,tbSOLDIER_NAME[3],restnpc_3,tbSOLDIER_NAME[4],restnpc_4,tbSOLDIER_NAME[5],restnpc_5, GetMissionV(MS_SHOUCHENGWEIBING)))
end

function cd_sendmsg2global()
	local szMsg = "卫国烽火连城"..GetMissionS(MS_S_CD_NAME).."战争正处于激战阶段."..tbDEFENCE_ANNOUNCE[GetMissionV(MS_CITYCAMP)]
	AddGlobalNews(szMsg)
end

function call_boss_zhushuai()
	local npcfile = ZHUSHUAI_POSFILE--GetMissionS( MS_S_SRNPCFILE );
	local filehigh = GetTabFileHeight( npcfile ) - 1
	if ( filehigh <= 0 or filehigh == nil ) then
		print("zhushuai file error ")
		return
	end
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "宋军"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "金军"
	end
	cd_addgoldennpc(npcfile, tbTNPC_SOLDIER[npccamp][5], tbSOLDIER_LEVEL[5], npcname..tbSOLDIER_NAME[5], 1, npccamp, tbFILE_NPCDEATH[5])
	cd_writelog(date("%m%d%H%M ")..format(" call yuanshuai = %d", filehigh))

	SetMissionV( MS_BOSS5_DOWN, 1 )
	Msg2MSAll( MISSIONID, "<color=pink>守城战报:"..npcname..tbSOLDIER_NAME[5].."自己出阵，各位士兵要小心防守!" )
end

function cd_addgoldennpc(npcfile, npcid, npclevel, npcname, boss, npccamp, deathscript)
	local posx = 0;
	local posy = 0;
	local npcindex = 0;
	local tbNpcpos = {};
	local aimx = 0
	local aimy = 0
	local filehigh = GetTabFileHeight(npcfile);
	for i = 1, filehigh - 1 do
		tbNpcpos[i] = i;
	end
	for i = 1, filehigh - 1 do
		rannum = random(filehigh - 1);
		temp = tbNpcpos[i];
		tbNpcpos[i] = tbNpcpos[rannum];
		tbNpcpos[rannum] = temp;
	end
	for i = 1, filehigh - 1 do
		
		if (tbNpcpos[i] >= 1 and tbNpcpos[i] <= 3) then
			aimfile = tbAimPos[1]
		elseif (tbNpcpos[i] >= 4 and tbNpcpos[i] <= 7) then
			aimfile = tbAimPos[2]
		else
			aimfile = tbAimPos[3]
		end
		posx = GetTabFileData( npcfile, tbNpcpos[i] + 1, 1 );
		posy = GetTabFileData( npcfile, tbNpcpos[i] + 1, 2 );
		aimx, aimy = bt_getadata(aimfile)
		series = floor((i - 1) / 2);
		npcindex = AddNpcEx( (npcid + i - 1), npclevel, series, SubWorld, posx, posy, 1, npcname, boss );
		if( npcindex > 0 ) then
			SetNpcCurCamp( npcindex, npccamp )
			SetNpcDeathScript( npcindex, deathscript )
			SetNpcAI(npcindex,9,20,-1,-1,-1,-1,-1,0,aimx, aimy);
		end
	end
end