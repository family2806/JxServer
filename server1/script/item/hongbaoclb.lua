Include("\\script\\lib\\awardtemplet.lua")

tbItemAward = {
	{szName = "紫莽玲", tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},	
	{szName = "玄猿令", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.05},	
	{szName = "苍狼令", tbProp = {6, 1, 2352, 1, 0, 0}, nRate = 1},	
	{szName = "云鹿令", tbProp = {6, 1, 2353, 1, 0, 0}, nRate = 3},	
	{szName = "混元灵露", tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 10},	
	{szName = "大力丸", tbProp = {6, 0, 3, 1, 0, 0}, nRate = 5},	
	{szName = "飞速丸", tbProp = {6, 0, 6, 1, 0, 0}, nRate = 5},	
	{szName = "黄金之果", tbProp = {6, 1, 907, 1, 0, 0}, nRate = 10, nExpiredTime = 10080},	
	{szName = "千年黄金之果", tbProp = {6, 1, 2270, 1, 0, 0}, nRate = 20},	
	{szName = "万年黄金之果", tbProp = {6, 1, 2271, 1, 0, 0}, nRate = 7.94},	
	{szName = "百年黄金之果", tbProp = {6, 1, 2269, 1, 0, 0}, nRate = 30},	
	{szName = "神秘矿石", tbProp = {6, 1, 398, 1, 0, 0}, nRate = 1},	
	{szName = "玄真丹", tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 5, tbParam={15e8}},	
	{szName = "紫金真丹", tbProp = {6, 1, 2263, 1, 0, 0}, nRate = 2, tbParam={20e8}},	
}

tbExpAward = {szName = "经验值", nExp_tl = 50000000}

TASK_USECOUNT = 2789
TASK_MONTH = 2790


function main(nItemIndex)
	local nMonth =tonumber(GetLocalDate("%m"))

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("该物品过了使用期，自动消失.")
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "大侠的装备不足1个空位!.");
		return 1
	end
	
	if (GetTask(TASK_MONTH) ~= nMonth) then
		SetTask(TASK_MONTH, nMonth)
		SetTask(TASK_USECOUNT, 0)
	end
	
	if (GetTask(TASK_USECOUNT) < 9) then
		SetTask(TASK_USECOUNT, GetTask(TASK_USECOUNT)+1)
		tbAwardTemplet:GiveAwardByList(tbExpAward , "获得红包俱乐部");
		tbAwardTemplet:GiveAwardByList(tbItemAward , "获得红包俱乐部");
		return 0
	else
		Msg2Player("物品最多只能一个月使用9次!")
		return 1
	end
	
end
