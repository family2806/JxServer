-- Ò°ÛÅÈÎÎñÁ´½Å±¾
-- Edited by peres
-- 2004/12/24 Ê¥µ®½ÚÇ°Ò¹

IncludeLib("FILESYS");
IncludeLib("RELAYLADDER");	--ÅÅĞĞ°ñ
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua"); -- ÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\newtask\\tasklink\\tasklink_award.lua"); -- ÈÎÎñÁ´µÄ½±ÀøÍ·ÎÄ¼ş
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--Storm ÕæÕıµÄ½ÓĞÂÈÎÎñ
function storm_goon_start(gameid, b_nonext)
	
	local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
		-- Ã¿ÌìµÄÏŞÖÆ´ÎÊı +1
		nNum = nNum + 1;
		SetTask(ID_TASKLINK_LIMITNUM, nNum);
		
	if b_nonext then return end
	tl_dealtask()
	Task_MainDialog()
end

-- ¼ì²âÈÎÎñÊÇ·ñÒÑ¾­¹ıÁËÃ¿ÌìµÄÏŞÖÆ
function checkTask_Limit()
	
-- Ã¿ÌìÏŞÖÆ´ÎÊıµÄ´¦Àí
local nNowDate = tonumber(GetLocalDate("%y%m%d"));
local nOldDate = GetTask(ID_TASKLINK_LIMITDATE);
local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
	if nNowDate~=nOldDate then
		
		SetTask(ID_TASKLINK_LIMITDATE, tonumber(GetLocalDate("%y%m%d")) );
		SetTask(ID_TASKLINK_LIMITNUM, 0);
		SetTask(ID_TASKLINK_LIMITCancelCount, 0);
		return 1;
		
	else
		-- 40 ´ÎµÄÏŞÖÆ
		if nNum>=40 then
			Say("Ha ha , mçi ngµy nhiÖm vô tæng sè kh«ng thÓ v­ît qua 40 lÇn . ", 0);
			return 0;
		end;
		
		return 1;

	end;
	
end;
	
	
--Task_BuyGoods = {}
--Task_FindGoods = {}
--Task_ShowGoods = {}
--Task_FindMaps = {}
--Task_UpGround = {}
--Task_WorldMaps = {}
--Task_Level = {}
--Task_MainLevelRate = {}


-- ¹¹ÔìÈÎÎñÄÚ´æ±äÁ¿
Task_BuyGoods = AssignValue(Task_BuyGoods,TL_BUYGOODS)
Task_FindGoods = AssignValue(Task_FindGoods,TL_FINDGOODS)
Task_ShowGoods = AssignValue(Task_ShowGoods,TL_SHOWGOODS)
Task_FindMaps = AssignValue(Task_FindMaps,TL_FINDMAPS)
Task_UpGround = AssignValue(Task_UpGround,TL_UPGROUND)
Task_WorldMaps = AssignValue(Task_WorldMaps,TL_WORLDMAPS)

Task_MainTaskLink = AssignValue_TaskLink(Task_MainTaskLink,TL_LEVELLINK)
Task_MainLevelRate = AssignValue_TaskRate(Task_MainLevelRate,TL_MAINTASKLEVEL)

-- ¹¹Ôì½±ÀøÄÚ´æ±äÁ¿
Task_AwardBasic = AssignValue_Award(Task_AwardBasic,TL_AWARDBASIC)

-- ¹¹ÔìÍê³É´ÎÊıµÄ½±Àø
Task_AwardLink = AssignValue_LinkAward(TL_AWARDLINK)

Task_AwardLoop = AssignValue_Award(Task_AwardLoop,TL_AWARDLOOP)

-- ¹¹Ôì¶Ô»°ÄÚÈİÄÚ´æ±äÁ¿
Task_TalkGoods = AssignValue_TaskTalk(Task_TalkGoods,TL_TASKGOODSTALK)
Task_TalkBuy = AssignValue_TaskTalk(Task_TalkBuy,TL_TASKBUYTALK)
Task_TalkShow = AssignValue_TaskTalk(Task_TalkShow,TL_TASKSHOWTALK)
Task_TalkFind = AssignValue_TaskTalk(Task_TalkFind,TL_TASKFINDMAPS)
Task_TalkUp = AssignValue_TaskTalk(Task_TalkUp,TL_TASKUPGROUNDTALK)
Task_TalkWorld = AssignValue_TaskTalk(Task_TalkWorld,TL_TASKWORLDTALK)


