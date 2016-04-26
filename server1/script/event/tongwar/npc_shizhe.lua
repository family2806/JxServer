--武林第一帮使者
-- 九月天下第一帮 第一名帮会帮主可以登记自己的队友

Include("\\script\\event\\tongwar\\head.lua");		--天下第一帮头文件
Include("\\script\\task\\system\\task_string.lua");	--对话界面头文件
Include("\\script\\global\\titlefuncs.lua");		-- 称号

Include("\\script\\vng_event\\give_support_item.lua")
SZONETONG_LGNAME	=	"ONETONG_ONETONG";
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;
_TB_ONETONG_MEMLIST	=	{-1, {}};
local SZTONGNAME_ONETONG = "BC";
local N_TTITLE_ID = 199;

ONETONG_START_SIGNUP	= 20120528						-- 天下第一帮开始登记时间
ONETONG_ENDLE_SIGNUP	= 20120603						-- 天下第一帮结束登记时间

ONETONG_START_TITLE		= 20100118						-- 天下一帮领取头衔开始时间
ONETONG_ENDLE_TITLE		= 20100214						-- 天下一帮领取头衔结束时间

ONETONG_MAX_SIGNMEM		= 74

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= ONETONG_START_SIGNUP and nDate <= ONETONG_ENDLE_SIGNUP) then
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_create()
			tongwar_cityrank();
		end;
		CreateTaskSay({"<dec><npc>天下第一帮战队登记活动正在进行，你找我有什么事吗? ",
					"看成员名单/onetong_showlistmem",
					"报名参加天下第一帮/onetong_signupmem",
					"上交物品支援宋金/#GiveSupportItem:OpenUI()",
					"结束对话/OnCancel"});
		
	elseif (nDate >= ONETONG_START_TITLE and nDate <= ONETONG_ENDLE_TITLE) then
		
		CreateTaskSay({format("<dec><npc>我是负责送称号%s 给帮会%s. 你找我有什么事吗?", "高级第一帮", %SZTONGNAME_ONETONG ),
					format("我是帮的成员%s./onetong_awardtitle", %SZTONGNAME_ONETONG),
					"结束对话/OnCancel"});
	else
		CreateTaskSay({format("<dec><npc>您好 %s!", GetName()), "结束对话/OnCancel" });
	end;
	
end;

function onetong_showlistmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--重载名单
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		CreateTaskSay({"<dec><npc>目前名单上没有成员.", "结束对话/OnCancel"});
		return 1;
	end;
	
	local tbOpp = onetong_selfinfo2next(0);
	tinsert(tbOpp, 1, "<dec><npc>成员名单: ")
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
	CreateTaskSay({format("<dec><npc>成员想看: <enter>%s", szmem), 
			format("取消成员/#onetong_delonemem([[%s]], %d)",szmem, npos),
			"结束对话/OnCancel"		});
end;

function onetong_delonemem(szmem, npos)
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	CreateTaskSay({format("<dec><npc>确认想取消成员:<enter>%s",szmem),
			format("同意/#onetong_suredelmem([[%s]], %d)",szmem, npos),
			"放弃/OnCancel"});
end;

function onetong_suredelmem(szmem, npos)
	
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	if (LG_GetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, 1) == 1) then
		CreateTaskSay({"<dec><npc>天下第一帮帮主不能从名单中移除.", "结束对话/OnCancel"});
		return
	end;
	
	if (_TB_ONETONG_MEMLIST[2][npos] ~= szmem) then
		return
	end;
	
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
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
	CreateTaskSay({format("<dec><npc>已取消成员:<enter>%s", szmem), "结束对话/OnCancel"});
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
	opp[getn(opp)+1] = "сng/OnCancel";
	if( num == 0 ) then
		return opp;
	end;
	tinsert(opp, 1, "<dec><npc>成员名单: ");
	CreateTaskSay(opp);
end

function onetong_signupmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>只有第11次武林第一帮帮主才能执行该操作.", "结束对话/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--重载名单
	end;
	
	local szmastername = GetName();
	local n_size = GetTeamSize();
	
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>请与之前的成员组队后再报名参加.", "结束对话/OnCancel"});
		return
	elseif (n_size > 2) then
		CreateTaskSay({"<dec><npc>每次报名需要与一个成员组队.", "结束对话/OnCancel"});
		return
	end;
	
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>只有队长才能进行报名.", "结束对话/OnCancel"});
		return 0;
	end;
	
	local n_onetongid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	local nCurMemCnt = LG_GetMemberCount(n_onetongid);
	if (nCurMemCnt < _TB_ONETONG_MEMLIST[1]) then
		nCurMemCnt = _TB_ONETONG_MEMLIST[1];
	end;
	if (nCurMemCnt >= ONETONG_MAX_SIGNMEM) then
		CreateTaskSay({"<dec><npc>天下第一帮成员名单已购，不能继续报名了.", "结束对话/OnCancel"});
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
			CreateTaskSay({format("<dec><npc>你确认想报名给<color=yellow>%s<color>吗?",szmemname), format("我同意#onetong_addmemlist([[%s]])", szmemname),"结束对话/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>白字成员不能参加报名!", "结束对话/OnCancel"});
		end;
	else
		CreateTaskSay({format("<dec><npc>玩家<color=yellow>%s<color> 目前已有名字在名单上!",szmemname), "结束对话/OnCancel"});
	end;
end;

function onetong_addmemlist(szmemname)
	--Fix bug member disconnect while registrering - Modified by DinhHQ - 20110520
	local nPIndex = SearchPlayer(szmemname)
	if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>玩家 <color=yellow>%s<color> 报名失败.", szmemname), "结束对话/OnCancel"});
		return
	end
	
	if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
		
		nPIndex = SearchPlayer(szmemname)
		if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>玩家<color=yellow>%s<color> 报名失败.", szmemname), "结束对话/OnCancel"});
		return
	end
		
		local ret = onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, szmemname);
		if (ret == 1 and onetong_addacclist(szmemname) == 1) then
			CreateTaskSay({format("<dec><npc>玩家<color=yellow>%s<color> 报名成功!", szmemname), "结束对话/OnCancel"});
			Msg2Team(format("玩家 <color=yellow>%s<color> 报名成功!", szmemname))
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
			CreateTaskSay({format("<dec><npc>玩家<color=yellow>%s<color> 报名失败.", szmemname), "结束对话/OnCancel"});
		end;
	end;
end;

function onetong_addacclist(szmemname)
	local nPIdx = SearchPlayer(szmemname);
	if (nPIdx > 0) then	--角色在线
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
		CreateTaskSay({"<dec><npc>".."阁下不符合条件领奖", "结束对话/OnCancel"});
		return
	end
	
	SetTask(TASK_ACTIVE_TITLE, n_title);
	Title_AddTitle(n_title, 1, 90 * 24 * 60 * 60 * 18);
	Title_ActiveTitle(n_title);
	
	local sz_title = Title_GetTitleName(n_title);
	
	CreateTaskSay({"<dec><npc>".."恭喜，阁下很值得我钦佩.", "结束对话/OnCancel"});
	
	Msg2Player(format("恭喜您获得称号<color=yellow>%s<color>", sz_title));
end
