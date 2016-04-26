IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINARECOIN_INFO ={
--[白金ID] = {装备名, 补天中数量};
--[1] = {"梦龙之正黄僧帽", 2},
}
RECOIN_PLATINA_DATE_RANGE = {20070420, 20070426};

function LoadPlatinaCoinSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataRecoinTmp")
	if b1~=1 then
		print("下载升级白金装备信息失败!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataRecoinTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "PLATINAID"));
		local recoin = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "RECOIN"));
		local name = TabFile_GetCell("PlatinaDataRecoinTmp", y, "EQUIPNAME");
		if (recoin ~= nil and recoin > 0) then
			TB_PLATINARECOIN_INFO[platinaid] = {name, recoin, platinaid};
		end;
	end	
end;

LoadPlatinaCoinSettingTmp()

--白金装备重铸入口
function recoin_platina_main()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	local aryDescribe = {};
	reloadRecoinPlatinaDate();
	if (nTodayString < RECOIN_PLATINA_DATE_RANGE[1] or nTodayString > RECOIN_PLATINA_DATE_RANGE[2]) then
		aryDescribe = {"<dec><npc>重铸白金装备会存在时间, 比如<color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[1]/10000).."年"..mod(floor(RECOIN_PLATINA_DATE_RANGE[1]/100),100).."月"..mod(RECOIN_PLATINA_DATE_RANGE[1], 100).."日"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n╩"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."月"..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).." 日<color> 真漂亮. 今天不是什么好日子所以不能铸造.",
			"真可惜，耽误了时间，别的时候再来吧./no",};
	else
		aryDescribe = {"<dec><npc>重铸白金装备时需要{1块金犀}, {1块8级玄晶矿石}和一定数量的{ 补天石碎片(中)}. 不再是黄金装备的重铸，需要的天石是不一样的. 趁早说说看想让我帮你做什么吧，等  <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."年"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."月"..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).."<color> 能不能帮你就不好说了.", 
		"重铸这件白金装备需要多少补天石碎片(中)/want_recoinplatina_preview",
		"我带齐了材料要重铸这套白金装备./want_recoinplatina",
		"我只是来看看的/no"}
	end;
	CreateTaskSay(aryDescribe);
end;

--预览的起始
function want_recoinplatina_preview()
	GiveItemUI("重铸白金装备", "请将要重铸的白金装备放到下面. 我看看需要多少补天石碎片(中)", "do_recoinplatina_preview", "no", 1);
end;

function do_recoinplatina_preview(nCount)
	if (nCount <= 0) then	--没有给出东西，不做对话直接返回
		return 0;
	end;
	
	if (nCount > 1) then	--一次一件，给于提示
		CreateTaskSay({"<dec><npc>一次只能给我一件物品我才可以帮你看.",
			"真不好意思，我重新整理一下/want_recoinplatina_preview",
			"等一下再回来/no"});
		return 0;
	end;
	
	local nItemIdx = GetGiveItemUnit(nCount);
	local nCurItemName = GetItemName(nItemIdx);
	local nCurItemQuality = GetItemQuality(nItemIdx);
	local tbCurItemProp = pack(GetItemProp(nItemIdx));
	if (nCurItemQuality == 4) then		--给于的是白金装备
		if (tbCurItemProp[1] == 0) then		--不是破损的装备
			local nCurPlatinaEqID = GetPlatinaEquipIndex(nItemIdx);
			if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
				CreateTaskSay({format("<dec><npc>白金装备 %s 需要 {%d 块} 补天石碎片(中) 和1块金犀以及1块8级玄晶矿石.",TB_PLATINARECOIN_INFO[nCurPlatinaEqID][1],TB_PLATINARECOIN_INFO[nCurPlatinaEqID][2]),
					"请帮我重铸这套白金装备/want_recoinplatina",
					"等我准备完了就会来找你/no"});
			else
				CreateTaskSay({format("<dec><npc>以我现在的能力不能帮你重铸{%s} 頲.",nCurItemName),
				"那么我要兑换/want_recoinplatina_preview",
				"等下再回来/no"});
			end;
			return 0;
		end;
	end;
	CreateTaskSay({"<dec><npc>你不是要想知道重铸白金要多少补天石碎片，不带来给我看我怎么知道呢？",
		"真不好意思，我重新整理下背包/want_recoinplatina_preview",
		"等下再回来/no"});
