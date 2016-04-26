--合成月饼
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="蝴蝶灯笼", tbProp={6, 1, 1796}, nCount = 2},
			{szName="星星灯笼", tbProp={6, 1, 1797}, nCount = 2},
			{szName="长管灯笼", tbProp={6, 1, 1798}, nCount = 2},
			{szName="圆灯笼", tbProp={6, 1, 1799}, nCount = 2},
			{szName="玄晶矿石(2级)", tbProp={6, 1, 147, 2}, nCount = 1},
		},
		nMoney = 0,
		tbAward = {szName="望月中秋月饼", tbProp={6, 1, 1801, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="蝴蝶灯笼", tbProp={6, 1, 1796}, nCount = 2},
			{szName="星星灯笼", tbProp={6, 1, 1797}, nCount = 2},
			{szName="长管灯笼", tbProp={6, 1, 1798}, nCount = 2},
			{szName="圆灯笼", tbProp={6, 1, 1799}, nCount = 2},
			{szName="福缘露(小) ", tbProp={6, 1, 122},nCount = 1}
		},
		nMoney = 30000,
		tbAward = {szName="建月中秋月饼", tbProp={6, 1, 1802, 1, 0, 0}},
	},
	[3] = 
	{
		tbMaterial = 
		{
			{szName="蝴蝶灯笼", tbProp={6, 1, 1796}, nCount = 2},
			{szName="星星灯笼", tbProp={6, 1, 1797}, nCount = 2},
			{szName="长管灯笼", tbProp={6, 1, 1798}, nCount = 2},
			{szName="圆灯笼", tbProp={6, 1, 1799}, nCount = 2},
			{szName="赏月蜡烛", tbProp={6, 1, 1800}, nCount = 1},

		},
		nMoney = 0,
		tbAward = {szName="赏月月饼", tbProp={6, 1, 1803, 1, 0, 0}},
	}
}

function zhongqiu0808_hecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>赏月中秋月饼活动举行从05-09-2008 到 05-10-2008 24时. 在活动期间，玩家打怪将收集到各种灯笼盒子。打开灯笼盒子将得到各种灯笼，玩家可以将灯笼换成中秋月饼。使用中秋月饼将获得经验值奖励以及有价值的物品。",
		"换望月中秋月饼/#zhongqiu0808_hecheng_select(1)",
		"换建月中秋月饼/#zhongqiu0808_hecheng_select(2)",
		"换赏月中秋月饼/#zhongqiu0808_hecheng_select(3)",
		"结束对话/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_hecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	if zhongqiu0808_PlayerLimit() ~= 1 then
		return Say("要求等级需要50级以上且已充值", 0)
		
	end
	local szMsg = format("<dec><npc>фi <color=yellow>%s<color> 需要:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("确定换/#zhongqiu0808_hecheng_comfirm(%d)", nSelectId),
				"结束对话/OnCancel",
				
			}
		)
end

function zhongqiu0808_hecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "做中秋饼活动")
	
end

function OnCancel()
	
end
