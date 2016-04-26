-- 玩ZingPlay获得奖品
-- 领取奖励NPC———ZingPlay使者

Include("\\script\\task\\system\\task_string.lua");	-- 对话处理头文件

-- COMMON 常量 --
ZingPlay_Start_Date	= 20081018;		-- 活动起始时间
ZingPlay_End_Date	= 20081102;		-- 领取限期

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {"<dec><npc>从18-10-2008 到 31-10-2008, 参加zingplay游戏的所有武林人士，当满足必须的要求时（去zingplay首页参考）可以来见zingplay使者领取zingplay礼包奖励。领奖时间到 02-11-2008为止."};
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		tinsert(tb_Msg, "我来领zingplay礼包./take_zingplay_bag");
	end
	
	tinsert(tb_Msg, "结束对话/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end

function take_zingplay_bag()
	local ext_pointid = 4;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>阁下不能领取此次奖励.", "结束对话/OnCancel"});
		return 0;
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,1826,1,1,0);
	local szMsg = format("获得 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end
