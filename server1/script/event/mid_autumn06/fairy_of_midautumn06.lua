--by 廖志山 [2006-09-12]
--2006中秋活动之活动二：寻找云游图和仙舞图.
--Illustration: 仙女 -- fairy au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--仙女活动入口函数
function au06_entrance_fairy()
	if (au06_IsPayed_player() == 0) then
		Say("只有充值玩家才可以参加中秋活动", 0);
		return
	end;
	
	local tab_Content = {
		"我已经搜集够了画的碎片了./handup_picture",
		"只是来探望一下你!/oncancel"
	};
	Describe("柳乙商人正在寻在2张名画姮娥仙子. 这两张画被分成了很多碎片散落在各地.听说野叟有这幅画的所有碎片.如果你可以得到这些碎片，我会帮你拼好.", getn(tab_Content), tab_Content);
end;

--给予界面
function handup_picture()
	--如果经验达到上限
	GiveItemUI("上交画", "拼图方法: 排好位置，以左边第一空为准拼图.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
--判断是否给奖励
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("每幅图有6个碎片，你带来的不够.", 1, "等够了我再来/oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("你的碎片不够拼图,找够了再回来见我吧.", 1, "那我先告辞了./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- 升序排序
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("你的碎片不够拼图,找够了再回来见我吧.", 1, "那我先告辞了./oncancel");
		return
	end
	
	--删除画
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--给奖励
	local str = "1 <color=yellow>苍古令牌<color>";
	AddItem(6, 1, 1252, 1, 0, 0, 0);
	
	--给提示
	Describe("真想不到你找齐了. 这是<color=yellow>苍古令牌<color>, 带够10块令牌去襄阳见柳乙商人兑换神器月饼",1,"领取奖品/oncancel")
	Msg2Player("你得到"..str);
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--采用降升序排序
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

