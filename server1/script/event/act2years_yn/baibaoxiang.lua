--2007越南国庆活动
--2007-08-08
--by 小浪多多
--获取百宝箱

TB_Material = {
 --1.物品名	2.数量
	["0,10,5"] = "80级马",
	["4,490,1"] =	"藏宝图 1",
	["4,491,1"] =	"藏宝图 2",
	["4,492,1"] =	"藏宝图 3",
	["4,493,1"] =	"藏宝图 4",
	["4,494,1"] =	"藏宝图 5",
	["4,495,1"] =	"藏宝图 6",
	["4,496,1"] =	"藏宝图 7",
	["4,497,1"] =	"藏宝图 8",
	["4,498,1"] =	"藏宝图 9",
	["4,499,1"] =	"藏宝图 10",
	["4,500,1"] =	"藏宝图 11",
	["4,501,1"] =	"藏宝图 12",
}
function BaiBaoXiang_Give_UI()
	GiveItemUI("百宝箱","兑换百宝箱的条件是打开第二个箱子、一匹80级的马和1到12中的任意一张藏宝图.","BaiBaoXiang_Get","no",1)
end			

function BaiBaoXiang_Get(nItemCount)
	if CheckStoreBoxState(2) > 0 then
		Say("神秘商人: 您已得到百宝箱了,还需要什么就到我这儿来.",1,"同意!/no");
		return 1;
	end
	if	CheckStoreBoxState(1) == 0 then
		Say("神秘商人: 您还未打开第二个箱子,我不能把百宝箱换给你. 请先到巴陵县打开第二给箱子之后再来找我.",1,"同意/no");
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
				Say("商人: 不行, 我们只要一张藏宝图和一匹80级马, 别的不需要.",2,"哈哈, 让我再试一次./BaiBaoXiang_Give_UI","真不好意思, 我稍后回来./no");
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
	end
	
		for szkey, tb_item in TB_Material do
				if (tb_enhanceitem_count[szkey][1] ~= 1) then
					Say("神秘商人: 不行, 我们需要的物品依旧不够.",2,"哈哈, 我再试试./BaiBaoXiang_Give_UI","真不好意思, 我稍后回来./no");
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
		Msg2Player("您已领取到 <color=yellow>百宝箱<color>.");
		Say("神秘商人: 祝贺您得到百宝箱.",1,"确定/no");
		OpenStoreBox(2);
		WriteLog(format("[GuoQing2007_BaiBaoXiang]\t Date:%s\t Account:%s\t Name:%s\t Effect:Get BaiBaoXiang",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName()));

end

function pack(...)
	return arg
end