function Task_NewVersionAward()
	
	local nNum = GetTask(ID_TASKLINK_LIMITNUM);
	local nCancelNum = GetTask(ID_TASKLINK_LIMITCancelCount);
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "yesourenwu")
	G_ACTIVITY:OnMessage("FinishYesou", nNum, nCancelNum);
	
	-- Ã¿ÌìÍê³ÉµÚ30¸ö¶îÍâ½±Àø
	if (nNum - nCancelNum) == 30 then
		Msg2Player("Chóc mõng ng­¬i , hoµn thµnh 30 c¸ d· tÈu nhiÖm vô , ®¹t ®­îc ng¹ch ngo¹i t­ëng th­ëng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 30000000}, "§¹t ®­îc ng¹ch ngo¹i t­ëng th­ëng ")
	end
	
	-- Ã¿ÌìÍê³ÉµÚ40¸ö¶îÍâ½±Àø
	if (nNum == 40 and nCancelNum) == 0 then
		Msg2Player("Chóc mõng ng­¬i , hoµn thµnh 40 c¸ d· tÈu nhiÖm vô , ®¹t ®­îc ng¹ch ngo¹i t­ëng th­ëng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 100000000}, "§¹t ®­îc ng¹ch ngo¹i t­ëng th­ëng ")
	end	
	
end


function main()

	--ÓĞÓÛÀ¼½Ú»î¶¯ÆÚ¼ä¶Ô»°¡£
--	local nDate = tonumber(GetLocalDate("%y%m%d"));
--	if (nDate >= 60808 and nDate <= 60815) then
--		local tab_Content = {
--			"Xem c nhi v?g? l kh tÇn g/tasklink_entence",
--		}
--		tinsert(tab_Content, "Ta mu l¹p l m vg Li yÕt Hoa/menglanjie");
--		tinsert(tab_Content, "R ¸ch kh ta /Task_Wait");
--		Say("M n nay chi khãa tranh tri thİch mi yÕt , d th th l¹p g kh? Phng trng Thi phØ L t?mu l¹p t?ch chËm th?trai m vŞ g L?Vu Lan  m ngi hng ch l©u gi ph l©u y yÕt bh", getn(tab_Content), tab_Content);
--		return
--	end;
	
	tasklink_entence();
end;

function menglanjie()
	if (GetExtPoint(0) <= 0 or GetLevel() < 30) then
		Say("Xin l! Ch?c?ngi ch béi t?c <color=red>30,  n th?color> m c?th?tham gia ho ng n phô ", 0)
		return 
	end;
	local tab_Content = {
		"Ta mu l¹p k vg Kim Li yÕt Hoa [c 9 Kim Li yÕt Hoa]/process(1)",
		"Ta mu l¹p h th yªu h vg M nhuËn Li yÕt Hoa [c 9 M nhuËn Li yÕt Hoa]/process(2)",
		"Ta mu l¹p h th yªu h vg Th Li yÕt Hoa [c 9 Th Li yÕt Hoa]/process(3)",
		"Ta mu l¹p h th yªu h vg H Li yÕt Hoa [c 9 H Li yÕt Hoa]/process(4)",
		"Ta mu l¹p h th yªu h vg Th?Li yÕt Hoa [c 9 Th?Li yÕt Hoa]/process(5)",
		"Ch?n th tÇn g ch l©u th quyÕt !/Task_Wait"
	}
	Say("Ch?c ngi  thu th  s?Li yÕt Hoa v?<color=yellow>"..MAKING_COST.."<color> lng ta s?gi ngi k vg hoa tuy khiªm p. Nhg l ? m ng phô ch?c?th?k  2 vg Li yÕt Hoa cg thu nhuËn t v·n h m?th quyÕt .", getn(tab_Content), tab_Content);
end;

--{name, product}
MAKING_COST = 10000;
MAKING_COUNT = 9;
tab_Flower = {
	{1126, "Kim ", 1131, 1760, 1761}, {1127, "Méc ", 1132, 1762, 1763}, {1128, "N­íc ", 1133, 1764, 1765}, {1129, " löa ", 1134, 1766, 1767}, {1130, "§Êt ", 1135, 1768, 1769}
}

function process(nIdx)
	if (nIdx < 1 or nIdx > getn(tab_Flower)) then
		return
	end;
	
	local nIndex;
	if (nIdx == 1) then
		nIndex = 1;
	elseif (nIdx == 2) then
		nIndex = 2;
	elseif (nIdx == 3) then
		nIndex = 3;
	elseif (nIdx == 4) then
		nIndex = 4;
	elseif (nIdx == 5) then
		nIndex = 5;
	end;
	
	Say("Mu l¹p l 1 vg <color=yellow>"..tab_Flower[nIdx][2].." Li yÕt Hoa<color> c c?9 <color=yellow>"..tab_Flower[nIdx][2].."Li yÕt Hoa<color>. Ngi x nh l ch?", 2, "ng! Xin l b tr?t nh­ng !/make_round("..nIndex..")", "Ta s?quay l t¹c sau!/Task_Wait");
end;

function make_round(nIdx)
	if (GetCash() < MAKING_COST) then
		Say("Xin t  10000 lng r m¹nh h quay l t¹c ! Ta ?y ch?", 1, " th quyÕt ! Ta  l th ¸p ti thİch !/Task_Wait");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(6,1,tab_Flower[nIdx][1],-1);
	if (nCount < 9) then
		Say("Ngi hh nh?ch  <color=yellow>"..tab_Flower[nIdx][2].." Li yÕt Hoa<color=yellow>. Ch  9 <color=yellow>"..tab_Flower[nIdx][2].." Li yÕt Hoa<color> th?ta kh tÇn g th?gi ngi k vg "..tab_Flower[nIdx][2].." Li yÕt Hoa ho yªu ", 1, " ta  chu oa b?!/Task_Wait");
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate ~= GetTask(tab_Flower[nIdx][4])) then
		SetTask(tab_Flower[nIdx][4], nDate);
		SetTask(tab_Flower[nIdx][5], 0);
	end;
	
	local nTimes = GetTask(tab_Flower[nIdx][5]);
	if (nTimes >= 2) then
		Say(tab_Flower[nIdx][2].."H nay  k th yªu h c tÇn g 2 vg r m¹nh ! Mai h n nh?", 0)
		return
	end;
	
	Pay(MAKING_COST);
	ConsumeEquiproomItem(9, 6, 1, tab_Flower[nIdx][1], -1);
	SetTask(tab_Flower[nIdx][5], nTimes + 1);
	AddItem(6, 1, tab_Flower[nIdx][3], 1, 0, 0, 0);
	Say("Vg "..tab_Flower[nIdx][2].." Li yÕt Hoa c ngi  k xong. H mang n?n ch?L?Quan !", 1, "Nh nhÜ vg hoa/Task_Wait");
	Msg2Player("B nh nhÜ  m"..tab_Flower[nIdx][2].." Li yÕt Hoa ho yªu ");
end;
    
-- ÈÎÎñÁ´µÄÈë¿Ú
function tasklink_entence()

_TaskLinkDebug() -- ¶ÔÓÚÈÎÎñÁ´ÎŞ·¨½øĞĞÏÂÈ¥µÄ BUG ĞŞ¸´

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı

local myCountLinks
local myCountTimes

local myCanceled = nt_getTask(1036)
local myTaskTime = GetGameTime() -- »ñÈ¡ÓÎÏ·Ê±¼ä£¬ÓÃÒÔÅĞ¶ÏÍæ¼ÒÊÇ·ñ±»·â
local n = myTaskTime - nt_getTask(1029)
local myTaskInfo = ""


-- Èç¹ûÍæ¼Òµ±Ç°µÄ×´Ì¬Îª»¹Î´·¢½±µÄ»°£¬ÔòÖØĞÂ·¢½±
if (tl_gettaskcourse() == 2) then
	Task_GiveAward()
	return
end

	if ( myCanceled == 10) then
		if (n < 605) then
			Task_Punish()
			return
		else
			myCanceled = 0
			nt_setTask(1036,0)
			Task_Confirm()
		end
	end

	if (tl_gettaskcourse() == 0) then
		-- Èç¹û»¹Ã»ÓĞ¿ªÊ¼Ò°ÛÅµÄÈÎÎñÁ´µÄ»°
--		Say("V?n phô "..GetPlayerSex().."xem ra  b tÇn ba giang h? m th ¸ch gian d nh­ng r m¹nh nh? c?mu l¹p tham gia kh nghi nhi v?li yÕt t c ta kh tÇn g?",3," th quyÕt ! Ta kh tÇn g tin c?nhi v?n kú l kh?d? ta/Task_Confirm","Ta mu l¹p bi kh nghi c ngi n c?n dung ra sao/Task_Info","Ta b nhÜ r m¹nh , kh tÇn g rh ng m¹nh t g cèt v tÇn g/Task_Exit");
		Say("D· tÈu  vŞ nµy "..GetPlayerSex().." xem ra x«ng x¸o giang hå còng cã mét ®o¹n thêi gian , cã thÓ hay kh«ng cã høng thó tíi tham gia ta <color=yellow>“ hoµn hoµn liªn liªn t­¬ng xøng ®«i , tÇng tÇng ®iÖt ®iÖt lÊy hËu lÔ ”<color> ®İch nhiÖm vô kh¶o nghiÖm ®©y ? ",3,"H¶o nha , ta còng kh«ng tin cã c¸i g× nhiÖm vô cã thÓ khã ®­îc còng ta /Task_Confirm"," ta muèn biÕt ng­¬i nãi kh¶o nghiÖm lµ mét h×nh d¸ng g× /Task_Info","Ta cßn cã chuyÖn , kh«ng r·nh cïng ng­¬i ë ®©y rçi r·nh kĞo /Task_Exit");
	end
	
	if (tl_gettaskcourse() == 3) then

		-- ¼ì²âÊÇ·ñ³¬¹ıÃ¿ÌìµÄÏŞÖÆ
		if checkTask_Limit()~=1 then return end;
	
		myCountLinks = tl_counttasklinknum(2)
		myCountTimes = tl_counttasklinknum(1)
		
--		Say(":<enter>V?"..GetPlayerSex().." ho yªu th yªu h <color=yellow>"..myCountTimes.."<color>, nhi v?n phô ng phô h nay c?th?th hi l t¹c <color=yellow>"..(40 - GetTask(ID_TASKLINK_LIMITNUM)).."<color>, ngi c?mu l¹p l n kh tÇn g?",2,"g nhi yÕt , mau cho ta bi nhi v?ti theo l?g?/Task_TaskProcess"," ta ngh?ng béi m l ! Ta b nhÜ r m¹nh /Task_Wait");
		Say("D· tÈu <enter> vŞ nµy "..GetPlayerSex().." ®· hoµn thµnh <color=yellow>"..myCountTimes.."<color> lÇn ta ®­a cho nhiÖm vô cña ng­¬i , kh«ng biÕt ng­¬i cã cßn hay kh«ng høng thó tiÕp tôc tiÕp theo lµm tiÕp ®©y ? ",2,"DÜ nhiªn , mau ®Ó cho ta biÕt ng­êi/c¸i kÕ tiÕp nhiÖm vô lµ c¸i g× /Task_TaskProcess","H·y ®Ó cho ta nghØ mét l¸t mµ ®i , ta cßn kh¸c biÖt chuyÖn cña t×nh /Task_Wait");
	elseif (tl_gettaskcourse() == 1) then
		Task_MainDialog()
	end

end

-- ´ğÓ¦ÁËÒ°ÛÅµÄ¿¼Ñé£¬ÕıÊ½¿ªÊ¼ÈÎÎñÁ´
function Task_Confirm()

local myTaskID

-- ÉèÖÃÈÎÎñ±äÁ¿µÄÊıÖµ£¬1020 ºÅ±äÁ¿ÎªÈÎÎñÁ´×´Ì¬×¨ÓÃ±äÁ¿£¬ÆäÖĞµÄËÄ¸ö×Ö½Ú·Ö±ğ¶¨ÒåÎª£º| ¢Ù´ÎÊı | ¢ÚÁ´Êı | ¢Û»·Êı | ¢ÜÈ¡ÏûÊ£Óà´ÎÊı |

tl_settaskstate(1,0) -- ÕıÔÚ½øĞĞµÚÒ»´ÎÈÎÎñ
tl_settaskstate(2,tl_getfirstlink()) -- ÕıÔÚ½øĞĞµÚÒ»Á´ÈÎÎñ
tl_settaskstate(3,tl_getfirstloop()) -- ÕıÔÚ½øĞĞµÚÒ»»·ÈÎÎñ

tl_settaskstate(4,0) -- Ê£Óà 0 ´ÎÈ¡ÏûÈÎÎñµÄ»ú»á
nt_setTask(DEBUG_TASKVALUE, 0);

tl_settaskstate(6,0)

storm_ask2start(4)	--Storm ¿ªÊ¼ÌôÕ½
tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuDaTau")
--tbLog:PlayerActionLog("Chñ yÕu ®Æc ®iÓm ","NhanNhiemVuDaTau")
end


-- ½øĞĞÏÂÒ»´ÎÈÎÎñ
function Task_TaskProcess()

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı


-- ¼ì²âÊÇ·ñ³¬¹ıÃ¿ÌìµÄÏŞÖÆ
if checkTask_Limit()~=1 then return end;

tl_taskprocess() -- Ê×ÏÈÖ´ĞĞÏÂÒ»ÂÖº¯Êı

storm_goon_start()	--Storm»Ö¸´

end


-- ÈÎÎñÁ´µÄÖ÷Òª¿ØÖÆÃæ°æ
function Task_MainDialog()

local myTaskInfo = tl_gettaskinfo() -- ÈÎÎñµÄÏêÏ¸ĞÅÏ¢
local myTaskTotalNum = tl_counttasklinknum(1) + 1; -- ×ÜÈÎÎñ´ÎÊıÍ³¼Æ
local myTitleText = "";

if (myTaskInfo == nil) then
	myTaskInfo = ""
end

-- ÉèÖÃÈÎÎñ×´Ì¬ÎªÒÑ¾­½ÓÁËÈÎÎñµ«Î´Íê³É
tl_settaskcourse(1)


if myTaskTotalNum==0 or myTaskTotalNum==nil then
	myTitleText = " d· tÈu <enter><enter>"..myTaskInfo;
else
	myTitleText = " d· tÈu <enter><enter> ®©y lµ thø <color=green>"..myTaskTotalNum.."<color> c¸ nhiÖm vô , "..myTaskInfo;
end;

Say(myTitleText,
	4,
--	"Bi r m¹nh ,  ta ho yªu th yªu h nhi v?xong m l t¹c t ngi/Task_Wait",
--	"ta  ho yªu th yªu h nhi v?l n phô , xin h ki tra l t¹c !/Task_Accept",
--	"Nhi v?l n phô kh?qu? Ta mu l¹p h b?kh tÇn g l n/Task_CancelConfirm",
--	"Ta mu l¹p bi kh nghi c ngi n c?n dung ra sao/Task_Info"
	" biÕt , chê ta hoµn thµnh nhiÖm vô sau l¹i tíi t×m ng­¬i /Task_Wait",
	" ta ®· hoµn thµnh nhiÖm vô lÇn nµy , mêi/xin ng­¬i nghiÖm thu ®i /Task_Accept",
	" nhiÖm vô lÇn nµy còng qu¸ khã kh¨n , ta muèn hñy bá r¬i kh«ng lµm /Task_CancelConfirm",
	" ta muèn biÕt ng­¬i nãi kh¶o nghiÖm lµ mét h×nh d¸ng g× /Task_Info"
	);

-- ÉèÖÃÈ¡ÏûÈÎÎñµÄ±ê¼ÇÎª¿ÉÒÔÈ¡Ïû
nt_setTask(1045, 1);

end


-- È¡ÏûÈÎÎñÊ±¸øÓèÍæ¼ÒÒ»´ÎÈ·ÈÏµÄ»ú»á
function Task_CancelConfirm()

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı

local myCountTimes = tl_counttasklinknum(1);  -- Íæ¼Ò½øĞĞµÄÈÎÎñ×ÜÊı

if (myTaskCancel==0) then
	Say("D· tÈu  ngµi b©y giê mét lÇn hñy bá ®İch c¬ héi còng kh«ng cã , cø nh­ vËy ng­¬i liÒn ph¶i b¾t ®Çu l¹i tõ ®Çu ¸c  h¬n n÷a tr­íc ng­¬i ®İch t­ëng th­ëng tİch lòy sÏ lÇn n÷a b¾t ®Çu ®Õm hÕt . ",3,"§óng vËy , ta chİnh lµ kh«ng muèn lµm c¸i nµy quû nhiÖm vô /Task_NormalCancel","Ta muèn dïng 100 tê nói s«ng x· t¾c ®å m¶nh vôn tíi lÊy tiªu nhiÖm vô lÇn nµy /Task_Cancel(2)"," õ/d¹ …… vËy h·y ®Ó cho ta suy nghÜ l¹i mét chót ®i /Task_Wait");
else
	Say("D· tÈu  ngµi b©y giê cßn cã "..myTaskCancel.." lÇn hñy bá nhiÖm vô c¬ héi , ng­¬i nhÊt ®Şnh ph¶i hñy bá nhiÖm vô lÇn nµy sao ? ",2,"§óng vËy , ta chİnh lµ kh«ng muèn lµm c¸i nµy quû nhiÖm vô /Task_Cancel(1)"," õ/d¹ …… vËy h·y ®Ó cho ta suy nghÜ l¹i mét chót ®i /Task_Wait");
end


--if (myTaskCancel==0) then
--	
--	Say("Hi t t¹c b kh tÇn g c?c?h n kú  h b?nhi v? b ch?c?th?l l t¹c t?u th quyÕt ! ng th ¸ch ph thng t chu h l c b l bİ trc s? t v·n h l t¹c t?u.",
--		3,
--		"ng, ta kh tÇn g mu l¹p l nhi v?qu?qu n phô u/Task_NormalCancel",
--		"Ta mu l¹p s?dg 100 mh s H?X?T l¨ng  h b?nhi v?l n phô /Task_Cancel(2)",
--		"Uhm!  ta suy ngh?l t¹c /Task_Wait");
--	
--else
--	
--	Say("Hi t t¹c b c"..myTaskCancel.." s?l c?h h b?nhi v? b x nh h b?nhi v?l n phô ng kh tÇn g?",
--		2,
--		"ng, ta kh tÇn g mu l¹p l nhi v?qu?qu n phô u/Task_Cancel(1)",
--		"Uhm!  ta suy ngh?l t¹c /Task_Wait");
--	
--end

end


-- Õı³£µÄÈ¡Ïû·½Ê½ÔÙÈ·ÈÏÒ»´Î
function Task_NormalCancel()

Say("D· tÈu  ng­¬i nghÜ tèt l¾m thËt muèn lÊy tiªu nhiÖm vô lÇn nµy sao ? ",2,"Kh«ng muèn la toa liÔu , ta chİnh lµ kh«ng muèn lµm c¸i nµy quû nhiÖm vô /Task_Cancel(1)","VËy hay lµ ®Ó cho ta suy nghÜ l¹i mét chót ®i /Task_Wait");

--Say("B suy ngh?k?h b?nhi v?l n phô ng kh tÇn g?",2,"ng l quyÕt th quyÕt n! ta kh tÇn g mu l¹p l nhi v?qu?qu n phô u/Task_Cancel(1)","Th quyÕt  ta suy ngh?l t¹c !/Task_Wait");

end;


-- 1000 ´ÎÒÔÉÏµÄÈÎÎñÈ¡ÏûÊ±ĞèÒª·ÅË®¾§
function Task_TotalCancel()
	GiveItemUI("D· tÈu nhiÖm vô 1000 lÇn trë lªn hñy bá , cÇn cung cÊp n­íc biÕc tinh mét viªn , xin/mêi ®em thñy tinh ®Æt ë phİa d­íi vËt phÈm khu«ng trung ", "Task_TotalCancel_Main", "Task_Wait");
end;


function Task_TotalCancel_Main(nCount)
	
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
	local nIndex = 0;
	
	if nCount~=1 then
		Say("D· tÈu  ng­¬i cho ta kh«ng ph¶i lµ mµu xanh l¸ c©y <color=yellow>1 c¸ <color> thñy tinh !", 0);
		return
	end;
	
	nIndex = GetGiveItemUnit(1);
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	
	if nGenre==4 and nDetail==240 and nParticular==1 then
		Task_Cancel(1);  -- È«²¿È¡Ïû
	else
		Say("D· tÈu : ng­¬i cho ta kh«ng ph¶i lµ mµu xanh l¸ c©y <color=yellow>1 c¸ <color> thñy tinh !", 0);
		return		
	end;
	
end;


-- ÏÔÊ¾Íæ¼Òµ±Ç°µÄÈÎÎñËù½øĞĞµÄ³Ì¶È£¨µ÷ÊÔÓÃ£©
function Task_ProcessInfo()

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı

local myTaskType = tl_getplayertasktype()

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)