end;

--重铸的起始
function want_recoinplatina()
	GiveItemUI("重铸白金装备", "请将重铸白金装备的必需物品放在下面(1个金犀，1个8级玄晶石和一些数量的补天石碎片（中）)", "do_recoinplatina", "no", 1);
end;

function do_recoinplatina(nCount)
	if (nCount <= 0) then	--没有给出东西，不做对话直接返回
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nComposeEntryLvl = 0;
	local szBeforeItemInfo = "";
	local szBehindItemInfo = ""
	local nMarkCount = 0;
	local nItemBindState = 0;	--原料黄金的绑定状态
	local nItemLockState = 0;
	local bHaveLockItem  = 0;	
	local szMARKITEM_KEY = "6,1,1309";
	local tb_material = {
		--key = {数量，名称，等级} 
		["4,979,1"] = {1, "金犀", -1},
		["6,1,147"] = {1, "8级玄晶矿石", 8},
		};
	local tb_curmaterial = {};
	for key, tb in tb_material do
		tb_curmaterial[key] = {};
		tb_curmaterial[key][1] = 0;
	end;
	
	for i = 1, nCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		if (nCurItemQuality == 4) then		--给于的是白金装备
			if (nExpiredTime > 0) then -- 有保质期的装备，不能拆！
				CreateTaskSay(	{	"<dec><npc>装备有<color=fire>使用期限<color>, 不能重铸.",
									"真对不起，我又放错了. 待会再回来/no"	}	);
				return
			end
			if (tbCurItemProp[1] == 0) then		--不是破损的装备
				local nCurPlatinaEqID = GetPlatinaEquipIndex(nCurItemIdx);
				if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
					if (nComposeEntryIdx ~= 0) then
						CreateTaskSay({"<dec><npc>你想重铸哪套白金装备?",
							"哈哈. 大侠也有不小心的时候./want_recoinplatina",
							"真不好意思，我一会再来./no"	});
									return 0;
					else
						nComposeEntryIdx = nCurPlatinaEqID;
						nComposeEntryLvl = GetPlatinaLevel(nCurItemIdx);
						szBeforeItemInfo = getItemInfo(nCurItemIdx);	--获得重铸前的详细信息
						nItemBindState = GetItemBindState(nCurItemIdx)	--获取绑定状态
					end;
				else
					CreateTaskSay({format("<dec><npc>以我现在的能力不能帮你重铸{%s}.",nCurItemName),
						"那么我要兑换/want_recoinplatina_preview",
						"等下回来/no"});
					return 0;
				end;
			end;
		else		--如果不是白金装备，就判断是不是所需材料
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (szItemKey == szMARKITEM_KEY) then	--补天石碎片
				nMarkCount = nMarkCount + 1;
			else
				if (tb_material[szItemKey] == nil) then	--不是八玄 and 不是金犀
					CreateTaskSay({	"<dec><npc>{白金装备}和{金犀}, { 8及玄晶矿石}, { 补天石碎片 (中)} 是我需要的原料. 别的请再收集来.",
						"哈哈. 大侠也有不小心的时候，让我来放./want_recoinplatina",
						"真不好意思，我一会再来./no"	});
					return 0;
				else
					if (tb_material[szItemKey][3] ~= -1) then
						if (tb_material[szItemKey][3] ~= tbCurItemProp[4]) then
							CreateTaskSay({"<dec><npc>装备等级"..nCurItemName.."好像不对.",
								"哈哈. 大侠也有不小心的时候，让我来放./want_recoinplatina",
								"真不好意思，我一会再来./no"	}	);
							return 0;
						end;
					end;
					tb_curmaterial[szItemKey][1] = tb_curmaterial[szItemKey][1] + 1;
					tb_curmaterial[szItemKey][2] = nCurItemName;
				end;
			end;
		end;
	end;	--end for nCout
	
	local szlog = ""
	if (nComposeEntryIdx == 0) then		--竟然不给白金装备
		CreateTaskSay({"<dec><npc>你不是要重铸白金装备嘛，你不把准备交给我我怎么重铸得了.",
			"真对不起，我再整理下/want_recoinplatina",
			"等下回来/no"});
		return 0;
	end;
	if (nMarkCount ~= TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]) then
		CreateTaskSay({format("<dec><npc>白金装备 {%s} 要 (%d) 补天石碎片(中).",TB_PLATINARECOIN_INFO[nComposeEntryIdx][1],TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]),
					"真对不起，我再整理下/want_recoinplatina",
					"等我准备完了就会来找你/no"});
		return 0;
	end;
	for key, tb in tb_material do
		if (tb[1] ~= tb_curmaterial[key][1]) then
			CreateTaskSay({format("<dec><npc>重铸我需要的白金装备{%d} %s.", tb[1],tb[2]),
					"真对不起，我再整理下/want_recoinplatina",
					"等我准备完了就会来找你/no"});
			return 0;
		end;
	end;

