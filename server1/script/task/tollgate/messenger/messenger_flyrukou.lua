-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   风之骑入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--包含玩家任务数据表格的类
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"开始任务/fly_starttask",
	  	"离开区域/fly_movecity",
	  	"稍后回来/no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, " 在风骑地图上的任务 birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": 已开始计算闯关时间，加油哦！现在你想做什么?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);				--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   		--不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);               --设置为练功模式            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("已开始计算做任务时间 ")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."你已完成任务，不需要继续接了!",1,"结束任务/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": 你已完成任务，怎么还想继续接任务？快点离开这吧!",1,"结束任务/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": 你已完成信使任务了，请快点离开吧!",1,"结束任务/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("风骑驿站恭送"..name.."大人到"..citygo[i][4].."驿站!")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("驿官: 从19/06/2009 到 19/07/2009 24时,如果大侠能穿过下面其中的一个挑战，大侠将获得4个宝物中的一个，是霸王枪。大侠想参加挑战吗?", 8, 
		"接消灭500金国间谍任务 /#birthday0905_settask_message(1)",
		"接消灭6个虎豹骑任务 /#birthday0905_settask_message(2)",
		"接受接触100个坐标任务./#birthday0905_settask_message(3)",
		"我已完成消灭500金国间谍任务 /#birthday0905_gettask_message(1)",
		"我已完成消灭6个虎豹骑任务 /#birthday0905_gettask_message(2)",
		"我已完成接触100个坐标任务./#birthday0905_gettask_message(3)",
		"我想放弃目前任务/birthday0905_cancel_message",
		"我有急事，稍候回来./no");
end

function no()
	
end
