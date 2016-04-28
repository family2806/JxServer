-- Const List
aryAwardTime = { 1900, 2400, 928 }    	--�콱ʱ��� ( { ��ʼʱ�䣬 ����ʱ�� } ʱ���ʽΪHHMM )
aryAwardItem = {{ " hoa qu� r��u ",   {6,1,125,1,0,0,0} },	--��Ʒ����
  { " t�m tr�n ph�c th�ng �o�n vi�n b�nh ", {6,1,126,1,0,0,0} }}
 
MingZi=50     	--���ֺϳɼ���
QiuZi=30
GeZi=30
YingZi=80
JuZi=10
WangZi=80
YuanZi=10

-- Talking String
STR_Do_Nothing  = " ta ch�ng qua l� t�i �i d�o m�t ch�t /do_nothing"
STR_Next_Page  = " trang k� ti�p "
STR_OK 	 	 = " ta bi�t , c�m �n . "
STR_Main 	 = { " l� quan  ta l� ph� tr�ch g�i l� v�t ��ch l� quan , m�t n�m trung ��ch tr�ng ��i ng�y l� ta c�ng s� c� l� v�t g�i . ngo�i ra ta c�n ph� tr�ch ph�i ph�t t�ng v�t ph�m . ng�i b�y gi� m�u ch�t l�y l� v�t sao ? ",
    " h�i th�m trung thu ti�t ��ch lai l�ch ",
     " h�i th�m m�t ch�t trung thu ho�t ��ng n�i dung ",
     " trung thu ho�t ��ng m�t  tham gia �o�n ch� m� ho�t ��ng ",
     " trung thu ho�t ��ng hai  tham gia h�p th�nh m�t ch� ��c nh�t ", --5
     " trung thu ho�t ��ng ba  tham gia t�p th� t� d�n ph�n th��ng ",
     " trung thu ho�t ��ng b�n  nh�n l�y ng�y l� t�ng ph�m ",
     " ta ch�ng qua l� t�i �i d�o m�t ch�t ",
     " nh�n l�y t�ng v�t ph�m ",
     " mua chu ni�n kh�nh ��i l� t�i ph�i may m�n chi�c nh�n c�ng m��i to�n ��i b� ho�n " } --10
STR_About_MA  = { " truy�n thuy�t , H�u Ngh� ��ch th� t� th��ng nga , b�i v� kh�ng ch�u ���c nh�n gian t�ch m�ch , � th�ng t�m m��i l�m ng�y n�y , �n tr�m V��ng m�u n��ng n��ng ��ch linh d��c m� phi th�ng th�nh ti�n . t� nay c�ng ng�c th� l�m b�n , h�ng ��m ch� ��i th�ng cung . H�u Ngh� h�ng ��m ��i v�i v� �ch t� th�ng , l�y t� ni�m th� t� k� ph�n �o�n vi�n , sau �� li�n t� t� c� th�ng t�m m��i l�m ng�m tr�ng t� th�ng ��ch phong t�c . ",
    " c�ng c� n�i , n�ng l�ch th�ng t�m m��i l�m ng�y n�y v�a v�n l� ��o t� th�nh th�c th�i kh�c , c�c nh� c�ng l�y th� ��a th�n , trung thu l� thu b�o ��ch di t�c . m�i ��n ng�y n�y , gia gia h� h� c�ng s� �o�n t� chung m�t ch� , th��ng tr�ng s�ng  �n b�nh Trung thu  �o�n ch� m� . tr�ng s�ng cao treo , hoa qu� phi�u h��ng , trong �� c�ng k� th�c r�t nhi�u kh�ch c� tha h��ng ��ch du t� th�m thi�t ��ch t� ni�m t�nh . ",
    " m�i ��n ng�y n�y , gia gia h� h� c�ng s� �o�n t� chung m�t ch� , th��ng tr�ng s�ng , �n b�nh Trung thu , �o�n ch� m� . tr�ng s�ng cao treo , hoa qu� phi�u h��ng , trong �� c�ng k� th�c r�t nhi�u kh�ch c� tha h��ng ��ch du t� th�m thi�t ��ch t� ni�m t�nh . ",
    " ta �� bi�t " }
