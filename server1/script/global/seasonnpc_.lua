-- Ұ���������ű�
-- Edited by peres
-- 2004/12/24 ʥ����ǰҹ

IncludeLib("FILESYS");
IncludeLib("RELAYLADDER");	--���а�
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\newtask\\tasklink\\tasklink_award.lua"); -- �������Ľ���ͷ�ļ�
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--Storm �����Ľ�������
function storm_goon_start(gameid, b_nonext)
	
	local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
		-- ÿ������ƴ��� +1
		nNum = nNum + 1;
		SetTask(ID_TASKLINK_LIMITNUM, nNum);
		
	if b_nonext then return end
	tl_dealtask()
	Task_MainDialog()
end

-- ��������Ƿ��Ѿ�����ÿ�������
function checkTask_Limit()
	
-- ÿ�����ƴ����Ĵ���
local nNowDate = tonumber(GetLocalDate("%y%m%d"));
local nOldDate = GetTask(ID_TASKLINK_LIMITDATE);
local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
	if nNowDate~=nOldDate then
		
		SetTask(ID_TASKLINK_LIMITDATE, tonumber(GetLocalDate("%y%m%d")) );
		SetTask(ID_TASKLINK_LIMITNUM, 0);
		SetTask(ID_TASKLINK_LIMITCancelCount, 0);
		return 1;
		
	else
		-- 40 �ε�����
		if nNum>=40 then
			Say("Ha ha , m�i ng�y nhi�m v� t�ng s� kh�ng th� v��t qua 40 l�n . ", 0);
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


-- ���������ڴ����
Task_BuyGoods = AssignValue(Task_BuyGoods,TL_BUYGOODS)
Task_FindGoods = AssignValue(Task_FindGoods,TL_FINDGOODS)
Task_ShowGoods = AssignValue(Task_ShowGoods,TL_SHOWGOODS)
Task_FindMaps = AssignValue(Task_FindMaps,TL_FINDMAPS)
Task_UpGround = AssignValue(Task_UpGround,TL_UPGROUND)
Task_WorldMaps = AssignValue(Task_WorldMaps,TL_WORLDMAPS)

Task_MainTaskLink = AssignValue_TaskLink(Task_MainTaskLink,TL_LEVELLINK)
Task_MainLevelRate = AssignValue_TaskRate(Task_MainLevelRate,TL_MAINTASKLEVEL)

-- ���콱���ڴ����
Task_AwardBasic = AssignValue_Award(Task_AwardBasic,TL_AWARDBASIC)

-- ������ɴ����Ľ���
Task_AwardLink = AssignValue_LinkAward(TL_AWARDLINK)

Task_AwardLoop = AssignValue_Award(Task_AwardLoop,TL_AWARDLOOP)

