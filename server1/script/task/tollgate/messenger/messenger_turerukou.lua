-------------------------------------------------------------------------
-- FileName		:	messenger_turerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   千宝库入口
-------------------------------------------------------------------------

Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数

Include("\\script\\lib\\common.lua");

Include("\\script\\activitysys\\functionlib.lua")--引用lib:DoFunByPlayer

function main()
	local tbDialog =
	{
		--"接受任务/ture_gettask",
		"开始任务 /ture_try_starttask",
		"接任务/ture_continuetask",
	  	"离开区域/ture_movecity",
	  	"稍后回来 /no",
	}
--	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "在千宝库地图的任务/birthday0905_ture");
--	end
	 Describe(DescLink_YiGuan..":从我这开始给大家分工具体任务，加油哦。由队长开始任务的组队将更容易完成任务。现在你想做什么？",getn(tbDialog), unpack(tbDialog))
end

--function ture_gettask()
--	local Uworld1204 = nt_getTask(1204)  --记录玩家的任务变量，每次任务结束时清空
--	local Uworld1028 = nt_getTask(1028)  --任务链任务变量
--
--	if ( GetLevel() < 120 ) then
--		Describe(DescLink_YiGuan.."：对不起，您当前等级没有达到最小的120级要求。请达到等级再来找我吧。",1,"结束对话/no")	
--	elseif ( Uworld1204 ~= 0 )  then
--		Describe(DescLink_YiGuan.."：对不起，您当前的信使任务未完成，不能接同样的任务，请先完成该任务，谢谢。",1,"结束对话/no")
--	elseif (  messenger_givetime() == 10 ) then  --查看今日是否还有关卡时间
--		Describe(DescLink_YiGuan.."：对不起，您今天在信使任务中的时间已耗尽，请明日再来,谢谢。",1,"结束对话/no")
--	else
--		nt_setTask( 1204,1 )
--		nt_setTask( 1203,10) --设置信使任务的步骤
--	end
--end

--function ture_starttask()
--	if ( nt_getTask(1203) == 10 ) then
--		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
--		nt_setTask(1203,20)
--		DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
--		SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
--		SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
--		SetPunish(0);				--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
--		SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
--		ForbidChangePK(1);   		--不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
--		SetPKFlag(0);               --设置为练功模式            
--		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
--		SetPos(1414,3191);
--		Msg2Player("任务开始计时了")
--	elseif ( nt_getTask(1203) == 20 ) then
--		Describe(DescLink_YiGuan.."：你已经开始了任务，无需再开始勒。",1,"结束对话/no")
--	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
--		Describe(DescLink_YiGuan.."：你已经完成了任务，怎么还要开始任务呢？速速离开吧。",1,"结束对话/no")
--	elseif ( nt_getTask(1203) == 0 ) then
--		Describe(DescLink_YiGuan.."：你的信使任务已经失败，请速速离开。",1,"结束对话/no")
--	end
--end

function ture_try_starttask()
	if ( nt_getTask(1203) == 10 ) then
		--自己开始任务
		local nTeamSize = GetTeamSize();
		if nTeamSize > 1 and IsCaptain() ~= 1 then
			Describe(DescLink_YiGuan..": 你不是队长，不能开始任务 ",1,"结束对话/no")
			return
		end
		
		local nTaskCode,_ = %get_task_order()
		ture_real_starttask_one(nTaskCode);
		
    	if (nTeamSize > 1) then
    		--所有队员开始任务
    		for i=1,nTeamSize do
    			local nMemberIndex = GetTeamMember(i)
    			print(format("nMemberIndex:%d", nMemberIndex))
    			if nMemberIndex >= 0 then
    			
--    			if(CallPlayerFunction(nMemberIndex, IsCaptain)~=1)then
--    				CallPlayerFunction(nMemberIndex, ture_real_starttask_member, nTaskCode)
--    			end
        			if(lib:DoFunByPlayer(nMemberIndex, IsCaptain)~=1)then
    					lib:DoFunByPlayer(nMemberIndex, ture_real_starttask_member, nTaskCode);
    				end
    			else
    				print(format("nMemberIndex:%d error", nMemberIndex))
				end
    		end
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] 开始信使任务，组队人数为 [%d]",
			GetAccount(),
			GetName(),
			nTeamSize
			)
		);
	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
		Describe(DescLink_YiGuan..": 你已开始任务，不需要再开始了.",1,"结束对话/no")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": 任务已完成，怎么还需要开始呢？快点离开这里吧.",1,"结束对话/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": 你已完成信使任务了，快点离开这里吧!",1,"结束对话/no")
	end
end

