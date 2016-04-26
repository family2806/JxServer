--by ��־ɽ [2006-09-12]
--2006����֮�����Ѱ������ͼ������ͼ.
--Illustration: ��Ů -- fairy au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--��Ů���ں���
function au06_entrance_fairy()
	if (au06_IsPayed_player() == 0) then
		Say("ֻ�г�ֵ��Ҳſ��Բμ�����", 0);
		return
	end;
	
	local tab_Content = {
		"���Ѿ��Ѽ����˻�����Ƭ��./handup_picture",
		"ֻ����̽��һ����!/oncancel"
	};
	Describe("������������Ѱ��2��������������. �����Ż����ֳ��˺ܶ���Ƭɢ���ڸ���.��˵Ұ�����������������Ƭ.�������Եõ���Щ��Ƭ���һ����ƴ��.", getn(tab_Content), tab_Content);
end;

--�������
function handup_picture()
	--�������ﵽ����
	GiveItemUI("�Ͻ���", "ƴͼ����: �ź�λ�ã�����ߵ�һ��Ϊ׼ƴͼ.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
--�ж��Ƿ������
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("ÿ��ͼ��6����Ƭ��������Ĳ���.", 1, "�ȹ���������/oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("�����Ƭ����ƴͼ,�ҹ����ٻ������Ұ�.", 1, "�����ȸ����./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- ��������
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("�����Ƭ����ƴͼ,�ҹ����ٻ������Ұ�.", 1, "�����ȸ����./oncancel");
		return
	end
	
	--ɾ����
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--������
	local str = "1 <color=yellow>�Թ�����<color>";
	AddItem(6, 1, 1252, 1, 0, 0, 0);
	
	--����ʾ
	Describe("���벻����������. ����<color=yellow>�Թ�����<color>, ����10������ȥ�������������˶һ������±�",1,"��ȡ��Ʒ/oncancel")
	Msg2Player("��õ�"..str);
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--����һ��ð������
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--���ý���������
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

