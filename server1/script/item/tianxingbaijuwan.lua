--ʹ����Ч��׾���ű�
--2006.08.29
--80Сʱ�����й�ʱ��
--����Ϊԭ�׾Ե�2��

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>���ǰ׾��裬ʹ�ú���<color=red>8 Сʱ<color> ί������.��þ�����ƽ���׾����5��",
		"<#>ʹ�����ǰ׾���/confirmlevel",
		"<#> ����������!/cancel",
		"<#> �鿴�ҵĹһ�ʣ��ʱ��/get_left_time",
		"<#> �����һ��淨��ϸ��/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--�жϵȼ��ٴ�ȷ��
function confirmlevel()
	str=
	{	"<#>��ĵȼ����� <color=red>50<color>. ���ԣ�������ί��״̬�£�����Խ������������Լ���ȡ��Ե�㣬���ǲ��ܻ��<color=red>����ֵ<color>. �����Ҫʹ���ر�׾�����#?",
		"<#> ʹ��/use",
		"<#> ��������!/cancel",
		"<#> ��Ϊ�㲻�ǳ�ֵ�ͻ������Բ���ʹ�����߹��ܡ����ֵ��ʹ�ø���Ʒ!",
		"<#>�����Ҫ50�������Լ��Ѿ�ת������ʹ�ø���Ʒ."
	};

    -- �俨�û�����ʹ�ô�׾���
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end

	nLevel = GetLevel();

	if (nLevel < AEXP_NEEDLEVEL or ST_IsTransLife() ~= 1) then
		Talk(1, "", str[5]);
		return 
	end
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--ѡ��ʹ�����ǰ׾���
function use()
	local sparetime = GetTask(AEXP_TIANXING_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--���û���ʾ��ʾ������
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("���ǰ׾���ί��ʣ��ʱ��Ϊ <color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color> ����. ������۵�ί��ʱ�䲻�ܳ���<color=red>10000 Сʱ<color>.", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 2183) then
			return --������Ч��׾�
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TIANXING_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("�ɹ�ʹ�ã����ǰ׾����ί��ʱ��Ϊ<color=red>"..hours.."<color>Сʱ<color=red>"..minutes.."<color> ����",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("û�����ǰ׾������ʹ��", 0);	
		end
	end
end

--ѡ���ٿ��ǿ���
function cancel()
	return 0
end