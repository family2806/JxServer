Include("\\script\\event\\wulin_final_match\\awardhead.lua")

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

function wl_get_zonename( clientid )
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		if ( WL_TAB_ZONEINFO[ i ][ 2 ] == clientid ) then
			return WL_TAB_ZONEINFO[ i ][ 1 ]
		end
	end
	return nil
end

function safe_tonumber( str )
	local ret=tonumber(str)
	if (ret==nil) then
		return 0
	else
		return	ret
	end
end

function wl_get_zonefile_match( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."award.dat"
	end
	return nil
end

function wl_get_zonefile_actor( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."actoraward.dat"
	end
	return nil
end

------------------------------------------------------------------------------------
-- ��һ���ļ�
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--����ļ��е�szSection��key��ֵ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row + 1, col))
	end
end

------------------------------------------------------------------------------------

--��Ҫ���ã��ж��Ƿ������ȡ�����
--==========================================================================
--����ѯ������һ���������Ƚ�����ʱ��
--nMatchType��ZONEAWARD_TASKID_FIRST �� ZONEAWARD_TASKID_SECOND �� ZONEAWARD_TASKID_THIRD
--nAwardLevel������
--[����]�������������
----------------------------------------------
--����ѯ��������ʱ��
--nMatchType����ΪTaskID�������������
--nAwardLevel�������ȼ�
--	nAwardLevel=0��ʾ�����ظý���Ľ����ȼ�
--[����]-1��	��ʾ�Ѿ������
--[����]0��	��ʾû�н���
--[����]1��	��ʾ������ȡ�����
---------------------------------------------------
function wl_CheckAward(nMatchType, nAwardLevel)
	if( GetTask(nMatchType) == -1 ) then
		return -1
	end

	local nClientID = GetGateWayClientID()
	local strPlayerAccount = GetAccount()
	local strZoneName = wl_get_zonename( nClientID )
	local strPlayerName = GetName()
	local strZoneSection = tostring( nClientID )

	--�����Ǳ�������
	if (strZoneName == nil) then
		-- print("�����Ǳ�������")
		return 0
	end
	--����50������
	if (GetLevel() < 50) then
		-- print("����50������")
		return 0
	end

	--ȫ�������һ���������Ƚ�������ȫ��������
	if (nMatchType == ZONEAWARD_TASKID_FIRST or nMatchType == ZONEAWARD_TASKID_SECOND or nMatchType == ZONEAWARD_TASKID_THIRD) then
		local strAwardType
		if (nMatchType == ZONEAWARD_TASKID_FIRST) then
			strMatchType="First"
		elseif (nMatchType == ZONEAWARD_TASKID_SECOND) then
			strMatchType="Second"
		elseif (nMatchType == ZONEAWARD_TASKID_THIRD) then
			strMatchType="Third"
		end

		biwu_loadfile( WL_FILE_ZONEAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, strMatchType ))
		return nAwardCount
	end

	--�������������ǲ�����Ա
	local nChampTitle = champ_checktitle();
	if (nChampTitle == nil) then
		-- print("�����ǲ�����Ա")
		return 0
	end

	--������Ա��������Ա����ӣ�
	local nReadAwardLevel	--��ȡ���Ľ����ȼ�
	if (nMatchType == ZONEAWARD_TASKID_ACTORAWARD or nMatchType == ZONEAWARD_TASKID_LEADAWARD) then
		if (nMatchType == ZONEAWARD_TASKID_LEADAWARD and nChampTitle~=7) then
			-- print("���������")
			return 0
		end
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
	--��������������
	elseif (nMatchType == ZONEAWARD_TASKID_ZONE) then
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
	--������������ˡ�˫�ˡ����С�ʮ�ˡ�ʮ���ˣ�
	else
		local strMatchType
		if (nMatchType == ZONEAWARD_TASKID_SINGLE) then
			strMatchType="SingleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_DOUBLE) then
			strMatchType="DoubleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_FIVE) then
			strMatchType="FiveMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_TEN) then
			strMatchType="TenMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_SIXTEEN) then
			strMatchType="SixteenMatch"
		else
			-- print("�޴˽������ͣ�")
			return 0
		end

		biwu_loadfile( WL_FILE_MATCHAWARD )
		local strReadPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, strPlayerAccount, "Key" )
		if (strReadPlayerName == nil or strReadPlayerName ~= strPlayerName) then
			-- print("û�иý�ɫ��Ϣ")
			return 0
		end

		nReadAwardLevel = safe_tonumber(biwu_getdata(WL_FILE_MATCHAWARD, GetAccount(), strMatchType))
	end

	if (nAwardLevel == nil or nAwardLevel <= 0) then
		return nReadAwardLevel
	elseif (nAwardLevel == nReadAwardLevel) then
		return 1
	else
		-- print("�����")
		return 0
	end
