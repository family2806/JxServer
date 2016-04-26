Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_white = {}

function main(itemidx)
	--���ʹ����Ʒ����
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "�㲻������ʹ����Ʒ��Ҫ��50�����ϳ�ֵ�û�")
		return 1
	end
	-- het event, ��Ʒʹ�õ���
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("��Ʒʹ�ù��ڣ��Զ���ʧ.")
		return 0; -- delete item
	end
	-- ʹ����Ʒ�ɹ���ɾ��item
	if (tbNSKT_star_happiness:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "����������޶�ʹ�ø���Ʒ��!")
		return 1 -- ��ɾ�� item	
	end
end

function tbNSKT_star_white:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--��������task, ������, ɾ����Ʒ
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 50e6} --50 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "�����Ǿ��齱��");
		return 1;
	end
	return 0; --ʹ�� max, ����ʹ��, ����ɾ��
end