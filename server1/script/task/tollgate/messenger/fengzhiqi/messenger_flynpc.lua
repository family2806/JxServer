-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   风之骑关卡的出口处对话npc，风之骑将白翼
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
	
	if ( messenger_middletime() == 10  ) then
		Msg2Player("对不起! "..name.."! 你已没时间执行信使任务，任务失败!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_BaiYi..":"..name..", 你不是已经穿过风骑挑战了吗？想出关啊?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_BaiYi..": 信使令 - 木"..name..", 你不是已经穿过风骑挑战了吗？想出关啊?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_BaiYi..": 信使令 - 铜"..name.."大人，是不是你已过了风骑的挑战了？想出关是吗 ?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_BaiYi..": 信使令 - 银"..name.."大人，是不是你已过了风骑的挑战了？想出关是吗 ?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_BaiYi..": 信使令 - 金"..name.."大人，是不是你已过了风骑的挑战了？想出关是吗 ?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_BaiYi..": 御赐金牌- 金"..name.."大人，我未见过御赐金牌，今天算是大开眼界了。你真是厉害。你已过了风骑的挑战，想出关是吗 ?",3,"对。我想离开/messenger_comeback","我未完成考验，但是不想继续做了/messenger_icantdo","不是，我还想继续/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --风之骑任务的任务变量设置为任务完成状态
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
		taskProcess_002_06:doTaskEntity()  --同伴剧情任务
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..":对不起，你未过关，在风骑地图上最少你要确定<color=red>5个坐标<color> 才能过关.",1,"结束对话/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_BaiYi..": 你想离开是吗？如果未完成任务就离开，你也可以到驿官那里交任务和领奖，但是，奖励会少很多。",2,"对。我想离开/f_fallmessengertask","让我想想/no")

end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --风之骑任务的任务变量设置为简单任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
