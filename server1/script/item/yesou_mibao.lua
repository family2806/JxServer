-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 道具:杀手秘宝
-- 文件名　：shashou_mibao.lua
-- 创建者　：子非魚
-- 创建时间：2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- 奖励模板
local n_XuanTian_Chui = 6;

tbItem_Mibao = {
	{szName = "仙草露",tbProp = {6,1,71,1,1,0}, nRate = 15.873},--ok
	{szName = "紫莽令", tbProp = {6,1,2350,1,1,0}, nRate = 0.2},--ok
	{szName = "玄猿令", tbProp = {6,1,2351,1,1,0}, nRate = 0.5},--ok
	{szName = "紫莽令", tbProp = {6,1,2350,1,1,0}, nRate = 0.1},--ok
	{szName = "玄猿令", tbProp = {6,1,2351,1,1,0}, nRate = 0.1},--ok
	{szName = "大力丸", tbProp = {6,0,3,1,1,0}, nRate = 25},--ok
	{szName = "飞速丸", tbProp = {6,0,6,1,1,0}, nRate = 25},--ok
	{szName = "挑战礼包", tbProp = {6,1,2006,1,1,0}, nRate = 20},--ok
	{szName = "辉煌果(高) ", tbProp = {6,1,906,1,1,0}, nRate = 10, nExpiredTime = 10080},--ok
	{szName = "黄金之果 ", tbProp = {6,1,907,1,1,0}, nRate = 0.5, nExpiredTime = 10080},--ok
	{szName = "回天再造锦囊", tbProp = {6,1,1781,1,1,0}, nRate = 3, tbParam = {60}},	-- 锦囊包含60个--ok
}

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("需要%d %s, 阁下所带数量不够!", %n_XuanTian_Chui, "玄天锤"));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "野叟的秘宝"))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- 数据埋点第一期
	else
		Msg2Player("包内空位不足! ");
		return 1
	end
end
