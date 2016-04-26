-------------------------------------------------------------------------
-- FileName		:	turebug90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:18:14
-- Desc			:   千宝库关卡的小怪脚本[90级以上]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

Include("\\script\\activitysys\\functionlib.lua")--引用lib:DoFunByPlayer

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_exp"))  --小怪经验
TUREBUGBEAR_MAPID= 395  --千宝库的地图id
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_jifen"))  --小怪经验

--这个距离大概是2屏范围
SHARE_BOSS_DIST_LEN = 80^2--该距离范围内的队友杀死boss，自己可以开宝箱

function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	set_team_task_temp181(turesureindex)
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."! 你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end

function set_team_task_temp181(turesureindex)

--Fix bug 如果同组队，但是，不同号数，不给完成任务- Modified by DinhHQ - 20110502
	local nTaskCode = GetTask(1201)
	local nOldPlayer = PlayerIndex;
	local nMemberTaskCode = 0
	local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nMemberTaskCode = GetTask(1201)
			if nMemberTaskCode == nTaskCode then
				lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, turesureindex, nSelfMapId, nSelfX, nSelfY);
			end
		end
		PlayerIndex = nOldPlayer
	else
		real_set_task_temp181(turesureindex, 0, 0, 0)
	end
end

function is_near(nMapId, nPosX, nPosY)
	if not nMapId then
		return 0
	end
	if nMapId == TUREBUGBEAR_MAPID then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		if nSelfMapId==nMapId then
			local nDis2 = (nPosX - nSelfX)^2 + (nPosY - nSelfY)^2
			if nDis2 < SHARE_BOSS_DIST_LEN then
				return 1
			end
		end
	elseif nMapId == 0 then
		return 1--没有传入地图id
	end
	return 0
end

function real_set_task_temp181(turesureindex, nMapId, nPosX, nPosY)
	local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
	if is_near(nMapId, nPosX, nPosY)==1 then
		SetTaskTemp(181,turesureindex)
		Msg2Player(format("你可以打开宝箱<color=yellow>%d 号<color> 千宝库 ",turesureindex));
	end
end

function testMemberDist(nDist)
	local nSave = SHARE_BOSS_DIST_LEN
	SHARE_BOSS_DIST_LEN = nDist
    local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, 0, nSelfMapId, nSelfX, nSelfY);
		end
	end
	SHARE_BOSS_DIST_LEN = nSave
end


