-- �ļ�������yirongmishu.lua
-- �����ߡ���wangjingjun
-- ���ݡ������������� ���������ߵ��������Ʒ
-- ����ʱ�䣺2011-07-11 09:36:28

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbMask = 
{
	{szName = "��ӯӯ���", tbProp = {0,11,496,1,0,0}, nExpiredTime = 48*60},
	{szName = "�׳ǿ������", tbProp = {0,11,497,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,498,1,0,0}, nExpiredTime = 48*60},
	{szName = "�Ű����", tbProp = {0,11,499,1,0,0}, nExpiredTime = 48*60},
	{szName = "��˫�����", tbProp = {0,11,500,1,0,0}, nExpiredTime = 48*60},
	{szName = "�����������", tbProp = {0,11,501,1,0,0}, nExpiredTime = 48*60},
	{szName = "�������", tbProp = {0,11,502,1,0,0}, nExpiredTime = 48*60},
	{szName = "��ľ����", tbProp = {0,11,503,1,0,0}, nExpiredTime = 48*60},
	{szName = "�������", tbProp = {0,11,504,1,0,0}, nExpiredTime = 48*60},
	{szName = "�Ʋ�Ⱦ���", tbProp = {0,11,505,1,0,0}, nExpiredTime = 48*60},	-- 10
	{szName = "�������", tbProp = {0,11,506,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,507,1,0,0}, nExpiredTime = 48*60},
	{szName = "���ɱ������", tbProp = {0,11,508,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,509,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,510,1,0,0}, nExpiredTime = 48*60},
	{szName = "�³����", tbProp = {0,11,511,1,0,0}, nExpiredTime = 48*60},
	{szName = "�������", tbProp = {0,11,512,1,0,0}, nExpiredTime = 48*60},
	{szName = "÷��¹���", tbProp = {0,11,513,1,0,0}, nExpiredTime = 48*60},
	{szName = "������ʦ���", tbProp = {0,11,514,1,0,0}, nExpiredTime = 48*60},
	{szName = "���鹫�����", tbProp = {0,11,515,1,0,0}, nExpiredTime = 48*60},	-- 20
	{szName = "���������", tbProp = {0,11,516,1,0,0}, nExpiredTime = 48*60},
	{szName = "��Ʈ�����", tbProp = {0,11,517,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,518,1,0,0}, nExpiredTime = 48*60},
	{szName = "��ʮ�������", tbProp = {0,11,519,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,520,1,0,0}, nExpiredTime = 48*60},
	{szName = "Ľ�ݰ����", tbProp = {0,11,521,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,522,1,0,0}, nExpiredTime = 48*60},
	{szName = "Ƭ�����", tbProp = {0,11,523,1,0,0}, nExpiredTime = 48*60},
	{szName = "��������", tbProp = {0,11,524,1,0,0}, nExpiredTime = 48*60},
	{szName = "������Ů", tbProp = {0,11,525,1,0,0}, nExpiredTime = 48*60},	-- 30
	{szName = "���꺣�����", tbProp = {0,11,526,1,0,0}, nExpiredTime = 48*60},
	{szName = "���꺣�����", tbProp = {0,11,527,1,0,0}, nExpiredTime = 48*60},
	{szName = "����������", tbProp = {0,11,528,1,0,0}, nExpiredTime = 48*60},
	{szName = "����������", tbProp = {0,11,529,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,530,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,531,1,0,0}, nExpiredTime = 48*60},
	{szName = "�����׽����", tbProp = {0,11,532,1,0,0}, nExpiredTime = 48*60},
	{szName = "�����׽����", tbProp = {0,11,533,1,0,0}, nExpiredTime = 48*60},
	{szName = "����Ц˪���", tbProp = {0,11,534,1,0,0}, nExpiredTime = 48*60},
	{szName = "����Ц˪���", tbProp = {0,11,535,1,0,0}, nExpiredTime = 48*60},	-- 40
	{szName = "���ʦ̫���", tbProp = {0,11,536,1,0,0}, nExpiredTime = 48*60},
	{szName = "���꺣�����", tbProp = {0,11,537,1,0,0}, nExpiredTime = 48*60},
	{szName = "����������", tbProp = {0,11,538,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,539,1,0,0}, nExpiredTime = 48*60},
	{szName = "�����׽����", tbProp = {0,11,540,1,0,0}, nExpiredTime = 48*60},
	{szName = "����Ц˪���", tbProp = {0,11,541,1,0,0}, nExpiredTime = 48*60},
	{szName = "�մ�ܰ���", tbProp = {0,11,542,1,0,0}, nExpiredTime = 48*60},
	{szName = "���������", tbProp = {0,11,543,1,0,0}, nExpiredTime = 48*60},
	{szName = "�������", tbProp = {0,11,544,1,0,0}, nExpiredTime = 48*60},
	{szName = "ȫ�������", tbProp = {0,11,545,1,0,0}, nExpiredTime = 48*60},		-- 50	
	{szName = "���������", tbProp = {0,11,546,1,0,0}, nExpiredTime = 48*60},
	{szName = "�ƺ������", tbProp = {0,11,547,1,0,0}, nExpiredTime = 48*60},
	{szName = "�������", tbProp = {0,11,548,1,0,0}, nExpiredTime = 48*60},
	{szName = "����ծ���", tbProp = {0,11,549,1,0,0}, nExpiredTime = 48*60},
	{szName = "�೯���", tbProp = {0,11,550,1,0,0}, nExpiredTime = 48*60},
	{szName = "��һ�����", tbProp = {0,11,551,1,0,0}, nExpiredTime = 48*60},
	{szName = "��һ���", tbProp = {0,11,552,1,0,0}, nExpiredTime = 48*60},
	{szName = "��ľ�����", tbProp = {0,11,553,1,0,0}, nExpiredTime = 48*60},
	{szName = "�ƺ����", tbProp = {0,11,554,1,0,0}, nExpiredTime = 48*60},
	{szName = "�϶����", tbProp = {0,11,555,1,0,0}, nExpiredTime = 48*60},		-- 60	
	{szName = "���������", tbProp = {0,11,556,1,0,0}, nExpiredTime = 48*60},
	{szName = "����÷���", tbProp = {0,11,557,1,0,0}, nExpiredTime = 48*60},
	{szName = "��ţ���", tbProp = {0,11,558,1,0,0}, nExpiredTime = 48*60},
}

