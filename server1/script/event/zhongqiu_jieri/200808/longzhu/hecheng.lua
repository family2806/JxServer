--���黻�±�
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="��ɫ����(��)", tbProp={6, 1, 1807}},
			{szName="��ɫ����(ľ)", tbProp={6, 1, 1808}},
			{szName="��ɫ���� (ˮ)", tbProp={6, 1, 1809}},
			{szName="��ɫ���� (��)", tbProp={6, 1, 1810}},
			{szName="��ɫ���� (��)", tbProp={6, 1, 1811}},

		},
		nMoney = 0,
		tbAward = 	{szName="���¹���", tbProp={6, 1, 127, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="��ɫ����(��)", tbProp={6, 1, 1812}},
			{szName="��ɫ����(ľ)", tbProp={6, 1, 1813}},
			{szName="��ɫ����(ˮ)", tbProp={6, 1, 1814}},
			{szName="��ɫ����(��)", tbProp={6, 1, 1815}},
			{szName="��ɫ����(��)", tbProp={6, 1, 1816}},
		},
		nMoney = 0,
		tbAward = {szName="����ܽ��", tbProp={6, 1, 128, 1, 0, 0}},
	},
}

function zhongqiu0808_longzhuhecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>�����ֱ�������뻻ʲô��<enter>1:1 ��ɫ���黻���¹���<enter>2:1 ��ɫ���𻻹���ܽ��.",
		"���뻻���¹���./#zhongqiu0808_longzhuhecheng_select(1)",
		"���뻻����ܽ��./#zhongqiu0808_longzhuhecheng_select(2)",
		"�����Ի�/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_longzhuhecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	
	local szMsg = format("<dec><npc>��i <color=yellow>%s<color> ��Ҫ:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("ȷ�ϻ�/#zhongqiu0808_longzhuhecheng_comfirm(%d)", nSelectId),
				"�����Ի�/OnCancel",
				
			}
		)
end

function zhongqiu0808_longzhuhecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "�������±��")
	
end

function OnCancel()
	
end
