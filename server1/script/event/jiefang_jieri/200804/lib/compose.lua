
Include("\\script\\task\\system\\task_string.lua");
if not jiefang_0804_ComposeClass then
	
jiefang_0804_ComposeClass = {}

function jiefang_0804_ComposeClass:CheckMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
				return 0;
			end	
		end
	end
	return 1;
end

function jiefang_0804_ComposeClass:ConsumeMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
				return 0;
			end	
		end
	end
	return 1;
end
function jiefang_0804_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","物品","数量")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-20s  %d",szList,tbMaterial[i].szName, tbMaterial[i].nCount)
	end
	return szList
end
function jiefang_0804_ComposeClass:Compose(szMsg, tbMaterial, nMoney, Awardfun,...)
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = format("<dec><npc>%s, 需要: <enter>%s", szMsg, jiefang_0804_ComposeClass:GetMaterialList(tbMaterial) )
		if nMoney ~= 0 then
			szMsg = format("%s<enter> 和 %d 两用来合成",szMsg,  nMoney)
		end
		CreateTaskSay(
			{
				szMsg,
				"真不好意思，我一会回来./OnCancel",
				
			}
		)
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("不可以，钱没有带够，需要有<color=yellow>%d<color> 两",nMoney),0)
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