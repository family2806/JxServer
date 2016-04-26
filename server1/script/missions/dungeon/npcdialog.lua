Include("\\script\\missions\\dungeon\\dungeonmanager.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--弹出对话框
	tbDailog:Show()
	
end

if not DungeonDlg then
	DungeonDlg = {};
end

function DungeonDlg:DungeonTempletDlg(szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";
	
	for i, n in tbDungeonManager.tbDungeonTempletList do
		if (i ~= "n") then
			tinsert(tbOpt, {i, DungeonDlg.DungeonInfoDlg, {DungeonDlg, i, szTile}})
		end
	end
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DungeonInfoDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";

	tinsert(tbOpt, {format("打开 [%s]",strDungeon), tbDungeonManager.OpenDungeon, {tbDungeonManager, strDungeon}});
	tinsert(tbOpt, {format("检查打开[%s]",strDungeon), DungeonDlg.DungeonListDlg, {DungeonDlg, strDungeon, szTile}});
	tinsert(tbOpt, {format("管理打开[%s]",strDungeon), DungeonDlg.OptDungeonDlg, {DungeonDlg, strDungeon, szTile}});
	tinsert(tbOpt, {"再见",DungeonDlg.Cancel, {DungeonDlg}});
	
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DungeonListDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);

	for i,v in tbList do
		if (i ~= "n") then
			if (v.bHiden ~= 1 and (v.nMemberLimit ~= nil and getn(v.tbMember) < v.nMemberLimit)) then
				if (v.nOpenMapId == nil or v.nOpenMapId == SubWorldIdx2ID(SubWorld)) then
					tinsert(tbOpt, {format("[%s]打开[%s]", v.strOwner, v.strDungeon), DungeonDlg.DungeonOpDlg, {DungeonDlg, v.nDungeonId, szTile}});
				end
			end
		end
	end
	tinsert(tbOpt, {"再见",DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:MineDungeonListDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);
	local strName = GetName();
	
	for i,v in tbList do
		if (i ~= "n" and (v.nOpenMapId == nil or v.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
			for j,u in v.tbMember do
				if (j ~= "n") then
					if (u.strName == strName) then
						tinsert(tbOpt, {format("[%s] 打开[%s]", v.strOwner, v.strDungeon), DungeonDlg.DungeonOpDlg, {DungeonDlg, v.nDungeonId, szTile}});
					end
				end
			end
			
		end
	end
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:OptDungeonDlg(strDungeon, szTile)
	local tbOpt = {};
	local szTempTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);
	local tbDungeon = nil;
	local strName = GetName();
	for i,v in tbList do
		if (i ~= "n") then
			if  (v.strOwner == strName) then
				tbDungeon = v;
				szTempTile = format("%s 下面是你打开 [<color=yellow>%s<color>] 信息 <enter>=====================================<enter>",szTempTile, tbDungeon.strDungeon);
				szTempTile = format("%sId:<color=green>%0.f<color><enter>",szTempTile, tbDungeon.nDungeonId);
				szTempTile = format("%s 拥有 :<color=yellow>%s<color><enter>",szTempTile, tbDungeon.strOwner);
				szTempTile = format("%s 打开时间<color=green>%04d-%02d-%02d %02d:%02d<color><enter>",szTempTile, 
									tbDungeon.nOpenTime/100000000, 
									mod(tbDungeon.nOpenTime, 100000000)/1000000,  
									mod(tbDungeon.nOpenTime, 1000000)/10000,
									mod(tbDungeon.nOpenTime, 10000)/100,
									mod(tbDungeon.nOpenTime, 100));
				if (v.nLifeTime ~= nil) then
					szTempTile = format("%s 剩余时间:<color=green>%0.f<color> 秒<enter>",szTempTile, tbDungeon.nLifeTime);
				end
				szTempTile = format("%s 成员( 红字是玩家在[<color=yellow>%s<color>]):<enter>",szTempTile, tbDungeon.strDungeon);
				for j,u in v.tbMember do
					if (j ~= "n") then
						if (u.bInDungeon == 1) then
							szTempTile = format("%s<color=red>%s,<color>",szTempTile, u.strName);
						else
							szTempTile = format("%s%s,",szTempTile, u.strName);
						end
					end
				end
			end
		end
	end

	if (tbDungeon ~= nil) then
		if (tbDungeon.bHiden ~= 1) then
			tinsert(tbOpt, {"禁止打扰", DungeonDlg.Hiden, {DungeonDlg, tbDungeon.nDungeonId, 1}});
		else
			tinsert(tbOpt, {"取消禁止打扰", DungeonDlg.Hiden, {DungeonDlg, tbDungeon.nDungeonId, 0}});
		end
		
		tinsert(tbOpt, {"处理邀请", DungeonDlg.OptApplyDlg, {DungeonDlg, tbDungeon.nDungeonId, szTile}});
		tinsert(tbOpt, {"删除成员", DungeonDlg.DelMemberDlg, {DungeonDlg, tbDungeon.nDungeonId, szTile}});
		tinsert(tbOpt, {format("сng [%s]", tbDungeon.strDungeon), DungeonDlg.CloseDungeon, {DungeonDlg, tbDungeon.nDungeonId}});
	end
	
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTempTile== nil or szTempTile == "" then
		szTempTile = format("你还未打开 [%s]",strDungeon);
	end
	CreateNewSayEx(szTempTile, tbOpt);
end

function DungeonDlg:DungeonOpDlg(nDungeonId, szTile)
	local tbOpt = {};
	local szTempTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local strName = GetName();
	local bMember = 0;
	if (tbDungeon ~= nil) then
		szTempTile = format("%s 下面是 [<color=yellow>%s<color>] 信息<enter>=====================================<enter>",szTempTile, tbDungeon.strDungeon);
		szTempTile = format("%sId:<color=green>%0.f<color><enter>",szTempTile, tbDungeon.nDungeonId);
		szTempTile = format("%s 拥有 :<color=yellow>%s<color><enter>",szTempTile, tbDungeon.strOwner);
		szTempTile = format("%s 打开时间 <color=green>%d-%02d-%02d %02d:%02d<color><enter>",szTempTile, 
							tbDungeon.nOpenTime/100000000, 
							mod(tbDungeon.nOpenTime, 100000000)/1000000,  
							mod(tbDungeon.nOpenTime, 1000000)/10000,
							mod(tbDungeon.nOpenTime, 10000)/100,
							mod(tbDungeon.nOpenTime, 100));
		if (tbDungeon.nLifeTime ~= nil) then
			szTempTile = format("%s 剩余时间:<color=green>%0.f<color> 秒<enter>",szTempTile, tbDungeon.nLifeTime);
				end
				szTempTile = format("%s 成员( 红字是玩家在[<color=yellow>%s<color>]):<enter>",szTempTile, tbDungeon.strDungeon);
				for j,u in tbDungeon.tbMember do
			if (j ~= "n") then
				if (u.strName == strName) then
					bMember = 1;
				end
				if (u.bInDungeon == 1) then
					szTempTile = format("%s<color=red>%s,<color>",szTempTile, u.strName);
				else
					szTempTile = format("%s%s,",szTempTile, u.strName);
				end
			end
		end
		
		if (tbDungeon.strOwner == strName) then
			tinsert(tbOpt, {format("进入 [%s]", tbDungeon.strDungeon), tbDungeonManager.EnterDungeon, {tbDungeonManager, nDungeonId}});
			tinsert(tbOpt, {format("管理打开[%s]", tbDungeon.strDungeon), DungeonDlg.OptDungeonDlg, {DungeonDlg, tbDungeon.strDungeon, szTile}});
		elseif (bMember ~= 1) then
			tinsert(tbOpt, {"发送加入要求", tbDungeonManager.ApplyJoinDungeon, {tbDungeonManager, nDungeonId, strName}});
		else
			tinsert(tbOpt, {format("进入 [%s]", tbDungeon.strDungeon), tbDungeonManager.EnterDungeon, {tbDungeonManager, nDungeonId}});
			tinsert(tbOpt, {format("退出[%s]", tbDungeon.strDungeon), tbDungeonManager.DelMember, {tbDungeonManager, nDungeonId, strName}});
		end
		
	end
	
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTempTile== nil or szTempTile == "" then
		szTempTile = format("你未打开 [%s]",strDungeon);
	end
	CreateNewSayEx(szTempTile, tbOpt);
end

function DungeonDlg:OptApplyDlg(nDungeonId, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		for i,v in tbDungeon.tbApply do
			if (i ~= "n") then
				tinsert(tbOpt, {format("同意加入 [%s]",v), DungeonDlg.AddMember, {DungeonDlg, nDungeonId, v}});
			end
		end
	end
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:AddMember(nDungeonId, strName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeonManager:AddMember(nDungeonId, strName);
	end
end

function DungeonDlg:DelMemberDlg(nDungeonId, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>您好，我是该副本的管理员.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local strName = GetName();
	if (tbDungeon ~= nil) then
		if (tbDungeon ~= nil and tbDungeon.strOwner == strName and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
			for i,v in tbDungeon.tbMember do
				if (i ~= "n" and v.strName ~= tbDungeon.strOwner) then
					tinsert(tbOpt, {format("[%s] 离开 [%s]", v.strName, tbDungeon.strDungeon), DungeonDlg.DelMember, {DungeonDlg, nDungeonId, v.strName}});
				end
			end
		end
	end
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DelMember(nDungeonId, strName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeonManager:DelMember(nDungeonId, strName);
	end
end

function DungeonDlg:Hiden(nDungeonId, bHiden)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeon.bHiden = bHiden;
		Talk(1,"",bHiden == 1 and format("你已设置 [%s] 禁止打扰状态!",tbDungeon.strDungeon) or
			 format("取消 [%s] 打扰状态!",tbDungeon.strDungeon));
	end
end

function DungeonDlg:CloseDungeon(nDungeonId)
	local tbOpt = {};
	local szTile = "<npc> ";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		szTile = format("你确定想关闭[<color=red>%s<color>]?",tbDungeon.strDungeon);
		tinsert(tbOpt, {"确定", DungeonDlg.CloseDungeonCommit, {DungeonDlg, tbDungeon.nDungeonId}});
	end
	tinsert(tbOpt, {"再见", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --防止报错
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:CloseDungeonCommit(nDungeonId)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		WriteLog(format("[%s] %s close owen [%s] dungeon(id:%d), templet mapid is [%0.f].", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, tbDungeon.strDungeon , tbDungeon.nDungeonId, tbDungeon.nMapTemplet));
		tbDungeonManager:CloseDungeon(nDungeonId);
	end
end

function DungeonDlg:Cancel()
end