-- ����Ի������ڴ����
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
	
	-- ÿ����ɵ�30�����⽱��
	if (nNum - nCancelNum) == 30 then
		Msg2Player("Ch�c m�ng ng��i , ho�n th�nh 30 c� d� t�u nhi�m v� , ��t ���c ng�ch ngo�i t��ng th��ng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 30000000}, "��t ���c ng�ch ngo�i t��ng th��ng ")
	end
	
	-- ÿ����ɵ�40�����⽱��
	if (nNum == 40 and nCancelNum) == 0 then
		Msg2Player("Ch�c m�ng ng��i , ho�n th�nh 40 c� d� t�u nhi�m v� , ��t ���c ng�ch ngo�i t��ng th��ng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 100000000}, "��t ���c ng�ch ngo�i t��ng th��ng ")
	end	
	
end


function main()

	--�������ڻ�ڼ�Ի���
--	local nDate = tonumber(GetLocalDate("%y%m%d"));
--	if (nDate >= 60808 and nDate <= 60815) then
--		local tab_Content = {
--			"Xem c nhi v?g? l kh t�n g/tasklink_entence",
--		}
--		tinsert(tab_Content, "Ta mu l�p l m vg Li y�t Hoa/menglanjie");
--		tinsert(tab_Content, "R �ch kh ta /Task_Wait");
--		Say("M n nay chi kh�a tranh tri th�ch mi y�t , d th th l�p g kh? Phng trng Thi ph� L t?mu l�p t?ch ch�m th?trai m v� g L?Vu Lan  m ngi hng ch l�u gi ph l�u y y�t bh", getn(tab_Content), tab_Content);
--		return
--	end;
	
	tasklink_entence();
end;

function menglanjie()
	if (GetExtPoint(0) <= 0 or GetLevel() < 30) then
		Say("Xin l! Ch?c?ngi ch b�i t?c <color=red>30,  n th?color> m c?th?tham gia ho ng n ph� ", 0)
		return 
	end;
	local tab_Content = {
		"Ta mu l�p k vg Kim Li y�t Hoa [c 9 Kim Li y�t Hoa]/process(1)",
		"Ta mu l�p h th y�u h vg M nhu�n Li y�t Hoa [c 9 M nhu�n Li y�t Hoa]/process(2)",
		"Ta mu l�p h th y�u h vg Th Li y�t Hoa [c 9 Th Li y�t Hoa]/process(3)",
		"Ta mu l�p h th y�u h vg H Li y�t Hoa [c 9 H Li y�t Hoa]/process(4)",
		"Ta mu l�p h th y�u h vg Th?Li y�t Hoa [c 9 Th?Li y�t Hoa]/process(5)",
		"Ch?n th t�n g ch l�u th quy�t !/Task_Wait"
	}
	Say("Ch?c ngi  thu th  s?Li y�t Hoa v?<color=yellow>"..MAKING_COST.."<color> lng ta s?gi ngi k vg hoa tuy khi�m p. Nhg l ? m ng ph� ch?c?th?k  2 vg Li y�t Hoa cg thu nhu�n t v�n h m?th quy�t .", getn(tab_Content), tab_Content);
end;

--{name, product}
MAKING_COST = 10000;
MAKING_COUNT = 9;
tab_Flower = {
	{1126, "Kim ", 1131, 1760, 1761}, {1127, "M�c ", 1132, 1762, 1763}, {1128, "N��c ", 1133, 1764, 1765}, {1129, " l�a ", 1134, 1766, 1767}, {1130, "��t ", 1135, 1768, 1769}
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
	
	Say("Mu l�p l 1 vg <color=yellow>"..tab_Flower[nIdx][2].." Li y�t Hoa<color> c c?9 <color=yellow>"..tab_Flower[nIdx][2].."Li y�t Hoa<color>. Ngi x nh l ch?", 2, "ng! Xin l b tr?t nh�ng !/make_round("..nIndex..")", "Ta s?quay l t�c sau!/Task_Wait");
end;

function make_round(nIdx)
	if (GetCash() < MAKING_COST) then
		Say("Xin t  10000 lng r m�nh h quay l t�c ! Ta ?y ch?", 1, " th quy�t ! Ta  l th �p ti th�ch !/Task_Wait");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(6,1,tab_Flower[nIdx][1],-1);
	if (nCount < 9) then
		Say("Ngi hh nh?ch  <color=yellow>"..tab_Flower[nIdx][2].." Li y�t Hoa<color=yellow>. Ch  9 <color=yellow>"..tab_Flower[nIdx][2].." Li y�t Hoa<color> th?ta kh t�n g th?gi ngi k vg "..tab_Flower[nIdx][2].." Li y�t Hoa ho y�u ", 1, " ta  chu oa b?!/Task_Wait");
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate ~= GetTask(tab_Flower[nIdx][4])) then
		SetTask(tab_Flower[nIdx][4], nDate);
		SetTask(tab_Flower[nIdx][5], 0);
	end;
	
	local nTimes = GetTask(tab_Flower[nIdx][5]);
	if (nTimes >= 2) then
		Say(tab_Flower[nIdx][2].."H nay  k th y�u h c t�n g 2 vg r m�nh ! Mai h n nh?", 0)
		return
	end;
	
	Pay(MAKING_COST);
	ConsumeEquiproomItem(9, 6, 1, tab_Flower[nIdx][1], -1);
	SetTask(tab_Flower[nIdx][5], nTimes + 1);
	AddItem(6, 1, tab_Flower[nIdx][3], 1, 0, 0, 0);
	Say("Vg "..tab_Flower[nIdx][2].." Li y�t Hoa c ngi  k xong. H mang n?n ch?L?Quan !", 1, "Nh nh� vg hoa/Task_Wait");
	Msg2Player("B nh nh�  m"..tab_Flower[nIdx][2].." Li y�t Hoa ho y�u ");
end;
    
-- �����������
function tasklink_entence()

_TaskLinkDebug() -- �����������޷�������ȥ�� BUG �޸�

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���

local myCountLinks
local myCountTimes

local myCanceled = nt_getTask(1036)
local myTaskTime = GetGameTime() -- ��ȡ��Ϸʱ�䣬�����ж�����Ƿ񱻷�
local n = myTaskTime - nt_getTask(1029)
local myTaskInfo = ""


-- �����ҵ�ǰ��״̬Ϊ��δ�����Ļ��������·���
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
		-- �����û�п�ʼҰ�ŵ��������Ļ�
--		Say("V?n ph� "..GetPlayerSex().."xem ra  b t�n ba giang h? m th �ch gian d nh�ng r m�nh nh? c?mu l�p tham gia kh nghi nhi v?li y�t t c ta kh t�n g?",3," th quy�t ! Ta kh t�n g tin c?nhi v?n k� l kh?d? ta/Task_Confirm","Ta mu l�p bi kh nghi c ngi n c?n dung ra sao/Task_Info","Ta b nh� r m�nh , kh t�n g rh ng m�nh t g c�t v t�n g/Task_Exit");
		Say("D� t�u  v� n�y "..GetPlayerSex().." xem ra x�ng x�o giang h� c�ng c� m�t �o�n th�i gian , c� th� hay kh�ng c� h�ng th� t�i tham gia ta <color=yellow>� ho�n ho�n li�n li�n t��ng x�ng ��i , t�ng t�ng �i�t �i�t l�y h�u l� �<color> ��ch nhi�m v� kh�o nghi�m ��y ? ",3,"H�o nha , ta c�ng kh�ng tin c� c�i g� nhi�m v� c� th� kh� ���c c�ng ta /Task_Confirm"," ta mu�n bi�t ng��i n�i kh�o nghi�m l� m�t h�nh d�ng g� /Task_Info","Ta c�n c� chuy�n , kh�ng r�nh c�ng ng��i � ��y r�i r�nh k�o /Task_Exit");
	end
	
	if (tl_gettaskcourse() == 3) then

		-- ����Ƿ񳬹�ÿ�������
		if checkTask_Limit()~=1 then return end;
	
		myCountLinks = tl_counttasklinknum(2)
		myCountTimes = tl_counttasklinknum(1)
		
--		Say(":<enter>V?"..GetPlayerSex().." ho y�u th y�u h <color=yellow>"..myCountTimes.."<color>, nhi v?n ph� ng ph� h nay c?th?th hi l t�c <color=yellow>"..(40 - GetTask(ID_TASKLINK_LIMITNUM)).."<color>, ngi c?mu l�p l n kh t�n g?",2,"g nhi y�t , mau cho ta bi nhi v?ti theo l?g?/Task_TaskProcess"," ta ngh?ng b�i m l ! Ta b nh� r m�nh /Task_Wait");
		Say("D� t�u <enter> v� n�y "..GetPlayerSex().." �� ho�n th�nh <color=yellow>"..myCountTimes.."<color> l�n ta ��a cho nhi�m v� c�a ng��i , kh�ng bi�t ng��i c� c�n hay kh�ng h�ng th� ti�p t�c ti�p theo l�m ti�p ��y ? ",2,"D� nhi�n , mau �� cho ta bi�t ng��i/c�i k� ti�p nhi�m v� l� c�i g� /Task_TaskProcess","H�y �� cho ta ngh� m�t l�t m� �i , ta c�n kh�c bi�t chuy�n c�a t�nh /Task_Wait");
	elseif (tl_gettaskcourse() == 1) then
		Task_MainDialog()
	end

end

-- ��Ӧ��Ұ�ŵĿ��飬��ʽ��ʼ������
function Task_Confirm()

local myTaskID

-- ���������������ֵ��1020 �ű���Ϊ������״̬ר�ñ��������е��ĸ��ֽڷֱ���Ϊ��| �ٴ��� | ������ | �ۻ��� | ��ȡ��ʣ����� |

tl_settaskstate(1,0) -- ���ڽ��е�һ������
tl_settaskstate(2,tl_getfirstlink()) -- ���ڽ��е�һ������
tl_settaskstate(3,tl_getfirstloop()) -- ���ڽ��е�һ������

tl_settaskstate(4,0) -- ʣ�� 0 ��ȡ������Ļ���
nt_setTask(DEBUG_TASKVALUE, 0);

tl_settaskstate(6,0)

storm_ask2start(4)	--Storm ��ʼ��ս
tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuDaTau")
--tbLog:PlayerActionLog("Ch� y�u ��c �i�m ","NhanNhiemVuDaTau")
end


-- ������һ������
function Task_TaskProcess()

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���


-- ����Ƿ񳬹�ÿ�������
if checkTask_Limit()~=1 then return end;

tl_taskprocess() -- ����ִ����һ�ֺ���

storm_goon_start()	--Storm�ָ�

end


-- ����������Ҫ�������
function Task_MainDialog()

local myTaskInfo = tl_gettaskinfo() -- �������ϸ��Ϣ
local myTaskTotalNum = tl_counttasklinknum(1) + 1; -- ���������ͳ��
local myTitleText = "";

if (myTaskInfo == nil) then
	myTaskInfo = ""
end

-- ��������״̬Ϊ�Ѿ���������δ���
tl_settaskcourse(1)


if myTaskTotalNum==0 or myTaskTotalNum==nil then
	myTitleText = " d� t�u <enter><enter>"..myTaskInfo;
else
	myTitleText = " d� t�u <enter><enter> ��y l� th� <color=green>"..myTaskTotalNum.."<color> c� nhi�m v� , "..myTaskInfo;
end;

Say(myTitleText,
	4,
--	"Bi r m�nh ,  ta ho y�u th y�u h nhi v?xong m l t�c t ngi/Task_Wait",
--	"ta  ho y�u th y�u h nhi v?l n ph� , xin h ki tra l t�c !/Task_Accept",
--	"Nhi v?l n ph� kh?qu? Ta mu l�p h b?kh t�n g l n/Task_CancelConfirm",
--	"Ta mu l�p bi kh nghi c ngi n c?n dung ra sao/Task_Info"
	" bi�t , ch� ta ho�n th�nh nhi�m v� sau l�i t�i t�m ng��i /Task_Wait",
	" ta �� ho�n th�nh nhi�m v� l�n n�y , m�i/xin ng��i nghi�m thu �i /Task_Accept",
	" nhi�m v� l�n n�y c�ng qu� kh� kh�n , ta mu�n h�y b� r�i kh�ng l�m /Task_CancelConfirm",
	" ta mu�n bi�t ng��i n�i kh�o nghi�m l� m�t h�nh d�ng g� /Task_Info"
	);

-- ����ȡ������ı��Ϊ����ȡ��
nt_setTask(1045, 1);

end


-- ȡ������ʱ�������һ��ȷ�ϵĻ���
function Task_CancelConfirm()

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���

local myCountTimes = tl_counttasklinknum(1);  -- ��ҽ��е���������

if (myTaskCancel==0) then
	Say("D� t�u  ng�i b�y gi� m�t l�n h�y b� ��ch c� h�i c�ng kh�ng c� , c� nh� v�y ng��i li�n ph�i b�t ��u l�i t� ��u �c  h�n n�a tr��c ng��i ��ch t��ng th��ng t�ch l�y s� l�n n�a b�t ��u ��m h�t . ",3,"��ng v�y , ta ch�nh l� kh�ng mu�n l�m c�i n�y qu� nhi�m v� /Task_NormalCancel","Ta mu�n d�ng 100 t� n�i s�ng x� t�c �� m�nh v�n t�i l�y ti�u nhi�m v� l�n n�y /Task_Cancel(2)"," �/d� �� v�y h�y �� cho ta suy ngh� l�i m�t ch�t �i /Task_Wait");
else
	Say("D� t�u  ng�i b�y gi� c�n c� "..myTaskCancel.." l�n h�y b� nhi�m v� c� h�i , ng��i nh�t ��nh ph�i h�y b� nhi�m v� l�n n�y sao ? ",2,"��ng v�y , ta ch�nh l� kh�ng mu�n l�m c�i n�y qu� nhi�m v� /Task_Cancel(1)"," �/d� �� v�y h�y �� cho ta suy ngh� l�i m�t ch�t �i /Task_Wait");
end


--if (myTaskCancel==0) then
--	
--	Say("Hi t t�c b kh t�n g c?c?h n k�  h b?nhi v? b ch?c?th?l l t�c t?u th quy�t ! ng th �ch ph thng t chu h l c b l b� trc s? t v�n h l t�c t?u.",
--		3,
--		"ng, ta kh t�n g mu l�p l nhi v?qu?qu n ph� u/Task_NormalCancel",
--		"Ta mu l�p s?dg 100 mh s H?X?T l�ng  h b?nhi v?l n ph� /Task_Cancel(2)",
--		"Uhm!  ta suy ngh?l t�c /Task_Wait");
--	
--else
--	
--	Say("Hi t t�c b c"..myTaskCancel.." s?l c?h h b?nhi v? b x nh h b?nhi v?l n ph� ng kh t�n g?",
--		2,
--		"ng, ta kh t�n g mu l�p l nhi v?qu?qu n ph� u/Task_Cancel(1)",
--		"Uhm!  ta suy ngh?l t�c /Task_Wait");
--	
--end

end


-- ������ȡ����ʽ��ȷ��һ��
function Task_NormalCancel()

Say("D� t�u  ng��i ngh� t�t l�m th�t mu�n l�y ti�u nhi�m v� l�n n�y sao ? ",2,"Kh�ng mu�n la toa li�u , ta ch�nh l� kh�ng mu�n l�m c�i n�y qu� nhi�m v� /Task_Cancel(1)","V�y hay l� �� cho ta suy ngh� l�i m�t ch�t �i /Task_Wait");

--Say("B suy ngh?k?h b?nhi v?l n ph� ng kh t�n g?",2,"ng l quy�t th quy�t n! ta kh t�n g mu l�p l nhi v?qu?qu n ph� u/Task_Cancel(1)","Th quy�t  ta suy ngh?l t�c !/Task_Wait");

end;


-- 1000 �����ϵ�����ȡ��ʱ��Ҫ��ˮ��
function Task_TotalCancel()
	GiveItemUI("D� t�u nhi�m v� 1000 l�n tr� l�n h�y b� , c�n cung c�p n��c bi�c tinh m�t vi�n , xin/m�i �em th�y tinh ��t � ph�a d��i v�t ph�m khu�ng trung ", "Task_TotalCancel_Main", "Task_Wait");
end;


function Task_TotalCancel_Main(nCount)
	
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
	local nIndex = 0;
	
	if nCount~=1 then
		Say("D� t�u  ng��i cho ta kh�ng ph�i l� m�u xanh l� c�y <color=yellow>1 c� <color> th�y tinh !", 0);
		return
	end;
	
	nIndex = GetGiveItemUnit(1);
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	
	if nGenre==4 and nDetail==240 and nParticular==1 then
		Task_Cancel(1);  -- ȫ��ȡ��
	else
		Say("D� t�u : ng��i cho ta kh�ng ph�i l� m�u xanh l� c�y <color=yellow>1 c� <color> th�y tinh !", 0);
		return		
	end;
	
end;


-- ��ʾ��ҵ�ǰ�����������еĳ̶ȣ������ã�
function Task_ProcessInfo()

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���

local myTaskType = tl_getplayertasktype()

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)

local myCountTimes = tl_counttasklinknum(1)

-- local myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
-- local myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	

-- local myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1))

