--zero 20070713 �����ٻ�
--��һ���ֽڼ�¼�� �ڶ����ֽڼ�¼�� �������ֽڼ�¼����Ϊֻ��һ�Σ�ֻ��Ҫ��¼ʱ��

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
yinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20080331) then
		Say("�����ѹ�ʹ���ڣ�ʧȥЧ��!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("�����ź���ֻ���ѳ�ֵ��Ҳ���ʹ��.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("�����ź���ֻ��90��������Ҳ���ʹ��.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,1) ) then --���ǽ���
		if( CallBoss(3) == 0) then
			TaskValue=SetByte(TaskValue,1,nDate); --������������ ��1�ֽ�
			SetTask(yinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("������ʹ��1�������ˣ���������ܼ���ʹ����!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end