Include("\\script\\event\\newyear_2009\\lucky_bag\\hongbaohecheng.lua");
Include("\\script\\event\\newyear_2009\\lucky_bag\\wuguohecheng.lua");
Include("\\script\\event\\newyear_2009\\xinnianyanhua\\xinnianyanhua.lua");
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main()
	local arytalk = {"<dec><npc>�������ǹ����ʱ�򣬴�����ԥʲô��?"};
	
	if (newyear0901_hongbao_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "����ѹ����/#newyear0901_hongbao_dialogmain()";
	end
	
	if (newyear0901_wuguo_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "����̻#newyear0901_wuguo_dialogmain()";
	end
	
	if (newyear0901_yanhua_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "�̻��ش��/#newyear0901_yanhua_dialogmain()";
	end
	
	if (valentine2009_isCarryon() == 1) then
		arytalk[getn(arytalk)+1]	= "������/#valentine2009_main()";
	end
	
	arytalk[getn(arytalk)+1]	= "������æ�����ʱ���ٹ����ɣ�/OnCancel";
	
	CreateTaskSay(arytalk);
end