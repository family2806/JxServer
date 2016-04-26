-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 龙凤尾
-- 文件名　：longfeng_wei.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 12:05:35

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if 20090619 > nCurDate or nCurDate > 20090727 then	
		Talk(1, "", "活动已结束.");
		return 0;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == tbBirthday0905.tbTask.nmaxexpfromzhuhe) then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
		Msg2Player("升级获得[新盘古]和[新盘期]限制经验为3000000000 Exp")
	else
		
		Talk(1, "", "不能使用该物品.");
		return 1;
		
	end
end

