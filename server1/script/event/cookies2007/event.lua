Include("\\script\\event\\cookies2007\\head.lua");

function iscookies2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070414 and nDate <= 20070424) then
		return 1;
	else
		return 0;
	end;
end;

function cookies2007_main()
	Say("С��: �Ϸ�ֻ����С�����������������һ�������, ������3��3����. ������·���������˰����л����Ǯ�ƶ�������. �Ϸ����λ���������ûػ����Ǯ��", 3,
			"���Ѿ��ҹ���/want_take_cookiesma",
			"�����˽�3��3�յĻ/about_cookies2007", 
			"��һ�����/OnCancel");
end;

function want_take_cookiesma()
	if (checkcookies2007Limit() ~= 1) then
		Say("С��: �治����˼, ֻ��<color=yellow>50�������ѳ�ֵ�����<color> �ſ��Խ�������ԭ�ϰ�.", 0);
		return 0;
	end;
	if (iscookies2007() == 1) then
		sure_task_cookiesma();
	else
		Say("С��: [���δ����] �ҵĻ������װ�Ķ�������ԭ��, ��л��������.",0);
		return 0;
	end
end;

function sure_task_cookiesma()
	if (iscookies2007() == 1) then
			if GetCash() < 100000 then 
				Say("С��: �Ϸ�ʧ��<color=yellow>10����<color>, ��֪����������û��?",0);
				return 0;
			end
			if CalcFreeItemCellCount() < 1 then 
				Say("С��: ��������! �Ϸ���С����Ҫ�͸�����.",0);
				return 0;
			end
			local nsum = CalcEquiproomItemCount(6,1,1393,-1);
			if nsum < 20 then
				Say("С��: ������δ��������, �Ϸ�ʧ��<color=yellow>20������<color> �İ�",0);
				return 0;
			end	
			if ConsumeEquiproomItem(20,6,1,1393,-1) ~= 1 then
				WriteLog(format("[2007��3��3��] \t%sName:%s\tAccount:%s\t ȡ�������ʧ��.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
				Say("С��: ȡ�������ʧ��.",0);
				return 0;
			else
				WriteLog(format("[2007��3��3��]\t%sName:%s\tAccount:%s\t �ɹ�ȡ�������.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			end
			Pay(100000);
			AddItem(6,1,1394,1,0,0);
			Say("С��: ��������ԭ�ϣ������Ͽ�ȥ��һλŮ��һ������.", 0);
		--end;
	end;
end;

function about_cookies2007()
	Talk(3,"","С��: ��ڼ�, ���д����������Ҷ��л����<color=yellow>�����<color>. ֮��, ����20�� <color=yellow>�����<color> ��<color=yellow>10����<color>��������е�NPCС�����ﻻȡ<color=yellow>����ԭ�ϰ�<color>.","��Ů���(50�������ѳ�ֵ) ���Ե��������У����ִ���߷羰��һͬ����."," ����������, ��ҽ�Ҫ���к���, ���̶�Ƥ, ���ڷ������Ĳ���, ��Ӳ��Խ�������������ı���Խ��.");
end;

function OnCancel()
	
end