-- local myMainValueText1 = " ng��i tr��c m�t ��ch nhi�m v� v�t ph�m gi� tr� v� : "..myTaskValue1.." nhi�m v� gi� tr� v� : "..myTaskValue2.."<enter>".." nhi�m v� c�a ng��i b�y gi� t�ng gi� tr� l��ng v� : "..myMainValue

--	Say("D� t�u  ng��i b�y gi� ti�n h�nh ���c li�u th� "..myTaskLoops.." ho�n trung ��ch th� "..myTaskLinks.." li�n trung ��ch th� "..myTaskTimes.." l�n . <enter> ng��i li�n t�c ti�n h�nh ��ch s� l�n v� "..tl_counttasklinknum(1).." l�n <enter> ng��i li�n t�c ti�n h�nh ��ch li�n ��m v� "..tl_counttasklinknum(2).." li�n <enter>"..myMainValueText1,0);

--	Say("Hi t t�c ngi  ho y�u th y�u h <color=yellow>"..myCountTimes.."<color> s?l nhi v?ta giao cho, c c?g l��ng g h nh?", 0);
	Say("D� t�u  ng��i b�y gi� �� ho�n th�nh <color=yellow>"..myCountTimes.."<color> l�n ta ��a cho nhi�m v� c�a ng��i , k�nh xin ti�p t�c c� g�ng nga ", 0);

