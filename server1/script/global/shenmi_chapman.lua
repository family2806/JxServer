-- �������� �Ի��ű�
-- Li_Xin(2004-07-20)

--Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
IncludeLib("ITEM")
IncludeLib("SETTING")

function writeChapManLog(str)
	WriteLog(date("%H%M%S").."���˺ţ�"..GetAccount().."����ɫ��"..GetName().."��"..str);
end;

function writeChapManGoldLog( str, nPaidGold, nPaidSilver, nPaidCoin, nPaidTicket )
	WriteGoldLog( GetAccount().."("..GetName()..") "..str, -nPaidGold, -nPaidSilver, -nPaidCoin, -nPaidTicket );
end;

function get1()
	str=
	{
		"<#>�������ˣ������������ʢ���ľ�����Ʒ����ͼ���ˡ�����ͼ������������������ط��������ɴ�����֮Ч���������ˮ��������������Ȥ��",
		"<#>ֻ�ǿ���/no",
		"<#>����ǹ�����ƪ(ǹ)/yes1",
		"<#>���䴸֮������(��)/yes2",
		"<#>����������ͼ(��)/yes3",
		"<#>��������Ҫ(��)/yes4",
		"<#>��Ҷ��絶����ȡƪ(�ɵ�)/yes5",
		"<#>���µ��Ͼ���¼(��)/yes6",
		"<#>�����ͼ��(��)/yes7",
		"<#>�������ס���һ(����)/yes8",
		"<#>ԧ�쵶������ƪ(˫��)/yes9"
	};
	Say(str[1],10,str[2],str[3],str[4],str[5],str[6],str[7],str[8],str[9],str[10],str[11])
end;

function get2()
	str=
	{
		"<#>�������ˣ���������׸�������ɽ�������ԭ���õ����������ˡ������������ڶ����·���ñ�ӣ�������á�����Ȥ��",
		"<#>�����޼�˿(�����ȼ�)/buy_silk",
		"<#>����֮��(���͵ȼ�)/buy_stone",
		"<#>ֻ�ǿ���/no",
	};
	Say(str[1],3,str[2],str[3],str[4])
end;

function yes1()
	-- Խ�ϰ汾�۸�Ķ���
	Say("�������ˣ���ȷ��Ҫ��<color=red>����ǹ�����ƪ<color>������ǹ�����ƪ��Ҫ1��<color=red>��ˮ��<color>��<color=red>2����ˮ��<color>��<color=red>1����ˮ��<color>������",2,"ȷ��/sure1","ȡ��/no")
end;

