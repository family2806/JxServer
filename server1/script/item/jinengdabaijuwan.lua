--ʹ�ü��ܴ�׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>һ�ż��ܴ�׾��裬ʹ�ú�ɻ��<color=red>8Сʱ<color>�������й�ʱ�䡣",
		"<#>ʹ�ü��ܴ�׾���/use",
		"<#>���ٿ��ǿ���/cancel",
		"<#>��ѯ��ʣ��������й�ʱ��/get_left_time",
		"<#>ѡ�������йܼ���/#selectofflineskill('cancel')",
		"<#>���������йܵ���ϸ����/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--ѡ��ʹ�ü��ܴ�׾���
function use()
	local sparetime = GetTask(AEXP_SKILL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("��Ŀǰ�����߼����й�ʣ��ʱ��Ϊ <color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color>���ӣ���������߼����й�ʱ���ۼƲ����Գ���<color=red>10000Сʱ<color>�������һ��ʱ����ʹ�ü��ܴ�׾��衣", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SKILLCHANGE;
			SetTask(AEXP_SKILL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("ʹ�óɹ�����ʣ������߼����й�ʱ��Ϊ <color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color>����",0);
			writeUseBaiJulog("skillofflineitem_normal", hours, minutes);
		else
			Say("û�м��ܴ�׾������ʹ��", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end