end


-- ����Ѿ��������ǰ����Ұ������
function Task_Accept()
	--2007-09-19 ������Ʒ����ʱ�ı����ռ��ж�
	if (CalcFreeItemCellCount() < 5) then
		Say("D� t�u  xin/m�i d�n d�p t�i x�ch c�a ng��i ph�c kh�ng thua k�m 5 c� c�ch t� , sau �� t�i nh�n l�y ph�n th��ng ",0);
		return
	end;
local myTaskType = tl_getplayertasktype()

	if (myTaskType == 1) then
		GiveItemUI("T�m ki�m v�t ph�m nhi�m v� ","D� t�u  nga ? ta cho ng��i �i mua �� ng��i mua cho ta �� t�i ch�a ? ","Task_Accept_01","Task_Wait");
	elseif (myTaskType == 2) then
		GiveItemUI("Mua v�t ph�m nhi�m v� ","D� t�u  nga ? ta cho ng��i �i t�m �� ng��i cho ta t�m ���c sao ? ","Task_Accept_02","Task_Wait");
	elseif (myTaskType == 3) then
		GiveItemUI("V�t ph�m bi�u di�n nhi�m v� ","D� t�u  nga ? ta cho ng��i �i t�m �� ng��i cho ta t�m ���c sao ? ","Task_Accept_03","Task_Wait");
	elseif (myTaskType == 4) then
		Task_Accept_04()
	elseif (myTaskType == 5) then
		Task_Accept_05()
	elseif (myTaskType == 6) then
		Task_Accept_06()
	else -- �쳣����
		Say("D� t�u  ng��i b�y gi� l�m �� c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end

end


-- ����һ���жϴ���
function Task_Accept_01(nCount)
local myTaskGoods
local ItemGenre,DetailType,ParticularType,Level,nSeries,Luck

if ( nCount > 1 ) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i m�t l�n �� nhi�u nh� v�y �� �i v�o ta l� th�y con m�t b�t h� ti�p nha , c�n l� t� t� �i �i ��",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i �� th�t �� c� �� c� � b�n trong kh�ng ? c� ph�i hay kh�ng ta l�o Hoa li�u m�t nha ? ",0);
	return 0
end

	ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
--	magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
	myTaskGoods = {ItemGenre,DetailType,ParticularType,nSeries,Level}
	
