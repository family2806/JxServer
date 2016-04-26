--龙珠换月饼
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="五色龙珠(金)", tbProp={6, 1, 1807}},
			{szName="五色龙珠(木)", tbProp={6, 1, 1808}},
			{szName="五色龙珠 (水)", tbProp={6, 1, 1809}},
			{szName="五色龙珠 (火)", tbProp={6, 1, 1810}},
			{szName="五色龙珠 (土)", tbProp={6, 1, 1811}},

		},
		nMoney = 0,
		tbAward = 	{szName="奉月果蓉", tbProp={6, 1, 127, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="五色凤羽(金)", tbProp={6, 1, 1812}},
			{szName="五色凤羽(木)", tbProp={6, 1, 1813}},
			{szName="五色凤羽(水)", tbProp={6, 1, 1814}},
			{szName="五色凤羽(火)", tbProp={6, 1, 1815}},
			{szName="五色凤羽(土)", tbProp={6, 1, 1816}},
		},
		nMoney = 0,
		tbAward = {szName="龚月芙蓉", tbProp={6, 1, 128, 1, 0, 0}},
	},
}

function zhongqiu0808_longzhuhecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>有两种宝物，大侠想换什么？<enter>1:1 五色龙珠换奉月果蓉<enter>2:1 五色凤羽换龚月芙蓉.",
		"我想换奉月果蓉./#zhongqiu0808_longzhuhecheng_select(1)",
		"我想换龚月芙蓉./#zhongqiu0808_longzhuhecheng_select(2)",
		"结束对话/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_longzhuhecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	
	local szMsg = format("<dec><npc>фi <color=yellow>%s<color> 需要:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("确认换/#zhongqiu0808_longzhuhecheng_comfirm(%d)", nSelectId),
				"结束对话/OnCancel",
				
			}
		)
end

function zhongqiu0808_longzhuhecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "做中秋月饼活动")
	
end

function OnCancel()
	
end
