-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 新版鼓
-- 文件名　：xinban_gu.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 15:19:32

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("物品使用过期，自动消失.")
		return 0;
	end
	
	local bRet, szFailMsg = tbBirthday0905:IsPlayerEligible();
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "您为够条件领取该物品");
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1,"", format("装备空位不足%d 空位，请再安排一下.", 10));
		return 1;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp) >= tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp)) then
		Msg2Player("已领取最高经验上限.");
		return 1;
	end
	
	local n_exp = tbBirthday0905.nxinbangu_addexp
	AddOwnExp(n_exp);
	tbBirthday0905.tbTask:add_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp, floor(n_exp / tbBirthday0905.expbase));
	Msg2Player(format("获得不重叠经验%d.", n_exp ));
	
end
