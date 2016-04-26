-- �ļ�������lingjiang.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-14 14:34:01

-- ����ţ�����嵽�����ִ�����NPC ���һ�������
-- ����������һ��ս����Ʊ+1��8����+������Ʒ�б��е����һ��

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="��ţ������", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="ս����Ʊ", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="8��������ʯ", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="����׽������", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="�������Ǭ����", nQuality=1, tbProp={0, 144},nRate = 25},
                     {szName="����׽�����", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="�����������Ȧ", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>���գ�һ��ɽ������������ȥɧ�Ű��գ�����������أ���λ������������ɽ��. �л����<color=yellow>��ţ������<color> ��ɽ������, �����Ϸ��к�������.",
		format("�Ҽ���ţ������/#%s:Compose()", self.szName),
		"�����Ի�/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "����Ҫ�����������ɽ���Ķ�����?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "�����ڴ���ɽ���б��ֵĺܳ�ɫ������ȡ����.", 0)
end
