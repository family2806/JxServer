--description: ������ ������ ҩ���ϰ�Ի���������40��������������С������Ĳ���
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- ����40������
		Talk(5, "L40_tw_talk2", "T�i h� l� Thi�n v��ng gi�p ��ch �� t� , ta c� m�t ��ng m�n trung li�u x�ch luy�n x� ��ch ��c , xin/m�i th�n y cho ta gi�i d��c !", "X�ch luy�n x� ? th�t s� l� qu� nguy hi�m .. ta c� th� c�u , mu�n t�m t�i li�u t�i ch� thu�c !", "Kh�ng bi�t mu�n c�i g� t�i li�u ��y ? ", "��y l� gia truy�n b� quy�t , nh�ng ng��i l� Thi�n v��ng �� t� ta li�n n�i cho ng��i nghe ! ph�i c� <color=Red> l�a con th�n l�n ��ch v�y <color> c�ng <color=Red> l�ng xanh con r�a v� r�a th��ng ��ch mao <color>. t�m ���c hai th� �� n�y , ng��i ��ng m�n th� c� c�u ", "Kh�ng bi�t c� th� t�m ���c hai th� �� n�y sao ? ")
	elseif(UTask_world18 == 1) then				-- ���ִ�С������
		Talk(1,"","Ng� th�n y: oh ? ti�u c� ��ch ph� th�n ng� b�nh ? ng��i t�i th�t l� kh�ng kh�o , m�i v�a v�o ��ch m�t nh�m t� ba ho�n b�n h�t cho Thi�n v��ng gi�p . n�u kh�ng , ng��i �i h�i m�t ch�t trong th�n Thi�n v��ng gi�p ��ch �� t� ? ")
		Msg2Player("Ti�m thu�c l�o b�n n�i cho ng��i bi�t t� ba ho�n �� b�n xong , c�n �i t�m Thi�n v��ng gi�p �� t� ")
		AddNote("Ti�m thu�c l�o b�n n�i cho ng��i bi�t t� ba ho�n �� b�n xong , c�n �i t�m Thi�n v��ng gi�p �� t� ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe n�i � <color=Red> ph�c l�u ��ng <color> c� <olor=Red> l�a con th�n l�n <color> c�ng <color=Red> l�ng xanh con r�a <color>, c� ng��i � <color=Red> Thi�n v��ng ��o <color> g�p ���c . ch� c�n t�m ���c ng��i ��ng m�n th� c� c�u ", 2, "Ta �i tr��c mua m�t ch�t thu�c /yes", "Ta mu�n l�p t�c �i mua thu�c d�n /no")
	else							-- ������״̬
		Say("B�n ti�m l� th�n d��c! C� b�nh s� kh�i b�nh, kh�ng b�nh s� kh�e, gi� c� ph�i ch�ng. Mua m�t �t ch�? ", 3, "Giao d�ch /yes", "Ta ��n nh�n nhi�m v� s� nh�p /yboss","Kh�ng giao d�ch /no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe n�i � <color=Red> ph�c l�u ��ng <color> c� <color=Red> l�a con th�n l�n <color> c�ng <color=Red> l�ng xanh con r�a <color>, c� ng��i � <color=Red> Thi�n v��ng ��o <color> g�p ���c ", "�a t� th�n y !")
	SetTask(3, 40*256+50)								-- ����40������
	AddNote("Nghe ba l�ng huy�n ��ch th�n y n�i : mu�n m� r�n ��c ph�i c� l�a con th�n l�n da c�ng l�ng xanh con r�a ")
	Msg2Player("Mu�n m� r�n ��c ph�i c� l�a con th�n l�n da c�ng l�ng xanh con r�a .")
end;

function yes()
	Sale(39);  			--�������׿�
end;

function no()
end;
