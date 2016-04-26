IncludeLib("ITEM");
IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua")

FILE_Recoin_COMPOUND = "recoin_goldenequip.txt";
--非生铸相关的头文件转移
-- 黄金装备碎品对应表

function initRecoinConfig()
	g_aryRecoinConfig = {};
	
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 0, nLatestItemVer do
		local strFullPath = makeItemFilePath( i, FILE_Recoin_COMPOUND );
		TabFile_Load( strFullPath, strFullPath );
		g_aryRecoinConfig[i+1] = {};
		local nRowCount = TabFile_GetRowCount( strFullPath );
		for j = 2, nRowCount do
			
			local szGoldName = TabFile_GetCell( strFullPath, j, "DES_GOLDNAME", "NoITEM" );
			local nGenre = tonumber( TabFile_GetCell( strFullPath, j, "DES_GENRE", -1 ) );
			local nDetailtype = tonumber( TabFile_GetCell( strFullPath, j, "DES_DETAILTYPE", -1 ) );
			local nFirstPieceDetail = tonumber( TabFile_GetCell( strFullPath, j, "MAR_FIRST_DETAIL", -1 ) );
			local nPieceSum = tonumber( TabFile_GetCell( strFullPath, j, "MAR_COUNT", -1 ) );
			local nBadValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_BADVALUES", 0 ) );
			local nStandardValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_STANDARDVALUES", 0 ) );
		
		
			local szgoldkey = format("[%d,%d]",nGenre,nDetailtype)
			if g_aryRecoinConfig[i+1][szgoldkey] == nil then
				g_aryRecoinConfig[i+1][szgoldkey] = {}
			end
			g_aryRecoinConfig[i+1][szgoldkey].m_szGoldName = szGoldName
			g_aryRecoinConfig[i+1][szgoldkey].m_nFirstPieceDetail = nFirstPieceDetail
			g_aryRecoinConfig[i+1][szgoldkey].m_nPieceSum = nPieceSum
			g_aryRecoinConfig[i+1][szgoldkey].m_nBadValues = nBadValues
			g_aryRecoinConfig[i+1][szgoldkey].m_nStandardValues = nStandardValues
			local nNo = 1
			for k = nFirstPieceDetail,nFirstPieceDetail+nPieceSum-1 do 
				local szgoldpiecekey = format("[%d]",k)
				if g_aryRecoinConfig[i+1][szgoldpiecekey] == nil then
					g_aryRecoinConfig[i+1][szgoldpiecekey] = {}
				end
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_szGoldName = szGoldName
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nGenre = nGenre
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nDetailtype = nDetailtype
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceSum = nPieceSum
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceNo = nNo
				nNo = nNo + 1
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nBadValues = nBadValues
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nStandardValues = nStandardValues
			end
		end
	end
end

initRecoinConfig();

-- 黄金装备包含碎品数量和所需信物数量对应表
TB_MARK_ITEM_COUNT =
{
	{6, 1},	-- 黄金包含6个以上碎片需要至少1个信物
	{9,	2},	-- 黄金包含9个以上碎片需要至少2个信物
};

-- 黄金装备拆分附加物品的价值量
TB_ENHANCE_ITEM = {
		["6,1,398"] = 100000000,	-- 神秘矿石
		["6,1,122"] = 600000,		-- 福缘露（小）
		["6,1,123"] = 1200000,		-- 福缘露（中）
		["6,1,124"] = 3000000,		-- 福缘露（大）
		["4,238,1"] = 5000000,		-- 兰水晶
		["4,239,1"] = 5000000,		-- 紫水晶
		["4,240,1"] = 5000000,		-- 绿水晶
};

MARK_ITEM_ID = "4,979,1";								-- 黄金装备拆分信物（金犀）
GLBID_SPLIT_LAST_DATE = 919;							-- 全局变量ID of 最后一次装备拆分的日期
GLBID_SPLIT_DAILY_COUNT = 920;							-- 全局变量ID of 当天执行装备拆分的次数
SPLIT_COUNT_DAILY_THRESHOLD = 500;						-- 一台GameSvr一天内可执行装备拆分的次数上限
SPLIT_AVAILABLE_DATE_RANGE = { 20080113, 20080401 };	-- 装备拆分功能开放的开始、结束时间

