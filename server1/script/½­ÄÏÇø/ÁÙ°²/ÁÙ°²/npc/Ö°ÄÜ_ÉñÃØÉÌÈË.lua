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
		"<dec><npc>�����������Զ����������ԭ����˵���������<color=yellow>�����m<color>���������õ�һ�ݶ���װ�����ؼ������������m���ض�һЩ<color=yellow>�ƽ�װ��<color>����Ϊ<color=yellow>�׽�װ��<color>���벻�����Կ���ֻҪ�ٸ���1000W��������Ϊ�������þ��ԡ�",
		
		--Change request 04/06/2011,�ر�����׽�װ�� - Modified by DinhHQ - 20110605
		--"���������׽�װ��/upgrade_paltinaequip",
		--"����ѻƽ�װ������ɰ׽�װ��/upgrade_goldformplatina",
		
		--"�������������׽�װ��/recoin_platina_main",
		--"<#>���뽫����׽�װ������/get1",
		--"<#>���뽫����ƽ�װ������ɰ׽�װ��/get2",
		--"<#> ��� <װ�����>/deal_brokenequip",
		--"�����˽�׽�װ�����/unweave_paltinaequip",
		--"<#>�ٱ���/BaiBaoXiang_Give_UI",
		"<#>��ֻ��������/no",
		
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
	CreateTaskSay(tbDecOpp);
end;

function no()
end;