--	for i = 1, nCount do
--		local nCurItemIdx = GetGiveItemUnit(i)
--		nItemLockState = GetLockItemState(nCurItemIdx)
--		if (nItemLockState == 1) then
--			local bOwner = IsLockItemOwner(nCurItemIdx)
--			if (bOwner == 0)   then
--				CreateTaskSay({"<dec><npc>重铸的白金装备是锁魂物品，锁魂物品处于锁魂状态，只允许物品归属人重铸。","知道了/cancel"});
--				return
--			else
--				bHaveLockItem =	1;
--			end							
--		elseif (nItemLockState == 2) then
--			CreateTaskSay({"<dec><npc>重铸的白金装备是锁魂物品，锁魂物品处于解魂状态，禁止重铸。","知道了/cancel"});
--			return
--		end
--	end;	
	
	-- 删原料
	for i = 1, nCount do
		if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[重铸白金装备]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 删除失败物品\t"..GetItemName(GetGiveItemUnit(i)));
			return 0;
		end
	end
	
	--新给个白金装备
	local nNewItemIdx = AddPlatinaItem(0, nComposeEntryIdx);	--此时 是0级白金
	if (nNewItemIdx <= 0) then
		WriteLog("[重铸白金装备]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\添加失败的白金黄金装备\t"..GetItemName(GetGiveItemUnit(i)));
		return 0;
	end;

	if nItemBindState ~= 0 then 
		--把碎片设置为源黄金装备的绑定状态值
		SetItemBindState(nNewItemIdx, nItemBindState)
	end

	for i = 1, nComposeEntryLvl do								--升级之原装备等级
		UpgradePlatinaItem(nNewItemIdx);
	end;
	
--	if (bHaveLockItem == 1) then
--		LockItem(nNewItemIdx);
--	end
		
	szlog = format("[重铸白金装备]\t%s\tAccount:%s\tName:%s\重铸%s 删除原料: 1块金犀，1块8级玄晶矿石，%d块补天石碎片", 
				GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(),
				TB_PLATINARECOIN_INFO[nComposeEntryIdx][1], nMarkCount);
	szBehindItemInfo = getItemInfo(nNewItemIdx);	--重铸后的信息
	WriteLog(szlog);
	writeRecoinLog("[重铸白金装备之前的属性]", szBeforeItemInfo);
	writeRecoinLog("[重铸白金装备之后的属性]", szBehindItemInfo);
	Msg2Player("重铸成功<color=green>"..TB_PLATINARECOIN_INFO[nComposeEntryIdx][1]);
end;

function reloadRecoinPlatinaDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_PLATINAEQUIP",1), gb_GetTask("RECOIN_PLATINAEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= RECOIN_PLATINA_DATE_RANGE[2]) then
		RECOIN_PLATINA_DATE_RANGE[1] = tb_NewAvailableDate[1];
		RECOIN_PLATINA_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;