end

-----------------------------------------------------------

--������ȡ��Ʒ����������
--���أ�1���ɹ���0��ʧ��
function wl_FinalTakeMatch( nTaskID, nCount )
	local nAwardLevel = wl_CheckAward(nTaskID)

	if( nAwardLevel == -1 ) then
		Say("��ô�����Ѿ�����ˣ���ô�������!!", 0)
		-- print("��Ӧ���Ѿ���ȡ����")
		return 0
	elseif( nAwardLevel == 0 ) then
		Say("�Բ����㲻�����Ǹ�����!", 0)
		WriteLog("���ִ�ά���������������첻���Լ���˫�����齱��! ["..GetName().."]  TaskID:"..nTaskID);
		-- print("������ȡ������ȡ�Ľ��	["..GetName().."]  TaskID:"..nTaskID);
		return 0
	end
	
	local nClientID = GetGateWayClientID();
	local strZoneName = tostring( nClientID )

	--һ�Ƚ�����
	if (nTaskID == ZONEAWARD_TASKID_FIRST) then
		if( nCount == nil or nCount <= 0 ) then
			-- print("��ȡ�ɲ�¶��Ŀ������ 0 �� nil ��")
			WriteLog("���ִ�ά���������ɲ�¶���ܳ���0���� nil")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			Say("��ȡ�������񲻶�!", 0)
			-- print("���˳�����ȡ������ɲ�¶��	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			WriteLog("���ִ�ά������������ȡ�ɲ�¶������������ֵ! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end;
		
		local nRoom = CalcFreeItemCellCount()
		if ( nRoom < nCount ) then
			Say("װ��û�пռ��ˣ����°���һ�������������ɲ�¶����ֵ", 0)
			-- print("��ı�������û����ô��λ��", 0)
			return 0
		end;
		
		SetTask( nTaskID, GetTask( nTaskID ) - nCount )
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end;
		for i = 1, nCount do
			AddItem( 6, 1, 71, 1, 0, 0, 0 )
		end;
		Msg2Player("��ϲ������"..nCount.."1 �ɲ�¶")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", �����ڻ�õĽ���"..nCount.."�ɲ�¶")
		return 1
	--�������Ƚ����������Ǽ�˫������
	elseif (nTaskID == ZONEAWARD_TASKID_SECOND or nTaskID == ZONEAWARD_TASKID_THIRD) then
		if( nCount == nil or nCount <= 0 ) then
			WriteLog("���ִ�ά��������ȡ����ֵ���ܴ���0����nil")
			-- print("��ȡ˫��������Ŀ������ 0 �� nil��")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			WriteLog("���ִ�ά����������������ȡ��������ֵ��˫������!! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			-- print("������ȡ�����˫�����飡	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end
		SetTask( nTaskID, GetTask(nTaskID) - nCount )
		
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end
		
		local nDoubleTime = 15 * nCount
		if (nTaskID == ZONEAWARD_TASKID_SECOND) then
			nDoubleTime = nDoubleTime * 2;
		end
		
		AddSkillState(440, 1, 1, nDoubleTime * 60 * 18)
		Msg2Player("��ϲ�������"..nDoubleTime.."����ֵ��������˫��")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName().."�����ڻ�õĽ���"..nDoubleTime.."����ֵ��������˫��")
		return 1
	--����ѡ�ֽ���
	elseif (nTaskID == ZONEAWARD_TASKID_ACTORAWARD) then
		--��������
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot"))
		if( nAwardCount >= 100 ) then
			Say("�Բ����Ǹ�������������!", 0)
			-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:ActorAward");
			WriteLog("���ִ�ά�����������콱�ˣ�����������! ["..GetName().."]:ActorAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot", nAwardCount+1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		if( nRoom < nCount ) then
			Say("װ����û��λ�ã����°��ţ�Ȼ����������������������.", 0)
			Say("����װ����λ������", 0)
			return 0
		end
		
		SetTask( ZONEAWARD_TASKID_ACTORAWARD, -1 )

		wl_addownexp( WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 3 ] )
		AddItem( 6, 1, 831, 1, 0, 0, 0 )		--���ִ����	����
		Msg2Player("��ϲ������"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ])
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", �μ��������ѡ�ֻ��"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ].."�����������"..nAwardLevel)
		return 1
	--����ӽ���
	elseif (nTaskID == ZONEAWARD_TASKID_LEADAWARD) then
		--��������
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot"))
		if( nAwardCount >= 1 ) then
			Say("�Բ����Ǹ���������ȡ��!", 0)
			WriteLog("���ִ�ά�����������콱�ˣ�����������! ! ["..GetName().."]:LeadAward");
			-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:LeadAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot", 1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		
		if( nRoom < nCount or (nAwardLevel == 1 and nRoom < nCount + 6)) then
			Say("װ����û��λ�ã����°��ţ�Ȼ����������������������.", 0)
			-- print("�����ռ���񲻹�", 0)
			return 0
		end
		
		if( nAwardLevel == 1 ) then
			wl_addgolditem_random()
		end
		
		for i = 1, nCount do
			AddItem( 6, 1, 831, 1, 0, 0, 0 )		--���ִ����	����
		end;

		SetTask( ZONEAWARD_TASKID_LEADAWARD, -1 )
		Msg2Player("��ϲ����"..nCount.."1 ���������")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", ��������ӻ��"..WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 1 ].."�����������"..nAwardLevel)
		return 1
	end

	--������������ˡ�˫�ˡ����С�ʮ�ˡ�ʮ���ˡ����壩
	local strMatchName
	if (nTaskID == ZONEAWARD_TASKID_SINGLE) then
		strMatchName = "SingleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_DOUBLE) then
		strMatchName = "DoubleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_FIVE) then
		strMatchName = "FiveMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_TEN) then
		strMatchName = "TenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_SIXTEEN) then
		strMatchName = "SixteenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strMatchName = "ZoneMatch"
	end

	local strAwardCountName
	if (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strAwardCountName = "ZoneMatchLeft"
	else
		strAwardCountName = strMatchName..tostring(nAwardLevel).."Left"
	end

	--��Ʒ��������
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName))
	if( nAwardCount <= 0 ) then
		Say("�Բ����Ǹ������Ѿ�������!", 0)
		WriteLog("���ִ�ά�����������콱�ˣ�����������! ["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		return 0
	else
		biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName, nAwardCount-1);
		biwu_save(WL_FILE_MATCHAWARD)
	end

	--��������ɵ������ھ������ǹ̶��� ��ƽ�װ��
	if(nTaskID == ZONEAWARD_TASKID_SINGLE and nAwardLevel == 1) then
		if ( wl_awardgolditem( GetLastFactionNumber(), nTaskID ) ~= nil ) then
			SetTask( nTaskID, -1 )
		end
		return 1
	end
	
	local nCount = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][2]
	if( nCount == nil or nCount == 0 ) then
		WriteLog( "���ִ�ά������	count==0 match=="..strMatchName..", ����Ϊ"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		-- print( "���ִ�ά������		count==0 match=="..strMatchName..",����Ϊ"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		return 0
	end
	
	--�����˫�����Ļ����������Ĺھ���ÿ�˻���һ������Ĵ�ƽ�
	if( ( strMatchName == "DoubleMatch" or strMatchName == "FiveMatch" ) and nAwardLevel == 1 ) then
		wl_addgolditem_random()	--��������Ĵ�ƽ�
	end
	
	local q = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][3]
	local g = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][4]
	local d = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][5]
	local l = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][6]
	local f = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][7]
	local k = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][8]
	local m = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][9]
	for i = 1, nCount do
		AddItem( q, g, d, l, f, k, m )
	end
	SetTask( nTaskID, -1 )
	Msg2Player( "��ϲ������"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", �ѻ��"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1].."�μӱ�����"..strMatchName)
	return 1
