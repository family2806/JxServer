--�ϳ��±�
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="��������", tbProp={6, 1, 1796}, nCount = 2},
			{szName="���ǵ���", tbProp={6, 1, 1797}, nCount = 2},
			{szName="���ܵ���", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Բ����", tbProp={6, 1, 1799}, nCount = 2},
			{szName="������ʯ(2��)", tbProp={6, 1, 147, 2}, nCount = 1},
		},
		nMoney = 0,
		tbAward = {szName="���������±�", tbProp={6, 1, 1801, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="��������", tbProp={6, 1, 1796}, nCount = 2},
			{szName="���ǵ���", tbProp={6, 1, 1797}, nCount = 2},
			{szName="���ܵ���", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Բ����", tbProp={6, 1, 1799}, nCount = 2},
			{szName="��Ե¶(С) ", tbProp={6, 1, 122},nCount = 1}
		},
		nMoney = 30000,
		tbAward = {szName="���������±�", tbProp={6, 1, 1802, 1, 0, 0}},
	},
	[3] = 
	{
		tbMaterial = 
		{
			{szName="��������", tbProp={6, 1, 1796}, nCount = 2},
			{szName="���ǵ���", tbProp={6, 1, 1797}, nCount = 2},
			{szName="���ܵ���", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Բ����", tbProp={6, 1, 1799}, nCount = 2},
			{szName="��������", tbProp={6, 1, 1800}, nCount = 1},

		},
		nMoney = 0,
		tbAward = {szName="�����±�", tbProp={6, 1, 1803, 1, 0, 0}},
	}
}

function zhongqiu0808_hecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>���������±�����д�05-09-2008 �� 05-10-2008 24ʱ. �ڻ�ڼ䣬��Ҵ�ֽ��ռ������ֵ������ӡ��򿪵������ӽ��õ����ֵ�������ҿ��Խ��������������±���ʹ�������±�����þ���ֵ�����Լ��м�ֵ����Ʒ��",
		"�����������±�/#zhongqiu0808_hecheng_select(1)",
		"�����������±�/#zhongqiu0808_hecheng_select(2)",
		"�����������±�/#zhongqiu0808_hecheng_select(3)",
		"�����Ի�/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_hecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	if zhongqiu0808_PlayerLimit() ~= 1 then
		return Say("Ҫ��ȼ���Ҫ50���������ѳ�ֵ", 0)
		
	end
	local szMsg = format("<dec><npc>��i <color=yellow>%s<color> ��Ҫ:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("ȷ����/#zhongqiu0808_hecheng_comfirm(%d)", nSelectId),
				"�����Ի�/OnCancel",
				
			}
		)
end

function zhongqiu0808_hecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "��������")
	
end

function OnCancel()
	
end
