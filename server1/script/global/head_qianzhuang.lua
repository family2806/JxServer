--------------------------------------
-- Ǯׯ���ܵ�ͷ�ļ�

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����

IncludeForRegionVer("\\script\\global\\", "gamebank_head.lua")

--------------------------------------

QUESTKEY_TICKET = 488;					-- ��Ʊ����ƷID
EXTPOINT_TICKET = 2;					-- ��Ʊ����չ��
EXTPOINT_TICKET_NEW = 6;
QUESTKEY_TICKET_NEW = 962

EXTPOINT_MAXVAL = 32768;	
			-- ��չ������ֵ
---------------------------------------------------------------
--ʹ����Ʊ���ܺ��� ��Ʊ����Ʊ������Ʊ���֣���function ͳһ����
--���������ticket ��Ʊ���� logstr ���������������־��
--����ֵΪ -1�쳣 0��Ʊ���� 1 ��Ʊ�۳��ɹ�
--�����Ʊ�������������Ʊ��

function qz_use_silver( ticket , logstr)
	if (logstr == nil) then
		logstr = "[δ֪]"
	end
	
	if (SYSCFG_GAMEBANK_TICKET_USE == nil) then -- ������~~
		print("use_ticket have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return -1
	end
	
	if (ticket < 1 or ticket == nil) then
		Msg2Player("���ܳ���")
		return -1
	end
	local nCountOld = GetItemCountEx(488);--����Ʊ
	local nCountNew = GetItemCountEx(962);
	if (nCountOld + nCountNew < ticket) then
		return 0;
	end
	
	local nDelCountOld = ticket;
	local nDelCountNew = 0;
	if (nCountOld < ticket) then
		nDelCountOld = nCountOld;
		nDelCountNew = ticket - nCountOld;
	end;
	for i = 1, nDelCountOld do
		DelItemEx(488);
	end
	for i = 1, nDelCountNew do
		DelItemEx(962);
	end
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."��["..GetName().."]������"..ticket.."����Ʊ"..logstr, 0, 0, 0, (-ticket));
	
	if (nDelCountOld > 0) then
		UseSilver(2, 2, nDelCountOld); -- ��Ʊ�һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	end;
	if (nDelCountNew > 0) then
		UseSilver(3, 2, nDelCountNew); -- ��Ʊ�һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	end;
	SaveNow(); -- ��������
	return 1;
end

function buy_hunyuanlinglu()
		local szMsg = 
		{
				"Ǯ��ү������Ӿ��ǽ���һ����Ԫ��¶���ں�100����ʯ��������������������ʱ���Ƹ��õ�װ��������Ϊ��ȡ������Ʒ��ȫ��ԭֻ��һ�ң����޷ֺš�Ҫ��Ҫ������",	--1
				"1ͭǮ�����Ԫ��¶/#buy_addhunyuan_yes(1)",	--2
				"5ͭǮ�����Ԫ��¶/#buy_addhunyuan_yes(5)",	--3
				"10ͭǮ�����Ԫ��¶/#buy_addhunyuan_yes(10)",	--4
				"50ͭǮ�����Ԫ��¶/#buy_addhunyuan_yes(50)",	--5
				"100ͭǮ�����Ԫ��¶/#buy_addhunyuan_yes(100)",	--6
				"��û��Ȥ/no",			--7
		};

			Say(szMsg[1], 6, szMsg[2], szMsg[3], szMsg[4], szMsg[5], szMsg[6], szMsg[7]);
				
end

function buy_addhunyuan_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	if(CalcFreeItemCellCount() < 5) then
		Say("������λ���㣬������Ҫ5���λ", 0);
		return
	end
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","�����ϵ�Ǯ�����ˣ�������Ǯ�����ɡ�")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: ���� %d ͭǮ, �����Ԫ��¶.",nNedCount),-2,0,0,0);
	for i=1,nNedCount do
		AddItem(6,1,2312,1,0,0,0)  ----��Ԫ��¶
	end
	
	UseSilver(1, 2, nNedCount); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	SaveNow(); -- ��������
	  	
	Talk(1,"","�����Ԫ��¶�ɹ�������<color=yellow>����<color>")
	Msg2Player("�����Ԫ��¶�ɹ�����鿴������")
end
