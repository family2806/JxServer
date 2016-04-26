--���ֵ�һ��ʹ��
-- �������µ�һ�� ��һ�����������ԵǼ��Լ��Ķ���

Include("\\script\\event\\tongwar\\head.lua");		--���µ�һ��ͷ�ļ�
Include("\\script\\task\\system\\task_string.lua");	--�Ի�����ͷ�ļ�
Include("\\script\\global\\titlefuncs.lua");		-- �ƺ�

Include("\\script\\vng_event\\give_support_item.lua")
SZONETONG_LGNAME	=	"ONETONG_ONETONG";
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;
_TB_ONETONG_MEMLIST	=	{-1, {}};
local SZTONGNAME_ONETONG = "BC";
local N_TTITLE_ID = 199;

ONETONG_START_SIGNUP	= 20120528						-- ���µ�һ�￪ʼ�Ǽ�ʱ��
ONETONG_ENDLE_SIGNUP	= 20120603						-- ���µ�һ������Ǽ�ʱ��

ONETONG_START_TITLE		= 20100118						-- ����һ����ȡͷ�ο�ʼʱ��
ONETONG_ENDLE_TITLE		= 20100214						-- ����һ����ȡͷ�ν���ʱ��

ONETONG_MAX_SIGNMEM		= 74

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= ONETONG_START_SIGNUP and nDate <= ONETONG_ENDLE_SIGNUP) then
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_create()
			tongwar_cityrank();
		end;
		CreateTaskSay({"<dec><npc>���µ�һ��ս�ӵǼǻ���ڽ��У���������ʲô����? ",
					"����Ա����/onetong_showlistmem",
					"�����μ����µ�һ��/onetong_signupmem",
					"�Ͻ���Ʒ֧Ԯ�ν�/#GiveSupportItem:OpenUI()",
					"�����Ի�/OnCancel"});
		
	elseif (nDate >= ONETONG_START_TITLE and nDate <= ONETONG_ENDLE_TITLE) then
		
		CreateTaskSay({format("<dec><npc>���Ǹ����ͳƺ�%s �����%s. ��������ʲô����?", "�߼���һ��", %SZTONGNAME_ONETONG ),
					format("���ǰ�ĳ�Ա%s./onetong_awardtitle", %SZTONGNAME_ONETONG),
					"�����Ի�/OnCancel"});
	else
		CreateTaskSay({format("<dec><npc>���� %s!", GetName()), "�����Ի�/OnCancel" });
	end;
	
end;

function onetong_showlistmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--��������
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		CreateTaskSay({"<dec><npc>Ŀǰ������û�г�Ա.", "�����Ի�/OnCancel"});
		return 1;
	end;
	
	local tbOpp = onetong_selfinfo2next(0);
	tinsert(tbOpp, 1, "<dec><npc>��Ա����: ")
	CreateTaskSay(tbOpp);
	
end;

function onetong_createlist()
	local n_lid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	if (FALSE(n_lid)) then
		local nLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nLeagueID, ONETONG_LGTYPE, SZONETONG_LGNAME)
		local ret = LG_ApplyAddLeague(nLeagueID, "", "")
		LG_FreeLeagueObj(nLeagueID);
		_TB_ONETONG_MEMLIST[1] = 0;
		if (ret == 1) then
			onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName());
			LG_ApplySetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName(), 1, 1);
			onetong_addacclist(GetName())
			_TB_ONETONG_MEMLIST[1] = 1;
			tinsert(_TB_ONETONG_MEMLIST[2], GetName())
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = GetName();
		end;
		return 1;
	end;
	_TB_ONETONG_MEMLIST[1] = LG_GetMemberCount(n_lid);
	for i = 0, _TB_ONETONG_MEMLIST[1]-1 do
		local sz_pl = LG_GetMemberInfo(n_lid, i);
		tinsert(_TB_ONETONG_MEMLIST[2], sz_pl)
		--_TB_ONETONG_MEMLIST[2][i + 1] = sz_pl;
	end;
	return 1;
end;

