FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
MAX_S_COUNT = 100;
MAX_J_COUNT = 100;
TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 60 * 60  * FRAME2TIME; -- ½»Õ½Ê±¼äÎª1Ğ¡Ê±

MS_STATE = 1; --ÈÎÎñÖĞ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖĞ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øĞĞÖĞ£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË

MS_SJTASKID = 20;
MS_J_DEATHCOUNT = 3; --ÈÎÎñÖĞ¼ÇÂ¼½ğÍæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID
MS_S_DEATHCOUNT = 4; --ÈÎÎñÖĞ¼ÇÂ¼ËÎÍæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID

MS_S_SIGHCOUNT  = 5;--ÈÎÎñÖĞËÎ·½¹²±¨ÃûµÄÈËÊı
MS_J_SIGHCOUNT  = 6;--ÈÎÎñÖĞ½ğ·½¹²±¨ÃûµÄÈËÊı
MS_KEY = 7;		--¼ÇÂ¼µ±Ç°µØÍ¼ÏÂÈÎÎñµÄÒ»¸ökey£¬¼´Ò»¸öËæ»úÉú³ÉµÄÊı¶¨

MS_S_NPCDEATH = 8; -- ÈÎÎñÖĞ¼ÇÂ¼ËÎÕ½¶·NpcËÀÍöµÄÊıÁ¿µÄÈÎÎñ±äÁ¿ID
MS_J_NPCDEATH = 9; -- ÈÎÎñÖĞ¼ÇÂ¼½ğÕ½¶·NpcËÀÍöµÄÊıÁ¿µÄÈÎÎñ±äÁ¿ID

MS_NEWSVALUE = 10; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½

MS_S_SHOWKING = 11; --0 means uncondition, 1 means condition but time no come ,2 mean all condition is ok ,and have showed.
MS_J_SHOWKING = 12;
MS_FIRSTSHOW = 13; --1 means Song , 2 means Jing


SJTASKID = 230; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñID
SJTASKVLAUE = 231; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñµÄÖµ,¼ÇÂ¼ËùÊô·½,ËÎÎª1£¬½ğÎª2
SJTASKKEY = 232; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñµÄkeyºÅ
SJKILLNPC = 233; 	--¼ÇÂ¼Íæ¼ÒÉ±NpcÊıÁ¿
SJKILLPK = 234; 	--¼ÇÂ¼Íæ¼ÒPKÍæ¼ÒÊıÁ¿

MS_TOTALPK = 250;	--¼ÇÂ¼Íæ¼Ò´òËÀÆäËüÍæ¼ÒµÄ×Ü´ÎÊı
MS_TOTALKO = 251;	--¼ÇÂ¼Íæ¼ÒÔÚPKÕ½ÒÛÖĞ±»´òËÀµÄ×Ü´ÎÊı

MS_SHOWKINGCOUNT = 100; --Ä³·½NpcÉËÍöÊıÁ¿£¬µ±ÉËÍöÊıÁ¿³¬¹ı¸ÃÖµÊ±£¬ÔòÖ÷½«¿ÉÄÜ³öÏÖ
MS_PKCOUNT	= 50;--Ä³·½Íæ¼ÒÉËÍöÊıÁ¿,µ±ÊıÁ¿³¬¹ı¸ÃÖµ£¬ÔòÖ÷½«¿ÉÄÜ³öÏÖ


GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- ±¨ÃûÊ±¼äÎª°ëĞ¡Ê±
SHOWKINGTIME1 = 3600 * FRAME2TIME / TIMER_1 ;
SHOWKINGTIME2 = 4200 * FRAME2TIME / TIMER_1;

MS_SIGN_MONEY = 3000; --±¨Ãû·Ñ