STR_About_Rules  = { " � n�i n�y vui m�ng ��ch trong cu�c s�ng ,  v�ng ki�m  c�ng v� nh� ch�i c�a chu�n b� r�t c� d�n t�c phong t�nh ��ch ng�y l� ho�t ��ng ���<color=red> �o�n ch� m� <color><color=red> t�p th� t� <color><color=red> ph�m b�nh Trung thu <color><color=red> th��ng tr�ng s�ng <color>� . ",
    " �o�n ch� m� ", 
    " t�p th� t� ",
    " ph�m b�nh Trung thu ", 
    " th��ng tr�ng s�ng ",   --5
    " ta �� hi�u ",
    "    ���������һ����ף�� thu ���죬������е���ٶԻ�ѡ�������Ϸ����ÿ�ν���<color=red>һǧ��<color>���Ϳ��Կ�ʼ������Ϸ . Ҫ��<color=red>������������Ŀ<color>�Ϳ���������һ��<color=red>���ⵥ��<color>��������������ͨ���ֺϳɳ�<color=red>��һ������ͨ����<color>���Լ��ڲμ� t�p th� t� ��л�ȡ��Ʒ . ",
    "    ���������һ����ף�� thu ���죬�ڻ�ڼ䣬��ҿ�������ٴ���һЩ������ʫ������ȡ��ͬ�Ľ�Ʒ��������;������õ��֣�<color=red>���<color>��<color=red>�����ͨ����<color>����<color=red> �o�n ch� m� <color>��<color=red>������ⵥ��<color>����<color=red>�ϳɵ���<color>��<color=red>������ͨ����<color>������ȡÿ�ֽ�Ʒ����Ҫƥ��һ����ͨ����һ�������� . ",
    "    ���������һ����ף�� thu ���죬��<color=red>���¶�ʮ������ thu <color>����� <color=red>19:00~24:00<color> ʱ���������������Ҷ����Ե���ٴ������ȡһ�ν�����Ʒ��<color=red> t�m tr�n ph�c th�ng �o�n vi�n b�nh <color>��<color=red> hoa qu� r��u <color>������Լ���� ph�m b�nh Trung thu  th��ng tr�ng s�ng  . ",
    " v�ng ki�m c�ng nh� ch�i c�ng nhau �n m�ng trung thu qu�c kh�nh , �ang ho�t ��ng trong l�c , <color=red> Hoa S�n <color><color=red> n�i Thanh Th�nh <color><color=red> V� di s�n <color> ba phong c�nh khu nh� ch�i c�ng c� th� th�y th�ng c�nh , cung m�i ng��i ng�m tr�ng n�i chuy�n phi�m  ch�p h�nh l�u ni�m . ",
    " h�i th�m nh�ng kh�c ho�t ��ng n�i r� " }	--11
STR_Gift 	 = { " th�t xin l�i , ng�i c�n kh�ng c� sung t�p . xin/m�i tr��c sung t�p . ",
    " th�t xin l�i , xin/m�i � th�ng ch�n hai m��i t�m ng�y trung thu ti�t bu�i t�i 19:00~24:00 �o�n th�i gian n�y t�i nh�n l�y t�ng ph�m . ",
    " th�t xin l�i , ng�i ��ch c�p b�c ch�a �� n�m m��i c�p . ",
    " th�t xin l�i , ng�i �� nh�n l�y qu� t�ng th��ng th�c . ",
    " ng�i thu ���c m�t " }
STR_Guess 	 = { " th�t xin l�i ng��i tu�i tr� , ng�n l��ng c� ph�i hay kh�ng qu�n � trong nh� n�a/r�i ? ",
    " th�t xin l�i , ng�n l��ng ch�a ��  c�n ",
    " l��ng b�c . ",
    " hai ng�y tr��c nh�n r�i kh�ng chuy�n g� , vi�t m�y c�u ��n m� , ng��i tu�i tr� c� mu�n t�i hay kh�ng �o�n m�t c�i ? ch� c�n <color=red> m�t ng�n l��ng b�c <color> , c�ng <color=red> li�n t�c ��p ��i v�i n�m �� <color> , ta li�n cho ng�i m�t <color=red> ��c th� m�t ch� ��c nh�t <color> . ",
    " ta �ang mu�n th� m�t ch�t ",   --5
    " ta mu�n tham gia nh�ng kh�c ho�t ��ng ",
    " ��o �� m�c . ",
    " c�ng ch� k�m nh� v�y m�t ch�t n�a/r�i , ��ng n�n ch� , ��n th�m n�a l� �i ",
    " ng�i l�y ���c m�t ch� ",
    " �o�n ch� m� ",   	--10
    " qu� nhi�n b�o h�c th� s�ch , l�o phu k�nh n� , n�i n�y l� h�a h�n ��ch ph�n th��ng  ��a ng�i m�t <color=red> ��c th� m�t ch� ��c nh�t <color> . ng��i tu�i tr� c�n ph�i kh�ng n�n �� cho l�o phu thi l�i thi ng�i ? ",
    "     c�ng ch� k�m nh� v�y m�t ch�t n�a/r�i , ��ng n�n ch� , ��n th�m n�a l� �i ��Ҫ��Ҫ�����Ϸ򿼿�����" }
