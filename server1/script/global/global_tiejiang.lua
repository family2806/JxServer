

Include("\\script\\global\\recoin_goldenequip.lua")
Include("\\script\\global\\equipenchase_help.lua") 
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\��ɫ���ƽ�װ������.lua")
Include("\\script\\global\\shenmi_chapman.lua");	--��װ������



Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")



--------�̶��Ի� ����--------
function tiejiang_city(...)
	
	local nNpcIndex = GetLastDiagNpc();
	--local szNpcName = GetNpcName(nNpcIndex);
	--if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local szNpcName = "����"
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	local aryParam = arg;
	
	if (getn(aryParam) == 0) then
		tbDailog.szTitleMsg = TIEJIANG_DIALOG
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tbDailog.szTitleMsg = TIEJIANG_DIALOG
			else
				local _,_, szOpt, szFun = strfind(aryParam[i], "([^/]+)/([^/]+)")
				local fn = getglobal(szFun)
				if fn then
					tbDailog:AddOptEntry(szOpt, fn);	
				end
			end;
		end;
	end;
	
	
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg, "<dec>", "")
	
	
	tbDailog:AddOptEntry("����", yes);
	tbDailog:AddOptEntry("����ʯ�̵�", energy_sale);
	tbDailog:AddOptEntry("����", yes);
	
	tbDailog:AddOptEntry("��Ʒ����", onFoundry);
	
	tbDailog:AddOptEntry("��Ʒ��Ƕ", jewel_yes);
	tbDailog:AddOptEntry("����<�𻵵�װ��>", deal_brokenequip);
	tbDailog:AddOptEntry("����������������", education_tiejiang);	
	--tbDailog:AddOptEntry("�������", no, {});
	tbDailog:Show()
end;
--------�̶��Ի� ���ִ�------
function tiejiang_village(...)
	local aryParam = arg;
	local aryDescribe = {
		--szDialog,		--������˵�����ڸ�����������
		"����/yes",
		
		--Change request 04/06/2011, ��ng ch? t�o trang b? b�ch kim - Modified by DinhHQ - 20110605
		--"V�t ph�m ��c/onFoundry",
		
		"��������/tboss",
		"�������/no",
	};
	
	if (getn(aryParam) == 0) then
		tinsert(aryDescribe, 1, TIEJIANG_DIALOG)
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tinsert(aryDescribe, 1, aryParam[i]);
			else
				tinsert(aryDescribe, 2, aryParam[i]);
			end;
		end;
	end;
	CreateTaskSay(aryDescribe);
end;

--------��Ƕ--------
function jewel_yes()
	CreateTaskSay({"<dec><npc>ˮ����Ƕ�漰����ƽ�⡢������ת֮�������������ɲ⣬δ������������ϣ����ɾ�����Ʒ��������ͼ�׺������������ܳɹ��ı�װ���ĵȼ�������ľ�����Ƕ���װ����", "��ʼ��Ƕ/jewel_yes1", "������Ƕ/help", "��������/no"});
end

function jewel_yes1()
	EnchaseItem()
end

-------No--------
function no()
end;

------����ʯ-------
function energy_sale()
	CreateStores();
	AddShop2Stores(174, "�����̵�", 15, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(179, "��̵�", 1, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(93, "��Ե�̵�", 2, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(98, "�ν��̵�", 4, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(146, "�����̵�", 11, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(173, "�����̵�", 13, 100, "fBuyCallBack(%d,%d)");
	OpenStores();
end

function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ������
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- �������
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- �����
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ��¹��
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ������
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ��Գ��
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ������
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ����Կ��
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- �׵���
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
