-- 钱庄功能.lua		卖红包的标准文件
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) 将银票功能移出到临安钱庄独有
Include("\\script\\global\\head_qianzhuang.lua") -- 钱庄头文件
IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main_proc()
	if (GetSex() == 0) then
		Say("钱庄老板：对了这位少侠要些什么服务？",3,"这里有没有红包？/buy_sele","我想换元宝成铜钱/change_ingot_to_coin","随便逛逛/no")
	else
		Say("钱庄老板：对了这位姑娘要些什么服务？",3,"这里有没有红包？/buy_sele","我想换元宝成铜钱/change_ingot_to_coin","随便逛逛/no")
	end
end
------------ 买红包 ---------------------
function buy_sele()
	--Say("钱庄老板：我这里的红包富丽臃荣，礼重情更重，最是送礼上品，小红包10000两，大红包100000两，以及<color=green>如意红包和贺岁红包。\n如意红包<color>是由客倌您自己决定包多少钱的红包。\n<color=green>贺岁红包<color>是可以包<color=yellow>铜钱<color>的红包，当然红包中铜钱数量还是由您定。",5,"要个小红包吧/buy1","来个大红包/buy2","要如意红包/ruyi_hongbao","要贺岁红包/hesui_hongbao","不要了/no")
	Say("钱庄老板：好啊好啊，我这里的红包富丽臃荣，礼重情更重，最是送礼上品，小红包10000两，大红包100000两，不知客倌您要哪种？",3,"要个小红包吧/buy1","来个大红包/buy2","不要了/no")
end

function buy1()
	if (GetCash() >= 10000) then
		Pay(10000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","钱庄老板：小红包壹个，您收好了！")
	else
		Talk(1,"","钱庄老板：您的钱好象不太够啊。")
	end
end

function buy2()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","钱庄老板：大红包壹个，您收好了！")
	else
		Talk(1,"","钱庄老板：您的钱好象不太够啊。")
	end
end

function no()
end

function hesui_hongbao()	--自定义铜钱
	AskClientForNumber("Package_Hesui", 1, 100, "请输入铜钱枚数:");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","钱庄老板：您带的铜钱好象不够"..nMoney.."枚哦。")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","钱庄老板：贺岁红包壹个，您收好了！")
	end
end


function ruyi_hongbao()		--自定义金钱
	AskClientForNumber("Package_Ruyi", 1, 10000000, "请输入红包金额:");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","钱庄老板：您的钱好象不够"..nMoney.."两哦。")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000) / 1000)
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","钱庄老板：如意红包壹个，您收好了！")
	end
end