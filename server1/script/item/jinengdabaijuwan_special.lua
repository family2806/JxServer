--ʹ�ü��ܴ�׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>1 ���ر��ܴ�׾��裬ʹ�ú󽫻��<color=red>8Сʱ<color> ί�С���һ�㼼�ܰ׾��������Ч��.",
		"<#>ʹ���ر��ܰ׾��� /use",
		"<#> ��������!/cancel",
		"<#> ������ʣ��Ĺһ�ʱ��/get_left_time",
		"<#> ѡ�����߹һ�����/#selectofflineskill('cancel')",
		"<#> ���ܹһ��淨��ϸ��/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--ѡ��ʹ�ü��ܴ�׾���
function use()
	local sparetime = GetTask(AEXP_SPECIAL_SKILL_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SPECIALSKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("�������߹һ�ʣ��ʱ��Ϊ<color=red>"..hours.."<color>gi?color=red>"..minutes.."<color> ���ӡ�����ί���ۼ�ʱ�䲻�ܳ���<color=red>10000 Сʱcolor>.", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SPECIALSKILLCHANGE;
			SetTask(AEXP_SPECIAL_SKILL_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("ʹ�óɹ����������߹һ�ʱ��Ϊ<color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color> ����",0);
			writeUseBaiJulog("skillofflineitem_special", hours, minutes);
		else
			Say("û���ر��ܰ׾��裬����ʹ��", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end