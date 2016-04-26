-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - JxWeb沟通使者
-- 文件名　：npc_jxweb.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-13 15:24:37

-- ======================================================
IncludeLib("ITEM");
Include("\\script\\event\\other\\jxweb_npc\\jxweb_head.lua");		-- 头文件

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {};
	
	if (n_date >= JxWeb_Start_Date and n_date <= JxWeb_End_Date) then
		tb_Msg = {"<dec><npc>".."现在正举行JX Web的Open Beta活动，各位大侠赶快加入到JX Web的世界来领取很多吸引人的奖励吧."};
		tinsert(tb_Msg, "帮助新手活动/jxweb_take_bag_1");
		tinsert(tb_Msg, "繁荣TOP竞赛活动/jxweb_other_dec");
	else
		jxweb_other_dec()
		return 0;
	end
	
	tinsert(tb_Msg, "结束对话/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end


function jxweb_take_bag_1()
	CreateTaskSay({"<dec><npc>".."{{帮助新手}活动:从01-05-2009到24:00 22-05-2009. 在此期间，之前一天完成1个收集任务则在第二天的10h-24h可以领取{{连心丹}}.", 
					format("得到%s/jxweb_take_bag_2", "连心丹"), 
					"结束对话/OnCancel"});
end

function jxweb_take_bag_2()
	local ext_pointid = 5;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>各位这次不能领奖.", "结束对话/OnCancel"});
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 2) then
		Talk(1, "", "背包要有2个空位.");
		return
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,2023,1,1,0);
	ITEM_SetExpiredTime(nIdx, JxWeb_Item_Expire_Date);
	SyncItem(nIdx);
	SetItemBindState(nIdx, -2);
	
	local szMsg = format("收集到 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	CreateTaskSay({"<dec><npc>"..szMsg, "多谢师兄 ".."/OnCancel"});
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end


function jxweb_other_dec()
	CreateTaskSay({"<dec><npc>".."{{繁荣点TOP竞赛}}活动:从01-05-2009到24:00 22-05-2009. 繁荣点最高的前10名可以领取诱人的奖品.", 
					"结束对话/OnCancel"});
end
