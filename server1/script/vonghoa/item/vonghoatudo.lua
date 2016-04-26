Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
--Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")

 tbAwardEXPTuDo=
 {
 	{nExp_tl=5000000, nRate = 80},
 	{nExp_tl=5500000, nRate = 15},
 	{nExp_tl=6000000, nRate = 5},
 };
  tbAwardItemTuDo=
  {
  	{szName = "玄猿令", tbProp = {6, 1, 2351, 1, 0, 0}, nCount = 1, nRate = 0.2},	
  	{szName = "苍狼令", tbProp = {6, 1, 2352, 1, 0, 0}, nCount = 1, nRate = 0.5},	
  	{szName = "云鹿令", tbProp = {6, 1, 2353, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "青驹令", tbProp = {6, 1, 2369, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "混元灵露", tbProp = {6, 1, 2312, 1, 0, 0}, nCount = 1, nRate = 15},	
  	{szName = "玄天锦囊", tbProp = {6, 1, 2355, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "神农真丹", tbProp = {6, 1, 2113, 1, 0, 0}, nCount = 1, nRate = 3},	
  	{szName = "八珍福月蜡烛", tbProp = {6, 1, 1817, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "挑战礼包", tbProp = {6, 1, 2006, 1, 0, 0}, nCount = 1, nRate = 7},	
  	{szName = "百年珍露", tbProp = {6, 1, 2266, 1, 0, 0}, nCount = 1, nRate = 12},	
  	{szName = "龙血丸", tbProp = {6, 1, 2117, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "天龙令", tbProp = {6, 1, 2256, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "白骨令", tbProp = {6, 1, 2255, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "海龙珠", tbProp = {6, 1, 2115, 1, 0, 0}, nCount = 1, nRate = 3.3},	
  	{szName = "仙草露( 特效)", tbProp = {6, 1, 1181, 1, 0, 0}, nCount = 1, nRate =5 },	
  	{szName = "试炼帖", tbProp = {6, 1, 2317, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "辉煌果(高级)", tbProp = {6, 1, 906, 1, 0, 0}, nCount = 1, nRate = 10,nExpiredTime = 10080},	
  	{szName = "百年辉煌果", tbProp = {6, 1, 2269, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "千年辉煌果", tbProp = {6, 1, 2270, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "万能辉煌果", tbProp = {6, 1, 2271, 1, 0, 0}, nCount = 1, nRate = 1},	
  };
   function tbRandom(tbAward)
 	local nRanVar =random(1,100);
	local num = 0; row = 0
	for row=1,getn(tbAward) do
		num = num + tbAward[row].nRate;
		if nRanVar <= num then
			return row
		end
	end
 end
 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("物品过使用期，自动失效.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","你正在使用物品 !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","使用花圈达到最大经验值!")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","等级小于50，不能使用 !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "装备不足5空位.");
			return 1
	end
	
	local nPlayerIndex = SearchPlayer(GetName())
	if(nPlayerIndex > 0)then
		local nValue = tbRandom(tbAwardEXPTuDo)
		if (nValue==nil) then
					nValue = 1
		end
		SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) + tbAwardEXPTuDo[nValue].nExp_tl/10000)
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPTuDo[nValue] , "领取使用自由花圈经验值")
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardItemTuDo , "领取 Item 使用自由花圈")
	end
end