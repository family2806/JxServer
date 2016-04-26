-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 道具:杀手秘宝
-- 文件名　：shashou_mibao.lua
-- 创建者　：子非魚
-- 创建时间：2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- 奖励模板
Include("\\script\\task\\tollgate\\killer\\mibao_head.lua")

local n_XuanTian_Chui = 6;

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("需要%d %s, 阁下所带数量不够!", %n_XuanTian_Chui, "玄天锤"));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "杀手秘宝"))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- 数据埋点第一期
	else
		Msg2Player("包内空位不足! ");
		return 1
	end
end