sj_aryItems = {
	{ "ÏÉ²İÂ¶", {6,1,71,1,0,0}, 20 },
	{ "¼ÓÅÜÍè", {6,0,2,1,0,0}, 5 },
	{ "¸ßÖĞÍè", {6,0,5,1,0,0}, 5 },
	{ "¸ßÉÁÍè", {6,0,4,1,0,0}, 5 },
	{ "³¤ÃüÍè", {6,0,1,1,0,0}, 5 },
	{ "·ÉËÙÍè", {6,0,6,1,0,0}, 5 },
	{ "¶¾·ÀÍè", {6,0,10,1,0,0}, 5 },
	{ "±ù·ÀÍè", {6,0,7,1,0,0}, 5 },
	{ "»ğ·ÀÍè", {6,0,9,1,0,0}, 5 },
	{ "À×·ÀÍè", {6,0,8,1,0,0}, 5 },
	{ "´óÁ¦Íè", {6,0,3,1,0,0}, 30 },
	{ "ÑÌ»¨", {6,0,11,1,0,0}, 1 },
	{ "Ãµ¹å»¨Óê", {6,0,20,1,0,0}, 2 },
	{ "ĞÄĞÄÏàÓ³·û", {6,1,18,1,0,0}, 5 },
		}
-------------------------------------------------------------------------
function GameOver()
idx = 0;

for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1,idx, 0);
	if (idx == 0) then 
 		break
 	end;
	if ( GetMSIdxGroup(1, idx) == 2) then --jing
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(100,45)
--		SetFightState(1)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬£¨by Dan_Deng£©
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 1585,3215);
	else				--song
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0)
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(78,33)
--		SetFightState(1)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬£¨by Dan_Deng£©
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 886,4499);
	end;
end;


end;
-------------------------------------------------------------------------
-------------Õ½¶·È¡ÏûµÄ»°£¬¹é»¹Íæ¼ÒµÄ±¨Ãû·Ñ------------------------------
function GiveBackBonus()
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, 0);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(MS_SIGN_MONEY);
 	end;
end;
end
-------------------------------------------------------------------------
function WinBonus(WinGroup, LoserGroup)
resultstr = "";
LCount = GetMissionV(LoserGroup + 4);
WCount = GetMissionV(WinGroup + 4);

TotalMoney = (LCount + WCount) * MS_SIGN_MONEY * 0.9 
Winner = GetMSPlayerCount(1, WinGroup);
if (Winner > 0) then
	Bonus = TotalMoney / Winner;
else 
	Bonus = MS_SIGN_MONEY;
end;

MaxNpc_idx = 0;
MaxPK_idx = 0;
MaxNpc_c = 0;
MaxPK_c = 0;
sj_itemcount = getn(sj_aryItems)
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, WinGroup);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(Bonus + MS_SIGN_MONEY);
   		AddLeadExp(500);				-- By Dan(Í³ÂÊ¾­Ñé´Ó1000¸ÄÎª500)
   		AddRepute(3);					-- By Dan(ÉùÍû´Ó20¸ÄÎª3)
   		Msg2Player("Xin chóc mõng phe b¹n ®· giµnh chiÕn th¾ng! Danh väng t¨ng 3 ®iÓm, Tµi l·nh ®¹o t¨ng 500 ®iÓm!")


		randitem = random(1, sj_itemcount);
		if (randitem > 0) then
			local szItemName = sj_aryItems[randitem][1];
			local arySelItemID =  sj_aryItems[randitem][2];
			AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
			Msg2Player("Xin chóc mõng b¹n nhËn ®­îc <#>"..szItemName);
		end;
		
   		
   		if (GetTask(SJKILLNPC) > MaxNpc_c) then 
   			MaxNpc_idx = pidx
			MaxNpc_c = GetTask(SJKILLNPC)
   		end;
   		
   		if (GetTask(SJKILLPK) > MaxPK_c) then 
   			MaxPK_idx = pidx;
			MaxPK_c = GetTask(SJKILLPK)
   		end;
 	end;
end;


-----------É±Npc×î¶àµÄÈËµÃµ½Ò»¼ş×°±¸
if (MaxNpc_idx > 0) then 
	PlayerIndex = MaxNpc_idx ;
	sex = GetSex();
	if (sex == 0) then --ÄĞ×°
	--¸øÒÂ·ş ,²ÎÊıÎª0,2,0-13(0,6 ÄĞ, 7,13Å®),8-9,0-4,70-99
		p1 = random(0,6);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> Tæng ®iÓm tiªu diÖt Npc phe ®Şch cao nhÊt thuéc vÒ "..GetName().."<#>, b¹n tiªu diÖt "..MaxNpc_c.."<#> kÎ ®Şch!";
	else
	--¸øÒÂ·ş ,²ÎÊıÎª0,2,0-13(0,6 ÄĞ, 7,13Å®),8-9,0-4,70-99
		p1 = random(7,13);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> Tæng ®iÓm tiªu diÖt Npc phe ®Şch cao nhÊt thuéc vÒ "..GetName().."<#>, b¹n tiªu diÖt "..MaxNpc_c.."<#> kÎ ®Şch!";
	end;
	AddRepute(30)
	Msg2Player("B¹n nhËn ®­îc 30 ®iÓm danh véng vµ mét bé trang bŞ!");