STR_Reward_Note  = { " ta ch� n�y c� m�t �t t�n ph� th� , n�u nh� ng�i tr�n ng��i v�a l�c c� trong l�c <color=red> thi�u s�t ��ch m�t ch� ��c nh�t <color> , ta s� ��a cho ng�i m�t m�n l� ph�m . ",
    " qu� nhi�n l� anh h�ng xu�t thi�u ni�n a ",
    " ch�c m�ng a  ng�i l�y ���c ",
    " mu�n d�n ph�n th��ng <color=red>",
    "<color> c�n m� ra �",
    "� c�u n�y th� , ng�i kh�ng c� c�n thi�t ��ch ch� ��y ",
    " ta ch�ng qua l� t�i �i d�o m�t ch�t ",
    " n�i cho m�i ng��i m�t tin t�c t�t , trong truy�n thuy�t ��ch c�ng th�ng ph� dung �� b� nh� ch�i nh�n l�y , m�i ng��i ti�p t�c c� g�ng a ",
    " n�i cho m�i ng��i m�t tin t�c t�t , trong truy�n thuy�t ��ch ph�ng th�ng qu� dong �� b� nh� ch�i nh�n l�y , m�i ng��i ti�p t�c c� g�ng a ",
    " n�i cho m�i ng��i m�t tin t�c t�t , trong truy�n thuy�t ��ch ��nh qu�c an bang ho�ng kim trang b� �� b� nh� ch�i nh�n l�y , m�i ng��i ti�p t�c c� g�ng a ",
    " c�n ph�i ��i l�y nh�ng kh�c ph�n th��ng ",
    " ta mu�n tham gia nh�ng kh�c ho�t ��ng " }
STR_Reward_Poem  = { " minh __ bao l�u c� , �em __ h�i thanh thi�n ",
    " tr�n bi�n th�ng __ th�ng , thi�n nhai c�ng n�y __ ",
    "__ kh�ng minh th�ng treo , quang __ l� d�nh ��t ",
    " ta __ th�ng b�i h�i , ta __ �nh th�t th�n ",
    " kh�i v� bi�t r� __ , h� t�a nh� __ nh�n gian ",
    "__ ch�n y�u tr�ng s�ng , ��i v�i �nh th�nh ba __ ",
    " ng�ng ��u __ tr�ng s�ng , c�i ��u __ c� h��ng ",
    " nh�ng __ ng��i l�u d�i , ng�n d�m c�ng thi�n __ " }
STR_Reward_Reward	 = { "���̻�+2��PKҩ�裩",
    " h�u n�m c�t t��ng t�i ",
    " ti�n th�o l� ",
    "�� t�m tr�n ph�c th�ng �o�n vi�n b�nh ��",
    "�� hoa qu� r��u ��",
    " c�ng th�ng ph� dung ",
    " ph�ng th�ng qu� dong ",
    " ��nh qu�c an bang ho�ng kim trang b� m�t m�n trong �� " }
STR_Reward_Func  = { "/yes1",
    "/yes2",
    "/yes3",
    "/yes4",
    "/yes5",
    "/yes6",
    "/yes7",
    "/yes8" }