end

--============================================

function wl_get_awardcount( count, taskid )
	if ( GetTask( taskid ) == 0 ) then
		SetTask( taskid, count )
		return count
	end
	if( GetTask( taskid ) == -1 ) then
		return 0
	end
	return GetTask( taskid )
end

function champ_checktitle()
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	if( zonename == nil ) then	--���Ǳ�������
		return nil
	end
	local prefix = "\\data\\wulin\\"..nClientID.."\\"
	local name = ""	--�ж��ǲ��������
	biwu_loadfile( prefix .. BID_LEADER )
	name = biwu_getdata( prefix..BID_LEADER, "Leader_Name", "Name")
	if( GetName() == name ) then
		return 7
	end
	
	name = ""	--�ж��ǲ�������ʮ��
	biwu_loadfile(prefix.. LEVELTOP10 )
	for i = 1, 10 do
		name = biwu_getdata(prefix..LEVELTOP10, "LevelTop10", "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end

	name = ""	--�ж��ǲ���������ǰ����
	local fanctionnum = GetLastFactionNumber()
	--for fanctionnum = 0, 9 do	--temp
	biwu_loadfile( prefix..WL_FACTION[fanctionnum+1][1] )
	for i = 1, 5 do
		name = biwu_getdata(prefix..WL_FACTION[fanctionnum+1][1], WL_FACTION[fanctionnum+1][2], "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end
	--end	--temp

	name = ""	--�ж��ǲ�������Ӹ���Ĳ����ʸ�
	local count = 0
	biwu_loadfile( prefix..LEADER_MEMBER )
	count = tonumber(biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Count"))
	if( count == 0 ) then
		return nil
	end
	for i = 1, count do
		name = biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Member"..i)
		if( GetName() == name ) then
			return 1
		end
	end
	
	return nil
end;

------------------------------------------------------------------------------------
--main
function wulin_awardmain()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local nowday = tonumber(date("%Y%m%d"))
	local bAwardNow = 1
	if (nowday > WL_AWARD_TIME[2] or nowday < WL_AWARD_TIME[1]) then
		bAwardNow = 0
	end
		
	if( zonename == nil or bAwardNow == 0) then	--���Ǳ�������
		Say("���ִ���ѽ�������ϸ�������ϵ��ҳ", 0)
		return
	end

	if ( GetLevel() < 50 ) then
		Say("���ִ������ʽ��Ļ����ϸ����뿴��ҳ <color=red> 50��<color> ���Ͽ�����������ȡ����", 0)
		return
	end
	
	local zonesection = tostring( nClientID )
	biwu_loadfile( WL_FILE_ZONEAWARD )
	local firstcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" ))--biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" )
	local secondcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Second" ))
	local thirdcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Third" ))
	
	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	
	local count = 0
	local tbOpp = {}
	count = firstcount + secondcount + thirdcount
	if (GetLastFactionNumber() ~= -1 and GetCamp() > 0) then
		if ( champ_checktitle() ~= nil ) then	--�ǲ��ǲ���ѡ��
			tbOpp[ getn( tbOpp ) + 1 ] = "���ִ����������/wl_matchaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "ѡ�ֲμ������������/wl_joinaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "��ȡ���ִ�������ƺ�/wl_taketitle"
		end
	end
		
	if (nowday >= WL_ZONEAWARD_TIME[1] and nowday <= WL_ZONEAWARD_TIME[2]) then
		if (count > 0 ) then --�������л�ùڡ��ǡ���������
			tbOpp[ getn( tbOpp ) + 1 ] = "������/#wl_awardall("..firstcount..","..secondcount..","..thirdcount..")"
		end
	end
	
	if( getn( tbOpp ) < 1 ) then	--û�н���
		Say("���ִ���ѽ�������ϸ����뿴��ҳ", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "��ֻ������/OnCancel"
	Say( "���ִ���ѽ��������Ե������콱.", getn(tbOpp), tbOpp )
end;

--------------------------------------------------------------------------------------------

function wl_matchaward()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	--WL_TAB_MATCHAWARD_INFO
	--WL_FILE_MATCHAWARD
	local playeraccount = GetAccount()
	local playername = GetName()

	biwu_loadfile( WL_FILE_MATCHAWARD )
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("��û���ڱ����л���κν�����Ҫ����Ŭ��Ŷ����ϸ����뿴��ҳ", 0)
		return
	end
	
	local tbOpp = {}
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch ~= 0 and GetTask( ZONEAWARD_TASKID_ZONE ) ~= -1 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "�������������___"..WL_TAB_MATCHAWARD_INFO[ "ZoneMatch" ][zonematch][1].."/#wl_want2takematch('ZoneMatch',"..zonematch..","..ZONEAWARD_TASKID_ZONE..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch ~= 0 and GetTask( ZONEAWARD_TASKID_SINGLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "���ɵ�������___"..WL_TAB_MATCHAWARD_INFO[ "SingleMatch" ][singlematch][1].."/#wl_want2takematch('SingleMatch',"..singlematch..","..ZONEAWARD_TASKID_SINGLE..")"
		end
		if( doublematch ~= 0 and GetTask( ZONEAWARD_TASKID_DOUBLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "˫������___"..WL_TAB_MATCHAWARD_INFO[ "DoubleMatch" ][doublematch][1].."/#wl_want2takematch('DoubleMatch',"..doublematch..","..ZONEAWARD_TASKID_DOUBLE..")"
		end
		if( fivematch ~= 0 and GetTask( ZONEAWARD_TASKID_FIVE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "���ж�����___"..WL_TAB_MATCHAWARD_INFO[ "FiveMatch" ][fivematch][1].."/#wl_want2takematch('FiveMatch',"..fivematch..","..ZONEAWARD_TASKID_FIVE..")"
		end
		if( tenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_TEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "ʮ�˶�����___"..WL_TAB_MATCHAWARD_INFO[ "TenMatch" ][tenmatch][1].."/#wl_want2takematch('TenMatch',"..tenmatch..","..ZONEAWARD_TASKID_TEN..")"
		end
		if( sixteenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_SIXTEEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "16�˶�����___"..WL_TAB_MATCHAWARD_INFO[ "SixteenMatch" ][sixteenmatch][1].."/#wl_want2takematch('SixteenMatch',"..sixteenmatch..","..ZONEAWARD_TASKID_SIXTEEN..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say( "����������˻���û�н�������ϸ����뿴��ҳ", 0 )
		return
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "L�t n�a ta quay l�i/OnCancel"
	Say("�������һ�½���������֮ǰ������һ��װ��!", getn( tbOpp ), tbOpp)
end

function wl_want2takematch( sectionname ,awardtype, taskid )
	local room = 0
	room = CalcFreeItemCellCount()
	if( room < 12 ) then
		Say("װ�����޿�λ�����ź�������!", 0)
		return
	end
	Say( "Ŀǰ����Ҫ�����"..WL_TAB_MATCHAWARD_INFO[ sectionname ][awardtype][1]..", ��������", 2, "����ø���!/#wl_FinalTakeMatch("..taskid..")", "��������/OnCancel" )
end

function wl_awardgolditem( fact, taskid )
	if ( fact == 0 ) then
		print("�������֣�����û�����ֹھ���")
		return nil
	end
	
	if( fact == 1 ) then
		AddGoldItem(0,19)
		Msg2Player("��ϲ����һ�����컢ͷ������")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",�������������һ������Ϊ������")
		return 1
	elseif ( fact == 2 ) then
		AddGoldItem(0,80)
		Msg2Player("��ϲ����һ�����֮���츿�ػ�")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ������ŵ�һ������Ϊ���ػ�")
		return 1
	elseif( fact == 3 ) then
		AddGoldItem(0,59)
		Msg2Player("��ϲ����һ������֮��󸻤��")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ����嶾������һ������Ϊ��󸻤��")
		return 1
	elseif( fact == 6 ) then
		AddGoldItem(0,100)
		Msg2Player("��ϲ����һ������֮�ݼ�ʯ��")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",���ؤ�ﵥ����һ������Ϊһ����ʯ��")
		return 1
	elseif( fact == 7 ) then
		AddGoldItem(0,113)
		Msg2Player("��ϲ����һ��ħ��֮ҵ����ڤ��")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ������̵�����һ������Ϊһ����ڤ��")
		return 1
	elseif( fact == 4 ) then
		AddGoldItem(0,35)
		Msg2Player("��ϲ����һ���޼�֮�����ָ")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",��ö�ü������һ�� ����Ϊһ�����ָ ")
		return 1
	elseif( fact == 5 ) then
		AddGoldItem(0,50)
		Msg2Player("��ϲ����һ���ܻ�֮����ָ��")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ��ô��̵�����һ������Ϊһ����ָ��")
		return 1
	elseif( fact == 8 ) then
		AddGoldItem(0,125)
		Msg2Player("��ϲ����һ������֮���ɷ���")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ����䵱������һ������Ϊһ�����ɷ���")
		return 1
	elseif( fact == 9 ) then
		AddGoldItem(0,130)
		Msg2Player("��ϲ����һ��˪��֮�籩ָ��")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", �������ص�һ������Ϊһ���籩ָ��")
		return 1
	else
		print("wl_awardgolditem faction wrong!!!!error!!!!")
		return nil
	end
end;

---------------------------------------------------------------------------------------------

function wl_joinaward()		--���������ý�
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	local tabTitle = {}
	local leader = 0
	local awardtype = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneAwardType" ))
	
	local leader = 0
	leader = champ_checktitle()		--leader == 7Ϊ�����
	if( leader == 7 ) then
		local tbOpp = {}
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) == -1 and GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "���������Ʒ�ˣ���ϸ����뿴��ҳ", 0 )
			return
		end;
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "��ȡ����ӽ���/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_LEADAWARD..")"
		end;
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "��ȡѡ�ֽ�/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")"
		end;
		tbOpp[ getn( tbOpp ) + 1 ] = "��һ��!/OnCancel" 
		if( awardtype == 5 ) then
			Say("����������ӿ�����"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", ѡ��"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", ���ھ���������֮ǰ�������װ����", getn( tbOpp ), tbOpp )
		else
			Say("���������Ա:"..zonename.."�ڳɼ�����������"..awardtype.."��������������ӣ������"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", �μ�ѡ�ֽ���"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", ���ھ���������֮ǰ�������װ��!", getn( tbOpp ), tbOpp )
		end
	else
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "���������Ʒ�ˣ���ϸ����뿴��ҳ", 0 )
			return
		end;
		if( awardtype == 5 ) then
			Say("��Ϊ"..zonename.."����ѡ�֣�����Ի��"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", ���ھ���������֮ǰ�������װ��!", 2, "���Ͼ���!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "��һ�°�!/OnCancel" )
		else
			Say("���������Ա:"..zonename.."�ڳɼ�����������"..awardtype.."��������������ӣ������ "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", ���ھ���������֮ǰ�������װ��!", 2, "���Ͼ���!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "��һ�°�!/OnCancel" )
		end
	end
	
end;

function wl_addgolditem_random()
	local serial = random( WL_GOLDITEMCOUNT )
	AddGoldItem(WL_TAB_MATCHAWARD[serial][3][1], WL_TAB_MATCHAWARD[serial][3][2])
	Msg2Player("��ϲ������һ��"..WL_TAB_MATCHAWARD[serial][1])
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", �ƽ�װ������"..WL_TAB_MATCHAWARD[serial][1])
end;

function wl_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end;


---------------------------------------------------------------------------------------------
function wl_awardall( firstcnt, secondcnt, thirdcnt )	--��ȡ��������
	local awardfst = 0
	local awardsec = 0
	local awardthd = 0
	local tbOpp = {}
	awardfst = wl_get_awardcount( firstcnt, ZONEAWARD_TASKID_FIRST )
	awardsec = wl_get_awardcount( secondcnt, ZONEAWARD_TASKID_SECOND )
	awardthd = wl_get_awardcount( thirdcnt, ZONEAWARD_TASKID_THIRD )
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local str = "��������������Ա:"..zonename.."������Ϊ "
	
	if ( firstcnt ~= 0 ) then
		str = str.."�ھ�"..firstcnt..", "
	end
	
	if ( secondcnt ~= 0 ) then
		str = str.."�Ǿ�"..secondcnt..", "
	end
	
	if ( thirdcnt ~= 0 ) then
		str = str.."����"..thirdcnt..", "
	end
	
	if ( awardfst == 0 and awardsec == 0 and awardthd == 0 ) then
		str = str.."������ȡ���������н���."
		Say(str, 0)
		return
	end
	
	str = str.."�㻹������:"
	if( awardfst > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardfst).."�ھ�����_�ɲ�¶/#wl_want2takeaward(1,"..awardfst..")"
	end
	
	if( awardsec > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardsec).."�Ǿ�����_��30����������˫������ֵ/#wl_want2takeaward(2,"..awardsec..")"
	end
	
	if ( awardthd > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardthd).."��������_��15����������˫������ֵ/#wl_want2takeaward(3,"..awardthd..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "��һ�°�!/OnCancel"
	Say( str, getn( tbOpp ), tbOpp )
end

function wl_want2takeaward(title,awardcount)
	local str = ""
	local cbFunc = ""
	local taskid = 0
	local tbOpp = {}
	if ( title == 1) then
		str = "����Ի��"..awardcount.."1 �ɲ�¶�����ھ�����"
		cbFunc = "��/#wl_FinalTakeMatch"
		taskid = ZONEAWARD_TASKID_FIRST
	elseif ( title == 2 ) then
		str = "����Ի��"..awardcount.."��30����������˫������ֵ�Ļ��ᣬ���ھ�����"
		cbFunc = "��/#wl_want2doubleexp_30"
		taskid = ZONEAWARD_TASKID_SECOND
	elseif( title == 3 ) then
		str = "����Ի��"..awardcount.."��15����������˫������ֵ�Ļ��ᣬ���ھ�����"
		cbFunc = "��/#wl_want2doubleexp_15"
		taskid = ZONEAWARD_TASKID_THIRD
	end
	
	for i = 1, awardcount do
		tbOpp[ getn( tbOpp ) + 1 ] = "��!"..tostring(i)..cbFunc.."("..taskid..","..i..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "���»�����/OnCancel"
	Say(str, getn(tbOpp), tbOpp)
end;

function wl_want2doubleexp_30( taskid, count )	--��ȡ�Ǿ�����
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("�쵽���������񲻶�!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 30 * count
	Say("���������"..count.."�Ǿ�����+ "..doubletime.."��������˫���������?", 2, "��/#wl_FinalTakeMatch("..taskid..","..count..")", "����������Ŷ!/OnCancel")
end

function wl_want2doubleexp_15( taskid, count )	--��ȡ��������
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("�쵽���������񲻶�!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 15 * count
	Say("���������"..count.."ph�n th��ng ?Qu�n + "..doubletime.."��������˫���������?", 2, "��/#wl_FinalTakeMatch("..taskid..","..count..")", "����������Ŷ!/OnCancel")
end

----------------------------------------------------------------------------------------------


function wl_taketitle()
--	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
--	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	local tbOpp = {}
	local zonesection = tostring(GetGateWayClientID())
	local playeraccount = GetAccount()
	biwu_loadfile( WL_FILE_MATCHAWARD)
	local playername = GetName()
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("���ڱ�����û���κ���������û�гƺŸ���.", 0)
		return
	end

	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch > 0 and zonematch <= 3 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "�ܶ�����������ƺ�/#wl_sure2taketitle('ZoneMatch',"..zonematch..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch > 0 and singlematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "������ɵ����ƺ�/#wl_sure2taketitle('SingleMatch',"..singlematch..")"
		end
		if( doublematch > 0 and doublematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "���˫���ƺ�/#wl_sure2taketitle('DoubleMatch',"..doublematch..")"
		end
		if( fivematch > 0 and fivematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "������ж��ƺ�/#wl_sure2taketitle('FiveMatch',"..fivematch..")"
		end
		if( tenmatch > 0 and tenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "���ʮ�ɶ��ƺ�/#wl_sure2taketitle('TenMatch',"..tenmatch..")"
		end
		if( sixteenmatch > 0 and sixteenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "���ʮ��ɱ���ƺ�/#wl_sure2taketitle('SixteenMatch',"..sixteenmatch..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say("���ڱ�����û���κ���������û�гƺŸ���.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "����������/OnCancel"
	
	Say("����Ի�����³ƺţ����뿴:", getn( tbOpp ), tbOpp)
end

function wl_sure2taketitle( sectionname , awardtype)
	if( awardtype < 0 or awardtype > 3 ) then
		return
	end
	
	local title = 0
	local str = ""
	if ( sectionname == "SingleMatch" ) then
		local faction = GetLastFactionNumber()
		if( faction == -1 ) then
			return
		end
		str = "�������ɳƺ�"
		if( awardtype == 1 ) then
			title = 32 + faction
		elseif( awardtype == 2 ) then
			title = 42 + faction
		else
			title = 52 + faction
		end
	end
	
	if( sectionname == "DoubleMatch" ) then
		title = 61 + awardtype
		str = "˫��"
	end
	
	if( sectionname == "FiveMatch" ) then
		title = 64 + awardtype
		str = "���ж�"
	end
	
	if( sectionname == "TenMatch" ) then
		title = 67 + awardtype
		str = "ʮ�ɶ�"
	end
	
	if( sectionname == "SixteenMatch" ) then
		title = 70 + awardtype
		str = "ʮ��ɱ��"
	end
	
	if( sectionname == "ZoneMatch" ) then
		title = 73 + awardtype
		str = "�����Ŷ�"
	end

	Title_AddTitle(title, 1, 30 * 24 * 60 * 60 * 18)
	Title_ActiveTitle( title )
	SetTask( ZONEAWARD_TASKID_TITLEID, title )
	if ( awardtype == 1 ) then
		str = str.."�ھ�"
	elseif ( awardtype == 2 ) then
		str = str.."�Ǿ�"
	else
		str = str.."����"
	end
	Msg2Player( "��ϲ��ﵽ"..str.."�ƺ�" )
end

