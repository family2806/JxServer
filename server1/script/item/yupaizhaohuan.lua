--zero 20070713 �����ٻ�
--��һ���ֽڼ�¼�� �ڶ����ֽڼ�¼�� �������ֽڼ�¼����Ϊֻ��һ�Σ�ֻ��Ҫ��¼ʱ��
--tinhpn 20100720: forbid item
Include("\\script\\item\\forbid_jinpai_yupai.lua");

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");

--tinhpn 20100803: Patch Request
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--�����ͼ����
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end


yupai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yupai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	--if(nDate>20080331) then
	--	Say("���ƹ���ʹ�����ޣ���Ч�ˣ�ֻ�ܶ���",0)
	--	return 0;
	--end
	
	--tinhpn 20100803: Patch ReQuest
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("�����ڴ�ʹ�ø���Ʒ.")
		return 1
	end
	
	--tinhpn 20100720: forbid item
	if (ForbidMap() == 1) then
		return 1
	end
	
	if( IsCharged() == 0) then
		Say("�����ź���ֻ�г�ֵ��Ҳ���ʹ��.",0);
		return 1; 
	end
	if( GetLevel() < 90 ) then
		Say("�����ź���ֻ��90��������Ҳ���ʹ��.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,3) ) then --���ǽ���
		if( CallBoss(5) == 0) then
			TaskValue=SetByte(TaskValue,3,nDate); --������������ ��1�ֽ�
			SetTask(yupai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
		
	else
		Say("������ʹ��һ�������ˣ����������ʹ����!",0);
		return 1;
	end
	
end

function GetDesc(nItem)
end