STR_Combin_Note  = { " n�u nh� c� d� th�a c�p th�p ch� , c� th� b�t ���c ta ch� n�y t�i , n�u nh� cho ta <color=red> m�t t� m�t ch� ��c nh�t <color> c�ng c�p ��ch <color=red> m�t ��c th� ch� c�ng m�t b�nh th��ng ch� <color> c�ng <color=red> m�t ng�n l��ng th� t�c ph� <color> , ta s� nh��ng ng�i th� m�t ch�t t� n�i n�y trong r��ng l�y l�p m��i c�p ��ch m�t ch� ��c nh�t , n�u nh� th�t b�i �em kh�ng l�i c�n ng�i b� ra ��ch ch�  d� nhi�n , ��ng qu�n m�i l�n h�p th�nh <color=red> m�t ng�n l��ng th� t�c ph� <color> . ",
    " h�p th�nh ch� c�n <color=red> m�t ng�n l��ng th� t�c ph� <color=red> , ti�n c�a ng�i gi�ng nh� kh�ng �� , c�n l� l�n sau tr� l�i �i . ",
    " xin ch� ch�c l�t . ",
    " ng�i l�y ���c m�t ch� ��c nh�t ",
    " th�t b�i , <color=red>",
    "<color> ch� c�ng kh�ng ph�i t�t nh� v�y h�p th�nh ��n ��ch , l�n sau tr� l�i th� m�t ch�t tay kh� �i . ",
    " mu�n h�p th�nh �<color=red>",
    "<color>� ch� c�n <color=red>",
    "<color> , ng�i kh�ng c� c�n thi�t ��ch ch� ��y  c� ph�i hay kh�ng qu�n mang theo ? mau �i tr� v� t�m m�t ch�t tr� l�i �i . ",
    " ta ch�ng qua l� t�i �i d�o m�t ch�t /do_nothing", --10
    " c�n ph�i h�p th�nh nh�ng kh�c m�t ch� ��c nh�t ",
    " ta mu�n tham gia nh�ng kh�c ho�t ��ng " }
STR_Combin_Word  = { " minh ",
    " thu ",
    " ca ",
    " �nh ",
    " gi� ",
    " ng�m ",
    " nguy�n " }
STR_Combin_Request	 = { "����+�ƣ�",
    "�� minh +ʱ��",
    "�� thu +�ʣ�",
    "�� ca +�裩",
    "�� �nh +�ڣ�",
    "�� gi� +�ˣ�",
    "�� ng�m +˼��" }
STR_Combin_Func  = { "/Combin1",
    "/Combin2",
    "/Combin3",
    "/Combin4",
    "/Combin5",
    "/Combin6",
    "/Combin7" }   
   
  
-- Start of Proc
--function main()
--	Say(STR_Main[1], 9, 
-- STR_Main[2].."/about_mid_autumn",
-- STR_Main[3].."/about_game_rules",
-- STR_Main[4].."/guess_at_riddle",
-- STR_Main[5].."/Combination",
-- STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
-- STR_Main[9].."/onGift",
-- STR_Main[10].."/lg_onRingGift",
-- STR_Main[8].."/do_nothing" )
--end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ���˵� ----------------------------------------------
-- ------------------------------------------------------------------------------------------------
function on_mid_autumn()
	Say( 
 STR_Main[1],
 5,
-- STR_Main[2].."/about_mid_autumn",
 STR_Main[3].."/about_game_rules",
 STR_Main[4].."/guess_at_riddle",
 STR_Main[5].."/Combination",
 STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
 STR_Main[8].."/do_nothing"
 );
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ������ thu  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_mid_autumn()
	Say(STR_About_MA[1], 1,
 STR_Next_Page.."/about_mid_autumn_b" )
