
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
	local szList = format("%-20s  %s","��Ʒ","����")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-20s  %d",szList,tbMaterial[i].szName, tbMaterial[i].nCount)
	end
	return szList
end
function jiefang_0804_ComposeClass:Compose(szMsg, tbMaterial, nMoney, Awardfun,...)
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = format("<dec><npc>%s, ��Ҫ: <enter>%s", szMsg, jiefang_0804_ComposeClass:GetMaterialList(tbMaterial) )
		if nMoney ~= 0 then
			szMsg = format("%s<enter> �� %d �������ϳ�",szMsg,  nMoney)
		end
		CreateTaskSay(
			{
				szMsg,
				"�治����˼����һ�����./OnCancel",
				
			}
		)
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("�����ԣ�Ǯû�д�������Ҫ��<color=yellow>%d<color> ��",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("��Ҫ<color=yellow>%d<color> ��",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("����ʧ�ܣ�������Ʒ��ʧ.")
		return 0;
	end
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

end