function showMask(nIndex, nPlayerIndex, nItemIndex)
	local szTitle = "��ѡ������Ҫ�����"
	local tbOpt = {}
	local nMaskCount = getn(%tbMask)
	local nShowIndex = 0
	local nPerCount = 10
	
	nIndex = max(1, nIndex)
	nIndex = min(nIndex, nMaskCount)
	nShowIndex = nIndex
	
	for i=1,nPerCount do
		if nShowIndex > nMaskCount then
			break
		end
		tinsert(tbOpt, {%tbMask[nShowIndex].szName, queren, {nShowIndex, nPlayerIndex, nItemIndex}})
		nShowIndex = nShowIndex + 1	
	end
	
	tinsert(tbOpt, {"��һҳ", showMask, {nIndex - nPerCount, nPlayerIndex, nItemIndex}})
	if nShowIndex + 1 < nMaskCount then
		tinsert(tbOpt, {"��һҳ", showMask, {nShowIndex, nPlayerIndex, nItemIndex}})
	end
	tinsert(tbOpt, {"�뿪", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function queren(nIndex, nPlayerIndex, nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ�������ĲƲ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 
	end
	
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("������������ʧ��")
		return 
	end
	-- ����ѡ�������
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbMask[nIndex], "ʹ����������", 1)
end

function main(nItemIndex)
	showMask(1, PlayerIndex, nItemIndex)
	return 1
end