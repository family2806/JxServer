
Include("\\script\\task\\system\\task_string.lua");
if not pingzi0805_ComposeClass then
	
pingzi0805_ComposeClass = {}

function pingzi0805_ComposeClass:CheckMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nCount = tbItem.nCount or 1
		if nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < nCount then
				return 0;
			end	
		end
	end
	return 1;
end

function pingzi0805_ComposeClass:ConsumeMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nCount = tbItem.nCount or 1
		if nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
				return 0;
			end	
		end
	end
	return 1;
end
function pingzi0805_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","物品","数量")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-20s  %d",szList,tbMaterial[i].szName, tbMaterial[i].nCount or 1)
	end
	return szList
end
function pingzi0805_ComposeClass:Compose(szMsg, tbMaterial, nMoney, Awardfun,...)
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = format("<dec><npc>%s, 需要: <enter>%s", szMsg, pingzi0805_ComposeClass:GetMaterialList(tbMaterial) )
		if nMoney ~= 0 then
			szMsg = format("%s<enter> 和 %d两来合成",szMsg,  nMoney)
		end
		CreateTaskSay(
			{
				szMsg,
				"真不好意思！我待会再回来./OnCancel",
				
			}
		)
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("不行啊，钱没有带够，需要有<color=yellow>%d<color> 两",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("需要<color=yellow>%d<color> 两",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("制作失败，部分物品丢失。",0)
		Msg2Player("制作失败，部分物品丢失.")
		return 0;
	end
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

end