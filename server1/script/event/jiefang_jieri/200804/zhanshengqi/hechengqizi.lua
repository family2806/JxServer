-- �ļ�������hechengqizi.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-14 14:32:38

--10 �����Ƭ1 + 6 �����Ƭ2 + 3 �����Ƭ3 + 1 �����Ƭ4 + 3 ����	��ã�1��սʤ��
--��ע��- ԭ�Ͻ�������ұ������Զ��۳���

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="�����Ƭ1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="�����Ƭ2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="�����Ƭ3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="�����Ƭ4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="սʤ��", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>��26-04-2008��24h00 18-05-2008, ��ֽ��Ѽ��������Ƭ�����Դ������Ƭ���Ϸ���ϳ�������սʤ��.",
		format("����ϳ�սʤ��/#%s:Compose()", self.szName),
		"�Ҵ�������/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("�������ˣ�Ϊ����Ʒ�İ�ȫ��������.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("�ϳ�1��սʤ��", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "���: ף�ش����Ѿ��ϳ�������սʤ��!", 0)
end