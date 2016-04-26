--Խ�Ͻ�ʦ�ڻ����һ�������֡�����Ϊ������ʦ�� ���ߡ�
--ͨ����Щ������ʦ����������
if (not __H_WORDCARD__) then
	__H_WORDCARD__ = 1;

Include "/script/shitu/shitu.lua"
Include([[\script\event\teachersday06_v\head.lua]]);

function main(nItemIndex)
	if (vt06_shifu_isactive() == 0) then
		return 1;
	end;
	
	if (mastercheck() == 0) then --���ʦ�������ߣ��򷵻�
		return 1;
	end;
	
	GiveItemUI("�׶�ʦ��","����ĸ��֣�һ��Ϊʦ ������ʵĿո���!", "sendgift", "no" );
	return 1;
end;

tab_Goods = {1289, 1290, 1291, 1292};

function sendgift(nCount)
	if (mastercheck() == 0) then --���ʦ�������ߣ��򷵻�
		return 1;
	end;
	if (nCount ~= 4) then
		Say("��������������!", 0);
		return
	end
	
	--��顰һ�������֡�����Ϊ������ʦ��
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		if (GetItemStackCount(idxItem) > 1) then
			Say("���ܷ��ظ�2����", 0);
			return
		end;
	end;
	local bFull = 1;
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
	
	au06_sort(tab_items); -- ��������
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_Goods[i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Say("��ŵ���������", 0);
		return
	end

	
	--ɾ����
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--������
	prize(); 		--����ͽ��
	prizemaster();	--����ʦ��
end;

--ͽ�ܽ���
function prize()
	AddItem(6, 1, 1295, 1, 0, 0, 0);
	Msg2Player("���� <color=yellow>��ͽ��<color>, ������������!");
end;

--ʦ������
function prizemaster()
	local masterName = GetMaster(GetName());
	if(not masterName) then
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		return 0;
	end
	
	local OldPlayer = PlayerIndex;
	PlayerIndex = masterIdx;
	AddItem(6, 1, 1293, 1, 0, 0, 0);
	Msg2Player("���� <color=yellow> ��ʦ��<color>, ������������!");
	PlayerIndex = OldPlayer;
end;

--���ʦ���Ƿ����ߣ����򷵻�1
function mastercheck()
	local szName = GetName();
	local masterName = GetMaster(szName);
	if(not masterName or masterName == szName) then
		Say("�����Ʒ���ӵܱ���ʦ���ĸж�֮�飬������û��ʦ��", 0);
		return 0;
	end
	
	local masterIdx = SearchPlayer(masterName)
	if(not masterIdx or masterIdx <= 0) then
		Say("ʦ�������ߣ���������", 0);
		return 0;
	end
	return 1;
end;

function no()
	
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


end; --__H_WORDCARD__

