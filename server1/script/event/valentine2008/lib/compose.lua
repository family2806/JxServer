

valentine2008_ComposeClass = {}

function valentine2008_ComposeClass:CheckMaterial(tbMaterial)
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

function valentine2008_ComposeClass:ConsumeMaterial(tbMaterial)
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
function valentine2008_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-10s%s","所需材料","所需数量")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s\n%-10s%d",szList,tbMaterial[i].szName, tbMaterial[i].nCount)
	end
	return szList
end
function valentine2008_ComposeClass:Compose(tbMaterial,nMoney,Awardfun,...)
	if self:CheckMaterial(tbMaterial) ~=1 then
		Say(format("大侠身上好像没带够所需的材料吧？别看我年纪大了,眼神可好着哩。需要：\n%s",valentine2008_ComposeClass:GetMaterialList(tbMaterial)), 1 , "不好意思，那我先告辞了。/OnCancel")
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("对不起,你带的钱不够。需要<color=yellow>%d<color>两",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("支付<color=yellow>%d<color>两",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("制作失败，部分物品丢失。",0)
		Msg2Player("制作失败，部分物品丢失。")
		return 0;
	end
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