FRAME_EXCHANGE_COIN = 2;			-- 交换装备碎片所需支付的铜钱个数
TASKTMP_EXCHANGE_FRAME = 194;		-- 要交换的装备碎片的索引

-- 黄金装备拆分
-- Fanghao_Wu	2006-06-21
function split_entry()
	local aryDescribe = {};
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	
	aryDescribe =
		{
		"<dec><npc>我可以分黄金装备碎片，这也是我师傅毕生的心血.",
			"这个黄金装备可以分成几块?/want_split_preview",
			"可以帮我分黄金装备碎片吗?/#want_split(0)",
			"分黄金装备碎片的方法./about_split",
			"不用在意，我只是随口说说而已./cancel",
		};
	CreateTaskSay(aryDescribe);
end

function want_split_preview()
	GiveItemUI("试看分装备碎片?", "设置黄金装备，金犀，神秘矿石，福缘露，我会让你知道可以分出的装备碎片数量.", "do_split_preview", "cancel", 1);
end

function want_split(bNoConfirm)
	if (_is_split_available() ~= 1) then
		return
	end
	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 9) then
		CreateTaskSay(	{	"<dec><npc>装备不足空位，请安排如何够9个空位。如果装备碎片掉落，就会被他人捡走，那时就不要怪我没有提醒你。",
							"装备已购空位，请继续!/#want_split(1)",
							"那让我安排一下装备先!/cancel"	}	);
	else
		GiveItemUI("分装备碎片", "设置好黄金装备，金犀，神秘矿石，水晶，福缘露，我才能帮你分碎片，如果设置的装备被锁了，那分出的装备碎片也将是这个状态。!", "do_split", "cancel");
	end
end

function about_split()
	local aryDescribe =
	{
		"<dec><npc>想分装备碎片，给我就行，但是我需要一样东西叫做?<color=yellow>金犀<color>. 注意，黄金装备可以分成4, 6, 9块。分出4块不需要用 <color=yellow>金犀<color> 也行。想分成6块，就要去最少需要1个 <color=yellow>金犀<color>,想分成9块就需要2个2 <color=yellow>金犀<color>, 此外，如果给我很多<color=yellow>金犀<color>, <color=yellow>神秘矿石<color>, <color=yellow>水晶<color>以及<color=yellow>福缘露<color> 则分成的装备碎片可以得更多，我记得<color=yellow>金犀<color> 在 <color=blue>奇珍阁有卖<color>.",
		"我知道了!/split_entry",
	};
	CreateTaskSay(aryDescribe);
end

function do_split(nItemCount)
	_do_split_process(nItemCount, 0);
end

function do_split_preview(nItemCount)
	_do_split_process(nItemCount, 1);
end

