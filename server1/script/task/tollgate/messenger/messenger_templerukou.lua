-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   山神庙入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"开始任务 /temple_starttask",
	  	"离开区域/temple_movecity",
	  	"稍后回来 /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "在山神庙地图上的任务 /birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": 已开始计算闯关时间，加油哦！现在你想做什么?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1202,20)
		DisabledUseTownP(1)--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);--允许组队				--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   --不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);        --设置为练功模式        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("已开始计算做任务时间 ")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."你已完成任务，不需要继续接了!",1,"结束对话/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": 你已完成任务，怎么还想继续接任务？快点离开这吧!",1,"结束对话/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": 你已完成信使任务了，请快点离开吧!",1,"结束对话/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("山神庙驿站恭送"..name.."大人到"..citygo[i][4].."驿站!")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("驿官: 从19/06/2009 到 19/07/2009 24时, 通过下面的任务可以获得夏日宫，大侠想参加吗?", 6, 
		"接消灭2个刀妖任务./#birthday0905_settask_message(7)",
		"接消灭100个山神庙刀手任务./#birthday0905_settask_message(8)",
		"我已完成消灭2个刀妖任务./#birthday0905_gettask_message(7)",
		"我已完成消灭100个山神庙刀手任务./#birthday0905_gettask_message(8)",
		"我想放弃现在的任务/birthday0905_cancel_message",
		"我有急事，稍候回来./no");
end

function no()
end
