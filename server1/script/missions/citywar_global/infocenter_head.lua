IncludeLib("LEAGUE")
IncludeLib("TONG")
Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\citywar_function.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\citywar_global\\ladder.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

LGTSK_QINGTONGDING_COUNT = 1;	--������Ͷ�� ��ս������
LGTSK_CITYWAR_SIGNCOUNT = 2;	--��ǰ��Ͷ�Ĵ���

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
nCityWar_Item_ID_G = 6		--����ս����G ID
nCityWar_Item_ID_D = 1	--����ս����D ID
nCityWar_Item_ID_P = 1499		--����ս����P ID
TIAOZHANLING_TASK_DATE = 1839 --��ս���¼��ȡʱ��,1.ʱ��(��%y),2.ʱ��(��)��3.ʱ��(��),4.��ȡ����
TIAOZHANLING_TASK_COUNT = 1840 --��ս��ɴ���
	
function OnCancel()
end;

function PreEnterGame()
	--���������ڰ�����ڽ�����̨��,���Զ�����ó���
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;

	--����,������Լ�ѡ�������һ��
	EnterGame();
end;

function EnterGame()
	ExtraArenaInfo = {"<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) ", "<#> (�յ�) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("���������ս��̨Ԥѡ����??", 9, "<#> ��̨1"..ExtraArenaInfo[1].."/EnterBattle", "<#>��̨2"..ExtraArenaInfo[2].."/EnterBattle", "<#>��̨3"..ExtraArenaInfo[3].."/EnterBattle", "<#>��̨4"..ExtraArenaInfo[4].."/EnterBattle", "<#>��̨5"..ExtraArenaInfo[5].."/EnterBattle", "<#>��̨6"..ExtraArenaInfo[6].."/EnterBattle", "<#>��̨7"..ExtraArenaInfo[7].."/EnterBattle", "<#>��̨8"..ExtraArenaInfo[8].."/EnterBattle","��ȥ��/OnCancel");
end;

function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	--���÷��ص�
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);

	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;


-- function main()
	--
--	ArenaMain();
-- end

--����ָ��������̨�� [wxb 2004-3-31](����2006-11-22)
function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "������Ͷ��Ľ��:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >��, ��̨������δ��ʼ", 0);
	end;
end;

--����Ψһ�����ڱ����׶ε���̨�� [wxb 2004-3-31](����2006-11-22)
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "������Ͷ��Ľ��:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >��, ��̨������δ��ʼ", 0);
	end;
end;

--�������Ͷ�������� [wxb 2004-3-31](����2006-11-22)
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);
end;

--��ѯ���쾺Ͷ��ս������
function citywar_CheckVotes()
	local nCityId = getSigningUpCity(1);
	local tbVotes = citywar_tbLadder:GetInfo()
	local szMsg = format("<dec><npc>�����ǰ��μӾ�Ͷ��ս��<%s>: <enter>%s%s%s<enter>", GetCityAreaName(nCityId), strfill_center("STT",4, " "), strfill_center("���", 20, " "), strfill_center("����", 20, " "))
	local res = {}
	for i = 1, getn(tbVotes) do
		tinsert(res, strfill_center(i, 4, " "))
		tinsert(res, strfill_center(tbVotes[i].szName, 20, " "))
		tinsert(res, strfill_center(tbVotes[i].nValue, 20, " "))
		tinsert(res, "<enter>")
	end
	PushString(szMsg)
	for i = 1, getn(res) do
		AppendString(res[i])
	end
	szMsg = PopString()
	TaskSayList(szMsg, "лл!��������./OnCancel")
