

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
	local szList = format("%-10s%s","����ԭ��","��������")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-10s%d",szList,tbMaterial[i].szName, tbMaterial[i].nCount)
	end
	return szList
end
function  BeiDouChuanGong_ComposeClass:Compose(tbMaterial,nMoney,Awardfun,...)
	if self:CheckMaterial(tbMaterial) ~=1 then
		Say(format("���ƺ�û�д���ԭ��? �����Ͼʹ�������, Ҫ��: \n%s", BeiDouChuanGong_ComposeClass:GetMaterialList(tbMaterial)), 1 , "�治����˼, �Ҵ�������./OnCancel")
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("����, Ǯ����, Ҫ��<color=yellow>%d<color> ��",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("��Ҫ <color=yellow>%d<color> ��",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("����ʧ��, ����ԭ�϶�ʧ.")
		return 0;
	end
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

