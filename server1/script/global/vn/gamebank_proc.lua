-- Ǯׯ���� (Խ�ϰ汾)
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ��ͳһ�����ƶ�������Ʊ���˶���
-- Update: Fanghao_Wu(2004-9-04) ����Ԫ���һ�ͭǮ����

-- Update: paul zhang(2005-09-06) ΪԽ�ϰ����޸ģ�ֻʹ����Ԫ����û�н�Ԫ������Ԫ���ɳ�ɰ���(7��)����25Сʱ��
--			ͭǮ��ʱ�����ţ�ͬʱ����һ��ͷ�ļ����ڿ��ƹ��ܵĿ�����ر�
-- Update: paul zhang(2005-12-28) ΪԽ�ϰ����޸ģ�����Խ�Ϸ���ԭ���޸ĳ�ֻʹ�ý�Ԫ����û����Ԫ�������ǽ�Ԫ���������޸�Ϊ�ɳ�ɰ���(7��)����25Сʱ��

-- Edited by peres
-- 2005/12/29 ����һ��Ԫ���� 15 ��ͭǮ�Ĺ���
-- end;

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
--Include("\\script\\global\\yuanbao_head.lua")
--Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
--Include("\\script\\misc\\maskfree\\event.lua")		--��������ȡ
Include("\\script\\event\\vnchristmas2006\\event.lua")	--ʥ���俨�����

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
--		"����ȡͭǮ/get_ingot",
--		"������ͭǮ����Ϸʱ��/pay_ingot",--�� knb ���������
--		"����һ����ж���ͭǮ/show_ingot",
		"���뻻Ԫ����ͭǮ/change_ingot_to_coin",
		"˳��·������/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "���ˣ�������Ҫʲô?";
	else
		talk = "���ˣ�Ů����Ҫʲô?";
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20070114) then
		tinsert(msg, 1, "��ȡ��Ʒ�����/takeMaskFree");
	end;
	
	Say(talk, getn(msg), msg)
end
------------- ��ѯԪ�� --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("�����������﷢���˴�����ʱ����ȡͭǮ������ϵ�����̽��!")
		return
	end
	if (nMoney <= 0) then
		Say("Ǯׯ�ϰ壺�͹�û�д������챦������",1,"֪����/no")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> �͹����ڱ����ܹ�����<color=green>"..nCurVar.."<color> ͭǮ.",1,"����/no")
	end
end

------------- ȡԪ�� -----------------------
function get_ingot()

	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","�Բ���Ǯׯ����ά�ޣ�2���͹�������")
		return
	end

	local nMoney = GetExtPoint(1)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("����������!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "װ������5����λ.");
			return 1
	end
	if (nMoney <= 0) then					-- û����չ����
		Talk(1,"","�Բ��𣬿͹�û���ڱ����ͭǮ!")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> �͹��Ѿ��ڱ����ܹ����� <color=green>"..nCurVar.."<color> ͭǮ����ȡ������?", 2, "����ȡ��20��ͭǮ/get_ingot10", "��ȡ/no")
	end
end

function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- ������~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("���ܳ���!");
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","�������ⷢ���˴�����ʱ����ȡ��ͭǮ������ϵ�����̽��!")
		return
	end
	Say("�͹�ȷ����ȡͭǮ? (ȷ�����벻Ҫ�˳���Ϸ!) ", 2, "ȷ��/get_ingot10ok", "�˳�/no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("Ŀǰ���ڸ���ȡͭǮ����ע�ⲻҪ�˳���Ϸ!")
end;

------------- ����Ԫ�� ---------------------
function pay_ingot()

	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","�Բ���ĿǰǮׯ����װ�ޣ�2���͹�������")
		return
	end

	-- Խ�ϵ���Ԫ����ƷID���½�汾�Ľ�Ԫ����ƷIDһ��
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("Ǯׯ�ϰ壺û���⣡�͹��뻻<color=green>ͭǮ<color>��ʲô��ʽ��?", 3,"������20��ͭǮ����10����/pay_ingot_10a","������20��ͭǮ����20��Сʱ����/pay_ticket_10b","������/no")
	else
		Say("�͹�û�д���ͭǮ",1,"���ˣ������Ǵ���/no")
	end

end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("���ܳ���!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("��ͭǮʧ��!")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."��ȡ10����"..GetAccount().."\t"..GetName().."\t".."��20��ͭǮ����10����ʧ��")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- ��������
		WriteLog(date("%Y%m%d %H%M%S").."\t".."��10����"..GetAccount().."\t"..GetName().."\t".."��20��ͭǮ����10����ɹ�")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 10 DAY CHARGE", 0, -1, 0 );
		Say("Ǯׯ�ϰ�: <color=green>ʹ��20��ͭǮ<color> ���� <color=red>10����<color> �ɹ�����͹��ټ��һ��!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("���ܴ���!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("��ͭǮʧ��!")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����20��Сʱ��"..GetAccount().."\t"..GetName().."\t".."��20��ͭǮ����20��Сʱ��ʧ��")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- ��������
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����20��Сʱ��"..GetAccount().."\t"..GetName().."\t".."��20��ͭǮ����20��Сʱ��ɹ�")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 20 HOURS CHARGE", 0, -1, 0 );
			Say("Ǯׯ�ϰ�: <color=green>Sʹ��20��ͭǮ<color> ����<color=green>20��Сʱ��<color> �ɹ�����͹��ټ��һ��!", 0)
		end
end

------------- �һ�ͭǮ---------------------
function change_ingot_to_coin()	
--do return end
	local nSilverCount = GetItemCountEx(343);		-- Ԫ������

	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","�Բ���Ǯׯ����ά�ޣ�2���͹�������")
		return
	end

	if (nSilverCount <= 0) then					-- û��Ԫ��
		Say( "�͹�û�д���Ԫ��?", 1, "���ˣ������Ǵ���/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "װ������5��λ.");
			return 1
	end

	Say( "Ǯׯ�ϰ壺�͹�ͬ�⻻ȡͭǮ��?", 2, "��Ԫ����"..COIN_CHANGE_COUNT_OF_SILVER.."<#> ͭǮ/change_silver_to_coin", "������/no");

end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- ������~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("���ܴ���!");
		return
	end
	
	if (GetItemCountEx(343) > 0) then		
		DelItemEx(343);		
		AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- ��Ʊ�һ�ΪͭǮ������ͳ��
		
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- Ԫ������
		--if( nSilverCount > 0 ) then
		--	Say( "Ǯׯ�ϰ壺����Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ������ĺ˲顣", 2, "֪����/no", "�ٶһ�һЩͭǮ/change_coin" );
		--else
		Say( "Ǯׯ�ϰ壺�͹ٻ�Ԫ������"..COIN_CHANGE_COUNT_OF_SILVER.."<#> ͭǮ����͹��ټ��һ��!",0);
		--end
	end
end

------------ ����ͭǮ ------------------
function onAboutCoin()
	Talk( 2,"","Ǯׯ�ϰ壺���Դ�Ԫ�������껻��ͭǮ, 1 <color=yellow>Ԫ��<color>����<color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> ͭǮ��Ԫ������ͭǮ�󣬾Ͳ��ܻ�������","ͭǮ���Ե������е��̷����������챦.","�����������һ��ͭǮ�ϣ�������һ��ͭǮ�������棬���Ϊ<color=yellow>100��<color>. ������<color=yellow>Shift<color> �Լ�����������һ��ͭǮ�ϣ������뻻��Ǯ������ȷ������ɡ�!");
end
----------------------------------------
function no()
end
