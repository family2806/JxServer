Include("\\script\\event\\valentine2007\\head.lua");

function isValentine2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070213 and nDate <= 20070215) then
		return 1;
	else
		return 0;
	end;
end;

function Valentine2007_main()
	Say("���ϣ���֪�Ӻ�ʱ�𣬽��´��ֿ�ʼһ����ô���۵Ŀ�����Ϊ��ף����ر�Ľ��գ��Ϸ��͸���λ����һЩ <color=yellow>õ������<color>. ��λ���Ժ��Ǹ��˵�ɽ��ˮ��֮�أ��Լ���<color=yellow>õ����<color> ���Լ�.", 3,
			"�ã�������õ������/want_take_roseseed",
			"�����˽����˽ڻ/about_valentine2007", 
			"���Ժ����/no");
end;

function want_take_roseseed()
	if (checkValentine2007Limit() ~= 1) then
		Say("���ϣ����ǲ�����˼���Ϸ�ֻ��õ�����Ӹ����<color=yellow>80�������ҳ�ֵ<color>.", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
		Say("����: <color=yellow>��13/02/2007 ��15/02/20007<color>, 80�������ҳ�ֵ��������ʿ�������Ϸ���ȡ<color=yellow>1<color> õ�����ӣ�������ȡ��?", 2, 
		"�ǵģ�������ȡõ������/sure_task_roseseed",
		"������Ҫ����/no");
	else
		Say("���ϣ�ÿ��ֻ�ܻ��<color=yellow>1<color> õ�����ӡ������㲻���Ѿ��������?", 0);
	end;
end;

function sure_task_roseseed()
	if (isValentine2007() == 1) then
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
			AddItem(6,1,1361,1,0,0);
			SetTask(TSK_VALENTINE_ROSE_DATE, nDate)
			WriteLog(format("[L?Tinh Nh�n 2007]\t%sName:%s\tAccount:%s\t �����1��õ������.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			Say("���ϣ�õ���������⣬���ȥ����һ������õ����.", 0);
		end;
	end;
end;

function about_valentine2007()
	Say("���ϣ��ڻ�ڼ䣬80�����ϳ�ֵ���ÿ����Ի��һ��õ�����ӣ��������ɱ��������һ���ֻ������ֵ�ʱ�������ϻ���ֱ�ǣ����õ������ȡһ����ˮ��ʩ�ʡ����ݡ�������������ڹ涨ʱ����������񣬲���Խ��ȷ��õ�廨�����������ȥ�μӰ�!", 0);
end;


