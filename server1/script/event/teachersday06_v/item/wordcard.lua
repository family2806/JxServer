--越南教师节活动，“一”、“字”、“为”、“师” 道具。
--通过这些道具向师父赠送礼物
if (not __H_WORDCARD__) then
	__H_WORDCARD__ = 1;

Include "/script/shitu/shitu.lua"
Include([[\script\event\teachersday06_v\head.lua]]);

function main(nItemIndex)
	if (vt06_shifu_isactive() == 0) then
		return 1;
	end;
	
	if (mastercheck() == 0) then --如果师父不在线，则返回
		return 1;
	end;
	
	GiveItemUI("献恩师节","请把四个字：一字为师 放入合适的空格内!", "sendgift", "no" );
	return 1;
end;

tab_Goods = {1289, 1290, 1291, 1292};

function sendgift(nCount)
	if (mastercheck() == 0) then --如果师父不在线，则返回
		return 1;
	end;
	if (nCount ~= 4) then
		Say("你放入的字数不对!", 0);
		return
	end
	
	--检查“一”、“字”、“为”、“师”
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		if (GetItemStackCount(idxItem) > 1) then
			Say("不能放重复2个字", 0);
			return
		end;
	end;
	local bFull = 1;
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
	
	au06_sort(tab_items); -- 升序排序
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_Goods[i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Say("你放的字数不对", 0);
		return
	end

	
	--删除画
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--给奖励
	prize(); 		--奖励徒弟
	prizemaster();	--奖励师父
end;

--徒弟奖励
function prize()
	AddItem(6, 1, 1295, 1, 0, 0, 0);
	Msg2Player("你获得 <color=yellow>高徒卡<color>, 带给掌门收礼!");
end;

--师父奖励
function prizemaster()
	local masterName = GetMaster(GetName());
	if(not masterName) then
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		return 0;
	end
	
	local OldPlayer = PlayerIndex;
	PlayerIndex = masterIdx;
	AddItem(6, 1, 1293, 1, 0, 0, 0);
	Msg2Player("你获得 <color=yellow> 恩师卡<color>, 带给掌门收礼!");
	PlayerIndex = OldPlayer;
end;

--检测师父是否在线，是则返回1
function mastercheck()
	local szName = GetName();
	local masterName = GetMaster(szName);
	if(not masterName or masterName == szName) then
		Say("这个物品是子弟表达对师傅的感恩之情，你现在没有师傅", 0);
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		Say("师傅不在线，不能献礼", 0);
		return 0;
	end
	return 1;
end;

function no()
	
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


end; --__H_WORDCARD__