end
--���
function ArenaMain()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Say(format("���ڹ���ռ��<%s>���ڱ���, ��Ҫ�Ǽ���?",GetCityAreaName(nCityId)), 7, "��������ս/SignUpCityWar", "���뿴������ս�ı������/ViewCityWarTong","���뿴�������ս�������/ViewTiaoZhanLing","�˽⹥��ս���/GameInfo", "����ռ������/TokenCard", "���򹥳�ս�����þ�/AskDeal", "ʲô������Ҫ/OnCancel");
	else
		Say("�������鹥��ս�ĵط�������ʲô����?",
			7,
			"����������/GiveTiaoZhanLing",
			"����ս��Ͷ�����/citywar_CheckVotes" ,
			"���뿴�������ս�������/ViewTiaoZhanLing",
			"�˽⹥��ս���/GameInfo",
			"����ռ������/TokenCard",
			"���򹥳�ս�����þ�/AskDeal",
			"ʲô������Ҫ/Cancel");
	end;
end;

--�鿴�Ѿ������μӹ���ս�İ��
function ViewCityWarTong()
	local caption = nil
	local nCityId = getSigningUpCity(1);
	local nlgID = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId)) 
	--LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId),
	local nlgcount = LG_GetMemberCount(nlgID)
	if nlgcount == 0 then
		caption = "<dec>����û�а�ᱨ������."	
	else
		caption = "<dec>��������ս�İ��: \n"
		PushString(caption)
		for nindex=0,nlgcount do
			szTongName = LG_GetMemberInfo(nlgID,nindex)
			AppendString("<color=yellow>")
			AppendString(szTongName)
			AppendString("<color>\t")
		end
		caption = PopString()
	end
	local option = {"����/ArenaMain", "�뿪/OnCancel"}
	TaskSay(caption, option)
end

--������ս��
function GiveTiaoZhanLing()
	if checkBangHuiLimit() == 0 then
			Say("������˼! �㻹û�м����κΰ��ɣ�",0);
			return 0;
	end
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCount >= 300) then
			Say("ÿ������ύ300�����ơ��������Ѿ��ύ��300�����ƣ����������",0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end

	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	local szTongName, nTongID = GetTongName();
	local nsum = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nsum >= 2000000000 then   --���޴�20���������ύ
		Say("�����������Ѵ����ޡ����ʱ�������԰�.",0)
		return 0;
	end
	--**�ύ��ս��
	GiveItemUI("�ύ��ս��", "��ս����Զһ� 20����, ���������������ս.", "sure_GiveTiaoZhanLing", "OnCancel");
end

function sure_GiveTiaoZhanLing(nCount)
	if nCount <= 0 then
		Say("���ϧ, �㻹û�н���ս��Ʒ����",2,"����Ʒ/GiveTiaoZhanLing","����һ��/OnCancel");
		return 0;
	end
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= nCityWar_Item_ID_G or d ~= nCityWar_Item_ID_D or p ~= nCityWar_Item_ID_P) then
			Say("�Ҳ���Ҫ���, ֻ�������<color=yellow>��ս��<color>�Ϳ�����.", 2,"����Ʒ/GiveTiaoZhanLing","����һ��/OnCancel");
			return 0;
		end;
	end;
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCountall = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCountall+nCount > 300) then
			Say(format("���ź�, �������Ѿ��Ͻ� %d��ս��, ֻ�����Ͻ� %d ���ƾͿ�����.",nCountall,300-nCountall),0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end
	local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local szplayName = GetName()
	--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName);
	--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
	--local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE, szTongName, szplayName, LGTSK_QINGTONGDING_COUNT);
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	--ConsumeEquiproomItem(nCount, nCityWar_Item_ID_G, nCityWar_Item_ID_D, nCityWar_Item_ID_P, -1);
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;
	SetTask(TIAOZHANLING_TASK_COUNT,nCountall+nCount);
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "");
	
	
	--print(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "")
	--���Ӿ���,�ύ1������20����
	nAddExp = nCount * 200000
	AddOwnExp(nAddExp)
	Msg2Player(format("�����Ͻ� %d ��ս��, �õ� %d ����",nCount,nAddExp))
	WriteLog(format("[����ս_����ս��]Date:%s Account:%s Name:%s Tong:%s Count:%d Exp:%d",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szTongName,nCount,nAddExp))