function ture_real_starttask_one(nTaskCode)
	nt_setTask(1202,0)--清空当前任务进度
	ture_real_starttask(nTaskCode)
	
	local szMsg,nCount = get_task_string(nTaskCode)
	szMsg = format("你开始天保库送信任务，快抓住时机打开5个宝箱完成任务，请注意按秩序打开<color=yellow>%s<color>", szMsg)
	Msg2Player(szMsg)
end

function ture_real_starttask_member(nTaskCode)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == 395 then
    	if ( nt_getTask(1203) == 10 ) then
    		nt_setTask(1202,0)--清空当前任务进度
    		ture_real_starttask(nTaskCode)
    		
    		local szMsg,nCount = get_task_string(nTaskCode)
    		szMsg = format("你的队长已开始天保库送信任务了, 请抓住时机到地图 <color=yellow> 天保库 <color> 打开5个宝箱完成任务，请注意按秩序打开<color=yellow>%s<color>", szMsg)
    		Msg2Player(szMsg)
    		return
    	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
    		Msg2Player("你的队长已开始天保库送信任务了, 你的任务与队伍的不同，要自己完成哦。" )
    	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
    		Msg2Player("你的队长已开始天保库送信任务了, 你的任务已完成，与队伍的不同，快离开队伍去交任务")
    	elseif ( nt_getTask(1203) == 0 ) then
    		Msg2Player("你的队长已开始天保库送信任务了, 你还未接该任务，请离开队伍吧")
    	end
    else
    	Msg2Player("你的队长已开始天保库送信任务了, 你不在地图<color=yellow>天保库<color>, 请自己完成")
	end
	
	Msg2Team(format("<color=yellow>%s<color>任务进度与队伍不同", GetName()))
end

function ture_real_starttask(nTaskCode)
	nt_setTask(1211,GetGameTime())              --:设置任务开始时间
	nt_setTask(1203,20)
	nt_setTask(1201,nTaskCode)
	DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
	SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
	SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
	SetPunish(1);				--打开死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
	--SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
	ForbidChangePK(0);   		--允许更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
	SetPKFlag(0);               --设置为练功模式            
	SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
	SetPos(1414,3191);
	--Cho b蕋 t?3 gi﹜, tr竓 b? s竧 - Modifiec by DinhHQ - 20110502
	SetProtectTime(3*18)
	AddSkillState(963, 1, 0, 18*3) 	
end

function ture_movecity()
--，当完成信使任务时，如果靠驿官NPC移动，Fix bug 依然可以在城内PK- Modified by DinhHQ - 20110518
	DisabledUseTownP(0)
	SetFightState(0)	
	SetPunish(1)
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	local name = GetName()
	if ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("天保库驿站"..name.."大人到"..citygo[i][4].."驿站!")
			end
		end	
	elseif ( nt_getTask(1203) == 10 ) or ( nt_getTask(1203) == 0 ) or ( nt_getTask(1203) == 20) or ( nt_getTask(1203) == 21 ) then
		SetLogoutRV(0);
		NewWorld(11,3021,5090)
	end
end

function birthday0905_ture()
	tbBirthday0905.tbTask:reset_task();
	Say("驿官: 从19/06/2009 到 19/07/2009 24时,如果大侠能穿过下面其中的一个挑战，大侠将获得4个宝物中的一个，是天残刀。大侠想参加挑战吗?", 8, 
		"接任务打开100个宝箱./#birthday0905_settask_message(4)",
		"接任务消灭一个盗贼./#birthday0905_settask_message(5)",
		"接任务寻找一个失落少女./#birthday0905_settask_message(6)",
		"我已完成任务打开100个宝箱./#birthday0905_gettask_message(4)",
		"我已完成任务消灭一个盗贼./#birthday0905_gettask_message(5)",
		"我已完成任务寻找一个失落少女./#birthday0905_gettask_message(6)",
		"我想放弃目前任务/birthday0905_cancel_message",
		"我有急事，稍候回来./no");
end

function no()
end

function ture_continuetask()
	if ( nt_getTask(1203) == 10 ) then
		Describe(DescLink_YiGuan..": 你的任务还未开始，不能继续任务",1,"结束对话/no")
	elseif ( nt_getTask(1203) == 20 ) then
		Describe(DescLink_YiGuan..": 你的任务已经开始，快点去打开5个宝箱吧.",1,"结束对话/no")
	elseif ( nt_getTask(1203) == 21 ) then
		ture_real_starttask(nt_getTask(1201))
		Msg2Player("你的任务可以继续")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": 你的任务已完成，不需要继续了.",1,"结束对话/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": 你的任务已失败，快点离开这里吧.",1,"结束对话/no")
	end
end

