-- 文件名　：makesnowman.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-11-23 10:56:30

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\basic.lua");
function main()
	xmas07_makeSnowMan_main()
end
function xmas07_makeSnowMan_main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Say(format("活动<color=yellow>%s<color> 已结束!",xmas07_makeSnowMan_ActName),0)
		return 0;
	end
	local tbDialog =
	{
		"<dec><npc>哈哈，圣诞快乐！",
		"我想了解活动内容/xmas07_makeSnowMan_Content",
		"我想造雪人./xmas07_makeSnowMan_wantCompose",
		"结束对话/OnCancel",
	}

	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_Content()
	local tbDialog =
	{
		"<dec><npc>从<color=red>0h00 日 08-12-2007 到 24h00日13-01-2008<color>,各武林人士打怪时将捡到<color=yellow>圣诞礼盒<color>, 打开圣诞礼盒将获得造雪人的原料。收集够原料后，可以到这造<color=yellow> 各种雪人 <color> .<enter>在城外区域，使用黄雪人，紫雪人，或者绿雪人可以获得<color=red>1000000 经验值<color> 以及一个<color=red>物品<color>, 当然，如果幸运，可以叫出<color=yellow>雪人boss<color>, 打败雪人boss将有机会获得有价值的奖励",
		"哈哈哈，我知道了/xmas07_makeSnowMan_main"
	}
	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_wantCompose()
	local tbDialog = 
	{
		"<dec><npc>各武林人士打怪时将有机会捡到<color=yellow>冰晶<color> 金系，木系，水系，火系，土系。使用不同的冰晶将造出不同的雪人，大侠想要哪种？",
		"我想造黄雪人'/#xmas2007_makeSnowMan_compose([[Yellow]])",
		"我想造紫雪人'/#xmas2007_makeSnowMan_compose([[Purple]])",
		"我想造绿雪人'/#xmas2007_makeSnowMan_compose([[Green]])",
		"稍候回来/OnCancel"
	}
	CreateTaskSay(tbDialog)
end
xmas2007_makeSnowMan_tbItem =
{
	{1, {6,1,1634,1,0,0}, "黄雪人"},
	{1, {6,1,1635,1,0,0}, "紫雪人"},
	{1, {6,1,1636,1,0,0}, "绿雪人"},
}
xmas2007_makeSnowMan_tbMaterial =
{
	{0, {6,1,1633,nil,nil,nil}, "五色冰晶"},
	{0, {6,1,1628,nil,nil,nil}, "金冰晶"},
	{0, {6,1,1629,nil,nil,nil}, "木冰晶"},
	{0, {6,1,1630,nil,nil,nil}, "水冰晶"},
	{0, {6,1,1631,nil,nil,nil}, "火冰晶"},
	{0, {6,1,1632,nil,nil,nil}, "土冰晶"},
}
xmas2007_makeSnowMan_Recipe =
{
	Yellow	= {tbItemList = {1,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[1]},		--1五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
	Purple	= {tbItemList = {0,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[2]},		--0五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
	Green	= {tbItemList = {0,2,3,4,5,6},nMoney = 100000, tbResult = xmas2007_makeSnowMan_tbItem[3]},	--10 万两 + 0五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
}

function xmas2007_makeSnowMan_ComposeConfirm(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	
	if xmas2007_makeSnowMan_CheckMaterial(tbMaterial) ~= 1 then
		Say(format("大侠不足原料，需要有%s 才能造.",szMaterialList), 1 , "真是不好意思，我稍候再来./OnCancel")
		return 0;
	end
	if Pay(nMoney) == 0 then
		Say(format("不能了，带钱不够，需要<color=yellow>%d<color>两",nMoney),0)
		return 0;
	end
	if nMoney ~= 0 then
		Msg2Player(format("消费<color=yellow>%d<color> 两",nMoney))
	end
	if xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial) ~= 1 then
		Say("制造失败，失去一些原料.",0)
		return 0;
	end
	xmas2007_SnowManItem_AddItem(tbAwardItem[3],tbAwardItem[2]);
	Say(format("雪老人：哈哈, <color=yellow>%s<color> 已经造成功了，请来取!",tbAwardItem[3]))
end
function xmas2007_makeSnowMan_compose(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	if nMoney ~= 0 then 
		szMaterialList = format("%s, 需要有<color=yellow>%d<color>两",szMaterialList,nMoney)
	end
	local tbNpcSay =
	{
		format("<dec><npc>制造 <color=yellow>%s<color>, 需要%s.",tbAwardItem[3],szMaterialList),
		format("造雪人/#xmas2007_makeSnowMan_ComposeConfirm([[%s]])",szSelect),
		"让我准备/OnCancel",
	}
	CreateTaskSay(tbNpcSay)
end

function xmas2007_makeSnowMan_CheckMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		if tbItem[1] > 0 and CalcEquiproomItemCount(tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) < tbItem[1] then
			return 0;
		end
	end
	return 1;
end

function xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		--print(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel)
		if tbItem[1] > 0 and ConsumeEquiproomItem(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) ~= 1 then
			return 0;
		end
	end
	return 1;
end

function OnCancel()
end