local myCountTimes = tl_counttasklinknum(1)

-- local myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
-- local myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	

-- local myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1))

-- local myMainValueText1 = " ng­¬i tr­íc m¾t ®İch nhiÖm vô vËt phÈm gi¸ trŞ v× : "..myTaskValue1.." nhiÖm vô gi¸ trŞ v× : "..myTaskValue2.."<enter>".." nhiÖm vô cña ng­¬i b©y giê tæng gi¸ trŞ l­îng v× : "..myMainValue

--	Say("D· tÈu  ng­¬i b©y giê tiÕn hµnh ®­îc liÔu thø "..myTaskLoops.." hoµn trung ®İch thø "..myTaskLinks.." liªn trung ®İch thø "..myTaskTimes.." lÇn . <enter> ng­¬i liªn tôc tiÕn hµnh ®İch sè lÇn v× "..tl_counttasklinknum(1).." lÇn <enter> ng­¬i liªn tôc tiÕn hµnh ®İch liªn ®Õm v× "..tl_counttasklinknum(2).." liªn <enter>"..myMainValueText1,0);

--	Say("Hi t t¹c ngi  ho yªu th yªu h <color=yellow>"..myCountTimes.."<color> s?l nhi v?ta giao cho, c c?g l­ìng g h nh?", 0);
	Say("D· tÈu  ng­¬i b©y giê ®· hoµn thµnh <color=yellow>"..myCountTimes.."<color> lÇn ta ®­a cho nhiÖm vô cña ng­¬i , kİnh xin tiÕp tôc cè g¾ng nga ", 0);

