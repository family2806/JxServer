--2007越南国庆活动
--2007-08-08
--by 小浪多多
--获取B竎h b秓 rng

TB_Material = {
 --1.物品名	2.数量
	["0,10,5"] = "Ng鵤 c蕄 80",
	["4,490,1"] =	"M秐h T祅g B秓 у 1",
	["4,491,1"] =	"M秐h T祅g B秓 у 2",
	["4,492,1"] =	"M秐h T祅g B秓 у 3",
	["4,493,1"] =	"M秐h T祅g B秓 у 4",
	["4,494,1"] =	"M秐h T祅g B秓 у 5",
	["4,495,1"] =	"M秐h T祅g B秓 у 6",
	["4,496,1"] =	"M秐h T祅g B秓 у 7",
	["4,497,1"] =	"M秐h T祅g B秓 у 8",
	["4,498,1"] =	"M秐h T祅g B秓 у 9",
	["4,499,1"] =	"M秐h T祅g B秓 у 10",
	["4,500,1"] =	"M秐h T祅g B秓 у 11",
	["4,501,1"] =	"M秐h T祅g B秓 у 12",
}
function BaiBaoXiang_Give_UI()
	GiveItemUI("B竎h b秓 rng","兑换B竎h b秓 rng的条件是打开第二个箱子、一匹80级的马和1到12中的任意一张藏宝图.","BaiBaoXiang_Get","no",1)
end			

function BaiBaoXiang_Get(nItemCount)
	if CheckStoreBoxState(2) > 0 then
		Say("神秘商人: 您已得到B竎h b秓 rng了,还需要什么就到我这儿来.",1,"уng �!/no");
		return 1;
	end
	if	CheckStoreBoxState(1) == 0 then
		Say("神秘商人: 您还未打开第二个箱子,我不能把B竎h b秓 rng换给你. 请先到巴陵县打开第二给箱子之后再来找我.",1,"уng �!/no");
		return 1;	
	end
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	--检测物品匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		
		if (TB_Material[szItemKey] == nil) then
				Say("商人: 不行, 我们只要一张藏宝图和一匹Ng鵤 c蕄 80, 别的不需要.",2,"Ha ha,  ta th� l筰 v藋./BaiBaoXiang_Give_UI","Th藅 ng筰 qu�, ta s� quay l筰 sau./no");
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
	end
	
		for szkey, tb_item in TB_Material do
				if (tb_enhanceitem_count[szkey][1] ~= 1) then
					Say("Th莕 b� thng nh﹏: Kh玭g 頲 r錳, v藅 ph萴 ta y猽 c莡 kh玭g v蒼 ch璦 .",2,"Ha ha,  ta th� l筰 v藋./BaiBaoXiang_Give_UI","Th藅 ng筰 qu�, ta s� quay l筰 sau./no");
				return
				end
		end
		
		--删材料
		for i=1, nItemCount do
			local nIdx = GetGiveItemUnit(i)
			if (RemoveItemByIndex(nIdx) ~= 1) then
				WriteLog(format("[GuoQing2007_BaiBaoXiang]Date:%s\t Account:%s\t Name:%s\t DelItemFail:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i)) ));
				return
			end
		end
		
		 --给物品
		Msg2Player("您已领取到 <color=yellow>B竎h b秓 rng<color>.");
		Say("神秘商人: 祝贺您得到B竎h b秓 rng.",1,"уng �!/no");
		OpenStoreBox(2);
		WriteLog(format("[GuoQing2007_BaiBaoXiang]\t Date:%s\t Account:%s\t Name:%s\t Effect:Get BaiBaoXiang",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName()));

end

function pack(...)
	return arg
end