IncludeLib("ITEM");
IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua")

FILE_Recoin_COMPOUND = "recoin_goldenequip.txt";
--��������ص�ͷ�ļ�ת��
-- �ƽ�װ����Ʒ��Ӧ��

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

-- �ƽ�װ��������Ʒ��������������������Ӧ��
TB_MARK_ITEM_COUNT =
{
	{6, 1},	-- �ƽ����6��������Ƭ��Ҫ����1������
	{9,	2},	-- �ƽ����9��������Ƭ��Ҫ����2������
};

-- �ƽ�װ����ָ�����Ʒ�ļ�ֵ��
TB_ENHANCE_ITEM = {
		["6,1,398"] = 100000000,	-- ���ؿ�ʯ
		["6,1,122"] = 600000,		-- ��Ե¶��С��
		["6,1,123"] = 1200000,		-- ��Ե¶���У�
		["6,1,124"] = 3000000,		-- ��Ե¶����
		["4,238,1"] = 5000000,		-- ��ˮ��
		["4,239,1"] = 5000000,		-- ��ˮ��
		["4,240,1"] = 5000000,		-- ��ˮ��
};

MARK_ITEM_ID = "4,979,1";								-- �ƽ�װ����������Ϭ��
GLBID_SPLIT_LAST_DATE = 919;							-- ȫ�ֱ���ID of ���һ��װ����ֵ�����
GLBID_SPLIT_DAILY_COUNT = 920;							-- ȫ�ֱ���ID of ����ִ��װ����ֵĴ���
SPLIT_COUNT_DAILY_THRESHOLD = 500;						-- һ̨GameSvrһ���ڿ�ִ��װ����ֵĴ�������
SPLIT_AVAILABLE_DATE_RANGE = { 20080113, 20080401 };	-- װ����ֹ��ܿ��ŵĿ�ʼ������ʱ��

FRAME_EXCHANGE_COIN = 2;			-- ����װ����Ƭ����֧����ͭǮ����
TASKTMP_EXCHANGE_FRAME = 194;		-- Ҫ������װ����Ƭ������

-- �ƽ�װ�����
-- Fanghao_Wu	2006-06-21
function split_entry()
	local aryDescribe = {};
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	
	aryDescribe =
		{
		"<dec><npc>�ҿ��Էֻƽ�װ����Ƭ����Ҳ����ʦ����������Ѫ.",
			"����ƽ�װ�����Էֳɼ���?/want_split_preview",
			"���԰��ҷֻƽ�װ����Ƭ��?/#want_split(0)",
			"�ֻƽ�װ����Ƭ�ķ���./about_split",
			"�������⣬��ֻ�����˵˵����./cancel",
		};
	CreateTaskSay(aryDescribe);
end

function want_split_preview()
	GiveItemUI("�Կ���װ����Ƭ?", "���ûƽ�װ������Ϭ�����ؿ�ʯ����Ե¶���һ�����֪�����Էֳ���װ����Ƭ����.", "do_split_preview", "cancel", 1);
end

function want_split(bNoConfirm)
	if (_is_split_available() ~= 1) then
		return
	end
	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 9) then
		CreateTaskSay(	{	"<dec><npc>װ�������λ���밲����ι�9����λ�����װ����Ƭ���䣬�ͻᱻ���˼��ߣ���ʱ�Ͳ�Ҫ����û�������㡣",
							"װ���ѹ���λ�������!/#want_split(1)",
							"�����Ұ���һ��װ����!/cancel"	}	);
	else
		GiveItemUI("��װ����Ƭ", "���úûƽ�װ������Ϭ�����ؿ�ʯ��ˮ������Ե¶���Ҳ��ܰ������Ƭ��������õ�װ�������ˣ��Ƿֳ���װ����ƬҲ�������״̬��!", "do_split", "cancel");
	end
end