end;

--��ѯ��ս��
function ViewTiaoZhanLing()
		local szTongName, nTongID = GetTongName();
		if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then
			Say("���ϧ, ֻ�а����ͳ��ϲſ��Կ���ս���������Ϣ.", 0);
			return 0
		end
		--local szlgname = GetTongName();
		--****�ж��Ƿ񴴽��˸�����
		checkCreatLG(szTongName);
	
		--**�ж��Ƿ�����˸�����
		checkJoinLG(szTongName);
		--local nCityId = getSigningUpCity(1);
		--local szTongName, nTongID = GetTongName();
		--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE, szTongName);
		--local szplayName = GetName()
		--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
		--Msg2Player(nlid)
		--local nCurCount = LG_GetMemberTask(nlid, LGTSK_TIAOZHANLING_COUNT)
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		
		Say(format("������Ͻ���<color=yellow>%d<color>��ս��.",nCurCount),0)
end

--�������ƵĴ��� start************************************************
function TokenCard()
	Say("��ս����Ҫ������ȥ֧Ԯ��ṥ�سǵ���! ����һ����ʿ��Ŀ����ʲô?", 4, "��ռ������/BuyCard", "������/CheckCard", "�˻�����/ReturnCard", "����ʲô/OnCancel");
end;

function BuyCard()
	if (GetName() == GetTongMaster()) then
		TongName, result = GetTong()
		for i = 1, 7 do
			Tong1, Tong2 = GetCityWarBothSides(i);
			if (Tong1 == TongName) then
				SetTaskTemp(15, CardTab[i * 2 - 1]);
				str_format = format("ԭ����������ս�� %s����, �����������������������ƣ���������б����������5���Ч����ÿ�������ۼ� %s��.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "��һ��/DealBuyCard", "��ʱ����Ҫ/OnCancel");
				return
			elseif (Tong2 == TongName) then
				SetTaskTemp(15, CardTab[i * 2]);
				str_format = format("ԭ�������� %s�ǵ�̫��, ���������س����ƣ���������б����������5���Ч����ÿ�������ۼ� %s��.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "��һ��/DealBuyCard", "��ʱ����Ҫ/OnCancel");
				return
			end;
		end;
		Say("��͹��سǵİ���û�й�ϵ������ʹ��ռ������!", 0);
	else
		Say("ֻ�а���������ռ������", 0);
	end;
end;

function DealBuyCard(CardID)
	AskClientForNumber("PayForCard", 1, 30, "��Ҫ����?");
end;

function PayForCard(count)
	CardItemID = GetTaskTemp(15);
	if (CardItemID > 0 and count > 0) then
		if (Pay(count * CardPrice) ~= 0) then
			for i = 1,count do
				AddEventItem(CardItemID);
			end;
			Say("�����Ʊ��棡���������ս����ͬ�˵ļ�֤����ע�����Ƶ�ʱ�䣬ֻ��5���Ч������������˾Ͳ���ʹ�ã����Ե����˻����ûط���", 0);
		end;
	end;
end;

function CheckCard()
	count = 0;
	CardItemID = 0;
	for i=1,14 do
		newcount = count + GetItemCountEx(CardTab[i])
		if (newcount > count) then
			CardItemID = CardTab[i];
			count = newcount;
		end;
	end;
	if (count == 0) then
		Say("������û���κ�����!", 0);
	elseif (count > 1) then
		Say("�����̫���ռ�����ƣ���֪��Ҫ��֤�Ŀ飡��ֻ��һ�����ƾͺ�!", 0);
	elseif (CardItemID ~= 0) then
		life = GetItemLife(CardItemID);
		if (life < 0) then
			Say("������Ƶ������......", 0);
		elseif (life < 7200) then
			Say(format("��Щ�������Ƶ�����Ҫ�� %s ��ǰ����, ����������Ч��.",floor(life/1440)), 0)
		else
			Say(format("��Щ�������Ƶ�����Ҫ�� %s ��ǰ����, �����Ѿ�������, û��ʹ��Ч��.",floor(life/1440)), 0);
		end;
	end;
end;

function ReturnCard()
	count = 0;
	for i=1,14 do
		count = count + GetItemCountEx(CardTab[i]);
	end;
	if (count <= 0) then
		Say("������û���κ�����!", 0);
	else
		str_format = format("�������ƿ����� %s������, ��ͬ���˻���?",count*ReturnCardPrice);
		Say(str_format, 2, "�����˻�/DealReturnCard", "��, ��ֻ������/OnCancel");
	end;
end;

function DealReturnCard()
	money = 0;
	for i=1,14 do
		count = GetItemCountEx(CardTab[i]);
		if (count > 0) then
			money = money + count * ReturnCardPrice;
			for j=1,count do DelItemEx(CardTab[i]) end;
		end;
	end;
	Earn(money);
end;
--�������ƵĴ��� end**************************************************

--AskDeal����ս�������� ת��citywar_global\\citywar_function.lua

--�˽⹥��ս��� start************************************************
function GameInfo()
Say("��Ҫ�˽��ĸ�����?", 9, GetCityAreaName(1).."/CityInfo", GetCityAreaName(2).."/CityInfo", GetCityAreaName(3).."/CityInfo", GetCityAreaName(4).."/CityInfo", GetCityAreaName(5).."/CityInfo", GetCityAreaName(6).."/CityInfo", GetCityAreaName(7).."/CityInfo", "Tr?v?ArenaMain", "����Ҫ/OnCancel");
end;

--"���̰���/ArenaInfo", 
--"������/AllArenaInfo", 
function CityInfo(nSel)
	local nCityId =  nSel + 1;
	SetTaskTemp(245, nCityId);
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(format("��Ҫ�˽⹥��ս %s��ʲô��Ϣ?",GetCityAreaName(nCityId)), 4, 
		"�������/RegisterInfo", 
		"����ս��/CityWarInfo", 
		"����/GameInfo", 
		"����Ҫ/OnCancel");
end;

function RegisterInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	
	local nHour = tonumber(GetLocalDate("%H"));
	if (nHour<18 or nHour>=19) then
		Say("���ڲ��ǹ���ս�ı���ʱ��.", 2, "����/GameInfo", "����Ҫ/OnCancel");
		return 0;
	end;
	if (nCityId ~= getSigningUpCity(1) or getSignUpState(nCityId) ~= 1) then
		Say(format("���ڹ���ս <%s> ���ڱ����׶�.",GetCityAreaName(nCityId)), 2, "����/GameInfo", "����Ҫ/OnCancel");
		return 0;
	end;
	
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<����>"
	if (szElector == "" or szElector == nil) then
		szElector = "<��ʱ��>";
	end;
Say(format("����ս<%s>����׼������������������е�һ��: %s<color=red><enter>����а������������͵�һ��ͬ������ϵͳ���ѡ������Ĺ��ǰ�.<color>",GetCityAreaName(nCityId),szElector), 2, "����/GameInfo", "����Ҫ/OnCancel");
end;


function getCityWarElector(szLeagueName)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)

	if (leagueObj == 0) then
		return 
	end;
	local nMem = LG_GetMemberCount(leagueObj);
	if (nMem < 1) then
		return
	end;
	local szMem = "";
	local tbMem = {};
	for i = 0, nMem - 1 do
		szMem = LG_GetMemberInfo(leagueObj, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	--local szMem = LG_GetMemberInfo(leagueObj, 0)
	return tbMem[random(getn(tbMem))][1];
	--return LG_GetMemberInfo(leagueObj, 0)
end;

--���̰���-(����2006-11-22)
function ArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(GetArenaSchedule(nCityId), 0);
end;

function AllArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	--Say(GetArenaInfoByCity(nCityId), 0);
end;

function CityWarInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	local str_format = format("����ս <%s> ����: ",GetCityAreaName(nCityId));
	local str1, str2 = GetCityWarBothSides(nCityId);
	if (str1 ~= "" and str2 ~= "" ) then
		if (nCityId == getSigningUpCity(2)) then
			str_format = format("����ս <%s> ����: ",GetCityAreaName(nCityId));
			if (HaveBeginWar(nCityId) == 1) then 
				str_format = format("���� <%s> ���ڹ���ս�׶�: ",GetCityAreaName(nCityId));
			end;
		end;
		str_format = format("�ط�%s��%s, ������%s!",str_format,str2,str1);
		Say(str_format , 2, "����/GameInfo", "����Ҫ/OnCancel");
	else
		Say(format("���� %s ��û���빥��ս�׶�!",GetCityAreaName(nCityId)) , 2, "����/GameInfo", "����Ҫ/OnCancel");
	end;
end;


--�˽⹥��ս��� end**************************************************

--��ȡ�������� start**************************************************
	function checkIsTakeQingtongDing(szTongName, nTongID, nCityId)
		if (nTongID == 0 or GetTongMaster()~= GetName()) then
			Say("ֻ�б������ǰ��İ����������Ʊ�����ʧ�ܵİ������ſ���������.", 0);
			return 0;
		end;
		if (nCityId < 1 or nCityId > 7) then
			return 0;
		end;
		
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour < 19) then
			Say("��ȡ���������ʱ���Ѿ�������, ÿ����19h00��24h00���ʱ���У���������ʧ�ܵİ����Ե�����������ȡ��ս��.", 0)
			return 0;
		end;
		
		if (getSignUpState(nCityId) == 1) then
			Say(format("�����μ� %s��������������ƻ�û�н��������Լ����μ�.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityWarBothSides(nCityId);
		if (szChallenger == szTongName) then
			Say(format("����ѳ�Ϊ���칥�� %s�İ��,���������ѽ�����̫����.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityOwner(nCityId);
		if (szChallenger == szTongName) then
			Say(format("���� %s�ǵ�̫��, ��Ӧ���ٽ��ܹ���������.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
		if (FALSE(nlid)) then
			Say("��û�б����μ�����Ĺ���ս������û���������.", 0);
			return 0;
		end;
		return 1;
	end;
	
	function getSignUpState(nCityId)
		return LG_GetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), 1);
	end;
	
function TakeQingtongDing()
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) ~= 1) then
		return 0
	end;
	local ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	if (ncount < 1) then
		Say("���������������Ѿ�����������.", 0);
	else
		Say(format("����%s��ս��, ������ǰ����������.",ncount), 3, "��������/#sure_takeQingtongDing("..ncount..")", "����/ArenaMain", "һ�»���/OnCancel");
	end;
end;

function sure_takeQingtongDing(ncount)
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) == 1) then
		local nFree = CalcFreeItemCellCount();
		if (nFree > 6) then
			local szMsg = format("����<color=yellow>%s<color>�����ս��.",ncount);
			if (nFree < ncount) then
				szMsg = format("����<color=yellow>%s<color>��ս��, ��Ϊ�����ռ䲻��, ���˻���֮ǰ�� %s��. ����<color=yellow>%s<color>û����ȡ, ����24h00 ֮ǰ��ȡ!",ncount,nFree,(ncount - nFree));
				ncount = nFree;
			end;
			for i =1, ncount do
				AddItem(nCityWar_Item_ID_G,nCityWar_Item_ID_D,nCityWar_Item_ID_P,1,1,1);--qingtongding
			end;
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, -nFree);
			WriteLog(format("[���ṥ����]%s Name:%s Account:%s Tong:%s ���� %s ��ȡ��ս�� %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),ncount));
			Say(szMsg, 0);
		else
			Say("�����ռ䲻��. ע��Ҫ��24h00֮ǰ�����������, ��������Ͳ�������ȡ��.", 0);
		end;
	end;
end;

--��ȡ�������� end****************************************************

--��������ս start****************************************************
function SignUpCityWar()
	local nCityId = getSigningUpCity(1);
	
	local szTongName, nTongID = GetTongName();
	
	if (checkSignUpCityWar(szTongName, nTongID, nCityId) ~= 1) then
		return 0;
	end;
	
	local szMsg = format("<dec>���������� %s�Ǳ���.",GetCityAreaName(nCityId));
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<����>"
	
	if (szElector == "" or szElector == nil) then
		szElector = "<��ʱ��>";
	end;

	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	if (FALSE(nlid)) then
		szMsg = szMsg.."ֻҪ��'��ս��' �Ϳ��Բμ�����. �������: ��û��ռ�ǵ�18�����ϰ�����ʹ��'��ս��'�μӾ���. ����ʱ����ÿ��18h00��19h00. 19h00֮ǰ, �õ���ս�����İ����Ȩ�μ�����μӹ���ս.<color=red><enter>����а��������������е�һ�Ļ�ϵͳ�������ȡһ����������Ĺ���.<color><enter>����������һ�İ���ǣ�"..szElector
	else
		
		local nCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
		
		--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT)
		szMsg = format("%s�������: ��û��ռ�ǵ�18�����ϰ�����ʹ��'��ս��'�μӾ���. ����ʱ����ÿ��18h00��19h00. 19h00֮ǰ, �õ���ս�����İ����Ȩ�μ�����μӹ���ս.<color=red><enter>����а��������������е�һ�Ļ�ϵͳ�������ȡһ����������Ĺ���.<color><enter>����������һ�İ���ǣ�%s<enter>������� %s����ս��������%s",szMsg,szElector,szTongName,nCount)
	end;
	TaskSayList(szMsg, "���뾺������/want_signupcitywar", "����/ArenaMain", "����һ��/OnCancel");
end;

function want_signupcitywar()
	--local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCurCount <= 0 then
		Say("���û����ս��, �����Ͻ�, ���ռ�����ս���Ժ���������.",0)
		return 0
	end
	if nCurCount > 1000000 then
		nCurCount = 1000000
	end
	AskClientForNumber("sure_signupcitywar", 0,nCurCount,"�Ͻ���ս��")
	--if (FALSE(nlid)) then
		--if (GetCash() >= 10000000) then
			--GiveItemUI("����ս����", "�뽫����ս�������ս��Ž�ȥ�ɡ�", "sure_signupcitywar", "OnCancel");
		--else
			--Say("��һ�α�������ս��Ҫ����<color=yellow>1000W��<color>���ӣ�������û�д���ô��Ǯ������׼���ñ����������ɡ�", 0);
		--end;
	--else
		--local nNum = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName,LGTSK_CITYWAR_SIGNCOUNT);
		--if (nNum >= 3) then
			--Say("���ľ�Ͷ�����Ѿ��ﵽ<color=yellow>3��<color>�������ڲ��ܼ���Ͷע�������ȴ���Ͷ����Ĺ�����", 0);
		--else
			--GiveItemUI("����ս����", "ÿ����ս����Ի�ȡ5��㾭�飬��ս�������������ṥ��ս��", "sure_signupcitywar", "OnCancel");
		--end;
	--end;