function OnCancel()
end;

function onetong_managemem(szmem, npos)
	CreateTaskSay({format("<dec><npc>��Ա�뿴: <enter>%s", szmem), 
			format("ȡ����Ա/#onetong_delonemem([[%s]], %d)",szmem, npos),
			"�����Ի�/OnCancel"		});
end;

function onetong_delonemem(szmem, npos)
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	CreateTaskSay({format("<dec><npc>ȷ����ȡ����Ա:<enter>%s",szmem),
			format("ͬ��/#onetong_suredelmem([[%s]], %d)",szmem, npos),
			"����/OnCancel"});
end;

function onetong_suredelmem(szmem, npos)
	
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	if (LG_GetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, 1) == 1) then
		CreateTaskSay({"<dec><npc>���µ�һ��������ܴ��������Ƴ�.", "�����Ի�/OnCancel"});
		return
	end;
	
	if (_TB_ONETONG_MEMLIST[2][npos] ~= szmem) then
		return
	end;
	
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	LGM_ApplyRemoveMember(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, "", "", 0);
	tremove(_TB_ONETONG_MEMLIST[2], npos);
	_TB_ONETONG_MEMLIST[1] = getn(_TB_ONETONG_MEMLIST[2]);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s Delete OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmem
					));
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		_TB_ONETONG_MEMLIST[1] = -1;
	end;
	CreateTaskSay({format("<dec><npc>��ȡ����Ա:<enter>%s", szmem), "�����Ի�/OnCancel"});
end;

function onetong_selfinfo2next( num )
	local opp = {};
	--if ( getn(_TB_ONETONG_MEMLIST[2]) - num > 10 ) then
	if ( _TB_ONETONG_MEMLIST[2].n - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
		end
		opp[getn(opp)+1] = format("Trang k? /#onetong_selfinfo2next(%d)", (num+10));
	else
		--for i = num+1, getn( _TB_ONETONG_MEMLIST[2] ) do
		for i = num+1, _TB_ONETONG_MEMLIST[2].n do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
--			opp[getn(opp) + 1] = _TB_ONETONG_MEMLIST[2][i];
		end;
	end;
	opp[getn(opp)+1] = "��ng/OnCancel";
	if( num == 0 ) then
		return opp;
	end;
	tinsert(opp, 1, "<dec><npc>��Ա����: ");
	CreateTaskSay(opp);
end

function onetong_signupmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>ֻ�е�11�����ֵ�һ���������ִ�иò���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--��������
	end;
	
	local szmastername = GetName();
	local n_size = GetTeamSize();
	
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>����֮ǰ�ĳ�Ա��Ӻ��ٱ����μ�.", "�����Ի�/OnCancel"});
		return
	elseif (n_size > 2) then
		CreateTaskSay({"<dec><npc>ÿ�α�����Ҫ��һ����Ա���.", "�����Ի�/OnCancel"});
		return
	end;
	
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>ֻ�жӳ����ܽ��б���.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	local n_onetongid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	local nCurMemCnt = LG_GetMemberCount(n_onetongid);
	if (nCurMemCnt < _TB_ONETONG_MEMLIST[1]) then
		nCurMemCnt = _TB_ONETONG_MEMLIST[1];
	end;
	if (nCurMemCnt >= ONETONG_MAX_SIGNMEM) then
		CreateTaskSay({"<dec><npc>���µ�һ���Ա�����ѹ������ܼ���������.", "�����Ի�/OnCancel"});
		return 0;
	end;
	
	local szmemname = "";
	local bp = 0;
	local nfact = -1;
	local oldPlayer = PlayerIndex;
	for i = 1, 2 do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		
		if (GetName() ~= szmastername) then
			szmemname = GetName();
			if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
				bp = 1;
				nfact = GetLastFactionNumber();
			end;
			break
		end;
	end;
	PlayerIndex = oldPlayer;
	if (bp == 1) then
		if (nfact ~= -1) then
			CreateTaskSay({format("<dec><npc>��ȷ���뱨����<color=yellow>%s<color>��?",szmemname), format("��ͬ��#onetong_addmemlist([[%s]])", szmemname),"�����Ի�/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>���ֳ�Ա���ܲμӱ���!", "�����Ի�/OnCancel"});
		end;
	else
		CreateTaskSay({format("<dec><npc>���<color=yellow>%s<color> Ŀǰ����������������!",szmemname), "�����Ի�/OnCancel"});
	end;
end;

function onetong_addmemlist(szmemname)
	--Fix bug member disconnect while registrering - Modified by DinhHQ - 20110520
	local nPIndex = SearchPlayer(szmemname)
	if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>��� <color=yellow>%s<color> ����ʧ��.", szmemname), "�����Ի�/OnCancel"});
		return
	end
	
	if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
		
		nPIndex = SearchPlayer(szmemname)
		if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>���<color=yellow>%s<color> ����ʧ��.", szmemname), "�����Ի�/OnCancel"});
		return
	end
		
		local ret = onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, szmemname);
		if (ret == 1 and onetong_addacclist(szmemname) == 1) then
			CreateTaskSay({format("<dec><npc>���<color=yellow>%s<color> �����ɹ�!", szmemname), "�����Ի�/OnCancel"});
			Msg2Team(format("��� <color=yellow>%s<color> �����ɹ�!", szmemname))
			_TB_ONETONG_MEMLIST[1] = _TB_ONETONG_MEMLIST[1] + 1;
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = szmemname;
			tinsert(_TB_ONETONG_MEMLIST[2], szmemname);
			
			WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s ApplyAdd OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmemname
					));
		else
			CreateTaskSay({format("<dec><npc>���<color=yellow>%s<color> ����ʧ��.", szmemname), "�����Ի�/OnCancel"});
		end;
	end;