function sure1()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(406)
	  	writeChapManLog("��õ�����ǹ�����ƪ��")
	  	Msg2Player("��õ�����ǹ�����ƪ��")
	else
	  	Talk(1,"","�������ˣ�����ǹ�����ƪ��Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes2()
	Say("�������ˣ���ȷ��Ҫ��<color=red>���䴸֮������<color>�����䴸֮��������Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure2","ȡ��/no")
end;

function sure2()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(407)
	  	writeChapManLog("��õ����䴸֮��������")
	  	Msg2Player("��õ����䴸֮��������")
	else
	  	Talk(1,"","�������ˣ����䴸֮��������Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes3()
	Say("�������ˣ���ȷ��Ҫ��<color=red>����������ͼ<color>������������ͼ��Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure3","ȡ��/no")
end;

function sure3()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(408)
	  	writeChapManLog("��õ�����������ͼ��")
	  	Msg2Player("��õ�����������ͼ��")
	else
	  	Talk(1,"","�������ˣ�����������ͼ��Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes4()
	Say("�������ˣ���ȷ��Ҫ��<color=red>��������Ҫ<color>����������Ҫ��Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure4","ȡ��/no")
end;

function sure4()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(409)
	  	writeChapManLog("��õ���������Ҫ��")
	  	Msg2Player("��õ���������Ҫ��")
	else
	  	Talk(1,"","�������ˣ���������Ҫ��Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes5()
	Say("�������ˣ���ȷ��Ҫ��<color=red>��Ҷ��絶����ȡƪ<color>����Ҷ��絶����ȡƪ��Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure5","ȡ��/no")
end;

function sure5()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(410)
	  	writeChapManLog("��õ���Ҷ��絶����ȡƪ��")
	  	Msg2Player("��õ���Ҷ��絶����ȡƪ��")
	else
	  	Talk(1,"","�������ˣ���Ҷ��絶����ȡƪ��Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes6()
	Say("�������ˣ���ȷ��Ҫ��<color=red>���µ��Ͼ���¼<color>�����µ��Ͼ���¼��Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure6","ȡ��/no")
end;

function sure6()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(411)
	  	writeChapManLog("��õ����µ��Ͼ���¼��")
	  	Msg2Player("��õ����µ��Ͼ���¼��")
	else
	  	Talk(1,"","�������ˣ����µ��Ͼ���¼��Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes7()
	Say("�������ˣ���ȷ��Ҫ��<color=red>�����ͼ��<color>�������ͼ����Ҫ1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>��1��<color=red>��ˮ��<color>������",2,"ȷ��/sure7","ȡ��/no")
end;

function sure7()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(412)
	  	writeChapManLog("��õ������ͼ�ס�")
	  	Msg2Player("��õ������ͼ�ס�")
	else
	  	Talk(1,"","�������ˣ������ͼ����Ҫ1����ˮ����1����ˮ����1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes8()
	Say("�������ˣ���ȷ��Ҫ��<color=red>�������ס���һ<color>�𣿰������ס���һ��Ҫ2��<color=red>��ˮ��<color>������",2,"ȷ��/sure8","ȡ��/no")
end;

function sure8()
	if ((GetItemCountEx(239)>=2)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(239)
	  	DelItemEx(239)
	  	AddEventItem(413)
	  	writeChapManLog("��õ��������ס���һ��")
	  	Msg2Player("��õ��������ס���һ��")
	else
	  	Talk(1,"","�������ˣ��������ס���һ��Ҫ2����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function yes9()
	Say("�������ˣ���ȷ��Ҫ��<color=red>ԧ�쵶������ƪ<color>��ԧ�쵶������ƪ��Ҫ1��<color=red>��ˮ��<color>������",2,"ȷ��/sure9","ȡ��/no")
end;

function sure9()
	if ((GetItemCountEx(239)>=1)) then 
		Talk(1,"","�������ˣ��õģ��յ�ˮ���ˡ��������ͼ�ף��㿴������֤�ܹ�������������ȼ���")
	  	DelItemEx(239)
	  	AddEventItem(414)
	  	writeChapManLog("��õ�ԧ�쵶������ƪ��")
	  	Msg2Player("��õ�ԧ�쵶������ƪ��")
	else
	  	Talk(1,"","�������ˣ�ԧ�쵶������ƪ��Ҫ1����ˮ�����������ˮ�����񲻹��أ�")
	end
end;

function buy_silk()
	str=
	{
		"<#>�������ˣ���ȷ��Ҫ����<color=red>�����޼�˿<color>����Ҫ1��<color=red>��Ԫ��<color>������1��<color=red>��Ʊ<color>���ܹ���Ŷ��",
		"<#>�ý�Ԫ������/sure10",
		"<#>ȡ��/no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure10()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","�������ˣ��õģ��յ���Ԫ���ˡ��������<color=red>�����޼�˿<color>���㿴������֤�ܹ���������·���ñ�ӵȼ���")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(415)
	  	UseSilver(1, 2, 2); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	  	SaveNow(); -- ��������
	  	-- writeChapManLog("��õ������޼�˿��")
	  	writeChapManGoldLog("����1����Ԫ�����õ������޼�˿", 1, 0, 0, 0);
	  	Msg2Player("��õ������޼�˿��")
	else
	  	Talk(1,"","�������ˣ������޼�˿��Ҫ1����Ԫ�����ܹ�����Ľ�Ԫ�����񲻹��أ�")
	end
end;

function buy_stone()
	str=
	{
		"<#>�������ˣ���ȷ��Ҫ����<color=red>����֮��<color>����Ҫ1��<color=red>��Ԫ��<color>������1��<color=red>��Ʊ<color>���ܹ���Ŷ��",
		"<#>�ý�Ԫ������/sure11",
		"<#>ȡ��/no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure11()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","�������ˣ��õģ��յ���Ԫ���ˡ��������<color=red>����֮��<color>���㿴������֤�ܹ���������·���ñ�ӵȼ���")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(416)
		UseSilver(1, 2, 2); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
		SaveNow(); -- ��������
		
	  	-- writeChapManLog("��õ�����֮����")
	  	writeChapManGoldLog("����1����Ԫ�����õ�����֮��", 1, 0, 0, 0);
	  	Msg2Player("��õ�����֮����")
	else
	  	Talk(1,"","�������ˣ�����֮����Ҫ1����Ԫ�����ܹ�����Ľ�Ԫ�����񲻹��أ�")
	end
end;


function deal_brokenequip()
	if (ST_CheckLockState() == 1) then
		Say("�������ˣ�Ҫ����<color=red><�𻵵�װ��><color>�����Ƚ��������䡣��Ĵ����䴦��<color=red>������<color>״̬�����Ƚ�����", 0)
		return
	end
	Say("�������ˣ�����<color=red><�𻵵�װ��><color>������ô�����أ�", 2, "�������޸���ʯ������ԭ/restore_brokenequip", "�Ҳ�Ҫ�ˣ����㽫�����հ�/throw_brokenequip")	
end

function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("�������ˣ�һ��ֻ�ܴ���һ��<color=red><�𻵵�װ��><color>Ŷ", 2, "ԭ���ǷŴ��ˣ������ط�һ��/"..szDealFunc, "���ټ�鿴��/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	if (itemgenre ~= 7) then -- �����𻵵�װ��
		Say("�������ˣ���Ž����Ĳ���<color=red><�𻵵�װ��><color>������ϸ���һ��", 2, "ԭ���ǷŴ��ˣ������ط�һ��/"..szDealFunc, "���ټ�鿴��/no")
		return	0	
	end
	
	return nItemIdx
end

------------------------------------
-- ���𻵵�װ��������
function throw_brokenequip()
	GiveItemUI( "<�𻵵�װ��>���ս���", "�뽫�뱻���յ�<�𻵵�װ��>�ŵ���������Ŀո��", "on_throw_be", "no" );
end

function on_throw_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "throw_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	Say("�������ˣ�<color=red><�𻵵�װ��>"..szItemName.."<color>һ�������գ�������ʧ����ȷ��Ҫ����������", 2, "��ȷ����Ҫ�ˣ�����հ�/#throw_be_sure("..nItemIdx..")", "���ٿ��ǿ���/no")
end

function throw_be_sure(nItemIdx)
	local szItemName = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
	Msg2Player("<�𻵵�װ��>"..szItemName.." �ѱ�����");
	writeChapManLog("[Remove]: RestoreBrokenEquip Remove: "..szItemName);
end
------------------------------------

------------------------------------
-- ���𻵵�װ�����ָ�
function restore_brokenequip()
	GiveItemUI( "<�𻵵�װ��>��ԭ����", "�뽫<�𻵵�װ��>��������Ŀո�������޸���ʯ������ͨװ����1������ɫװ����2�����ƽ�װ����5�����ر�ע�⣺���и�ԭ֮ǰ�����鱳���Ƿ����㹻�Ŀռ䡣", "on_restore_be", "no" );	
end

function on_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "restore_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)
	local nCoinCount = CalcEquiproomItemCount(6,1,2163,1)
	local nNeedCoin = 0;

	if (nQuality == 0) then
		nNeedCoin = 1;
	elseif (nQuality == 1) then -- �ƽ�װ��
		nNeedCoin = 5;
	elseif (nQuality == 2) then -- ��ɫװ��
		nNeedCoin = 2;
	elseif (nQuality == 4) then -- �׽�װ��
		nNeedCoin = 10;
	end
	
	if (nNeedCoin <= 0) then
		Say("�������ˣ������ʲôװ������������ʶ������ͷ���ϵ��", 1, "Ŷ/no")
		writeChapManLog("[Error]: RestoreBrokenEquip Fail. ItemQuality:"..nQuality);
		return
	end
	
	if (nCoinCount < nNeedCoin) then
		Say("�������ˣ�Ҫ��ԭ<color=red><�𻵵�װ��>"..szItemName.."<color>����Ҫ"..nNeedCoin.."���޸���ʯ��������޸���ʯ����������ȥȡһЩ��", 1, "���ף�����ȥȡ�޸���ʯ��/no")
		return
	end
	
	if (ConsumeEquiproomItem(nNeedCoin, 6, 1, 2163, -1) == 1) then
		if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
			SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) -- �;öȻָ�Ϊ����;ö�
			Msg2Player("����"..nNeedCoin.."���޸���ʯ��<�𻵵�װ��>"..szItemName.." ��ԭ�ɹ������鱳��");
			writeChapManGoldLog("[Succeed]: RestoreBrokenEquip Ok: "..szItemName, 0, 0, nNeedCoin, 0)
			-- Fix ch�c n�ng s�a �� - Created by AnhHH - 20110704
			KickOutSelf()
		else
			Msg2Player("<�𻵵�װ��>"..szItemName.." ��ԭʧ�ܣ�����ͷ���ϵ");
			Say("�������ˣ�<�𻵵�װ��>"..szItemName.." ��ԭʧ�ܣ�����ͷ���ϵ��", 1, "�õ�/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: "..szItemName, 0, 0, nNeedCoin, 0)
		end
	end
end
------------------------------------

function no()
end