end
function about_mid_autumn_b()
	Say(STR_About_MA[2], 1,
 STR_About_MA[4].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��Ϸ˵ minh  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_game_rules()
	Say(STR_About_Rules[1], 5,
 STR_About_Rules[2].."/rule_a",
 STR_About_Rules[3].."/rule_b",
 STR_About_Rules[4].."/rule_c",
 STR_About_Rules[5].."/rule_d",
 STR_About_Rules[6].."/main" )
end

function rule_a()
	Say(STR_About_Rules[7], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_b()
	Say(STR_About_Rules[8], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_c()
	Say(STR_About_Rules[9], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_d()
	Say(STR_About_Rules[10], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��ȡ��Ʒ --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function take_gift()  	--�� thu ����( -1:δ�俨  -2:��ǰ�����콱ʱ��  -3���ȼ�����50  -4:������� )
	local nCurrTime = tonumber(date("%H%M"))
	local nCurrData = tonumber(date("%m%d"))

	if( IsCharged() ~= 1 ) then   --�Ƿ�����
 Say(STR_Gift[1], 1,
 	STR_OK.."/main" )
 return -1
	end
	if not ((nCurrTime >= aryAwardTime[1]) and (nCurrTime <= aryAwardTime[2]) and (nCurrData == aryAwardTime[3])) then  	--�Ƿ����콱ʱ��
 Say(STR_Gift[2], 1,
 	STR_OK.."/main" )
 return -2
	end	
	if (GetLevel() < 50) then   --�ȼ��Ƿ����50
 Say(STR_Gift[3], 1,
 	STR_OK.."/main" )
 return -3
	end
	
	if (GetTask(702) == 5) then   --�Ƿ��������
 Say(STR_Gift[4], 1,
 	STR_OK.."/main" )
 return -4
	else
        AddItem( aryAwardItem[1][2][1], aryAwardItem[1][2][2], aryAwardItem[1][2][3], aryAwardItem[1][2][4], aryAwardItem[1][2][5], aryAwardItem[1][2][6] , aryAwardItem[1][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[1][1] )
        AddItem( aryAwardItem[2][2][1], aryAwardItem[2][2][2], aryAwardItem[2][2][3], aryAwardItem[2][2][4], aryAwardItem[2][2][5], aryAwardItem[2][2][6] , aryAwardItem[2][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[2][1] )
 SetTask(702, 5)
	end	
	
end

function IsCharged()  	--�ж�����Ƿ�����
	if( GetExtPoint( 0 ) >= 1 ) then
 return 1
	else
 return 0
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ���i���� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function guess_at_riddle()
	local mpay  = 1000 --��Ҫ֧���Ľ��X����

	Say(STR_Guess[4], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )	
end
function get_question()
	local mpay  = 1000 --��Ҫ֧���Ľ��X����
	
	if ( GetCash() >= mpay ) then
 SetTaskTemp(250, 0) --���õ�ǰ��ĿΪ�� 0 ��
 SetTaskTemp(251, 0) --���õ�ǰ��Ϊ�� 0
 Pay(mpay)
 gquestion()
	else
 Say(STR_Guess[1], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	end
end


-- �����������Ŀ
function gquestion()
	local qid_min  = 2001   --�����ʼID
	local qid_max  = 2220   --������ID
	local qid 	 = random(qid_min, qid_max)	--ȷ��һ����ĿID	
	local question  = GetQuestion(qid) 	--ȡ����
	local qchoose  = {GetChoose(qid , 1), --ȡ��ѡ�� A
   	GetChoose(qid , 2), --ȡ��ѡ�� B
   	GetChoose(qid , 3), --ȡ��ѡ�� C
   	GetChoose(qid , 4)} --ȡ��ѡ�� D
	local qrextemp  = 0   --��������ʱ�����±�
	local qchoosetemp	 = "_"   --��������ʱ����
	local qanswer  = GetQAnswer(qid) 	--ȡ��(�𰸱��)
    local gttc 	 = GetTaskTemp(250) + 1
    local inttemp  = {1,2,3,4}
	SetTaskTemp(250, gttc)   	--���ڽ��е���Ŀ�ִ�
	SetTaskTemp(251, 0)

	qrextemp = random(1, 3)
	qchoosetemp = qchoose[4]
	qchoose[4] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 4
	elseif (qanswer == 4) then
 qanswer = qrextemp
	end
	
	qrextemp = random(1, 2)
	qchoosetemp = qchoose[3]
	qchoose[3] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 3
	elseif (qanswer == 3) then
 qanswer = qrextemp
	end
	
	qrextemp = 1
	qchoosetemp = qchoose[2]
	qchoose[2] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 2
	elseif (qanswer == 2) then
 qanswer = qrextemp
	end

	SetTaskTemp(251, qanswer)   --ӛ䛮�ǰ���}��
	Say(question, 4, 
 qchoose[1].."/answerproc_a",
 qchoose[2].."/answerproc_b",
 qchoose[3].."/answerproc_c",
 qchoose[4].."/answerproc_d" )
end
	
function answerproc_a()  	--ѡ��� A
	if (GetTaskTemp(251) == 1) then --�Ƿ�����ȷ��
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_b()  	--ѡ��� B
	if (GetTaskTemp(251) == 2) then --�Ƿ�����ȷ��
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_c()  	--ѡ��� C
	if (GetTaskTemp(251) == 3) then --�Ƿ�����ȷ��
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_d()  	--ѡ��� D
	if (GetTaskTemp(251) == 4) then --�Ƿ�����ȷ��
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	

function qfail()  --�ش����
end
-- ��Ŀ����

function add_random_special_word()
	local qitem  	 = {426,427,428,429,430,431,432,433}  --ӛ��п��ܵĪ������(����ƥ��)
	local qitem_rate	 = {763,863,913,963,983,993,998,1000}  --ӛ��п��ܵĪ�����߳��F�C��
   --  763 100  50  50  20  10   5    2
	local accuracy  = 1000   --�S�C������
	local drop_rate  = random(1, accuracy) --�_����Ʒ��͵�һ���S�C��
 
	if ( drop_rate <= qitem_rate[1] ) then
 AddItem(4,qitem[1],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[2] ) then
 AddItem(4,qitem[2],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[3] ) then
 AddItem(4,qitem[3],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[4] ) then
 AddItem(4,qitem[4],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[5] ) then
 AddItem(4,qitem[5],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[6] ) then
 AddItem(4,qitem[6],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[7] ) then
 AddItem(4,qitem[7],1,1,0,0,0)
	elseif ( drop_rate <= accuracy ) then
 AddItem(4,qitem[8],1,1,0,0,0)
	end
	Msg2Player(STR_Guess[9])
--	guess_at_riddle()
	Say(STR_Guess[11], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��ʫ�콱Ʒ���� --------------------------------------
-- ------------------------------------------------------------------------------------------------
function GetReward()
	Say(STR_Reward_Note[1],9,
 STR_Reward_Poem[1]..STR_Reward_Reward[1]..STR_Reward_Func[1],
 STR_Reward_Poem[2]..STR_Reward_Reward[2]..STR_Reward_Func[2],
 STR_Reward_Poem[3]..STR_Reward_Reward[3]..STR_Reward_Func[3],
 STR_Reward_Poem[4]..STR_Reward_Reward[4]..STR_Reward_Func[4],
 STR_Reward_Poem[5]..STR_Reward_Reward[5]..STR_Reward_Func[5],
 STR_Reward_Poem[6]..STR_Reward_Reward[6]..STR_Reward_Func[6],
 STR_Reward_Poem[7]..STR_Reward_Reward[7]..STR_Reward_Func[7],
 STR_Reward_Poem[8]..STR_Reward_Reward[8]..STR_Reward_Func[8],
 STR_Reward_Note[7].."/main")
end

function yes1()                                                                 -- �̻���2��Pkҩ��
	if ((GetItemCountEx(418)>=1) and (GetItemCountEx(426))>=1) then
	  	DelItemEx(418)
	  	DelItemEx(426)
	  	for i=1,2 do 
	    	local x=random(1,10)
	    	AddItem(6,0,x,1,0,0,0)
	  	end
	  	AddItem(6,0,11,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[1].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[1]..STR_Reward_Note[5]..STR_Reward_Poem[1]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes2()                                                                 -- ���꼪���
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
	  	DelItemEx(419)
	  	DelItemEx(427)
	  	AddItem(6,1,19,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[2].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[2]..STR_Reward_Note[5]..STR_Reward_Poem[2]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes3()                                                                 -- �ɲ�¶
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
	  	DelItemEx(420)
	  	DelItemEx(428)
	  	AddItem(6,1,71,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[3].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[3]..STR_Reward_Note[5]..STR_Reward_Poem[3]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes4()                                                                 --  t�m tr�n ph�c th�ng �o�n vi�n b�nh 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
	  	DelItemEx(421)
	  	DelItemEx(429)
	  	AddItem(6,1,126,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[4].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[4]..STR_Reward_Note[5]..STR_Reward_Poem[4]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes5()                                                                 --  hoa qu� r��u 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	DelItemEx(422)
	  	DelItemEx(430)
	  	AddItem(6,1,125,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[5].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[5]..STR_Reward_Note[5]..STR_Reward_Poem[5]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes6()                                                                 -- ����ܽ��
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	DelItemEx(423)
	  	DelItemEx(431)
	  	AddItem(6,1,128,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[6].." . ")
	  	local n=GetGlbValue(12)+1
	  	SetGlbValue(12,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[6]);
	  	AddGlobalNews(STR_Reward_Note[8])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[6]..STR_Reward_Note[5]..STR_Reward_Poem[6]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes7()                                                                 -- ���¹���
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
	  	DelItemEx(424)
	  	DelItemEx(432)
	  	AddItem(6,1,127,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[7].." . ")
	  	local n=GetGlbValue(11)+1
	  	SetGlbValue(11,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[7]);
	  	AddGlobalNews(STR_Reward_Note[9])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[7]..STR_Reward_Note[5]..STR_Reward_Poem[7]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes8()                                                                 -- ��������ƽ�װ��
	if ((GetItemCountEx(425)>=1) and GetItemCountEx(433)>=1) then
	  	DelItemEx(425)
	  	DelItemEx(433)
	  	local x=random(159,167)
	  	AddGoldItem(0,x)
	  	local n=GetGlbValue(10)+1
	  	SetGlbValue(10,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[8]);
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[8].." . ")
	  	AddGlobalNews(STR_Reward_Note[10])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[8]..STR_Reward_Note[5]..STR_Reward_Poem[8]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ �ϳɲ��� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function Combination()
	local mpay  = 1000 --��Ҫ֧���Ľ��X����
	
	if ( GetCash() < mpay ) then
 Say(STR_Combin_Note[2], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	else
 Say(STR_Combin_Note[1], 2,
 	STR_Guess[5].."/Combination_List",
 	STR_Guess[6].."/main" )
	end
end
function Combination_List()
	local i=GetCash()
	if (i>=1000) then
 Say(STR_Combin_Note[1],8,
 	STR_Combin_Word[1]..STR_Combin_Request[1]..STR_Combin_Func[1],
 	STR_Combin_Word[2]..STR_Combin_Request[2]..STR_Combin_Func[2],
 	STR_Combin_Word[3]..STR_Combin_Request[3]..STR_Combin_Func[3],
 	STR_Combin_Word[4]..STR_Combin_Request[4]..STR_Combin_Func[4],
 	STR_Combin_Word[5]..STR_Combin_Request[5]..STR_Combin_Func[5],
 	STR_Combin_Word[6]..STR_Combin_Request[6]..STR_Combin_Func[6],
 	STR_Combin_Word[7]..STR_Combin_Request[7]..STR_Combin_Func[7],
 	STR_Combin_Note[10] )
	end
end

function Combin1()                                                                 --  minh 
	if ((GetItemCountEx(418)>=1) and GetItemCountEx(426)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(418)
	   DelItemEx(426)
	   local x=random(1,100) 
	   if (x<=MingZi) then
            	AddItem(4,419,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[1])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[1]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[1]..STR_Combin_Note[8]..STR_Combin_Request[1]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin2()                                                                 --  thu 
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(419)
	   DelItemEx(427)
	   local x=random(1,100) 
	   if (x<=QiuZi) then
            	AddItem(4,420,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[2])
	  else
  Say(STR_Combin_Note[5]..STR_Combin_Word[2]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[2]..STR_Combin_Note[8]..STR_Combin_Request[2]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin3()                                                                 --  ca 
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(420)
	   DelItemEx(428)
	   local x=random(1,100) 
	   if (x<=GeZi) then
            	AddItem(4,421,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[3])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[3]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[3]..STR_Combin_Note[8]..STR_Combin_Request[3]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin4()                                                                 --  �nh 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(421)
	   DelItemEx(429)
	   local x=random(1,100) 
	   if (x<=YingZi) then
            	AddItem(4,422,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[4])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[4]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[4]..STR_Combin_Note[8]..STR_Combin_Request[4]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin5()                                                                 --  gi� 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(422)
	   DelItemEx(430)
	   local x=random(1,100) 
	   if (x<=JuZi) then
            	AddItem(4,423,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[5])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[5]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[5]..STR_Combin_Note[8]..STR_Combin_Request[5]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin6()                                                                 --  ng�m 
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	if (Pay(1000) > 0 ) then 
	    	DelItemEx(423)
	    	DelItemEx(431)
	   local x=random(1,100) 
	   if (x<=WangZi) then
            	AddItem(4,424,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[6])
 	else
  Say(STR_Combin_Note[5]..STR_Combin_Word[6]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
 	end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[6]..STR_Combin_Note[8]..STR_Combin_Request[6]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin7()                                                                 --  nguy�n 
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(424)
	   DelItemEx(432)
	   local x=random(1,100) 
	   if (x<=YuanZi) then
            	AddItem(4,425,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[7])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[7]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[7]..STR_Combin_Note[8]..STR_Combin_Request[7]..STR_Combin_Note[9], 1,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function do_nothing()
end