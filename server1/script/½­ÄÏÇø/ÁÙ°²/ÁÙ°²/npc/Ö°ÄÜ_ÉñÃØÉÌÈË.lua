-- �ٰ���ְ�ܡ���������
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--�׽�װ��
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--�����׽�װ��
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	
	local tbDecOpp =
	{
		"<dec><npc>Ta t� T�y V�c xa x�i ��n Trung Nguy�n �� thu th�p Th�y Tinh, Kim Nguy�n B�o v� Ng�n phi�u. Ta s�n s�ng ��i c�c b�o v�t �� ���c nh�ng th� ��! Kh�ch quan c� g� ��i kh�ng?",
		
		--Change request 04/06/2011,�ر�����׽�װ�� - Modified by DinhHQ - 20110605
		--"Ta mu�n th�ng c�p cho trang b� B�ch Kim n�y/upgrade_paltinaequip",
		--"Ta mu�n ch� t�o trang b� Ho�ng Kim th�nh trang b� B�ch Kim/upgrade_goldformplatina",
		
		--"Ta mu�n m�i/xin ng��i ��c l�i b�ch kim trang b�/recoin_platina_main",
		--"Trao ��i �� ph� v� kh�/get1",
		--"Mua K� tr�n d� b�o/get2",
		--"X� l� <trang b� t�n h�i>/deal_brokenequip",
		--"Ta mu�n hi�u r� b�ch kim trang b� h�a gi�i/unweave_paltinaequip",
		--"Ta mu�n ��i b�o r��ng/BaiBaoXiang_Give_UI",
		"Ta xem th� tr��c ��!/no",
		
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
	CreateTaskSay(tbDecOpp);
end;

function no()
end;