function _do_split_process(nItemCount, bPreview)
	local nComposeEntryIdx = 0;
	local nMarkItemCount = 0;
	local nSrcItemValueSum = 0;
	local szContinueFunc = "";
	local szItemInfo = "";
	if (bPreview ~= 1) then
		if (_is_split_available() ~= 1) then
			return
		end
		szContinueFunc = "#want_split(0)";
	else
		szContinueFunc = "#want_split_preview()";
	end
	
	local nItemBindState;	--原料黄金的绑定状态
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_ENHANCE_ITEM do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	local nversion,nFirstPiece,nPieceSum,nBadVaules,nStandardValues,szgoldName;
	-- 校验物品是否匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local nCurItemValue = 0;
		if (nCurItemQuality == 1) then
			--如果不是装备(可能是损坏装备)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	"<dec><npc>除了<color=yellow>黄金装备<color> 和<color=yellow>金犀<color> 外, 只有<color=yellow>神秘矿石<color>, <color=yellow>水晶<color> 以及<color=yellow>福缘露<color> 是我需要的原料，其他的就放下.",
					format("哈哈！大侠也有不谨慎的时候，让我再设置一下./%s",szContinueFunc),
					"真不好意思，我将稍候回来./cancel"	}	);
				return
			end
			
			
			if (nExpiredTime > 0) then -- 有保质期的装备，不能拆！
				CreateTaskSay(	{	"<dec><npc>装备有<color=fire>使用时限<color>就不能打炼.",
									"真是不好意思，我又弄错了。等下我再来哦/cancel"	}	);
				return
			end
			
			
			nversion = ITEM_GetItemVersion( nCurItemIdx ) + 1;
			
			local szgoldkey = format("[0,%d]",GetGlodEqIndex(nCurItemIdx))
			if nFirstPiece == nil then
				if (g_aryRecoinConfig[nversion][szgoldkey])~= nil then
							szgoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
							nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
							nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
							nBadVaules = g_aryRecoinConfig[nversion][szgoldkey].m_nBadValues
							nStandardValues = g_aryRecoinConfig[nversion][szgoldkey].m_nStandardValues
				end
			else
				CreateTaskSay(	{	"<dec><npc>客官想分哪种黄金装备？我没有眼花吧?",
									format("哈哈，大侠也有不谨慎的时候，让我来设置./%s",szContinueFunc),
									"真是不好意思，我稍候回来./cancel"	}	);
				return
			end
			
			if (nFirstPiece == nil) then
				CreateTaskSay(	{	format("<dec><npc>真是遗憾，以我现在的能力，不能帮你分黄金装备了<color=yellow>%s<color> .",GetItemName(nCurItemIdx)),
									format("制造其他黄金装备./%s",szContinueFunc),
									"真是不好意思，我稍候再来./cancel"	}	);
				return
			end
			nCurItemValue = nBadVaules;
			nItemBindState = GetItemBindState(nCurItemIdx)	--获取绑定状态
			szItemInfo = getItemInfo(nCurItemIdx);
			writeRecoinLog("[份黄金碎片的主原料]", szItemInfo);
		else
			local szItemKey = format("%s,%s,%s",tbCurItemProp[1],tbCurItemProp[2],tbCurItemProp[3])
			if (szItemKey == MARK_ITEM_ID) then
				nMarkItemCount = nMarkItemCount + 1;
				nCurItemValue = ITEM_CalcItemValue(nCurItemIdx);
			else
				if (TB_ENHANCE_ITEM[szItemKey] == nil) then
					CreateTaskSay(	{	"<dec><npc>除了<color=yellow>黄金装备<color> 以及<color=yellow>金犀<color>外, 只有<color=yellow>神秘矿石<color>, <color=yellow>水晶<color> 和<color=yellow>福缘露<color> 是我需要的原料，其他的先放下.",
										format("哈哈，大侠也有不谨慎的时候，让我来设置./%s",szContinueFunc),
									"真是不好意思，我稍候回来./cancel"	}	);
					return
				end
				nCurItemValue = TB_ENHANCE_ITEM[szItemKey];
				tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + 1;
				tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			end
		end
		nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
	end
	if (szgoldName == nil) then
		CreateTaskSay(	{	"<dec><npc>如果需要我分装备碎片就把装备带到这里，没有装备就不能帮你.",
							format("哈哈，大侠也有不谨慎的时候，让我来设置./%s",szContinueFunc),
									"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	for i = getn(TB_MARK_ITEM_COUNT), 1, -1 do
		if (nPieceSum >= TB_MARK_ITEM_COUNT[i][1]) then
			if (nMarkItemCount < TB_MARK_ITEM_COUNT[i][2]) then
				CreateTaskSay(	{	format("<dec><npc>分该装备碎片最少需要<color=yellow>%s金犀<color>, 如果不是黄金装备，就可能会坏掉。去找够<color=yellow>金犀<color>然后回来。我记得该物品在<color=blue>奇珍阁有卖<color>.",TB_MARK_ITEM_COUNT[i][2]),
									format("已够了，让我再试试!/%s",szContinueFunc),	"真是不好意思，我稍候回来./cancel"	}	);
				return
			end
			break;
		end
	end
	
	-- 校验物品匹配成功，计算碎片数量及概率
	local aryProb = { { 0, 0 }, { 0, 0 } };
	local dFrameCount = nSrcItemValueSum / nStandardValues * nPieceSum;
	if (dFrameCount >= nPieceSum) then
		-- 投入大于最多碎片的总价值量，百分百出最多碎片
		aryProb[1][1] = nPieceSum;
		aryProb[1][2] = 1;
	else
		aryProb[1][1] = ceil(dFrameCount);
		aryProb[1][2] = 1 - (ceil(dFrameCount) - dFrameCount);
		aryProb[2][1] = aryProb[1][1] - 1;
		aryProb[2][2] = 1 - aryProb[1][2];
	end
	
	if (bPreview == 1) then
		local szPrompt = "<dec><npc>"
		for i = 1, 2 do
			if (aryProb[i][2] > 0) then
				if (aryProb[i][1] > 0) then
					szPrompt = szPrompt..format("该黄金装备有\n<color=yellow>%5.2f%%<color> 概率可以分成<color=yellow>%d<color> 块\n", aryProb[i][2] * 100, aryProb[i][1]);
				else
					szPrompt = szPrompt..format("该装备有\n<color=yellow>%5.2f%%<color> 可能分碎片失败\n", aryProb[i][2] * 100);
				end
			end
		end
		CreateTaskSay(	{	szPrompt,
							"请帮我看看其他装备可以分成多少块./want_split_preview",
							"可以帮我分该黄金装备碎片吗?/#want_split(0)",
							"我只懂了，谢谢./cancel"	}	);
		return
	else
		-- 删原料
		for i = 1, nItemCount do
			if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
				WriteLog(format("[分黄金装备碎片] %s\t%s\t%s\t 删除物品失败\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
				return
			end
		end
		-- 给碎片
		if (random() <= aryProb[1][2]) then
			dFrameCount = aryProb[1][1];
		else
			dFrameCount = aryProb[2][1];
		end
		local aryFrameDetailType = {};
		local szExpendableLog = "";
		local szFrameNameLog = "";
		for i = 1, nPieceSum do
			aryFrameDetailType[i] = nFirstPiece + i - 1;
		end
		for i = 1, dFrameCount do
			local nRandNum = random(getn(aryFrameDetailType));
			local nIdx = NewItemEx(4, 0, 0, 4, aryFrameDetailType[nRandNum], 1, 0, 0, 0);
			if nItemBindState ~= 0 then 
				--把碎片设置为源黄金装备的绑定状态值
				SetItemBindState(nIdx, nItemBindState)
			end
			AddItemByIndex(nIdx);
			szFrameNameLog = szFrameNameLog..szgoldName..format("块 [%s]\t",aryFrameDetailType[nRandNum]);
			tremove(aryFrameDetailType, nRandNum);
		end
		if (dFrameCount > 0) then
			CreateTaskSay(	{	format("<dec><npc> 装备<color=yellow>%s<color>分块好了，请带<color=yellow>%s<color> 该碎片去。如果哪天需要合成他们，就带过来我这里。",szgoldName,dFrameCount),
								"谢谢！/cancel"	}	);
		else
			CreateTaskSay(	{	format("<dec><npc>Ph﹏ m秐h <color=yellow>%s<color> 失败，下次要用更多的原料哦.",szgoldName),
								"我知道了!/cancel"	}	);
		end
		-- 记录每日装备拆分执行次数
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, GetGlbValue(GLBID_SPLIT_DAILY_COUNT) + 1);
		-- 记录Log
		for szkey, tb_item in tb_enhanceitem_count do
			if (tb_enhanceitem_count[szkey][1] > 0) then
			szExpendableLog = szExpendableLog..tb_enhanceitem_count[szkey][2]..format("[%s](%s#)\t",szkey,tb_enhanceitem_count[szkey][1]);
			end;
		end;
	WriteLog(format("[分黄金碎片] %s\t%s\t%s\t%s\t 消耗：金犀(%s)\t%s 分成%s 块:",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szgoldName,nMarkItemCount,szExpendableLog,dFrameCount,szFrameNameLog));
		writeRecoinLog("[分黄金碎片]", szItemInfo);
		return
	end
end

-- 判断是否可以进行装备拆分，即在开放日期内，并且还没到达当日装备拆分次数上限
function _is_split_available()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	--reloadRecoinGoldenDate();
	
	local nLastDate = GetGlbValue(GLBID_SPLIT_LAST_DATE);
	if (nLastDate ~= nTodayString) then
		SetGlbValue(GLBID_SPLIT_LAST_DATE, nTodayString);
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, 0);
	else
		local nDailySplitCount = GetGlbValue(GLBID_SPLIT_DAILY_COUNT);
		if (nDailySplitCount >= SPLIT_COUNT_DAILY_THRESHOLD) then
			CreateTaskSay(	{	"<dec><npc>对不起，今天我太累了，明天再来了哦",
								"那我就稍候再来!/cancel"	}	);
			return 0;
		end
	end
	return 1;
end

-- 黄金装备碎片合成
-- 小浪多多
function compose_entry()
	local aryDescribe =
	{
		"<dec><npc>只需要给我全部的装备碎片，不剩也不少，或者有2块装备碎片相同，我将帮你合成.",
		"我有这个的装备碎片想要你帮合成./want_compose",
		"我只随便看看./cancel",
	};
	CreateTaskSay(aryDescribe);
end

function want_compose(bNoConfirm)
--	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 6) then
--		CreateTaskSay(	{	"<dec><npc>你背包的剩余空间不多了，最好整理一下留出6格空间来，否则合成好的黄金装备掉地上被别人捡走可别怪我没提醒你哦。",
--							"背包空间够了，没关系，继续吧/#want_compose(1)",
--							"那我先整理一下背包吧/cancel"	}	);
--	else
		GiveItemUI("合成装备", "想合成装备需要有这个的装备碎片。如果装备碎片正处于被锁状态，那么装备合成依然会处于被锁状态。", "do_compose", "cancel", 1);
--	end
end

function do_compose(n_count)
	if (n_count <= 0) then
		CreateTaskSay(	{	"<dec><npc>如果想合成装备，就把装备碎片带给我，如果碎片不足，我将不能帮你.",
							"哈哈，大侠也有不谨慎的时候，让我来试试./want_compose",
							"真不好意思，我稍候再来./cancel"	}	);
		return
	end

	--看看是不是所有物品都是同一种类
	local n_goldgenre,n_golddetail,nversion,szgoldname,nPieceSum,nFirstPiece
	local tb_tgot = {}
	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		
		nversion = ITEM_GetItemVersion( n_itemidx ) + 1;

		local tb_p
		tb_p = pack(GetItemProp(n_itemidx))
		local szgoldkey = format("[%d]",tb_p[2])

--		print(GetItemProp(n_itemidx))
		if (tb_p[1] ~= 4 or g_aryRecoinConfig[nversion][szgoldkey] == nil ) then
			CreateTaskSay(	{	"<dec><npc>合成装备只要相应的碎片就行了，其他的就放心.",
								"哈哈，大侠也有不谨慎的时候，让我来试试./want_compose",
							"真不好意思，我稍候再来./cancel"	}	);
			return
		elseif (GetItemStackCount(n_itemidx) ~= 1) then
			CreateTaskSay(	{	"<dec><npc>装备不能重复设置，你不听我的话了 !",
								"哈哈，大侠也有不谨慎的时候，让我来试试./want_compose",
							"真不好意思，我稍候再来./cancel"	}	);
			return
		elseif not n_golddetail then	--根据第一个物品找到要合成的是哪种碎片

				nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
				n_goldgenre = g_aryRecoinConfig[nversion][szgoldkey].m_nGenre
				n_golddetail = g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype
				szgoldname = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
				
				if (n_count > nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>客官想合成<color=yellow]>%s<color>给我那么多东西做什么呢？只需要<color=yellow>%s<color>块就行.",szgoldname,nPieceSum),
											"哈哈，大侠也有不小心的时候，让我来吧./want_compose",
											"真是不好意思，我稍候回来./cancel"	}	);
						return
				elseif (n_count < nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>客官想合成<color=yellow>%s<color>？不够装备碎片，不能合成.",szgoldname),
											"哈哈，大侠也有不小心的时候，让我来吧./want_compose",
											"真是不好意思，我稍候回来./cancel"	}	);
						return
				end
					n_type = 1

		elseif (g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype ~= n_golddetail) then	--除第一个外，所有碎片都应是同一种类
			CreateTaskSay(	{	"<dec><npc>合成装备需要有装备碎片，你给我的装备碎片不对，不能合成.",
								"哈哈，大侠也有不小心的时候，让我来吧./want_compose",
											"真是不好意思，我稍候回来./cancel"	}	);
			return
		end

		local n_sid = tb_p[2]
		if tb_tgot[n_sid] then	--放了两张同样的碎片进来
			CreateTaskSay(	{	format("<dec><npc>我不需要2块相同的装备碎片<color=yellow>%s<color> 需要 <color=yellow>%s<color>  <color=yellow>块 %s<color>, 记住哦?",szgoldname,nPieceSum,szgoldname),
								"哈哈，大侠也有不小心的时候，让我来吧./want_compose",
											"真是不好意思，我稍候回来./cancel"	}	);
			return
		end
		tb_tgot[n_sid] = 1	--已有碎片标记
	end
	--安全检查，发布后可以删掉（如果有信心的话）
	local szkey = format("[0,%d]",n_golddetail)
	if g_aryRecoinConfig[nversion][szkey] == nil then
			CreateTaskSay(	{	"<dec><npc>发生系统错误?", "晕.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[合成黄金装备碎片] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));		
	end
	for i = g_aryRecoinConfig[nversion][szkey].m_nFirstPieceDetail,g_aryRecoinConfig[nversion][szkey].m_nPieceSum-1 do
		if not tb_tgot[i] then
			CreateTaskSay(	{	"<dec><npc>发生系统错误?", "晕.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[合成黄金装备碎片] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
			return
		end
	end
	--删原料
	local bBind = nil
	for i=1, n_count do
		local nIdx = GetGiveItemUnit(i)
		if (GetItemBindState(nIdx) ~= 0) then
			bBind = 1
		end
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog(format("<合成黄金装备碎片> %s\t%s\t%s\t 删除原料失败\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
			return
		end
	end
	--给物品
	
	local str = format("合成<color=yellow>%s<color> 成功!",szgoldname)
	Msg2Player(str)
	local nItem = AddGoldItem(n_goldgenre,n_golddetail)
	local szItemInfo = getItemInfo(nItem);
	--只要原料中有绑定或解绑状态，合出的黄金为绑定
	if (bBind) then
		BindItem(nItem)
	end
	--AddGlobalNews("据传闻 "..GetName().." 用装备碎片成功合成了"..szgoldname.."。")
	WriteLog(format("[合成黄金装备碎片] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
	writeRecoinLog("[黄金碎片合成黄金]", szItemInfo);
end

-- 黄金装备碎片交换
--
function exchange_entry()
	local aryDescribe =
	{
		format("<dec><npc>只需要拿 <color=yellow>%s钱<color> 我将帮你换成相应的装备碎片.",FRAME_EXCHANGE_COIN),
		"不用在意，我只是随便说说而已./cancel",
	};
	for i = 9, 1, -1 do
		tinsert(aryDescribe, 2, format("碎片%d/#want_exchange(%d)",i,i));
	end
	CreateTaskSay(aryDescribe);
end

function want_exchange(nFrameIdx)
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>没有钱怎么换取装备碎片，要找够<color=yellow>%s钱<color> 然后回来见我.",FRAME_EXCHANGE_COIN),
							"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	SetTaskTemp(TASKTMP_EXCHANGE_FRAME, nFrameIdx);
	GiveItemUI("换装备碎片", "设置一块想换的装备碎片，钱将被自动扣除", "do_exchange", "cancel", 1);
end

function do_exchange(nItemCount)
	if (nItemCount ~= 1) then
		CreateTaskSay(	{	"<dec><npc>一次换一片.",
							"哈哈，大侠也有不小心的时候，让我来吧./exchange_entry",
							"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	local nItemIdx = GetGiveItemUnit(1);
	local tbItemProp = pack(GetItemProp(nItemIdx));
	local nFirstPiece,nPieceSum,nPieceNo,nFirstPiece
	if GetItemStackCount(nItemIdx) ~= 1 then
		CreateTaskSay(	{	"<dec><npc> 装备碎片不能重复，每次只能换一块.",
							"哈哈，大侠也有不小心的时候，让我来吧./exchange_entry",
											"真是不好意思，我稍候回来./cancel"	}	);
		return		
	end
	if (tbItemProp[1] == 4) then
		local szgoldkey = format("[%d]",tbItemProp[2])
		local nversion = ITEM_GetItemVersion( nItemIdx ) + 1;
		
		if g_aryRecoinConfig[nversion][szgoldkey] ~= nil then
			--nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
			nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
			szGoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
			nPieceNo = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceNo
			nFirstPiece = tbItemProp[2] - (nPieceNo - 1)
		end
	end
	if nPieceSum == nil then
		CreateTaskSay(	{	"<dec><npc>我只能帮你换黄金装备碎片，你给我什么呀?",
							"哈哈，大侠也有不小心的时候，让我来吧./exchange_entry",
							"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	local nExchangeFrameIdx = GetTaskTemp(TASKTMP_EXCHANGE_FRAME);
	if (nExchangeFrameIdx < 1 or nExchangeFrameIdx > nPieceSum) then
		CreateTaskSay(	{	format("<dec><npc>碎片 <color=yellow>%s<color> 想总共换<color=yellow>%s<color> 块，没有第<color=yellow>%s<color>块.",szGoldName,nPieceSum,nExchangeFrameIdx),
							"哈哈，大侠也有不小心的时候，让我来吧./exchange_entry",
							"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>没有钱怎么换装备碎片，快去找够 <color=yellow>%s 铜钱<color>然后来见我.",FRAME_EXCHANGE_COIN),
							"真是不好意思，我稍候回来./cancel"	}	);
		return
	end
	if (ConsumeItem(3, FRAME_EXCHANGE_COIN, 4, 417, 1, -1) ~= 1) then
		WriteLog(format("[换黄金碎片] %s\t%s\t%s\t 刹车铜钱失败.",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName()));
		return
	end
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		WriteLog(format("[换黄金碎片] %s\t%s\t%s\t 删除物品失败\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S",GetAccount(),GetName(),GetItemName(nItemIdx))));
	end
	AddItem(4, nFirstPiece + nExchangeFrameIdx - 1, 1, 0, 0, 0);
	CreateTaskSay(	{	format("<dec><npc>找到第 <color=yellow>%s<color> 块 <color=yellow>%s<color>, 快拿吧!",nExchangeFrameIdx,szGoldName),
						"谢谢/cancel"	}	);
	WriteLog(format("[换黄金碎片] %s\t%s\t%s\t%s 块(%s) 换成(%s)",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szGoldName,tbItemProp[2],(nFirstPiece + nExchangeFrameIdx - 1)));
end

function pack(...)
	return arg
end

function cancel()
end

--{randseed,q,g,d,P,level,series,lucky,<magic1,magic2,magic3,magic4,magic5,magic6>}(gentime)(platinalvl)

--[时间]	[黄金拆分]	Account	Name
--[时间]	主要材料：

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;

function reloadRecoinGoldenDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_GOLDENEQUIP",1), gb_GetTask("RECOIN_GOLDENEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= SPLIT_AVAILABLE_DATE_RANGE[2]) then
		SPLIT_AVAILABLE_DATE_RANGE[1] = tb_NewAvailableDate[1];
		SPLIT_AVAILABLE_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;