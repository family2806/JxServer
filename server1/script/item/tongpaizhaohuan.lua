--zero 20070713 ͭ���ٻ�
--������� ǰ16bit��ľ�� ǰ8bit�����ڣ���¼�գ���8bit��¼����
--           ��16bit��ͭ�� ǰ8bit���գ���8bit����
--           
--           ʹ��GetByte(TaskValue,1)ȡľ�Ƶ�����
--               GetByte(TaskValue,2)ȡľ��ʹ�ô���
--               GetByte(TaskValue,3)ȡͭ������
--               GetByte(TaskValue,4)ȡͭ��ʹ�ô���
--���������������
--               SetByte(TaskValue,i,n) ����i��ʾ�ڼ��ֽڣ�n��ʾ���ڻ���� 10����
Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
tongpai_Task=1826;
function main( nItemIdx )
	local TaskValue=GetTask(tongpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20070820) then
		Say("����һ��ʹ���ڣ�����Ч��!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("�����ź���ֻ�г�ֵ����Ҳ���ʹ��.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("�����ź���ֻ��90��������Ҳ���ʹ��.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,3) ) then --���ǽ�������ָ�
		TaskValue=SetByte(TaskValue,3,nDate); --����ͭ������ ��3�ֽ�
		TaskValue=SetByte(TaskValue,4,10);    --�ָ�ͭ�ƴ���10 ��4�ֽ�
		SetTask(tongpai_Task,TaskValue); -- ���������������
	end
	local temp_count=GetByte(TaskValue,4);--���ʹ�ô���
	if(temp_count > 0 ) then --��������0��
		if( CallBoss(2) == 0) then
			TaskValue=SetByte(TaskValue,4,temp_count-1); --ʹ�ô���-1
			SetTask(tongpai_Task,TaskValue); -- ���������������
			return 0;
		else
			return 1;
		end	
	else
		Say("�����Ѿ�ʹ��10��ͭ���ˣ�������ܼ���ʹ����!",0);
		return 1;
	end
	
end

function GetDesc(nItem)
end