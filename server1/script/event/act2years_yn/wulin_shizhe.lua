--2007��-Խ�����彭������Ƭ
--��������2�������ջ��
--��2007��06��11����2007��07��01��
--by fmz
--����ʹ��,Խ��2007����
--modify by С�˶��

--ACT2YEARS_YN_CELLPAPER_ID = 1436        --����ֽ��ID
--ACT2YEARS_YN_BOWKNOT_ID = 1437          --�������ID
--ACT2YEARS_YN_ROSE_ID =  1438            --õ�廨��ID
--ACT2YEARS_YN_WHITEBOX_ID =  1439        --��ɫ���
--ACT2YEARS_YN_BLUEBOX_ID =   1441        --��ɫ���
--ACT2YEARS_YN_YELLOWBOX_ID = 1440        --��ɫ���
--ACT2YEARS_YN_NORMALCAKE_ID =1442        --�±�
--ACT2YEARS_YN_MIDCAKE_ID = 1443          --�����±�
--ACT2YEARS_YN_SPECIALCAKE_ID = 1444      --�����±�
ACT2YEARS_YN_BEGINTIME = 070825     --���ʼ����
ACT2YEARS_YN_ENDTIME = 070909       --���������
--
--2007Խ�Ϲ���
GUOQING_YN_TASK_DATE = 1831					--��¼��ȡʱ��,1.ʱ��(��%y),2.ʱ��(��)��3.ʱ��(��),4.��ȡ����
GUOQING_YN_TASK_COUNT = 0 				--��¼��ȡ����
GUOQING_YN_WUJIAOXING_ID = 1494			--ʤ�������
GUOQING_YN_LiHe_ID = 1495						--�������ID
--
function Act2Years2007_CheckInTime()
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > ACT2YEARS_YN_ENDTIME or nDate < ACT2YEARS_YN_BEGINTIME then
        return 0
    else
        return 1
    end
end
--
function main()
    --if Act2Years2007_CheckInTime() == 1 then
        --Say("����ף�����ִ�������������ա�<enter>��2007��06��11����2007��07��11���ڼ佫���ڽ����ϳ����������ͷҷ���õ�廨����������ռ���һЩ���ҽ��к���������",
        --5,"�һ���ɫ��Ʒ��/WLSZ_ExcWhiteBox","�һ���ɫ��Ʒ��/WLSZ_ExcBlueBox","�һ���ɫ��Ʒ��/WLSZ_ExcYellowBox",
        --"��ϸ˵��/WLSZ_ExcDetail","�����Ի�/WLSZ_End")
    if Act2Years2007_CheckInTime() == 1 then
    		Describe("����ʹ��: ������ף�����. �ڽ�������ʱ���� <color=red>25-08-2007<color> �� <color=red>09-09-2007<color>, ��ҿ���Я��10�� <color=yellow>ʤ�������<color> �� <color=yellow>15����<color> ������<color=yellow>�������<color>.<color=yellow>���������<color> �й�����ºͰ�ͼ. ����Ѽ���12�Ų�ͬ�İ�ͼ���л��� <color=yellow>�򿪵�3������<color>.",3,
    				"����һ��������/GuoQing_Give",
    				"�һ�������еķ���/guoQing_About",
    				"������/no"
    			)
    else		
        Say("����������ʹ��.",0)
    end
end
--
function WLSZ_End()    
end
--
function WLSZ_ExcWhiteBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    if nRoseNumber < 10 then
        return Say("��Ҫ10���õ��",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_WHITEBOX_ID,1,0,0 )
    Msg2Player("��10���õ�廻��ɫ���")
    Say("��õ�1�� <color=red>��ɫ���<color>, ������һЩ���벻��������.",2,"����/main","�����Ի�/WLSZ_End")
end
--
function WLSZ_ExcBlueBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nBOWKNOTNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_BOWKNOT_ID, -1 )
    if nRoseNumber < 10 or nBOWKNOTNumber < 1 then
        return Say("��Ҫ10���õ���1���������.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_BOWKNOT_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_BLUEBOX_ID,1,0,0 )
    Msg2Player("��10���õ���1��������ỻ��ɫ���.")
    Say("���õ�1��<color=red>��ɫ���<color>, ������һЩ���벻��������.",2,"����/main","�����Ի�/WLSZ_End")
end
--
function WLSZ_ExcYellowBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nCellPaperNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_CELLPAPER_ID, -1 )
    if nRoseNumber < 10 or nCellPaperNumber < 1 then
        return Say("��Ҫ10���õ���1�Ų���ֽ.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_CELLPAPER_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_YELLOWBOX_ID,1,0,0 )
    Msg2Player("��10���õ���1�Ų���ֽ����ɫ���.")
    Say("���õ�1�� <color=red>��ɫ���<color>, ������һЩ���벻��������.",2,"����/main","�����Ի�/WLSZ_End")
end
--
function WLSZ_ExcDetail()
    Say("��жһ�����:  <enter>��ɫ���: 10���õ���1���������� <enter> ��ɫ���: 10 ���õ���1�Ų���ֽ.",2,"����/main","�����Ի�/WLSZ_End")
end

--2007Խ�Ϲ���..
function guoQing_About()
	Describe("����ʹ��: �ڽ�������ʱ���� <color=red>25-08-2007<color> �� <color=red>09-09-2007<color>, ��ҿ��Դ�10�� <color=yellow>ʤ�������<color> �� <color=yellow>15����<color> ���ڽ�����1�� <color=yellow>�������<color>. <color=yellow>ʤ�������<color> ��ɢ����50�����ϵ�����. <color=yellow>���������<color> �й�����ºͰ�ͼ.���������1��12�İ�ͼ���л���<color=yellow>�򿪵�3������<color>.",1,"�����Ի�/WLSZ_End")
end

function GuoQing_Give()
	local nGuoqingLiHe = CalcEquiproomItemCount( 6,1,GUOQING_YN_WUJIAOXING_ID, -1 )

	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(GUOQING_YN_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetByte(nLibao,4);
	

	if ( nOlddate == nDate and nCount >= 50) then
			Say("����ʹ��: ���ź�, ÿ������ÿ�����ֻ�ܶһ�50�� <color=yellow>�������<color>, ����������.",0)
			return 1;
	end
	
	if nGuoqingLiHe < 10 then
		Say("����ʹ��: ���ź�, ����10��ʤ�������, ���ܶһ��������.",0)
		return 
	end
	
	if GetCash() < 150000 then
		Say("����ʹ��: ���ź�, û����15����, ���ܶһ��������.",0)
		return
	end
	if ( CalcFreeItemCellCount() < 2 ) then
		Say("��λ����, ��������.",0);
		return
	end
	if ( nOlddate ~= nDate ) then
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,0));
	end
	Pay(150000)
	nCount = GetByte(GetTask(GUOQING_YN_TASK_DATE),4);
	SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,nCount+1))
	ConsumeEquiproomItem( 10,6,1,GUOQING_YN_WUJIAOXING_ID,-1 )
 	local nidx = AddItem(6,1,GUOQING_YN_LiHe_ID,1,0,0 )
	Msg2Player("ף�������1��<color=yellow>�������<color>.")
	WriteLog(format("[WuLinShiZhe]Date:%s\t Account:%s\t Name:%s\t Effect:GetItem %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)))
end
