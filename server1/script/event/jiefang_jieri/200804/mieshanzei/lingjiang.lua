-- �ļ�������lingjiang.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-14 14:34:01

-- ��Thi�t Ng�u Lang Nha B�i�������ִ�����NPC ���һ�������
-- ����������һ��Ng�n phi�u chi�n b�+1��8����+������Ʒ�б��е����һ��

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="Thi�t Ng�u Lang Nha B�i", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="Ng�n phi�u chi�n b�", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="Huy�n tinh kho�ng th�ch c�p 8", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="��ng S�t B�ch Kim �i�u Long Gi�i", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="��ng S�t B�ch Ng�c C�n Kh�n B�i", nQuality=1, tbProp={0, 144},nRate = 25},
                     {szName="��ng S�t B�ch Kim T� Ph�ng Gi�i", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="��ng S�t Ph� Th�y Ng�c H�ng Khuy�n", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>���գ�һ��ɽ������������ȥɧ�Ű��գ�����������أ���λ������������ɽ��. �л����<color=yellow>Thi�t Ng�u Lang Nha B�i<color> ��ɽ������, �����Ϸ��к�������.",
		format("�Ҽ�Thi�t Ng�u Lang Nha B�i/#%s:Compose()", self.szName),
		"K�t th�c ��i tho�i/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "��i hi�p xin h�y nhanh ch�ng tham gia ��i ng� ti�u di�t s�n t�c?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "��i hi�p �� c� th�nh t�ch r�t xu�t s�c trong vi�c ��nh �u�i s�n t�c, xin h�y nh�n l�y ph�n th��ng n�y?", 0)
end