end;

function sure_signupcitywar(nCount)
	--Msg2Player(nCount)
	
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if not (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Talk(1, "", "���ڲ��ǹ���ս�ı���ʱ��.")
		return 1
	end
	
	
	
	
	local szTongName, nTongID = GetTongName();
	local nTongCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCount > nTongCurCount or nCount > 1000000 then
		Say("��ս���, �����Ͻ�,������ռ�֮������.",0)
		return 1
	end
	local nCityId = getSigningUpCity(1);
	local nlg = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	if (FALSE(nlid)) then
			local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
			--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
			LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
			LG_AddMemberToObj(nlg, nMemberID);
			local ret = LGM_ApplyAddMember(nMemberID, "", "")
			LGM_FreeMemberObj(nMemberID)
	end;

	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	local nCurCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount, "", "");
	--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount)
	citywar_tbLadder:AddOneInGameServer(nTongID, cityid_to_lgname(nCityId), szTongName, nCount)
	
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, -nCount, "", "");
	
	WriteLog(format("[���ṥ����]%s Name:%s Account:%s TongName:%s ���� %s ���ṥ������: %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),(nCount + nCurCount)));
	
	local szFirstTong = checkFirstSignUpChallenger(cityid_to_lgname(nCityId), szTongName, nCount + nCurCount);
	if (szFirstTong == szTongName) then
		Say(format(" %s�����ս���Ƶ����������ǣ�<color=yellow>%s<color>��, ���е�һ, ������ˣ�����Ҫ��ע����仯.",szTongName,(nCount + nCurCount)), 0);
	else
		Say(format(" %s�����ս���Ƶ����������ǣ�<color=yellow>%s<color>��. ���е�һ����%s,��������Ŭ��.",szTongName,(nCount + nCurCount),szFirstTong), 0);
	end;
end;

function checkSignUpCityWar(szTongName, nTongID, nCityId)
	local nHour = tonumber(GetLocalDate("%H"));
	if (nTongID == 0 or GetTongMaster() ~= GetName()) then
		Say("�㲻�ǰ�������18h00��19h00,���ʱ�Σ� ��û��ռ�ǵ�18�����ϵİ��������Ա����μӽ���֮��Ĺ���ս.", 0);
	elseif (nHour < 18 or nHour >= 19) then
		Say("���ڲ��ǹ���ս�ı���ʱ��. ÿ��18h00��19h00, ��û��ռ�ǵ�18�����ϵİ����Ե��ⱨ���μӽ���֮��Ĺ���ս.", 0);
	elseif (TONG_GetExpLevel(nTongID) < 18) then
		Say("Ҫ��Ҫ18�����ϵİ��ſ��Ա�������֮��Ĺ���ս.", 0);
	elseif (checkCityOwner(szTongName) ~= 0) then
		Say("���ǳ��������ر�������.", 0);
	elseif (checkCItyChallenger(szTongName) ~= 0) then
			Say(format("��������ս�� %s, ����������������.",GetCityAreaName(checkCItyChallenger(szTongName))), 0);
	elseif (getSignUpState(nCityId) ~= 1) then
		Say("���ڻ�û�п�ʼ�������ǣ����㾫��׼����", 0);
	else
		return 1;
	end;
	return 0;
end;

function checkCityOwner(szTongName)
	for i=1, 7 do
		if (GetCityOwner(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkCItyChallenger(szTongName)
	for i=1, 7 do
		if (GetCityWarBothSides(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkFirstSignUpChallenger(szLeagueName, szTongName, nCurCount)
	local szFirstTong = getCityWarElector(szLeagueName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)
	
	if (FALSE(szFirstTong)) then
		local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
		LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		
		LGM_FreeMemberObj(nMemberID);
		if (ret == 1) then
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szTongName, LGTSK_QINGTONGDING_COUNT, nCurCount);
		end;
		return szTongName;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLeagueName);
	local nCount = LG_GetMemberCount(nlid);
	local szTemTong = szFirstTong;
	for i = 0, nCount - 1 do
		local szMem = LG_GetMemberInfo(nlid, i);
		if (szMem == szFirstTong) then
			local nMemCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
			
			if (nMemCount <= nCurCount) then
				szTemTong = szTongName;
				break
			end;
		end;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
	if (szTemTong ~= szFirstTong) then
		local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
		LGM_SetMemberInfo(nMemberID, szTemTong, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		LGM_FreeMemberObj(nMemberID);
		--LG_ApplyDoScript(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong, "\\script\\event\\citywar.lua", "citywar_removemem", szLeagueName.." "..szFirstTong);
		--LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong);
	end;
	return getCityWarElector(szLeagueName);
end;
--��������ս end******************************************************