function about_split()
	local aryDescribe =
	{
		"<dec><npc>���װ����Ƭ�����Ҿ��У���������Ҫһ����������?<color=yellow>��Ϭ<color>. ע�⣬�ƽ�װ�����Էֳ�4, 6, 9�顣�ֳ�4�鲻��Ҫ�� <color=yellow>��Ϭ<color> Ҳ�С���ֳ�6�飬��Ҫȥ������Ҫ1�� <color=yellow>��Ϭ<color>,��ֳ�9�����Ҫ2��2 <color=yellow>��Ϭ<color>, ���⣬������Һܶ�<color=yellow>��Ϭ<color>, <color=yellow>���ؿ�ʯ<color>, <color=yellow>ˮ��<color>�Լ�<color=yellow>��Ե¶<color> ��ֳɵ�װ����Ƭ���Եø��࣬�Ҽǵ�<color=yellow>��Ϭ<color> �� <color=blue>���������<color>.",
		"��֪����!/split_entry",
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
	
	local nItemBindState;	--ԭ�ϻƽ�İ�״̬
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_ENHANCE_ITEM do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	local nversion,nFirstPiece,nPieceSum,nBadVaules,nStandardValues,szgoldName;
	-- У����Ʒ�Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local nCurItemValue = 0;
		if (nCurItemQuality == 1) then
			--�������װ��(��������װ��)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	"<dec><npc>����<color=yellow>�ƽ�װ��<color> ��<color=yellow>��Ϭ<color> ��, ֻ��<color=yellow>���ؿ�ʯ<color>, <color=yellow>ˮ��<color> �Լ�<color=yellow>��Ե¶<color> ������Ҫ��ԭ�ϣ������ľͷ���.",
					format("����������Ҳ�в�������ʱ������������һ��./%s",szContinueFunc),
					"�治����˼���ҽ��Ժ����./cancel"	}	);
				return
			end
			
			
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܲ�
				CreateTaskSay(	{	"<dec><npc>װ����<color=fire>ʹ��ʱ��<color>�Ͳ��ܴ���.",
									"���ǲ�����˼������Ū���ˡ�����������Ŷ/cancel"	}	);
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
				CreateTaskSay(	{	"<dec><npc>�͹�������ֻƽ�װ������û���ۻ���?",
									format("����������Ҳ�в�������ʱ������������./%s",szContinueFunc),
									"���ǲ�����˼�����Ժ����./cancel"	}	);
				return
			end
			
			if (nFirstPiece == nil) then
				CreateTaskSay(	{	format("<dec><npc>�����ź����������ڵ����������ܰ���ֻƽ�װ����<color=yellow>%s<color> .",GetItemName(nCurItemIdx)),
									format("���������ƽ�װ��./%s",szContinueFunc),
									"���ǲ�����˼�����Ժ�����./cancel"	}	);
				return
			end
			nCurItemValue = nBadVaules;
			nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
			szItemInfo = getItemInfo(nCurItemIdx);
			writeRecoinLog("[�ݻƽ���Ƭ����ԭ��]", szItemInfo);
		else
			local szItemKey = format("%s,%s,%s",tbCurItemProp[1],tbCurItemProp[2],tbCurItemProp[3])
			if (szItemKey == MARK_ITEM_ID) then
				nMarkItemCount = nMarkItemCount + 1;
				nCurItemValue = ITEM_CalcItemValue(nCurItemIdx);
			else
				if (TB_ENHANCE_ITEM[szItemKey] == nil) then
					CreateTaskSay(	{	"<dec><npc>����<color=yellow>�ƽ�װ��<color> �Լ�<color=yellow>��Ϭ<color>��, ֻ��<color=yellow>���ؿ�ʯ<color>, <color=yellow>ˮ��<color> ��<color=yellow>��Ե¶<color> ������Ҫ��ԭ�ϣ��������ȷ���.",
										format("����������Ҳ�в�������ʱ������������./%s",szContinueFunc),
									"���ǲ�����˼�����Ժ����./cancel"	}	);
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
		CreateTaskSay(	{	"<dec><npc>�����Ҫ�ҷ�װ����Ƭ�Ͱ�װ���������û��װ���Ͳ��ܰ���.",
							format("����������Ҳ�в�������ʱ������������./%s",szContinueFunc),
									"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	for i = getn(TB_MARK_ITEM_COUNT), 1, -1 do
		if (nPieceSum >= TB_MARK_ITEM_COUNT[i][1]) then
			if (nMarkItemCount < TB_MARK_ITEM_COUNT[i][2]) then
				CreateTaskSay(	{	format("<dec><npc>�ָ�װ����Ƭ������Ҫ<color=yellow>%s��Ϭ<color>, ������ǻƽ�װ�����Ϳ��ܻỵ����ȥ�ҹ�<color=yellow>��Ϭ<color>Ȼ��������Ҽǵø���Ʒ��<color=blue>���������<color>.",TB_MARK_ITEM_COUNT[i][2]),
									format("�ѹ��ˣ�����������!/%s",szContinueFunc),	"���ǲ�����˼�����Ժ����./cancel"	}	);
				return
			end
			break;
		end
	end
	
	-- У����Ʒƥ��ɹ���������Ƭ����������
	local aryProb = { { 0, 0 }, { 0, 0 } };
	local dFrameCount = nSrcItemValueSum / nStandardValues * nPieceSum;
	if (dFrameCount >= nPieceSum) then
		-- Ͷ����������Ƭ���ܼ�ֵ�����ٷְٳ������Ƭ
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
					szPrompt = szPrompt..format("�ûƽ�װ����\n<color=yellow>%5.2f%%<color> ���ʿ��Էֳ�<color=yellow>%d<color> ��\n", aryProb[i][2] * 100, aryProb[i][1]);
				else
					szPrompt = szPrompt..format("��װ����\n<color=yellow>%5.2f%%<color> ���ܷ���Ƭʧ��\n", aryProb[i][2] * 100);
				end
			end
		end
		CreateTaskSay(	{	szPrompt,
							"����ҿ�������װ�����Էֳɶ��ٿ�./want_split_preview",
							"���԰��ҷָûƽ�װ����Ƭ��?/#want_split(0)",
							"��ֻ���ˣ�лл./cancel"	}	);
		return
	else
		-- ɾԭ��
		for i = 1, nItemCount do
			if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
				WriteLog(format("[�ֻƽ�װ����Ƭ] %s\t%s\t%s\t ɾ����Ʒʧ��\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
				return
			end
		end
		-- ����Ƭ
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
				--����Ƭ����ΪԴ�ƽ�װ���İ�״ֵ̬
				SetItemBindState(nIdx, nItemBindState)
			end
			AddItemByIndex(nIdx);
			szFrameNameLog = szFrameNameLog..szgoldName..format("�� [%s]\t",aryFrameDetailType[nRandNum]);
			tremove(aryFrameDetailType, nRandNum);
		end
		if (dFrameCount > 0) then
			CreateTaskSay(	{	format("<dec><npc> װ��<color=yellow>%s<color>�ֿ���ˣ����<color=yellow>%s<color> ����Ƭȥ�����������Ҫ�ϳ����ǣ��ʹ����������",szgoldName,dFrameCount),
								"лл��/cancel"	}	);
		else
			CreateTaskSay(	{	format("<dec><npc>Ph�n m�nh <color=yellow>%s<color> ʧ�ܣ��´�Ҫ�ø����ԭ��Ŷ.",szgoldName),
								"��֪����!/cancel"	}	);
		end
		-- ��¼ÿ��װ�����ִ�д���
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, GetGlbValue(GLBID_SPLIT_DAILY_COUNT) + 1);
		-- ��¼Log
		for szkey, tb_item in tb_enhanceitem_count do
			if (tb_enhanceitem_count[szkey][1] > 0) then
			szExpendableLog = szExpendableLog..tb_enhanceitem_count[szkey][2]..format("[%s](%s#)\t",szkey,tb_enhanceitem_count[szkey][1]);
			end;
		end;
	WriteLog(format("[�ֻƽ���Ƭ] %s\t%s\t%s\t%s\t ���ģ���Ϭ(%s)\t%s �ֳ�%s ��:",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szgoldName,nMarkItemCount,szExpendableLog,dFrameCount,szFrameNameLog));
		writeRecoinLog("[�ֻƽ���Ƭ]", szItemInfo);
		return
	end
end

-- �ж��Ƿ���Խ���װ����֣����ڿ��������ڣ����һ�û���ﵱ��װ����ִ�������
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
			CreateTaskSay(	{	"<dec><npc>�Բ��𣬽�����̫���ˣ�����������Ŷ",
								"���Ҿ��Ժ�����!/cancel"	}	);
			return 0;
		end
	end
	return 1;
end

-- �ƽ�װ����Ƭ�ϳ�
-- С�˶��
function compose_entry()
	local aryDescribe =
	{
		"<dec><npc>ֻ��Ҫ����ȫ����װ����Ƭ����ʣҲ���٣�������2��װ����Ƭ��ͬ���ҽ�����ϳ�.",
		"���������װ����Ƭ��Ҫ���ϳ�./want_compose",
		"��ֻ��㿴��./cancel",
	};
	CreateTaskSay(aryDescribe);
end

function want_compose(bNoConfirm)
--	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 6) then
--		CreateTaskSay(	{	"<dec><npc>�㱳����ʣ��ռ䲻���ˣ��������һ������6��ռ���������ϳɺõĻƽ�װ�������ϱ����˼��߿ɱ����û������Ŷ��",
--							"�����ռ乻�ˣ�û��ϵ��������/#want_compose(1)",
--							"����������һ�±�����/cancel"	}	);
--	else
		GiveItemUI("�ϳ�װ��", "��ϳ�װ����Ҫ�������װ����Ƭ�����װ����Ƭ�����ڱ���״̬����ôװ���ϳ���Ȼ�ᴦ�ڱ���״̬��", "do_compose", "cancel", 1);
--	end
end

function do_compose(n_count)
	if (n_count <= 0) then
		CreateTaskSay(	{	"<dec><npc>�����ϳ�װ�����Ͱ�װ����Ƭ�����ң������Ƭ���㣬�ҽ����ܰ���.",
							"����������Ҳ�в�������ʱ������������./want_compose",
							"�治����˼�����Ժ�����./cancel"	}	);
		return
	end

	--�����ǲ���������Ʒ����ͬһ����
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
			CreateTaskSay(	{	"<dec><npc>�ϳ�װ��ֻҪ��Ӧ����Ƭ�����ˣ������ľͷ���.",
								"����������Ҳ�в�������ʱ������������./want_compose",
							"�治����˼�����Ժ�����./cancel"	}	);
			return
		elseif (GetItemStackCount(n_itemidx) ~= 1) then
			CreateTaskSay(	{	"<dec><npc>װ�������ظ����ã��㲻���ҵĻ��� !",
								"����������Ҳ�в�������ʱ������������./want_compose",
							"�治����˼�����Ժ�����./cancel"	}	);
			return
		elseif not n_golddetail then	--���ݵ�һ����Ʒ�ҵ�Ҫ�ϳɵ���������Ƭ

				nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
				n_goldgenre = g_aryRecoinConfig[nversion][szgoldkey].m_nGenre
				n_golddetail = g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype
				szgoldname = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
				
				if (n_count > nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>�͹���ϳ�<color=yellow]>%s<color>������ô�ණ����ʲô�أ�ֻ��Ҫ<color=yellow>%s<color>�����.",szgoldname,nPieceSum),
											"����������Ҳ�в�С�ĵ�ʱ����������./want_compose",
											"���ǲ�����˼�����Ժ����./cancel"	}	);
						return
				elseif (n_count < nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>�͹���ϳ�<color=yellow>%s<color>������װ����Ƭ�����ܺϳ�.",szgoldname),
											"����������Ҳ�в�С�ĵ�ʱ����������./want_compose",
											"���ǲ�����˼�����Ժ����./cancel"	}	);
						return
				end
					n_type = 1

		elseif (g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype ~= n_golddetail) then	--����һ���⣬������Ƭ��Ӧ��ͬһ����
			CreateTaskSay(	{	"<dec><npc>�ϳ�װ����Ҫ��װ����Ƭ������ҵ�װ����Ƭ���ԣ����ܺϳ�.",
								"����������Ҳ�в�С�ĵ�ʱ����������./want_compose",
											"���ǲ�����˼�����Ժ����./cancel"	}	);
			return
		end

		local n_sid = tb_p[2]
		if tb_tgot[n_sid] then	--��������ͬ������Ƭ����
			CreateTaskSay(	{	format("<dec><npc>�Ҳ���Ҫ2����ͬ��װ����Ƭ<color=yellow>%s<color> ��Ҫ <color=yellow>%s<color>  <color=yellow>�� %s<color>, ��סŶ?",szgoldname,nPieceSum,szgoldname),
								"����������Ҳ�в�С�ĵ�ʱ����������./want_compose",
											"���ǲ�����˼�����Ժ����./cancel"	}	);
			return
		end
		tb_tgot[n_sid] = 1	--������Ƭ���
	end
	--��ȫ��飬���������ɾ������������ĵĻ���
	local szkey = format("[0,%d]",n_golddetail)
	if g_aryRecoinConfig[nversion][szkey] == nil then
			CreateTaskSay(	{	"<dec><npc>����ϵͳ����?", "��.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[�ϳɻƽ�װ����Ƭ] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));		
	end
	for i = g_aryRecoinConfig[nversion][szkey].m_nFirstPieceDetail,g_aryRecoinConfig[nversion][szkey].m_nPieceSum-1 do
		if not tb_tgot[i] then
			CreateTaskSay(	{	"<dec><npc>����ϵͳ����?", "��.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[�ϳɻƽ�װ����Ƭ] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
			return
		end
	end
	--ɾԭ��
	local bBind = nil
	for i=1, n_count do
		local nIdx = GetGiveItemUnit(i)
		if (GetItemBindState(nIdx) ~= 0) then
			bBind = 1
		end
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog(format("<�ϳɻƽ�װ����Ƭ> %s\t%s\t%s\t ɾ��ԭ��ʧ��\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
			return
		end
	end
	--����Ʒ
	
	local str = format("�ϳ�<color=yellow>%s<color> �ɹ�!",szgoldname)
	Msg2Player(str)
	local nItem = AddGoldItem(n_goldgenre,n_golddetail)
	local szItemInfo = getItemInfo(nItem);
	--ֻҪԭ�����а󶨻���״̬���ϳ��Ļƽ�Ϊ��
	if (bBind) then
		BindItem(nItem)
	end
	--AddGlobalNews("�ݴ��� "..GetName().." ��װ����Ƭ�ɹ��ϳ���"..szgoldname.."��")
	WriteLog(format("[�ϳɻƽ�װ����Ƭ] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
	writeRecoinLog("[�ƽ���Ƭ�ϳɻƽ�]", szItemInfo);
end

-- �ƽ�װ����Ƭ����
--
function exchange_entry()
	local aryDescribe =
	{
		format("<dec><npc>ֻ��Ҫ�� <color=yellow>%sǮ<color> �ҽ����㻻����Ӧ��װ����Ƭ.",FRAME_EXCHANGE_COIN),
		"�������⣬��ֻ�����˵˵����./cancel",
	};
	for i = 9, 1, -1 do
		tinsert(aryDescribe, 2, format("��Ƭ%d/#want_exchange(%d)",i,i));
	end
	CreateTaskSay(aryDescribe);
end

function want_exchange(nFrameIdx)
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>û��Ǯ��ô��ȡװ����Ƭ��Ҫ�ҹ�<color=yellow>%sǮ<color> Ȼ���������.",FRAME_EXCHANGE_COIN),
							"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	SetTaskTemp(TASKTMP_EXCHANGE_FRAME, nFrameIdx);
	GiveItemUI("��װ����Ƭ", "����һ���뻻��װ����Ƭ��Ǯ�����Զ��۳�", "do_exchange", "cancel", 1);
end

function do_exchange(nItemCount)
	if (nItemCount ~= 1) then
		CreateTaskSay(	{	"<dec><npc>һ�λ�һƬ.",
							"����������Ҳ�в�С�ĵ�ʱ����������./exchange_entry",
							"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	local nItemIdx = GetGiveItemUnit(1);
	local tbItemProp = pack(GetItemProp(nItemIdx));
	local nFirstPiece,nPieceSum,nPieceNo,nFirstPiece
	if GetItemStackCount(nItemIdx) ~= 1 then
		CreateTaskSay(	{	"<dec><npc> װ����Ƭ�����ظ���ÿ��ֻ�ܻ�һ��.",
							"����������Ҳ�в�С�ĵ�ʱ����������./exchange_entry",
											"���ǲ�����˼�����Ժ����./cancel"	}	);
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
		CreateTaskSay(	{	"<dec><npc>��ֻ�ܰ��㻻�ƽ�װ����Ƭ�������ʲôѽ?",
							"����������Ҳ�в�С�ĵ�ʱ����������./exchange_entry",
							"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	local nExchangeFrameIdx = GetTaskTemp(TASKTMP_EXCHANGE_FRAME);
	if (nExchangeFrameIdx < 1 or nExchangeFrameIdx > nPieceSum) then
		CreateTaskSay(	{	format("<dec><npc>��Ƭ <color=yellow>%s<color> ���ܹ���<color=yellow>%s<color> �飬û�е�<color=yellow>%s<color>��.",szGoldName,nPieceSum,nExchangeFrameIdx),
							"����������Ҳ�в�С�ĵ�ʱ����������./exchange_entry",
							"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>û��Ǯ��ô��װ����Ƭ����ȥ�ҹ� <color=yellow>%s ͭǮ<color>Ȼ��������.",FRAME_EXCHANGE_COIN),
							"���ǲ�����˼�����Ժ����./cancel"	}	);
		return
	end
	if (ConsumeItem(3, FRAME_EXCHANGE_COIN, 4, 417, 1, -1) ~= 1) then
		WriteLog(format("[���ƽ���Ƭ] %s\t%s\t%s\t ɲ��ͭǮʧ��.",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName()));
		return
	end
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		WriteLog(format("[���ƽ���Ƭ] %s\t%s\t%s\t ɾ����Ʒʧ��\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S",GetAccount(),GetName(),GetItemName(nItemIdx))));
	end
	AddItem(4, nFirstPiece + nExchangeFrameIdx - 1, 1, 0, 0, 0);
	CreateTaskSay(	{	format("<dec><npc>�ҵ��� <color=yellow>%s<color> �� <color=yellow>%s<color>, ���ð�!",nExchangeFrameIdx,szGoldName),
						"лл/cancel"	}	);
	WriteLog(format("[���ƽ���Ƭ] %s\t%s\t%s\t%s ��(%s) ����(%s)",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szGoldName,tbItemProp[2],(nFirstPiece + nExchangeFrameIdx - 1)));
end

function pack(...)
	return arg
end

function cancel()
end

--{randseed,q,g,d,P,level,series,lucky,<magic1,magic2,magic3,magic4,magic5,magic6>}(gentime)(platinalvl)

--[ʱ��]	[�ƽ���]	Account	Name
--[ʱ��]	��Ҫ���ϣ�

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