--	tl_print ("D� t�u ki�m nghi�m li�u v�t ph�m "..ItemGenre..DetailType..ParticularType..nSeries..Level)
	
	if (tl_checktask(myTaskGoods) == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- ɾ��������ϵ���Ʒ
		Task_AwardRecord()
		Task_GiveAward()
		-- ��������
	else
		Say("D� t�u  ng��i b�y gi� ��a cho ��ch �� c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end
end


-- ��������жϴ���
function Task_Accept_02(nCount)

local myTaskGoods
local ItemGenre, DetailType, ParticularType, Level, nSeries, Luck
local magictype,p1,p2,p3
local i,n,m = 0,0,0

if ( nCount > 1 ) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i m�t l�n �� nhi�u nh� v�y �� �i v�o ta l� th�y con m�t b�t h� ti�p nha , c�n l� t� t� �i �i ��",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i �� th�t �� c� �� c� � b�n trong kh�ng ? c� ph�i hay kh�ng ta l�o Hoa li�u m�t nha ? ",0);
	return 0
end

	for i=1,6 do
		ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
		magictype , p1, p2, p3 = GetItemMagicAttrib(GetGiveItemUnit(1), i)
		myTaskGoods = {ItemGenre,DetailType,ParticularType,Level,nSeries,magictype,p1,p2,p3}
--		tl_print("Ki�m nghi�m li�u ma ph�p thu�c t�nh "..i.." :".." ma ph�p ID v� : "..magictype.." ma ph�p tham s� 1 v� : "..p1.." ma ph�p tham s� 2 v� : "..p2.." ma ph�p tham s� 3 v� : "..p3);
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end
	
	if (m == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- ɾ��������ϵ���Ʒ
		Task_AwardRecord()
		Task_GiveAward()
	else
		Say("D� t�u  ng��i b�y gi� ��a cho ��ch �� c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end
	
end


-- ���������жϴ���
function Task_Accept_03(nCount)

local myTaskGoods
local magictype,p1,p2,p3
local i,n,m = 0,0,0


if ( nCount > 1 ) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i m�t l�n �� nhi�u nh� v�y �� �i v�o ta l� th�y con m�t b�t h� ti�p nha , c�n l� t� t� �i �i ��",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t�u  v� n�y "..GetPlayerSex().." , ng��i �� th�t �� c� �� c� � b�n trong kh�ng ? c� ph�i hay kh�ng ta l�o Hoa li�u m�t nha ? ",0);
	return 0
end

	for i=1,6 do -- ѭ���������е�ħ�����Կ����Ƿ��к��ʵ�
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
		-- ��������
	else
		Say("D� t�u  ng��i b�y gi� ��a cho ��ch �� c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end
	
end


-- �����ĵ��жϴ���
function Task_Accept_04()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- ��������
	else
		Say("D� t�u  ng��i b�y gi� chuy�n l�m c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end
	
end


-- ��������жϴ���
function Task_Accept_05()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- ��������
	else
		Say("D� t�u  ng��i b�y gi� chuy�n l�m c�n kh�ng c� ��t t�i y�u c�u c�a ta nga , c�n l� m�i/xin ng��i c� g�ng n�a �i ",0);
	end
	
end



-- ���������жϴ���
function Task_Accept_06()
	
	if (tl_checktask()==1) then
		Task_AwardRecord()
		Task_GiveAward()
		return 1
	else
		Say("D� t�u  ha ha ha �� v� n�y "..GetPlayerSex().." , m�t tuy b�t t�i , nh�ng c�ng hi�u tr�n giang h� n�i l� m�t tin/th� ch� , ng��i c�ng c�n kh�ng c� thu t�p ho�n ta mu�n c�u n�i s�ng x� t�c �� m�nh v�n th� n�o li�n mu�n t�i l�nh th��ng ��y ? ",0);
		return 0
	end

end



-- ���ѡ��ȡ������Ĵ���
-- ������� nType��ȡ������ķ�����1Ϊ��ȡ��������ȡ����2Ϊ�� 100 ��ɽ�����ͼ��Ƭ��ȡ��
function Task_Cancel(nType)

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���
local myCanceled = nt_getTask(1036) -- ����Ѿ�����ȡ���˶��ٴ�
local myMapNum = nt_getTask(1027) -- ������������ж��ٸ�ɽ�����ͼ��Ƭ

local myNewCancel = GetTask(DEBUG_TASKVALUE);  -- ���ݵ�ȡ������

local nTotalTaskNum = tl_counttasklinknum(1); -- ��ȡ��ǰ���һ�����˶��ٴ�����

-- ������Ǵ����������״̬�����ܽ������µ�ȡ������
if nt_getTask(1045)~=1 then
	return
end;

-- �ж��Ƿ����ˢȡ���������Ϊ
if _CancelTaskDebug()~=1 then
	Say("D� t�u  �/d� �� ng��i tu�i tr� , gi�ng nh� ng��i �� kh�ng c� h�y b� c� h�i nga ", 0);
	return
end;

-- ����Ƿ񳬹�ÿ�������
if checkTask_Limit()~=1 then return end;

	if (nType==2) then
		if (myMapNum>=100) then
			myMapNum = myMapNum - 100;
			nt_setTask(1027, myMapNum);
			myTaskCancel = myTaskCancel + 1;
			Msg2Player("Ng�i s� d�ng 100 t� n�i s�ng x� t�c �� m�nh v�n t�i l�y ti�u m�t l�n nhi�m v� ");
			Msg2Player("Ng�i b�y gi� n�i s�ng x� t�c �� m�nh v�n c�n l�i "..myMapNum.." t� ");
		else
			Say("D� t�u  ng��i �� ng��i �� ng��i th�t mang c� <color=yellow>100<color> t� n�i s�ng x� t�c �� m�nh v�n t�i sao ? ta kh�ng c� nh�n hoa m�t �i ? ",0);
			return
		end;
	end;

	if (myTaskTimes == 0) and (myTaskLinks == tl_getfirstlink()) then
	
		if (myTaskCancel == 0) then
		
			myCanceled = myCanceled + 1
			nt_setTask(1036,myCanceled)
	
			if ( myCanceled > 2) then -- �����������ڳ���ȡ��������������������
				myCanceled = 10	
				nt_setTask(1036,myCanceled)
				nt_setTask(1029,GetGameTime())
				Task_Punish()
				
				return
				
			end
			
		end
		
		-- ��������ɷ��µ�����
		SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- ���ӵ����ȡ������
		storm_ask2start(4)	--Storm ��ʼ��ս
		
		return
		
	end

	if (myTaskCancel >= 1) then -- �����һ��л���ȡ���Ļ�����������ǰ�ȼ�������
	
		-- д��ȡ������ʱ�� LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
		
		myTaskCancel = myTaskCancel - 1
		
		tl_settaskstate(4,myTaskCancel)
		
		nt_setTask(DEBUG_TASKVALUE, myTaskCancel);
			
	else
		-- д��ȡ������ʱ�� LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
	
		tl_settaskstate(1,0) -- ���ڽ��е�һ������
		tl_settaskstate(2,tl_getfirstlink()) -- ���ڽ��е�һ������
		tl_settaskstate(3,0) -- �ӵ� 0 ����ʼ
		
		tl_settaskstate(4,0) -- ʣ�� 0 ��ȡ������Ļ���
		nt_setTask(DEBUG_TASKVALUE, 0);
		
		tl_settaskstate(6,0) -- ��ǰ���������� 0 ��
		nt_setTask(1036,0) -- �ͷ������ۻ���Ϊ 0 
		-- �������¼һ�����������
		nt_setTask(1044, tl_counttasklinknum(1));
		
--		Msg2Player("<color=yellow>Chu nhi v?D?T  x b?ho y�u to y�u , b gi?s?ph ti�n l l t�c t?nhi v?u ti y�t <color>!");
	end
	
	-- ����ȡ������ı��Ϊ������ȡ��
	nt_setTask(1045, 2);
	
	-- ��������ɷ��µ�����
	SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- ���ӵ����ȡ������
	storm_ask2start(4)	--Storm ��ʼ��ս
end;


-- ��Ұ�Ž��������������Ĺ����뷽��
function Task_Info()
	Talk(4,
		"tasklink_entence",
		" d� t�u  ta ��y l�n an b�i kh�o nghi�m chia l�m c�c lo�i b�t ��ng lo�i h�nh ti�u nhi�m v� t�i ki�m nghi�m c�c v� v� l�m nh�n s� ��ch v� thu�t c�ng n�i l�c . ",
		" d� t�u  m�i ho�n th�nh m�t l�n nhi�m v� ��u c� <color=red> t��ng �ng t��ng th��ng <color> ch� c�c v� , v� ph�n c� th� li�n t�c ��t th�nh <color=red> t�m ng�n l�n <color> nhi�m v� ng��i l� s� c� <color=red> ��ng gi� vui m�ng th� lao <color> ch� ng��i ",
		" d� t�u  m� n�u nh� ng��i � ��y trong �� b� qua m�t c�i nhi�m v� l�i c�a , l� �em t� nhi�m v� th� nh�t b�t ��u coi l� kh�i . b�t qu� , ta c� l�c h�u c�n l� s� cho d� ng��i h�y b� nhi�m v� c� h�i , kia ph�i xem ng��i m�nh t�i sao n�m ch�c . ",
		" d� t�u  nh� th� n�o ? ng��i tu�i tr� , c� h�ng th� hay kh�ng t�i ��n b� ta c�i n�y kh�o nghi�m nha ? "
		);
end


-- �ܾ���Ұ�ŵĿ�������
function Task_Exit()

	if (GetSex() == 0) then
		Say("D� t�u  ha ha ha �� ch� c�ng t� bi�t th�ng qua kh�o nghi�m c�a ta c� nhi�u phong ph� t��ng th��ng sau li�n t� nhi�n s� tr� v� n�a t�m ta li�u . ",0);
	else
		Say("D� t�u  ha ha ha �� ch� v� n�y n� hi�p bi�t th�ng qua kh�o nghi�m c�a ta c� nhi�u phong ph� t��ng th��ng sau li�n t� nhi�n s� tr� v� n�a t�m ta li�u . ",0);
	end
end


-- ��������Ĺ������˳�Ұ�ŵĶԻ��������κδ���
function Task_Wait()

end


function Task_Punish()
	Say("D� t�u  v� n�y "..GetPlayerSex().." c� ph�i hay kh�ng c�ng qu� g�p g�p li�u ch�t , ta an b�i kh�o nghi�m th�t kh� kh�n nh� th� sao ? ng��i c�n l� tr� ch�t tr� l�i �i ",0);
	return 0
end




--  //////////////////////////////////////////////////////////////
-- //                     ���轱���Ĵ���                       //
--//////////////////////////////////////////////////////////////

function Task_GiveAward()

	local i
	
	local myAward
	local myLinkAward,myLoopAward
	
	local myGoodsText = ""
	local ShowText = {"","",""}

	local nTotalTaskNum = tl_counttasklinknum(1); -- ��ȡ��ǰ���һ�����˶��ٴ�����
--	if (nTotalTaskNum ~= 0 and mod(nTotalTaskNum, 10) == 0 and GetTask(TKS_TASKLINK_SPITEM) ~= nTotalTaskNum) then
--		SetTask(TKS_TASKLINK_SPITEM, nTotalTaskNum);
--		local tbItem = {tbProp = {6, 1, 2374, 1, 0, 0}}
--		tbAwardTemplet:GiveAwardByList(tbItem, "seasonnpc_10task")
--		Msg2Player(format("Ch b� m v� g i hi  ho y�u th y�u h li y�t ti %d nhi v?D?T, nh nh�  ph thng %s!", 10, "B rng th b?c D?T"));
--	end

	--tl_print ("Cho li�n t��ng th��ng c�ng ho�n t��ng th��ng ph�t t��ng xong ");
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
	--	tl_print (" l�y ���c kim ti�n t��ng th��ng ");
		if (myAward[i][1] == 1) then
			ShowText[i] = " l�y ���c "..myAward[i][9].."/3".."/"..myAward[i][2].."/SelectAward_Money"
		elseif (myAward[i][1] == 2) then
			ShowText[i] = " l�y ���c "..myAward[i][9].."/4".."/"..myAward[i][2].."/SelectAward_Exp"
		elseif (myAward[i][1] == 3) then
			myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
			ShowText[i] = " l�y ���c "..myAward[i][9].."/5".."/"..myGoodsText.."/mySG"
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
			ShowText[i] = " l�y ���c "..myAward[i][9].."/7".."/"..myAward[i][1].."/SelectAward_Cancel"
		end
		
	end
	
	tl_print(ShowText[1])
	tl_print(ShowText[2])
	tl_print(ShowText[3])
	
Prise( "D� t�u  c�c kh� , xin/m�i v� n�y "..GetPlayerSex().." xem m�t ch�t b�n n�o �� l� ng��i r�t mu�n ��ch ��y ? ",ShowText[1],ShowText[2],ShowText[3] );
	
	--tl_print ("Ph�t t��ng xong ");

end



-- ���Ѿ�ȷ����������ɵ��ǻ�δ����ʱ�ı��������Է����ˢ��
function Task_AwardRecord()
	--Storm �ӻ���
	local filename = tl_gettasktextID(tl_getplayertasktype())
	local tabcol = tl_gettasktablecol()
	local myTaskValue1 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue1"))
	local myTaskValue2 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue2"))
	local myMainValue = myTaskValue1 + myTaskValue2
	storm_addpoint(4, myMainValue)
	
	tl_settaskcourse(2) -- ����Ľ�չ�̶�Ϊ2�����ǻ�û�з���
	nt_setTask(1037, GetGameTime() + tonumber(GetLocalDate("%H%M%S")));
end



-- ѡ������Ʒ�Ľ���
-- PS����Ϊ���ǵ��������Ĵ����ַ����ܳ��� 32 ��������������̼�д�� mySG
function mySG(myQuality,myGenre,myDetail,myParticular,myLevel,myFive)

-- ��ֹ�����浯����ˢ�����Ĵ���
if (tl_gettaskcourse() == 3) then
	Say("D� t�u  ng��i �� d�n qu� ph�n th��ng nga , th� n�o c�n mu�n n�a d�n ��y ? ",0);
	return
end
	--2007-09-19 ������Ʒ����ʱ�ı����ռ��ж�
	if (CalcFreeItemCellCount() < 5) then
		Say("D� t�u  xin/m�i d�n d�p b�c qu�n �o c�ch t� kh�ng thua k�m 5 c� , sau �� s� t�i nh�n l�y t��ng th��ng ",0);
		return
	end;
	
--	tl_print(" l�y ���c t��ng th��ng v�t ph�m bi�n s� "..myQuality..myGenre..myDetail..myParticular..myLevel..myGoodsFive);
	if (myQuality == 0) then
		AddItem(myGenre,myDetail,myParticular,myLevel,myFive,0,0)
		
		if (myDetail==238) or (myDetail==239) or (myDetail==240) or (myDetail==252) then
			WriteLog("[ nhi�m v� li�n t��ng th��ng ghi ch�p ]"..date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().." � nhi�m v� li�n t��ng th��ng trung l�y ���c b�o th�ch m�t , b�o th�ch lo�i h�nh bi�n s� v� "..myDetail)
		end

	else
		AddGoldItem(0,myGenre)
		AddGlobalNews("Th�ng b�o  nh� ch�i "..GetName().." b�i v� ho�n th�nh nhi�m v� � d� t�u ch� l�y ���c ho�ng kim trang b� m�t m�n ");
		WriteLog("[ nhi�m v� li�n t��ng th��ng ghi ch�p ]"..date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().." � nhi�m v� li�n t��ng th��ng trung l�y ���c ho�ng kim trang b� m�t m�n , ho�ng kim trang b� bi�n s� v� "..myGenre)
	end
	Msg2Player("Ng�i l�y ���c m�t c�i nhi�m v� v�t ph�m t��ng th��ng ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--�������ɽ���
	Task_NewVersionAward()
end

-- ѡ����Kim Ǯ�Ľ���
function SelectAward_Money(nAward)

-- ��ֹ�����浯����ˢ�����Ĵ���
if (tl_gettaskcourse() == 3) then
	Say("D� t�u  ng��i �� d�n qu� ph�n th��ng nga , th� n�o c�n mu�n n�a d�n ��y ? ",0);
	return
end

	Earn(nAward)
	Msg2Player("Ng�i l�y ���c <color=green>"..nAward.."<color> l��ng b�c ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	-- ���������Kim Ǯ�������� 30W�����LOG
	if nAward>=300000 then
		WriteLog("[ nhi�m v� li�n kim ti�n ghi ch�p ]"..
				 date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]")..
				 "[ tr��ng m�c ]"..GetAccount()..
				 "[ vai tr� ]"..GetName()..
				 " � nhi�m v� li�n trung thu ���c <money>"..nAward.."</money> l��ng b�c ��ch t��ng th��ng ");
	end;
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--�������ɽ���
	Task_NewVersionAward()
end

-- ѡ���˾���ֵ�Ľ���
function SelectAward_Exp(nAward)

-- ��ֹ�����浯����ˢ�����Ĵ���
if (tl_gettaskcourse() == 3) then
	Say("D� t�u  ng��i �� d�n qu� ph�n th��ng nga , th� n�o c�n mu�n n�a d�n ��y ? ",0);
	return
end

	tl_addPlayerExp(nAward)
	Msg2Player("Ng�i l�y ���c <color=green>"..nAward.."<color> ch�t kinh nghi�m tr� gi� ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--�������ɽ���
	Task_NewVersionAward()
end

-- ѡ�������һ�εĽ���
function SelectAward_Change(nAward)

-- ��ֹ�����浯����ˢ�����Ĵ���
if (tl_gettaskcourse() == 3) then
	Say("D� t�u  ng��i �� d�n qu� ph�n th��ng nga , th� n�o c�n mu�n n�a d�n ��y ? ",0);
	return
end

	Msg2Player("Ng�i l�y ���c ng�u nhi�n n�a l�a ch�n m�t l�n t��ng th��ng ��ch c� h�i ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();

end

-- ѡ����ȡ���Ļ���
function SelectAward_Cancel(nAward)

local myCancel = 0;
local myNewCancel = GetTask(DEBUG_TASKVALUE);

	-- ��ֹ�����浯����ˢ�����Ĵ���
	if (tl_gettaskcourse() == 3) then
		Say("D� t�u  ng��i �� d�n qu� ph�n th��ng nga , th� n�o c�n mu�n n�a d�n ��y ? ",0);
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
		-- �ٴ�һ������ı���
		nt_setTask(DEBUG_TASKVALUE, myNewCancel);
	end;
	
	tl_settaskstate(4, myCancel);
	
	if myCancel<=254 then
		Msg2Player("Ng�i l�y ���c <color=green>һ��ȡ������Ļ���<color>!");
	end;

	WriteLog("[ nhi�m v� li�n t��ng th��ng ghi ch�p ]"..
			 date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n %S gi�y ]")..
			 "[ tr��ng m�c ]"..GetAccount()..
			 "[ vai tr� ]"..GetName()..
			 " � nhi�m v� li�n trung thu ���c h�y b� c� h�i t��ng th��ng , tr��c m�t ��ch h�y b� c� h�i v� <"..myCancel.."> l�n . ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--�������ɽ���
	Task_NewVersionAward()
end


-- ������������������������߻�Kim װ��
function PayPlayerLinkAward()

local myGolden = {2,6,11,16,21,22,26,31,39,40,42,46,51,54,56,60,61,67,71,76,81,87,92,94,96,101,106,107,115,119,121,122,126,132,136,144,145,146} -- 20 ��������Kim װ���ı��
local nGoldenID = 0

local myTaskTimes = tl_gettaskstate(1)
local myTaskLinks = tl_gettaskstate(2)
local myTaskLoops = tl_gettaskstate(3)

local nTotalTask = tl_counttasklinknum(1);

-- ����������ɴ�������
Ladder_NewLadder(10118, GetName(), nTotalTask, 1);

-- �����﷢��̶���������Ľ���
tl_getlinkaward(Task_AwardLink, nTotalTask);

-- Խ�ϰ���� 8000 ���������κδ���
if (nTotalTask == 8000) then

--	nGoldenID = myGolden[random(getn(myGolden))]
	
	-- �� 8000 �������� 1E Kim Ǯ
	Earn(100000000);
	
--	AddGoldItem( 0, nGoldenID )
	
	WriteLog("[ nhi�m v� li�n t��ng th��ng ghi ch�p ]"..date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().." � nhi�m v� li�n t��ng th��ng trung b�i v� ho�n th�nh 8000 l�n nhi�m v� l�y ���c ho�ng kim trang b� m�t m�n , ho�ng kim trang b� bi�n s� v� "..nGoldenID)
	
	AddGlobalCountNews("Th�ng b�o  nh� ch�i "..GetName().." b�i v� ho�n th�nh 8000 l�n nhi�m v� � d� t�u ch� l�y ���c m�n ph�i ��i ho�ng kim trang b� m�t m�n c�ng ki�m hi�p ti�n m�t �c hai ", 3);
	
	for i=1,3 do
		Msg2Player("Ch�c m�ng ng��i  b�i v� ng��i li�n t�c ho�n th�nh 8000 l�n nhi�m v� cho n�n l�y ���c m�t c�c ph�m t��ng th��ng c�ng m�t �c hai ki�m hi�p ti�n ");
	end

	return
	
end

storm_ask2start(4, 1)	--Storm ��ʼ��ս

end


--/////���������޷�������ȥ�� BUG ���޲�/////

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
-- ///// �ж�����Ƿ�ˢȡ������Ĺ��� /////////////
--////////////////////////////////////////////////

function _CancelTaskDebug()

local nOrgTask = GetTask(DEBUG_TASKVALUE);
local nDecTask = tl_gettaskstate(4);
local nDiff    = 0;

	if nOrgTask==nDecTask or nOrgTask==0 then
		return 1;
	else
		WriteLog("[ nhi�m v� li�n b� l�i ghi ch�p ]"..
				 date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n %S gi�y ]")..
				 "[ tr��ng m�c ]"..GetAccount()..
				 "[ vai tr� ]"..GetName()..
				 " nhi�m v� h�y b� c� h�i kh�ng ��u ch� , tr��c m�t h�y b� c� h�i v� <"..nDecTask.."> , b� ph�n ��ch h�y b� c� h�i v� <"..nOrgTask.."> . ");
		return 0;
	end;

end;

--  /////�������ȡ��ʱ�� LOG //////////////////////
-- ///// ����Ĳ���Ϊ���������ȡ������Ļ��� /////
--////////////////////////////////////////////////

function _WriteCancelLog(nType, nTime, nCancel)

	if nType==1 then
		WriteLog("[ nhi�m v� li�n h�y b� ghi ch�p ]"..date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().." � nhi�m v� s� l�n v� "..nTime.." h�y b� c� h�i c�n th�a l�i "..nCancel.." l�c h�y b� m�t l�n nhi�m v� . ");
	else
		WriteLog("[ nhi�m v� li�n h�y b� ghi ch�p ]"..date("[%y n�m %m th�ng %d ng�y %H l�c %M ph�n ]").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().." � nhi�m v� s� l�n v� "..nTime.." l�c d�ng 100 t� x� t�c �� h�y b� m�t l�n nhi�m v� . ");
	end;

end;
