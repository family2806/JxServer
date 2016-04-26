--家传秘籍
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\taskctrl.lua")
Include("\\script\\lib\\pay.lua")
local tbAwardList = 
{
	[1] = {nExp = 1000000},
	[2] =
	{
		{szName="安邦冰晶项链", nQuality=1, nRate=0.002, tbProp={0, 164}},
		{szName="安邦鸡血石戒指", nQuality=1, nRate=0.005, tbProp={0, 167}},
		{szName="安邦菊花石指环", nQuality=1, nRate=0.005, tbProp={0, 165}},
		{szName="安邦田黄石玉佩", nQuality=1, nRate=0.01, tbProp={0, 166}},
		{szName="定国乌沙发冠", nQuality=1, nRate=0.005, tbProp={0, 160}},
		{szName="定国青纱长衫", nQuality=1, nRate=0.008, tbProp={0, 159}},
		{szName="定国银蚕腰带", nQuality=1, nRate=0.2, tbProp={0, 163}},
		{szName="定国赤绢软靴", nQuality=1, nRate=0.05, tbProp={0, 161}},
		{szName="定国紫藤护腕", nQuality=1, nRate=0.2, tbProp={0, 162}},
		{szName="柔情巾帼霓裳", nQuality=1, nRate=0.002, tbProp={0, 190}},
		{szName="柔情慧心玉佩", nQuality=1, nRate=0.01, tbProp={0, 193}},
		{szName="柔情凤仪戒指", nQuality=1, nRate=0.2, tbProp={0, 192}},
		{szName="柔情淑女项链", nQuality=1, nRate=0.15, tbProp={0, 191}},
		{szName="侠骨情义结", nQuality=1, nRate=0.01, tbProp={0, 189}},
		{szName="侠骨铁血衫", nQuality=1, nRate=0.1, tbProp={0, 186}},
		{szName="侠骨丹心戒", nQuality=1, nRate=0.1, tbProp={0, 188}},
		{szName="侠骨多情环", nQuality=1, nRate=0.5, tbProp={0, 187}},
		{szName="3级玄晶矿石", nRate=5, tbProp={6, 1, 147, 3, 0, 0}},
		{szName="4级玄晶矿石", nRate=3, tbProp={6, 1, 147, 4, 0, 0}},
		{szName="5级玄晶矿石", nRate=2, tbProp={6, 1, 147, 5, 0, 0}},
		{szName="武林秘籍", nRate=0.1, tbProp={6, 1, 26, 1, 0, 0}},
		{szName="洗髓经", nRate=0.1, tbProp={6, 1, 22, 1, 0, 0}},
	}
}

function main(nItemIndex)
	jiaoshi0810_ResetTask()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","该物品已过期");
		return 0
	end
	if GetLevel() < 50 or IsCharged() == 0 then
		Talk(1, "", "只有50级以上已充值玩家才能使用该道具.")
		return 1
	end
	local nCurExp = GetTask(jiaoshi0810_TSK_ExpLimit)
	if nCurExp >= jiaoshi0810_MaxExpLimit then
		Talk(1, "", format("每个人物使用该物品最多只获得%s 经验.", jiaoshi0810_TransferDigit2CnNum(jiaoshi0810_MaxExpLimit)))
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(%tbAwardList, "use "..GetItemName(nItemIndex))
	SetTask(jiaoshi0810_TSK_ExpLimit, nCurExp + %tbAwardList[1].nExp)
end