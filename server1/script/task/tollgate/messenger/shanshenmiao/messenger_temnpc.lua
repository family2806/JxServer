-------------------------------------------------------------------------
-- FileName		:	messenger_temnpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:29:14
-- Desc			:   山神庙关卡的出口处对话npc，纳兰青城
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --增加同伴剧情任务完成的控制判断
Include("\\script\\activitysys\\g_activity.lua")			--活动编辑器
Include("\\script\\activitysys\\playerfunlib.lua")		--活动编辑器

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("对不起! "..name.."! 你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_NaLanQingCheng..":"..name..", 是不是通过了山神庙的考验，想离开啊?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_NaLanQingCheng..": 信使令 - 木"..name..", 是不是通过了山神庙的考验，想离开啊?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_NaLanQingCheng..": 信使令 - 铜"..name.."是不是通过了山神庙的考验，想离开啊?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_NaLanQingCheng..": 信使令 - 银"..name.."太辛苦你了是不是已经通过山神庙的考验，想离开了?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_NaLanQingCheng..": 信使令 - 金"..name.."你从远处来，辛苦了是不是已经通过山神庙的考验，想离开了?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_NaLanQingCheng..": 御赐金牌 - 金"..name.."之前我未见过御赐金牌，今天总算是大开眼界了，你真是厉害. 是不是通过了山神庙的考验，想离开啊?",3,"对，我想离开/messenger_comeback","我为完成任务，但是不想继续了/messenger_icantdo","不是，我还想继续试试/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 2 ) then
		nt_setTask(1202,30)  --山神庙任务的任务变量设置为任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_07:doTaskEntity()
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 2, n_level);
		
		SetPos(1337,3154);
	else
		Describe(DescLink_NaLanQingCheng..": 对不起，你还未完成前方的关卡任务，在山神庙地图上至少要下<color=red>2个刀妖<color> 才算过关.",1,"结束对话/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_NaLanQingCheng..": 是不是你想离开？如果未完成任务就离开，你也可以到驿官那里交任务领奖，但是，奖励会减少很多.",2,"对，我想离开/s_fallmessengertask","让我想想/no")

end

function s_fallmessengertask()
		nt_setTask(1202,25)  --山神庙任务的任务变量设置为简单完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1337,3154);
end

function no()
end
