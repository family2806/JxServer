-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - �һ���װ�����ƣ������ȣ�
-- �ļ�������ex_goldequip_lingpai.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- �һ���װ�����ƣ������ȣ�
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>���뻻ʲôװ��?",
		format("���װ��/#take_xp_equip_1(1, %d)", 905),
		format("��¹װ��/#take_xp_equip_1(2, %d)", 1135),
		format("����װ��/#take_xp_equip_1(3, %d)", 1365),
		format("��Գװ��/#take_xp_equip_1(4, %d)", 1595),
		format("��çװ��/#take_xp_equip_1(5, %d)", 1825),
		format("������װ/#take_xp_equip_1(6, %d)", 2055),
---		format("�׻���װ/#take_xp_equip_1(7, %d)", 2285),
---		format("������װ/#take_xp_equip_1(8, %d)", 2515),
		format("�����װ/#take_xp_equip_91(9, %d)", 1),
---		format("����װ/#take_xp_equip_101(10, %d)", 194),
---		format("�׻���װ/#take_xp_equip_111(11, %d)", 422),
		"�Ժ����/no",
	};
	
	CreateTaskSay(aryDescribe);
end

----------------------------�¼������ �� �׻�---------------------------------
function take_xp_equip_91(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "����������Ǵ�������?")
		return
	end
	
	CreateTaskSay({"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:", 
						format("����ȭ/#take_xp_equip_92(%d,%d, 1)", n_g, n_d),
						format("���ֹ�/#take_xp_equip_92(%d,%d, 2)", n_g, n_d),
						format("���ֵ�/#take_xp_equip_92(%d,%d, 3)", n_g, n_d),
						format("������/#take_xp_equip_92(%d,%d, 4)", n_g, n_d),
						format("����ǹ/#take_xp_equip_92(%d,%d, 5)", n_g, n_d),
						format("������/#take_xp_equip_92(%d,%d, 6)", n_g, n_d),
						format("��ü��/#take_xp_equip_92(%d,%d, 7)", n_g, n_d),
						format("��ü��/#take_xp_equip_92(%d,%d, 8)", n_g, n_d),
						format("��ü����/#take_xp_equip_92(%d,%d, 9)", n_g, n_d),
						format("���̵�/#take_xp_equip_92(%d,%d, 10)", n_g, n_d),
						format("������/#take_xp_equip_92(%d,%d, 11)", n_g, n_d),
						format("�嶾��/#take_xp_equip_92(%d,%d, 12)", n_g, n_d),
						format("��һҳ/#take_xp_equip_911(%d,%d)", n_g, n_d),
						"�Ժ���� /no"});
end

function take_xp_equip_911(n_g, n_d)
	CreateTaskSay({"<dec><npc>���뻻�����Ǹ���ϵ��װ��:", 
						format("�嶾��/#take_xp_equip_92(%d,%d, 13)", n_g, n_d),
						format("�嶾����/#take_xp_equip_92(%d,%d, 14)", n_g, n_d),
						format("���ŷɵ�/#take_xp_equip_92(%d,%d, 15)", n_g, n_d),
						format("������/#take_xp_equip_92(%d,%d, 16)", n_g, n_d),
						format("������/#take_xp_equip_92(%d,%d, 17)", n_g, n_d),
						format("��������/#take_xp_equip_92(%d,%d, 18)", n_g, n_d),
						format("ؤ����/#take_xp_equip_92(%d,%d, 19)", n_g, n_d),
						format("ؤ���/#take_xp_equip_92(%d,%d, 20)", n_g, n_d),
						format("����ս/#take_xp_equip_92(%d,%d, 21)", n_g, n_d),
						format("��������/#take_xp_equip_92(%d,%d, 22)", n_g, n_d),
						format("����ħ/#take_xp_equip_92(%d,%d, 23)", n_g, n_d),
						format("��һҳ/#take_xp_equip_912(%d,%d)", n_g, n_d),
						"�Ժ����/no"});
end

function take_xp_equip_912(n_g, n_d)
	CreateTaskSay({"<dec><npc>���뻻�����Ǹ���ϵ��װ��:", 
						format("�䵱��/#take_xp_equip_92(%d,%d, 24)", n_g, n_d),
						format("�䵱��/#take_xp_equip_92(%d,%d, 25)", n_g, n_d),
						format("���ص�/#take_xp_equip_92(%d,%d, 26)", n_g, n_d),
						format("���ؽ�/#take_xp_equip_92(%d,%d, 27)", n_g, n_d),
						format("��������/#take_xp_equip_92(%d,%d, 28)", n_g, n_d),
						format("����/#take_xp_equip_91(%d,%d)", n_g, n_d),
						"�Ժ����/no"});
end

function take_xp_equip_92(n_g, n_d, n_p)
	local n_count = 5;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "�Ժ���� /no");
	CreateTaskSay(aryDescribe);
end

-----------��

function take_xp_equip_101(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "����������Ǵ�������?")
		return
	end
	
	CreateTaskSay({"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:", 
						format("����ͨ��װ��/#take_xp_equip_102(%d,%d, 1)", n_g, n_d),
						"�Ժ���� /no"});
end

function take_xp_equip_102(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "�Ժ���� /no");
	CreateTaskSay(aryDescribe);
end

---------�׵�װ��
function take_xp_equip_111(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "����������Ǵ�������?")
		return
	end
	
	CreateTaskSay({"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:", 
						format("����ͨ��װ��/#take_xp_equip_112(%d,%d, 1)", n_g, n_d),
						format("����ͨ��װ��/#take_xp_equip_112(%d,%d, 2)", n_g, n_d),
						format("Ů�ͨ��װ��/#take_xp_equip_112(%d,%d, 3)", n_g, n_d),
						format("ף��ͨ��װ��/#take_xp_equip_112(%d,%d, 4)", n_g, n_d),
						format("��ũͨ��װ��/#take_xp_equip_112(%d,%d, 5)", n_g, n_d),
						"�Ժ���� /no"});
end

function take_xp_equip_112(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "�Ժ���� /no");
	CreateTaskSay(aryDescribe);
end
--------------------------------------------------------------------------------

function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "����������Ǵ�������?")
		return
	end
	
	CreateTaskSay({"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:", 
						format("����ȭ/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("���ֹ�/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("���ֵ�/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("������/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("����ǹ/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("������/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("��ü��/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("��ü��/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("���̵�/#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("������/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("�嶾��/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("�嶾��/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("��һҳ/#take_xp_equip_11(%d,%d)", n_g, n_d),
						"�Ժ���� /no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>���뻻�����Ǹ���ϵ��װ��:", 
						format("���ŷɵ�/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("������/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("������/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("ؤ����/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("ؤ���/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("����ս/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("����ħ/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("�䵱��/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("�䵱��/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("���ص�/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("���ؽ�/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("��һҳ/#take_xp_equip_1(%d,%d)", n_g, n_d),
						"�Ժ����/no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>�����뻻�����Ǹ���ϵ��װ��:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "�Ժ���� /no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "װ��������λ�������������");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "����������Ǵ������˰� ?")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	Խ�ϰ汾û�д�����
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("���"..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000��1��1�� ����� 1970��1��1�յ�����

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