end;

function onetong_addacclist(szmemname)
	local nPIdx = SearchPlayer(szmemname);
	if (nPIdx > 0) then	--��ɫ����
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPIdx;
		local szmemacc = GetAccount();
		local n_lid = LG_GetLeagueObj(ONETONG_ACC_LGTYPE, szmemacc);
		if (FALSE(n_lid)) then
			local nLeagueID = LG_CreateLeagueObj();
			LG_SetLeagueInfo(nLeagueID, ONETONG_ACC_LGTYPE, szmemacc);
			local ret = LG_ApplyAddLeague(nLeagueID, "", "")
			LG_FreeLeagueObj(nLeagueID);
			if (ret == 1) then
				return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
			else
				return 0;
			end;
		end;
		return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
	else
		return 0;
	end;
end;

function onetong_applyaddmem(nlgtype, szlgname, szmemname)
	local n_lid = LG_GetLeagueObjByRole(nlgtype, szmemname);
	if (FALSE(n_lid)) then
		local nMemberID = LGM_CreateMemberObj();
		LGM_SetMemberInfo(nMemberID, szmemname, 0, nlgtype, szlgname) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "");
		LGM_FreeMemberObj(nMemberID);
		return ret;
	end;
	return 1;
end;


function onetong_awardtitle()
	local szTongName, nTongID = GetTong();
	local n_title = %N_TTITLE_ID;
	local n_titletype = Title_GetTitleInfo(n_title);
	
	if((nTongID == 0 or nTongID == -1) or szTongName ~= %SZTONGNAME_ONETONG or n_titletype == 1 or GetJoinTongTime() < 10080) then
		CreateTaskSay({"<dec><npc>".."���²����������콱", "�����Ի�/OnCancel"});
		return
	end
	
	SetTask(TASK_ACTIVE_TITLE, n_title);
	Title_AddTitle(n_title, 1, 90 * 24 * 60 * 60 * 18);
	Title_ActiveTitle(n_title);
	
	local sz_title = Title_GetTitleName(n_title);
	
	CreateTaskSay({"<dec><npc>".."��ϲ�����º�ֵ��������.", "�����Ի�/OnCancel"});
	
	Msg2Player(format("��ϲ����óƺ�<color=yellow>%s<color>", sz_title));
end