end;

-----------PKÈËÊı×î¶àµÄÈËµÃµ½Ò»°ÑÎäÆ÷
if (MaxPK_idx > 0) then
	PlayerIndex = MaxPK_idx ;
	--p1 = random(0,5);
	--p2 = random(8,9);
	--p3 = random(0,4);
	--p4 = random(70,99);
	--AddItem(0,0,p1,p2,p3,p4,7,7,7,0,0,0);
	--Msg2Player("Äã»ñµÃÁËÒ»°ÑÎäÆ÷!");
	AddRepute(15)
	AddLeadExp(5000);				-- By Dan(Í³ÂÊ¾­Ñé´Ó1000¸ÄÎª500)
	Msg2Player("Xin chóc mõng, trong trËn nµy b¹n lµ ng­êi cã chØ sè PK cao nhÊt! NhËn ®­îc 15 ®iÓm danh väng, tµi l·nh ®¹o t¨ng 5000 ®iÓm!")
	resultstr = resultstr .."<#>Binh sÜ cã chØ sè PK cao nhÊt lµ "..GetName().."<#>,sè l­îng :"..MaxPK_c;
end;

return resultstr;

end;

-------------------------------------------------------------------------
function SJ_JoinJ()
LeaveTeam()
AddMSPlayer(1,2);
SetCurCamp(2);
SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);
SetPos(47584/32, 106880/32);
SetPunish(0);
--SetRevPos(100,45)
SetRevPos(44,50)
SetTempRevPos(44, 1573*32 ,3874 * 32);
SetCreateTeam(0);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 2);
str = GetName().."<#>tham gia doanh tr¹i phe Kim";
Msg2MSAll(1,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\missions\\ËÎ½ğÕ½³¡pkÕ½\\Ö÷½ÇËÀÍö1.lua");

--´ËÎªÍæ¼Ò½»ÁË±¨Ãû·Ñ£¬ÕıÊ½¼ÓÈë¶ÓÎéÊÇÌáÊ¾¶Ô»°

Talk(2, "", "Chµo mõng Kim binh sÜ! HiÖn t¹i Tèng binh vÉn ch­a xuÊt hiÖn, chóng ta h·y nghØ ng¬i vµ chê lÖnh", "§· t×m thÊy Tèng binh, lËp tøc chÊp hµnh mÖnh lÖnh!");
end;
-------------------------------------------------------------------------

function SJ_JoinS()
LeaveTeam()
AddMSPlayer(1,1);
SetCurCamp(1);
SetTaskTemp(200,1);
SetFightState(0);
str = GetName().."<#>tham gia doanh tr¹i phe Tèng";
SetDeathScript("\\script\\missions\\ËÎ½ğÕ½³¡pkÕ½\\Ö÷½ÇËÀÍö.lua");
SetLogoutRV(1);
SetCreateTeam(0);
SetPunish(0)
--SetRevPos(78,33)
SetRevPos(44,49)
SetPos(31168/32, 133472/32);
SetTempRevPos(44, 1515 * 32, 3980 * 32);
Msg2MSAll(1,str);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 1);
SetPKFlag(1)
ForbidChangePK(1);
Talk(2,"","Chµo mõng Tèng binh sÜ! HiÖn t¹i Kim binh vÉn ch­a xuÊt hiÖn, chóng ta h·y nghØ ng¬i vµ chê lÖnh","§· t×m thÊy Kim binh, lËp tøc chÊp hµnh mÖnh lÖnh!");
end;