end


-- Íæ¼ÒÒÑ¾­Íê³ÉÈÎÎñÇ°À´¸øÒ°ÛÅÑéÊÕ
function Task_Accept()
	--2007-09-19 Ôö¼ÓÎïÆ·½±ÀøÊ±µÄ±³°ü¿Õ¼äÅĞ¶Ï
	if (CalcFreeItemCellCount() < 5) then
		Say("D· tÈu  xin/mêi dän dÑp tói x¸ch cña ng­¬i phôc kh«ng thua kĞm 5 c¸ c¸ch tö , sau ®ã tíi nhËn lÊy phÇn th­ëng ",0);
		return
	end;
local myTaskType = tl_getplayertasktype()

	if (myTaskType == 1) then
		GiveItemUI("T×m kiÕm vËt phÈm nhiÖm vô ","D· tÈu  nga ? ta cho ng­¬i ®i mua ®å ng­¬i mua cho ta ®· tíi ch­a ? ","Task_Accept_01","Task_Wait");
	elseif (myTaskType == 2) then
		GiveItemUI("Mua vËt phÈm nhiÖm vô ","D· tÈu  nga ? ta cho ng­¬i ®i t×m ®å ng­¬i cho ta t×m ®­îc sao ? ","Task_Accept_02","Task_Wait");
	elseif (myTaskType == 3) then
		GiveItemUI("VËt phÈm biÓu diÔn nhiÖm vô ","D· tÈu  nga ? ta cho ng­¬i ®i t×m ®å ng­¬i cho ta t×m ®­îc sao ? ","Task_Accept_03","Task_Wait");
	elseif (myTaskType == 4) then
		Task_Accept_04()
	elseif (myTaskType == 5) then
		Task_Accept_05()
	elseif (myTaskType == 6) then
		Task_Accept_06()
	else -- Òì³£´¦Àí
		Say("D· tÈu  ng­¬i b©y giê lµm ®å cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end

end


-- ÈÎÎñÒ»µÄÅĞ¶Ï´¦Àí
function Task_Accept_01(nCount)
local myTaskGoods
local ItemGenre,DetailType,ParticularType,Level,nSeries,Luck

if ( nCount > 1 ) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i mét lÇn ®Ó nhiÒu nh­ vËy ®å ®i vµo ta lµ thÊy con m¾t bÊt h¹ tiÕp nha , cßn lµ tõ tõ ®i ®i ……",0);
	return 0
elseif ( nCount == 0) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i …… thËt ®Ó cã ®å cã ë bªn trong kh«ng ? cã ph¶i hay kh«ng ta l·o Hoa liÔu m¾t nha ? ",0);
	return 0
end

	ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
--	magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
	myTaskGoods = {ItemGenre,DetailType,ParticularType,nSeries,Level}
	
--	tl_print ("D· tÈu kiÓm nghiÖm liÔu vËt phÈm "..ItemGenre..DetailType..ParticularType..nSeries..Level)
	
	if (tl_checktask(myTaskGoods) == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- É¾³ıÍæ¼ÒÉíÉÏµÄÎïÆ·
		Task_AwardRecord()
		Task_GiveAward()
		-- ·¢½±´¦Àí
	else
		Say("D· tÈu  ng­¬i b©y giê ®­a cho ®İch ®å cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end
end


-- ÈÎÎñ¶şµÄÅĞ¶Ï´¦Àí
function Task_Accept_02(nCount)

local myTaskGoods
local ItemGenre, DetailType, ParticularType, Level, nSeries, Luck
local magictype,p1,p2,p3
local i,n,m = 0,0,0

if ( nCount > 1 ) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i mét lÇn ®Ó nhiÒu nh­ vËy ®å ®i vµo ta lµ thÊy con m¾t bÊt h¹ tiÕp nha , cßn lµ tõ tõ ®i ®i ……",0);
	return 0
elseif ( nCount == 0) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i …… thËt ®Ó cã ®å cã ë bªn trong kh«ng ? cã ph¶i hay kh«ng ta l·o Hoa liÔu m¾t nha ? ",0);
	return 0
end

	for i=1,6 do
		ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
		magictype , p1, p2, p3 = GetItemMagicAttrib(GetGiveItemUnit(1), i)
		myTaskGoods = {ItemGenre,DetailType,ParticularType,Level,nSeries,magictype,p1,p2,p3}
--		tl_print("KiÓm nghiÖm liÔu ma ph¸p thuéc tİnh "..i.." :".." ma ph¸p ID v× : "..magictype.." ma ph¸p tham sæ 1 v× : "..p1.." ma ph¸p tham sæ 2 v× : "..p2.." ma ph¸p tham sæ 3 v× : "..p3);
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end
	
	if (m == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- É¾³ıÍæ¼ÒÉíÉÏµÄÎïÆ·
		Task_AwardRecord()
		Task_GiveAward()
	else
		Say("D· tÈu  ng­¬i b©y giê ®­a cho ®İch ®å cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end
	
end


-- ÈÎÎñÈıµÄÅĞ¶Ï´¦Àí
function Task_Accept_03(nCount)

local myTaskGoods
local magictype,p1,p2,p3
local i,n,m = 0,0,0


if ( nCount > 1 ) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i mét lÇn ®Ó nhiÒu nh­ vËy ®å ®i vµo ta lµ thÊy con m¾t bÊt h¹ tiÕp nha , cßn lµ tõ tõ ®i ®i ……",0);
	return 0
elseif ( nCount == 0) then
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." , ng­¬i …… thËt ®Ó cã ®å cã ë bªn trong kh«ng ? cã ph¶i hay kh«ng ta l·o Hoa liÔu m¾t nha ? ",0);
	return 0
end

	for i=1,6 do -- Ñ­»·Àú±éËùÓĞµÄÄ§·¨ÊôĞÔ¿´¿´ÊÇ·ñÓĞºÏÊÊµÄ
		magictype,p1,p2,p3 = GetItemMagicAttrib(GetGiveItemUnit(1),i)
		myTaskGoods = {magictype,p1,p2,p3}
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end	

	if (m == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- ·¢½±´¦Àí
	else
		Say("D· tÈu  ng­¬i b©y giê ®­a cho ®İch ®å cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end
	
end


-- ÈÎÎñËÄµÄÅĞ¶Ï´¦Àí
function Task_Accept_04()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- ·¢½±´¦Àí
	else
		Say("D· tÈu  ng­¬i b©y giê chuyÖn lµm cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end
	
end


-- ÈÎÎñÎåµÄÅĞ¶Ï´¦Àí
function Task_Accept_05()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- ·¢½±´¦Àí
	else
		Say("D· tÈu  ng­¬i b©y giê chuyÖn lµm cßn kh«ng cã ®¹t tíi yªu cÇu cña ta nga , cßn lµ mêi/xin ng­¬i cè g¾ng n÷a ®i ",0);
	end
	
end



-- ÈÎÎñÁùµÄÅĞ¶Ï´¦Àí
function Task_Accept_06()
	
	if (tl_checktask()==1) then
		Task_AwardRecord()
		Task_GiveAward()
		return 1
	else
		Say("D· tÈu  ha ha ha …… vŞ nµy "..GetPlayerSex().." , mét tuy bÊt tµi , nh­ng còng hiÓu trªn giang hå nãi lµ mét tin/th¬ ch÷ , ng­¬i còng cßn kh«ng cã thu tËp hoµn ta muèn cÇu nói s«ng x· t¾c ®å m¶nh vôn thÕ nµo liÒn muèn tíi lÜnh th­ëng ®©y ? ",0);
		return 0
	end

end



-- Íæ¼ÒÑ¡ÔñÈ¡ÏûÈÎÎñµÄ´¦Àí
-- ´«Èë²ÎÊı nType£ºÈ¡ÏûÈÎÎñµÄ·½·¨£¬1ÎªÓÃÈ¡Ïû»ú»áÀ´È¡Ïû£¬2ÎªÓÃ 100 ÕÅÉ½ºÓÉçğ¢Í¼ËéÆ¬À´È¡Ïû
function Task_Cancel(nType)

local myTaskTimes = tl_gettaskstate(1) -- Íæ¼Ò½øĞĞµ½µÄ´ÎÊı
local myTaskLinks = tl_gettaskstate(2) -- Íæ¼Ò½øĞĞµ½µÄÁ´Êı
local myTaskLoops = tl_gettaskstate(3) -- Íæ¼Ò½øĞĞµ½µÄ»·Êı
local myTaskCancel = tl_gettaskstate(4) -- Íæ¼Ò¿ÉÒÔÈ¡ÏûµÄ´ÎÊı
local myCanceled = nt_getTask(1036) -- Íæ¼ÒÒÑ¾­¶ñÒâÈ¡ÏûÁË¶àÉÙ´Î
local myMapNum = nt_getTask(1027) -- ¿´¿´Íæ¼ÒÉíÉÏÓĞ¶àÉÙ¸öÉ½ºÓÉçğ¢Í¼²ĞÆ¬

local myNewCancel = GetTask(DEBUG_TASKVALUE);  -- ±¸·İµÄÈ¡Ïû»ú»á

local nTotalTaskNum = tl_counttasklinknum(1); -- »ñÈ¡µ±Ç°Íæ¼ÒÒ»¹²×öÁË¶àÉÙ´ÎÈÎÎñ

-- Èç¹û²»ÊÇ´ÓÖ÷Ãæ°æ½øÈëµÄ×´Ì¬£¬Ôò²»ÄÜ½øĞĞÒÔÏÂµÄÈ¡Ïû¹ı³Ì
if nt_getTask(1045)~=1 then
	return
end;

-- ÅĞ¶ÏÊÇ·ñ´æÔÚË¢È¡Ïû»ú»áµÄĞĞÎª
if _CancelTaskDebug()~=1 then
	Say("D· tÈu  õ/d¹ …… ng­êi tuæi trÎ , gièng nh­ ng­¬i ®· kh«ng cã hñy bá c¬ héi nga ", 0);
	return
end;

-- ¼ì²âÊÇ·ñ³¬¹ıÃ¿ÌìµÄÏŞÖÆ
if checkTask_Limit()~=1 then return end;

	if (nType==2) then
		if (myMapNum>=100) then
			myMapNum = myMapNum - 100;
			nt_setTask(1027, myMapNum);
			myTaskCancel = myTaskCancel + 1;
			Msg2Player("Ngµi sö dông 100 tê nói s«ng x· t¾c ®å m¶nh vôn tíi lÊy tiªu mét lÇn nhiÖm vô ");
			Msg2Player("Ngµi b©y giê nói s«ng x· t¾c ®å m¶nh vôn cßn l¹i "..myMapNum.." tê ");
		else
			Say("D· tÈu  ng­¬i …… ng­¬i …… ng­¬i thËt mang cã <color=yellow>100<color> tê nói s«ng x· t¾c ®å m¶nh vôn tíi sao ? ta kh«ng cã nh×n hoa m¾t ®i ? ",0);
			return
		end;
	end;

	if (myTaskTimes == 0) and (myTaskLinks == tl_getfirstlink()) then
	
		if (myTaskCancel == 0) then
		
			myCanceled = myCanceled + 1
			nt_setTask(1036,myCanceled)
	
			if ( myCanceled > 2) then -- Èç¹ûÍæ¼ÒÁ¬ĞøÔÚ³õÆÚÈ¡ÏûÁËÈı´ÎÈÎÎñ£¬Ôò×÷´¦·£
				myCanceled = 10	
				nt_setTask(1036,myCanceled)
				nt_setTask(1029,GetGameTime())
				Task_Punish()
				
				return
				
			end
			
		end
		
		-- ÖØĞÂËæ»úÅÉ·¢ĞÂµÄÈÎÎñ
		SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- Ôö¼Óµ±ÌìµÄÈ¡Ïû´ÎÊı
		storm_ask2start(4)	--Storm ¿ªÊ¼ÌôÕ½
		
		return
		
	end

	if (myTaskCancel >= 1) then -- Èç¹ûÍæ¼Ò»¹ÓĞ»ú»áÈ¡ÏûµÄ»°Ôò¼ÌĞøËæ»úµ±Ç°µÈ¼¶µÄÈÎÎñ
	
		-- Ğ´ÈëÈ¡ÏûÈÎÎñÊ±µÄ LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
		
		myTaskCancel = myTaskCancel - 1
		
		tl_settaskstate(4,myTaskCancel)
		
		nt_setTask(DEBUG_TASKVALUE, myTaskCancel);
			
	else
		-- Ğ´ÈëÈ¡ÏûÈÎÎñÊ±µÄ LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
	
		tl_settaskstate(1,0) -- ÕıÔÚ½øĞĞµÚÒ»´ÎÈÎÎñ
		tl_settaskstate(2,tl_getfirstlink()) -- ÕıÔÚ½øĞĞµÚÒ»Á´ÈÎÎñ
		tl_settaskstate(3,0) -- ´ÓµÚ 0 »·¿ªÊ¼
		
		tl_settaskstate(4,0) -- Ê£Óà 0 ´ÎÈ¡ÏûÈÎÎñµÄ»ú»á
		nt_setTask(DEBUG_TASKVALUE, 0);
		
		tl_settaskstate(6,0) -- µ±Ç°µÄÁ´½øĞĞÁË 0 ´Î
		nt_setTask(1036,0) -- ³Í·£´ÎÊıÀÛ»ı±äÎª 0 
		-- ÔÚÕâÀï¼ÇÂ¼Ò»ÏÂÈÎÎñµÄ×ÜÊı
		nt_setTask(1044, tl_counttasklinknum(1));
		
--		Msg2Player("<color=yellow>Chu nhi v?D?T  x b?ho yªu to yªu , b gi?s?ph tiªn l l t¹c t?nhi v?u ti yÕt <color>!");
	end
	
	-- ÉèÖÃÈ¡ÏûÈÎÎñµÄ±ê¼ÇÎª²»¿ÉÒÔÈ¡Ïû
	nt_setTask(1045, 2);
	
	-- ÖØĞÂËæ»úÅÉ·¢ĞÂµÄÈÎÎñ
	SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- Ôö¼Óµ±ÌìµÄÈ¡Ïû´ÎÊı
	storm_ask2start(4)	--Storm ¿ªÊ¼ÌôÕ½
end;


-- ÌıÒ°ÛÅ½âÊÍÕû¸öÈÎÎñÁ´µÄ¹ı³ÌÓë·½·¨
function Task_Info()
	Talk(4,
		"tasklink_entence",
		" d· tÈu  ta ®©y lÇn an bµi kh¶o nghiÖm chia lµm c¸c lo¹i bÊt ®ång lo¹i h×nh tiÓu nhiÖm vô tíi kiÓm nghiÖm c¸c vŞ vâ l©m nh©n sÜ ®İch vâ thuËt cïng n¹i lùc . ",
		" d· tÈu  mçi hoµn thµnh mét lÇn nhiÖm vô ®Òu cã <color=red> t­¬ng øng t­ëng th­ëng <color> chê c¸c vŞ , vÒ phÇn cã thÓ liªn tôc ®¹t thµnh <color=red> t¸m ngµn lÇn <color> nhiÖm vô ng­êi lµ sÏ cã <color=red> ®¸ng gi¸ vui mõng thï lao <color> chê ng­¬i ",
		" d· tÈu  mµ nÕu nh­ ng­¬i ë ®©y trong ®ã bá qua mét c¸i nhiÖm vô lêi cña , lµ ®em tõ nhiÖm vô thø nhÊt b¾t ®Çu coi lµ khëi . bÊt qu¸ , ta cã lóc hÇu cßn lµ sÏ cho d­ ng­¬i hñy bá nhiÖm vô c¬ héi , kia ph¶i xem ng­¬i m×nh t¹i sao n¾m chÆc . ",
		" d· tÈu  nh­ thÕ nµo ? ng­êi tuæi trÎ , cã høng thó hay kh«ng tíi ®ãn bŞ ta c¸i nµy kh¶o nghiÖm nha ? "
		);
end


-- ¾Ü¾øÁËÒ°ÛÅµÄ¿¼ÑéÌáÒé
function Task_Exit()

	if (GetSex() == 0) then
		Say("D· tÈu  ha ha ha …… chê c«ng tö biÕt th«ng qua kh¶o nghiÖm cña ta cã nhiÒu phong phó t­ëng th­ëng sau liÒn tù nhiªn sÏ trë vÒ n÷a t×m ta liÔu . ",0);
	else
		Say("D· tÈu  ha ha ha …… chê vŞ nµy n÷ hiÖp biÕt th«ng qua kh¶o nghiÖm cña ta cã nhiÒu phong phó t­ëng th­ëng sau liÒn tù nhiªn sÏ trë vÒ n÷a t×m ta liÔu . ",0);
	end
end


-- ÔÚ×öÈÎÎñµÄ¹ı³ÌÖĞÍË³öÒ°ÛÅµÄ¶Ô»°£¬²»×÷ÈÎºÎ´¦Àí
function Task_Wait()

end


function Task_Punish()
	Say("D· tÈu  vŞ nµy "..GetPlayerSex().." cã ph¶i hay kh«ng còng qu¸ gÊp g¸p liÔu chót , ta an bµi kh¶o nghiÖm thËt khã kh¨n nh­ thÕ sao ? ng­¬i cßn lµ tr× chót trë l¹i ®i ",0);
	return 0
end




--  //////////////////////////////////////////////////////////////
-- //                     ·¢Óè½±ÀøµÄ´¦Àí                       //
--//////////////////////////////////////////////////////////////

function Task_GiveAward()

	local i
	
	local myAward
	local myLinkAward,myLoopAward
	
	local myGoodsText = ""
	local ShowText = {"","",""}

	local nTotalTaskNum = tl_counttasklinknum(1); -- »ñÈ¡µ±Ç°Íæ¼ÒÒ»¹²×öÁË¶àÉÙ´ÎÈÎÎñ
--	if (nTotalTaskNum ~= 0 and mod(nTotalTaskNum, 10) == 0 and GetTask(TKS_TASKLINK_SPITEM) ~= nTotalTaskNum) then
--		SetTask(TKS_TASKLINK_SPITEM, nTotalTaskNum);
--		local tbItem = {tbProp = {6, 1, 2374, 1, 0, 0}}
--		tbAwardTemplet:GiveAwardByList(tbItem, "seasonnpc_10task")
--		Msg2Player(format("Ch bİ m vŞ g i hi  ho yªu th yªu h li yÕt ti %d nhi v?D?T, nh nhÜ  ph thng %s!", 10, "B rng th b?c D?T"));
--	end

	--tl_print ("Cho liªn t­ëng th­ëng cïng hoµn t­ëng th­ëng ph¸t t­ëng xong ");
	local nTongValue;
	myAward, nTongValue = tl_giveplayeraward(1);
	if (not nTongValue) then
		nTongValue = 0;
	end	
	local nBeishu = greatnight_huang_event(4);
	if (nBeishu > 0) then
		nTongValue = floor(nTongValue / nBeishu);
	end;
	
	for i=1,3 do
	--	tl_print (" lÊy ®­îc kim tiÒn t­ëng th­ëng ");
		if (myAward[i][1] == 1) then
			ShowText[i] = " lÊy ®­îc "..myAward[i][9].."/3".."/"..myAward[i][2].."/SelectAward_Money"
		elseif (myAward[i][1] == 2) then
			ShowText[i] = " lÊy ®­îc "..myAward[i][9].."/4".."/"..myAward[i][2].."/SelectAward_Exp"
		elseif (myAward[i][1] == 3) then
			myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
			ShowText[i] = " lÊy ®­îc "..myAward[i][9].."/5".."/"..myGoodsText.."/mySG"
		elseif (myAward[i][1] == 4) then
			if (myAward[i][10]==1) then
				myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
				ShowText[i] = myAward[i][9].."/6".."/"..myGoodsText.."/mySG"
			elseif (myAward[i][10]==2) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Exp"
			elseif (myAward[i][10]==3) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Money"
			end
			
		elseif (myAward[i][1] == 5) then
			ShowText[i] = " lÊy ®­îc "..myAward[i][9].."/7".."/"..myAward[i][1].."/SelectAward_Cancel"
		end
		
	end
	
	tl_print(ShowText[1])
	tl_print(ShowText[2])
	tl_print(ShowText[3])
	
Prise( "D· tÈu  cùc khæ , xin/mêi vŞ nµy "..GetPlayerSex().." xem mét chót bªn nµo ®å lµ ng­¬i rÊt muèn ®İch ®©y ? ",ShowText[1],ShowText[2],ShowText[3] );
	
	--tl_print ("Ph¸t t­ëng xong ");

end



-- ÔÚÒÑ¾­È·ÈÏÁËÈÎÎñÍê³Éµ«ÊÇ»¹Î´·¢½±Ê±µÄ±äÁ¿´¦Àí£¬ÒÔ·ÀÍæ¼ÒË¢½±
function Task_AwardRecord()
	--Storm ¼Ó»ı·Ö
	local filename = tl_gettasktextID(tl_getplayertasktype())
	local tabcol = tl_gettasktablecol()
	local myTaskValue1 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue1"))
	local myTaskValue2 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue2"))
	local myMainValue = myTaskValue1 + myTaskValue2
	storm_addpoint(4, myMainValue)
	
	tl_settaskcourse(2) -- ÈÎÎñµÄ½øÕ¹³Ì¶ÈÎª2£¬¼´ÊÇ»¹Ã»ÓĞ·¢½±
	nt_setTask(1037, GetGameTime() + tonumber(GetLocalDate("%H%M%S")));
end



-- Ñ¡ÔñÁËÎïÆ·µÄ½±Àø
-- PS£ºÒòÎª¿¼ÂÇµ½ÈÎÎñÃæ°æµÄ´«Èë×Ö·û²»ÄÜ³¬¹ı 32 ¸ö£¬ËùÒÔÕâ¸ö¹ı³Ì¼òĞ´³É mySG
function mySG(myQuality,myGenre,myDetail,myParticular,myLevel,myFive)

-- ·ÀÖ¹¶à¸öÃæ°æµ¯³öÀ´Ë¢½±ÀøµÄ´¦Àí
if (tl_gettaskcourse() == 3) then
	Say("D· tÈu  ng­¬i ®· dÉn qu¸ phÇn th­ëng nga , thÕ nµo cßn muèn n÷a dÉn ®©y ? ",0);
	return
end
	--2007-09-19 Ôö¼ÓÎïÆ·½±ÀøÊ±µÄ±³°ü¿Õ¼äÅĞ¶Ï
	if (CalcFreeItemCellCount() < 5) then
		Say("D· tÈu  xin/mêi dän dÑp bäc quÇn ¸o c¸ch tö kh«ng thua kĞm 5 c¸ , sau ®ã sÏ tíi nhËn lÊy t­ëng th­ëng ",0);
		return
	end;
	
--	tl_print(" lÊy ®­îc t­ëng th­ëng vËt phÈm biªn sè "..myQuality..myGenre..myDetail..myParticular..myLevel..myGoodsFive);
	if (myQuality == 0) then
		AddItem(myGenre,myDetail,myParticular,myLevel,myFive,0,0)
		
		if (myDetail==238) or (myDetail==239) or (myDetail==240) or (myDetail==252) then
			WriteLog("[ nhiÖm vô liªn t­ëng th­ëng ghi chĞp ]"..date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." ë nhiÖm vô liªn t­ëng th­ëng trung lÊy ®­îc b¶o th¹ch mét , b¶o th¹ch lo¹i h×nh biªn sè v× "..myDetail)
		end

	else
		AddGoldItem(0,myGenre)
		AddGlobalNews("Th«ng b¸o  nhµ ch¬i "..GetName().." bëi v× hoµn thµnh nhiÖm vô ë d· tÈu chç lÊy ®­îc hoµng kim trang bŞ mét mãn ");
		WriteLog("[ nhiÖm vô liªn t­ëng th­ëng ghi chĞp ]"..date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." ë nhiÖm vô liªn t­ëng th­ëng trung lÊy ®­îc hoµng kim trang bŞ mét mãn , hoµng kim trang bŞ biªn sè v× "..myGenre)
	end
	Msg2Player("Ngµi lÊy ®­îc mét c¸i nhiÖm vô vËt phÈm t­ëng th­ëng ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--¼ÓÉÏÃÅÅÉ½±Àø
	Task_NewVersionAward()
end

-- Ñ¡ÔñÁËKim Ç®µÄ½±Àø
function SelectAward_Money(nAward)

-- ·ÀÖ¹¶à¸öÃæ°æµ¯³öÀ´Ë¢½±ÀøµÄ´¦Àí
if (tl_gettaskcourse() == 3) then
	Say("D· tÈu  ng­¬i ®· dÉn qu¸ phÇn th­ëng nga , thÕ nµo cßn muèn n÷a dÉn ®©y ? ",0);
	return
end

	Earn(nAward)
	Msg2Player("Ngµi lÊy ®­îc <color=green>"..nAward.."<color> l­îng b¹c ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	-- Èç¹û½±ÀøµÄKim Ç®ÊıÁ¿´óÓÚ 30W£¬Ôò¼ÇLOG
	if nAward>=300000 then
		WriteLog("[ nhiÖm vô liªn kim tiÒn ghi chĞp ]"..
				 date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]")..
				 "[ tr­¬ng môc ]"..GetAccount()..
				 "[ vai trß ]"..GetName()..
				 " ë nhiÖm vô liªn trung thu ®­îc <money>"..nAward.."</money> l­îng b¹c ®İch t­ëng th­ëng ");
	end;
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--¼ÓÉÏÃÅÅÉ½±Àø
	Task_NewVersionAward()
end

-- Ñ¡ÔñÁË¾­ÑéÖµµÄ½±Àø
function SelectAward_Exp(nAward)

-- ·ÀÖ¹¶à¸öÃæ°æµ¯³öÀ´Ë¢½±ÀøµÄ´¦Àí
if (tl_gettaskcourse() == 3) then
	Say("D· tÈu  ng­¬i ®· dÉn qu¸ phÇn th­ëng nga , thÕ nµo cßn muèn n÷a dÉn ®©y ? ",0);
	return
end

	tl_addPlayerExp(nAward)
	Msg2Player("Ngµi lÊy ®­îc <color=green>"..nAward.."<color> chót kinh nghiÖm trŞ gi¸ ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--¼ÓÉÏÃÅÅÉ½±Àø
	Task_NewVersionAward()
end

-- Ñ¡ÔñÔÙËæ»úÒ»´ÎµÄ½±Àø
function SelectAward_Change(nAward)

-- ·ÀÖ¹¶à¸öÃæ°æµ¯³öÀ´Ë¢½±ÀøµÄ´¦Àí
if (tl_gettaskcourse() == 3) then
	Say("D· tÈu  ng­¬i ®· dÉn qu¸ phÇn th­ëng nga , thÕ nµo cßn muèn n÷a dÉn ®©y ? ",0);
	return
end

	Msg2Player("Ngµi lÊy ®­îc ngÉu nhiªn n÷a lùa chän mét lÇn t­ëng th­ëng ®İch c¬ héi ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();

end

-- Ñ¡ÔñÁËÈ¡ÏûµÄ»ú»á
function SelectAward_Cancel(nAward)

local myCancel = 0;
local myNewCancel = GetTask(DEBUG_TASKVALUE);

	-- ·ÀÖ¹¶à¸öÃæ°æµ¯³öÀ´Ë¢½±ÀøµÄ´¦Àí
	if (tl_gettaskcourse() == 3) then
		Say("D· tÈu  ng­¬i ®· dÉn qu¸ phÇn th­ëng nga , thÕ nµo cßn muèn n÷a dÉn ®©y ? ",0);
		return
	end


	
	myCancel = tl_gettaskstate(4)
	myCancel = myCancel + 1
	
	if myNewCancel==0 then
		myNewCancel = myCancel;
	else
		myNewCancel = myNewCancel + 1;		
	end;
	
	if myNewCancel<=254 then
		-- ÔÙ´æÒ»´ÎÁíÍâµÄ±äÁ¿
		nt_setTask(DEBUG_TASKVALUE, myNewCancel);
	end;
	
	tl_settaskstate(4, myCancel);
	
	if myCancel<=254 then
		Msg2Player("Ngµi lÊy ®­îc <color=green>Ò»´ÎÈ¡ÏûÈÎÎñµÄ»ú»á<color>!");
	end;

	WriteLog("[ nhiÖm vô liªn t­ëng th­ëng ghi chĞp ]"..
			 date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n %S gi©y ]")..
			 "[ tr­¬ng môc ]"..GetAccount()..
			 "[ vai trß ]"..GetName()..
			 " ë nhiÖm vô liªn trung thu ®­îc hñy bá c¬ héi t­ëng th­ëng , tr­íc mÆt ®İch hñy bá c¬ héi v× <"..myCancel.."> lÇn . ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--¼ÓÉÏÃÅÅÉ½±Àø
	Task_NewVersionAward()
end


-- ·¢¸øÍæ¼ÒÁ´½±Àø¡¢»·½±Àø»òÕß»ÆKim ×°±¸
function PayPlayerLinkAward()

local myGolden = {2,6,11,16,21,22,26,31,39,40,42,46,51,54,56,60,61,67,71,76,81,87,92,94,96,101,106,107,115,119,121,122,126,132,136,144,145,146} -- 20 »·½±Àø»ÆKim ×°±¸µÄ±àºÅ
local nGoldenID = 0

local myTaskTimes = tl_gettaskstate(1)
local myTaskLinks = tl_gettaskstate(2)
local myTaskLoops = tl_gettaskstate(3)

local nTotalTask = tl_counttasklinknum(1);

-- ÉèÖÃÈÎÎñÍê³É´ÎÊıÅÅÃû
Ladder_NewLadder(10118, GetName(), nTotalTask, 1);

-- ÔÚÕâÀï·¢Óè¹Ì¶¨ÈÎÎñ´ÎÊıµÄ½±Àø
tl_getlinkaward(Task_AwardLink, nTotalTask);

-- Ô½ÄÏ°æÍê³É 8000 ´ÎÈÎÎñ²»×öÈÎºÎ´¦Àí
if (nTotalTask == 8000) then

--	nGoldenID = myGolden[random(getn(myGolden))]
	
	-- Âú 8000 ´ÎÈÎÎñ½±Àø 1E Kim Ç®
	Earn(100000000);
	
--	AddGoldItem( 0, nGoldenID )
	
	WriteLog("[ nhiÖm vô liªn t­ëng th­ëng ghi chĞp ]"..date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." ë nhiÖm vô liªn t­ëng th­ëng trung bëi v× hoµn thµnh 8000 lÇn nhiÖm vô lÊy ®­îc hoµng kim trang bŞ mét mãn , hoµng kim trang bŞ biªn sè v× "..nGoldenID)
	
	AddGlobalCountNews("Th«ng b¸o  nhµ ch¬i "..GetName().." bëi v× hoµn thµnh 8000 lÇn nhiÖm vô ë d· tÈu chç lÊy ®­îc m«n ph¸i ®¹i hoµng kim trang bŞ mét mãn cïng kiÕm hiÖp tiÒn mét øc hai ", 3);
	
	for i=1,3 do
		Msg2Player("Chóc mõng ng­¬i  bëi v× ng­¬i liªn tôc hoµn thµnh 8000 lÇn nhiÖm vô cho nªn lÊy ®­îc mét cùc phÈm t­ëng th­ëng cïng mét øc hai kiÕm hiÖp tiÒn ");
	end

	return
	
end

storm_ask2start(4, 1)	--Storm ¿ªÊ¼ÌôÕ½

end


--/////ÈÎÎñÁ´µÄÎŞ·¨½øĞĞÏÂÈ¥µÄ BUG µÄĞŞ²¹/////

function _TaskLinkDebug()

	if (nt_getTask(1030)==0) and (tl_gettaskcourse()==1) then
		nt_setTask(1030,2);
		tl_savetalkvalue(1,2);
		tl_savetalkvalue(2,2);
		tl_savetalkvalue(3,2);
		tl_savetalkvalue(4,2);
		tl_savetalkvalue(5,2);
		tl_savetalkvalue(6,2);
	end

end


--  ////////////////////////////////////////////////
-- ///// ÅĞ¶ÏÍæ¼ÒÊÇ·ñË¢È¡Ïû»ú»áµÄ¹ı³Ì /////////////
--////////////////////////////////////////////////

function _CancelTaskDebug()

local nOrgTask = GetTask(DEBUG_TASKVALUE);
local nDecTask = tl_gettaskstate(4);
local nDiff    = 0;

	if nOrgTask==nDecTask or nOrgTask==0 then
		return 1;
	else
		WriteLog("[ nhiÖm vô liªn bŞ lçi ghi chĞp ]"..
				 date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n %S gi©y ]")..
				 "[ tr­¬ng môc ]"..GetAccount()..
				 "[ vai trß ]"..GetName()..
				 " nhiÖm vô hñy bá c¬ héi kh«ng ®Òu chê , tr­íc mÆt hñy bá c¬ héi v× <"..nDecTask.."> , bŞ ph©n ®İch hñy bá c¬ héi v× <"..nOrgTask.."> . ");
		return 0;
	end;

end;

--  /////Êä³öÈÎÎñÈ¡ÏûÊ±µÄ LOG //////////////////////
-- ///// ´«ÈëµÄ²ÎÊıÎªÈÎÎñ´ÎÊıºÍÈ¡ÏûÈÎÎñµÄ»ú»á /////
--////////////////////////////////////////////////

function _WriteCancelLog(nType, nTime, nCancel)

	if nType==1 then
		WriteLog("[ nhiÖm vô liªn hñy bá ghi chĞp ]"..date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." ë nhiÖm vô sè lÇn v× "..nTime.." hñy bá c¬ héi cßn thõa l¹i "..nCancel.." lóc hñy bá mét lÇn nhiÖm vô . ");
	else
		WriteLog("[ nhiÖm vô liªn hñy bá ghi chĞp ]"..date("[%y n¨m %m th¸ng %d ngµy %H lóc %M ph©n ]").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." ë nhiÖm vô sè lÇn v× "..nTime.." lóc dïng 100 tê x· t¾c ®å hñy bá mét lÇn nhiÖm vô . ");
	end;

end;
