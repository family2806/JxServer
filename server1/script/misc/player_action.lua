--------------------------------------------------------------------
-- ��Ҳ����ű�����Ҫ��Ӧ�������
--------------------------------------------------------------------
TIME_2000_1_1 = 946656000;
function BIND_ITEM(itemIdx)
	local g = GetItemProp(itemIdx)
	--������װ�����𻵵�װ��
	if g ~= 0 and g ~= 7 then
		Say("ֻ�ܸ�װ��������", 0)
		return
	end
	--���ɻص�����
	local szFunStep2 = "/#BIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState < 0 then
		Say("��װ��������������״̬������Ҫ������!", 0)
	elseif nBindState > 0 then
		
		if (nBindState > (floor((GetCurServerTime() - TIME_2000_1_1) / 3600)) ) then
			Say("����Ʒ����ʱ��<color=green> ����168��Сʱ <color>, ��ʱ���ܿ���!", 0)
			return
		end
		
		Say("����Ʒ�������ѿ�������״̬�����������?", 2, "ͬ��"..szFunStep2, "����/cancel")
	else
		Say("��װ�����������ܽ��ף��������߷��ζԻ��С�ͬʱ�����������죬�����ǵ�PKʱ��������䡣�������յ�װ����Ȼ��ƽ�������ã�������������Ҫͨ�� <color=yellow>��������<color> (װ������ġ��⡱�������ǣ�<color=green>168Сʱ��<color> ������ȫ����.", 
			2, "������װ������"..szFunStep2, "���ҿ���/cancel")
	end
end

function BIND_ITEM_2(itemIdx, nGenTime)
	--У���Ƿ���ǰ����Ʒ
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		
		return 
	end
	if BindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("���ѳɹ�����һ��װ������")
	end
end

function UNBIND_ITEM(itemIdx)
	--���ɻص�����
	local szFunStep2 = "/#UNBIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState == 0 then
		Say("����Ʒ����������!", 0)
	elseif nBindState > 0 then
		Say("����Ʒ�����ڿ���״̬������Ҫ�ٿ���!", 0)
	elseif nBindState == -1 then
		Say("�ڵ�����⡱����������ʱ����Ҫ��<color=green>168Сʱ<color> �������ȫ����", 
			2, "��ͬ�⿪������"..szFunStep2, "���ҿ���/cancel")
	else
		Say("����Ʒ�����������գ����ܿ���!", 0)
	end
end

function UNBIND_ITEM_2(itemIdx, nGenTime)
	--У���Ƿ���ǰ����Ʒ
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		return 
	end
	if UnBindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tUnBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("Ҫ�󿪱������ѷ���168Сʱ���Զ���ȫ����.")
	end
end

function cancel()
end