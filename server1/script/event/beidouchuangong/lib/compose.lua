

 BeiDouChuanGong_ComposeClass = {}

function  BeiDouChuanGong_ComposeClass:CheckMaterial(tbMaterial)
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

function  BeiDouChuanGong_ComposeClass:ConsumeMaterial(tbMaterial)
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
function  BeiDouChuanGong_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-10s%s","所需原料","所需数量")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-10s%d",szList,tbMaterial[i].szName, tbMaterial[i].nCount)
	end
	return szList
end
function  BeiDouChuanGong_ComposeClass:Compose(tbMaterial,nMoney,Awardfun,...)
	if self:CheckMaterial(tbMaterial) ~=1 then
		Say(format("您似乎没有带够原料? 别看我老就打算蒙我, 要求: \n%s", BeiDouChuanGong_ComposeClass:GetMaterialList(tbMaterial)), 1 , "真不好意思, 我待会再来./OnCancel")
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("不行, 钱不够, 要有<color=yellow>%d<color> 两",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("需要 <color=yellow>%d<color> 两",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("制作失败，部分物品丢失。",0)
		Msg2Player("制作失败, 部分原料丢失.")
		return 0;
	end
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

