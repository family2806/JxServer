--2007Խ�Ϲ���
--2007-08-08
--by С�˶��
--��ȡB�ch b�o r��ng

TB_Material = {
 --1.��Ʒ��	2.����
	["0,10,5"] = "Ng�a c�p 80",
	["4,490,1"] =	"M�nh T�ng B�o �� 1",
	["4,491,1"] =	"M�nh T�ng B�o �� 2",
	["4,492,1"] =	"M�nh T�ng B�o �� 3",
	["4,493,1"] =	"M�nh T�ng B�o �� 4",
	["4,494,1"] =	"M�nh T�ng B�o �� 5",
	["4,495,1"] =	"M�nh T�ng B�o �� 6",
	["4,496,1"] =	"M�nh T�ng B�o �� 7",
	["4,497,1"] =	"M�nh T�ng B�o �� 8",
	["4,498,1"] =	"M�nh T�ng B�o �� 9",
	["4,499,1"] =	"M�nh T�ng B�o �� 10",
	["4,500,1"] =	"M�nh T�ng B�o �� 11",
	["4,501,1"] =	"M�nh T�ng B�o �� 12",
}
function BaiBaoXiang_Give_UI()
	GiveItemUI("B�ch b�o r��ng","�i�һ�B�ch b�o r��ng�������Ǵ򿪵ڶ������ӡ�һƥ80�������1��12�е�����һ�Ųر�ͼ.","BaiBaoXiang_Get","no",1)
end			

function BaiBaoXiang_Get(nItemCount)
	if CheckStoreBoxState(2) > 0 then
		Say("��������: ���ѵõ�B�ch b�o r��ng��,����Ҫʲô�͵��������.",1,"��ng �!/no");
		return 1;
	end
	if	CheckStoreBoxState(1) == 0 then
		Say("��������: ����δ�򿪵ڶ�������,�Ҳ��ܰ�B�ch b�o r��ng������. ���ȵ������ش򿪵ڶ�������֮����������.",1,"��ng �!/no");
		return 1;	
	end
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	--�����Ʒƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		
		if (TB_Material[szItemKey] == nil) then
				Say("����: ����, ����ֻҪһ�Ųر�ͼ��һƥNg�a c�p 80, ��Ĳ���Ҫ.",2,"Ha ha, �� ta th� l�i v�y./BaiBaoXiang_Give_UI","Th�t ng�i qu�, ta s� quay l�i sau./no");
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
	end
	
		for szkey, tb_item in TB_Material do
				if (tb_enhanceitem_count[szkey][1] ~= 1) then
					Say("Th�n b� th��ng nh�n: Kh�ng ���c r�i, v�t ph�m ta y�u c�u kh�ng v�n ch�a ��.",2,"Ha ha, �� ta th� l�i v�y./BaiBaoXiang_Give_UI","Th�t ng�i qu�, ta s� quay l�i sau./no");
				return
				end
		end
		
		--ɾ����
		for i=1, nItemCount do
			local nIdx = GetGiveItemUnit(i)
			if (RemoveItemByIndex(nIdx) ~= 1) then
				WriteLog(format("[GuoQing2007_BaiBaoXiang]Date:%s\t Account:%s\t Name:%s\t DelItemFail:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i)) ));
				return
			end
		end
		
		 --����Ʒ
		Msg2Player("������ȡ�� <color=yellow>B�ch b�o r��ng<color>.");
		Say("��������: ף�����õ�B�ch b�o r��ng.",1,"��ng �!/no");
		OpenStoreBox(2);
		WriteLog(format("[GuoQing2007_BaiBaoXiang]\t Date:%s\t Account:%s\t Name:%s\t Effect:Get BaiBaoXiang",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName()));

end

function pack(...)
	return arg
end