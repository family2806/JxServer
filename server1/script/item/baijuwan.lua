--ʹ�ð׾���ű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>һ�Ű׾��裬ʹ�ú�ɻ��<color=red>1Сʱ<color>�������й�ʱ�䡣",
		"<#>ʹ�ð׾���/confirmlevel",
		"<#>���ٿ��ǿ���/cancel",
		"<#>��ѯ��ʣ��������й�ʱ��/get_left_time",
		"<#>���������йܵ���ϸ����/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--�жϵȼ��ٴ�ȷ��
function confirmlevel()
	str=
	{	"<#>��Ϊ��ĵȼ�����<color=red>50��<color>�������������й�״̬�ڣ�����Խ��а�̯���ף����һ�ø�Ե����������<color=red>����ֵ<color>����ȷ��Ҫʹ�ð׾�����",
		"<#>ȷ��/use",
		"<#>���ٿ��ǿ���/cancel",
		"<#>��Ϊ�㲻�ǳ�ֵ�û������Բ���ʹ�������йܹ��ܡ������ֵ����ʹ�ø���Ʒ��"
	};

    -- �俨�û�����ʹ�ð׾���
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end
	
	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--ѡ��ʹ�ð׾���
function use()
	sparetime = GetTask(AEXP_SMALL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;
	end

	--showtime = floor(sparetime /(FRAME2TIME * 60));		--���û���ʾ��ʾ������
	if ((sparetime + AEXP_SMALLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("��Ŀǰ�����߾����й�ʣ��ʱ��Ϊ <color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color>���ӣ���������߾����й�ʱ���ۼƲ����Գ���<color=red>10000Сʱ<color>�������һ��ʱ����ʹ�ð׾��衣", 0);
	else
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		smallgeneraltype,smalldetailtype,smallpartype = GetItemProp(itemindex);
		if ( smallgeneraltype ~= AEXP_SMALL_NGENTYPE
			or smalldetailtype ~= AEXP_SMALL_DETAILTYPE
			or smallpartype ~= AEXP_SMALL_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);
		
		if (nresult > 0) then 
			ntotaltime=sparetime + AEXP_SMALLCHANGE;
			SetTask(AEXP_SMALL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("ʹ�óɹ�����Ŀǰ�������й�ʣ��ʱ��Ϊ <color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color>����",0);
			writeUseBaiJulog("offlineitem_small", hours, minutes);
		else
			Say("û�а׾������ʹ��", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end