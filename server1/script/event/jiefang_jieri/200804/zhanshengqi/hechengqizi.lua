-- �ļ�������hechengqizi.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-14 14:32:38

--10 M�nh c� 1 + 6 M�nh c� 2 + 3 M�nh c� 3 + 1 M�nh c� 4 + 3 ����	��ã�1��L� C� Chi�n Th�ng
--��ע��- ԭ�Ͻ�������ұ������Զ��۳���

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M�nh c� 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M�nh c� 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M�nh c� 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M�nh c� 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L� C� Chi�n Th�ng", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>��26-04-2008��24h00 18-05-2008, ��ֽ��Ѽ��������Ƭ�����Դ������Ƭ���Ϸ���ϳ�������L� C� Chi�n Th�ng.",
		format("����ϳ�L� C� Chi�n Th�ng/#%s:Compose()", self.szName),
		"Ta s� gh� l�i sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("T�i h�nh trang �� ��y, h�y d�n d�p h�nh trang �� b�o ��m an to�n cho v�t ph�m.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("�ϳ�1��L� C� Chi�n Th�ng", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "���: ף�ش����Ѿ��ϳ�������L� C� Chi�n Th�ng!", 0)
end