-------------------------------------------------------------------------
--Group±íÊ¾¶Ô»°µÄÖ÷¹ÜÊÇÄÄ·½µÄ£¬1ÎªËÎ£¬2Îª½ğ·½
--State±íÊ¾µ±Ç°Õ½ÒÛµÄ×´Ì¬
function CheckLastBattle(Group, State)

if (Group == 1) then 
	JoinFun = SJ_JoinS;
else
	JoinFun = SJ_JoinJ;
end;

local MKey = GetMissionV(MS_KEY); --µ±Ç°Õ½ÒÛµÄÎ¨Ò»KeyÂë
local Taskid = GetTask(SJTASKID); --¸ÃÕ½ÒÛÀàĞÍµÄID
local TaskV = GetTask(SJTASKVLAUE);

if (Taskid == MS_SJTASKID) then 
	local TaskKey = GetTask(SJTASKKEY)
    if (TaskKey == MKey) then 
		if (TaskV == Group) then
			JoinFun();
			if (State == 2) then
				SetFightState(1);
			end;
			Msg2Player("Chµo mõng b¹n trë l¹i víi chiÕn tr­êng!");
		elseif (State == 2) then
			return 2 --±íÊ¾·Çµ±Ç°ÕóÓª
		else 
			return 0
		end
		return 1;
	else
--		Say("ÄãÉÃÀëÖ°ÊØÀ´µ½ÁË´íÎóµÄÕ½³¡£¡",0);
		return 0;
	end;
end;
return 0;
end;
-------------------------------------------------------------------------
function CheckGoFight()
  V1 = GetMissionV(5);
  V2 = GetMissionV(6);
  if (V1 >= MAX_S_COUNT and V2 >= MAX_J_COUNT) then
  	RunMission(1);
  end;
end;
--------------------------------------------------------------------------
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
------------------------¼ì²éÊÇ·ñ¿ÉÒÔÈÃÖ÷½«³öÏÖÁË--------------------------
function CheckShowKing(Group)

if (Group == 1) then 
	groupvalue1 = MS_S_NPCDEATH; --¼ÇÂ¼S·½NpcËÀÍöÊıÁ¿µÄ²ÎÊıId
	groupvalue2 = MS_S_DEATHCOUNT;--¼ÇÂ¼S·½Íæ¼ÒËÀÍöÊıÁ¿µÄ²ÎÊıId
else
	groupvalue1 = MS_J_NPCDEATH;
	groupvalue2 = MS_J_DEATHCOUNT;
end;

NpcDCount = GetMissionV(groupvalue1);

if (NpcDCount < MS_SHOWKINGCOUNT) then
	return 0;
end;

PlayerDCount = GetMissionV(groupvalue2);

if (PlayerDCount < MS_PKCOUNT) then
	return 0;
end;

if (Group == 1) then 
	SetMissionV(MS_S_SHOWKING, 1)
else
	SetMissionV(MS_J_SHOWKING, 1)
end;

return 1;

end;

function ShowTheKing(Group)

if (Group == 1) then 
	HideNpc("ÄÏËÎ½«¾ü",1);
	str1 = "Th¸m tö håi b¸o:Chñ t­íng phe Tèng ®· xuÊt hiÖn! Binh sÜ h·y b¶o vÖ nguyªn so¸i!";
	str2 ="H·y tiÕp tôc nç lùc tiªu diÖt t­íng ®Şch!";
	Msg2MSGroup(1,str1, 1);
	Msg2MSGroup(1,str2, 2);
	str3 = "<#>ChiÕn tr­êng Tèng Kim:Chñ t­íng phe Tèng ®· xuÊt hiÖn!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

if (Group == 2) then
	HideNpc("½ğ¹ú´ó½«",1);
	str1 = "Th¸m tö håi b¸o:Chñ t­íng phe Tèng ®· xuÊt hiÖn! Binh sÜ h·y b¶o vÖ nguyªn so¸i!";
	str2 = "H·y tiÕp tôc nç lùc tiªu diÖt t­íng ®Şch!";
	Msg2MSGroup(1,str1, 2);
	Msg2MSGroup(1,str2, 1);
	str3 = "<#>ChiÕn tr­êng Tèng Kim:Chñ t­íng phe Kim ®· xuÊt hiÖn!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

return 1;

end;
