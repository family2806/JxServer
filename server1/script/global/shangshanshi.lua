--����ʹ
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("��Ʒ����", 0)
		return
	end
	--��ȡ�����ļ�����ֻ֤��ȡһ��
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#>����ʹ:�����ƹ��������ʹ�ߣ����ܰ���ʲô�أ�",
		"<#>�ύ������/onsubmit",
		"<#>��ȡ����/ontakeprize",
		"<#>��ѯ�����ռ����еĹ���/onchecknum",
		"<#>�˽�˴λ/onhelp",
		"<#>��ֻ�������/oncancel",
	}
	
	Say(aryszContent[1], 5, aryszContent[2], aryszContent[3], aryszContent[4], aryszContent[5], aryszContent[6]);
end 

--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "") then 
			if (strCityTongName == strTongName) then
				return nCityID
			end
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

--ĳһ���е����������ӵ���ʼ���͵�����
function beginadward(nCityIndex)
	--����������г����ۼƵ�������
	for i=1, 7 do
		SetGlbValue(arraycitytoglobalvalue[i], 0)
	end
	
	--��������ۼ�����
	for i=1, 7 do
		CityData[i] = 0
	end
	
	local strTongName = GetCityOwner(nCityIndex)
	--�洢Ҫ�����ĳ�������
	SetGlbValue(AEXP_GLOBAL_ADWARD_CITY, nCityIndex)

	--���ý������������
	--�洢ʱ�����(ϵͳ��ʱ��)
	local nEnddate = GetCurrentTime() + AEXP_ADWARD_HOURNUM * 60 * 60
	SetGlbValue(AEXP_GLOBAL_ENDDATE, nEnddate)
	
	--���д���
	savevalue()
		
	--����������ʾ��Ϣ
	AddGlobalCountNews("���"..strTongName.."ռ����еĹ����ﵽ��ý�����Ҫ����ð����а��ڵ���������ʹ����ȡ����,��������Ϊ"..AEXP_ADWARD_HOURNUM.."Сʱ,���ڲ������г��й���ȫ�����", 1)
end

function onsubmit()
	--�ж�ռ����еİ��
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1) then
		Say("<#>��û�м����������İ��û��ռ����У��޷��ύ�����", 0)
		return
	end
	
	--�򿪸������
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	GiveItemUI( "�ύ������", "������������Ӱ��ռ����еĹ��������������۵�һ�����������������а��ڶ���õ���,���ǰ���Ŀǰռ�������<color=read>"..arraycityindextoname[nCityIndex].."<color>,����Ϊ:<color=read>"..nNum.."<color>", "onsubmitconfirm", "oncancel" );
end

-- ��ȡ�ɻ�ý�����������Ŀ
function GetMaxCardCount()
	local count = GetTongMemberCount()
	if (count == 0) then
		return 999999999
	end
	if (count > 1500) then	-- (1500, +��)
		return 49999
	elseif (count > 900) then	-- (900, 1500]
		return 39999
	elseif (count > 600) then	-- (600, 900]
		return 29999
	elseif (count > 300) then	-- (300, 600]
		return 19999
	else 						-- (0, 300]
		return 9999
	end
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("��û���ύ������")
		return
	end
	
	--�жϱ����ռ��ĳ���
	local nCityIndex = gettongownercity();
	if (nCityIndex < 1) then
		Say("��û�м����������İ��û��ռ����У��޷��ύ�����", 0)
		return
	end
		
	--�ж���Ʒ�Ƿ�Ϊ������
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_AWARDMEDIAL_NGENTYPE or
			DetailType ~= AEXP_AWARDMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_AWARDMEDIAL_PARTYPE) then
				Msg2Player("������ж�������������Ӵ��")
				return 0			
		end
	end
	local nTotalNum = 0;
	--ɾ������������
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	--if (nNum < 0) then
		--nNum = 0
	--end
	nNum = nNum + nTotalNum;
	SetGlbValue(arraycitytoglobalvalue[nCityIndex], nNum)
	SetTask(1074,1);
	
	local strTongName = GetCityOwner(nCityIndex)	
	if (nNum >= GetMaxCardCount()) then
		Msg2Player("���ǰ���ռ��ĳ���"..arraycityindextoname[nCityIndex].."��ý���,��Ͽ�ȥ��ȡ������")
		WriteLog( "["..date("%Y-%m-%d %X").."] ���:"..strTongName.."����"..arraycityindextoname[nCityIndex].."��ý���. "..GetAccount().."("..GetName()..")�ύ��"..nTotalNum.."�������� (Current OnlineTime: "..GetGameTime().." sec)" );
		beginadward(nCityIndex)
	else
		CityData[nCityIndex] = CityData[nCityIndex] + nTotalNum
		if (CityData[nCityIndex] > AEXP_ADDMAX_SAVE) then
			CityData[nCityIndex] = 0			
			WriteLog( "["..date("%Y-%m-%d %X").."] ���"..strTongName.."����"..arraycityindextoname[nCityIndex].."��Ϊ"..GetAccount().."("..GetName()..")�ύ��"..nTotalNum.."��������,������������������д���,����������Ϊ:"..nNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
			savevalue()			
		end
		Msg2Player("���ǰ�Ṧ��������"..nTotalNum..",Ŀǰ��:"..nNum);
	end 	
end

function ontakeprize()
	
	-- �ж���Ұ����ռ���е�����
	local nCityIndex = gettongownercity()	
	if (nCityIndex < 1 ) then
		Say("<#>��û�м��������İ��û��ռ����У��޷���ý�����", 0);
	 	return 0
	end
	 
	--�ж���Ұ����ռ�����Ƿ��Ľ���
	local nAdwardCityIndex = GetGlbValue(AEXP_GLOBAL_ADWARD_CITY)
	if (nAdwardCityIndex < 1) then
		Say("<#>��ǰû�г��л�ý������޷���ȡ��", 0);
		return 0
	end
	
	if (nAdwardCityIndex ~= nCityIndex) then
		Say("<#>�����ڵİ��ռ����еĳ��й���������û�л�ý�����", 0);
		return 0
	end
	 
	local nNow = GetCurrentTime()
	local nLastdate = GetGlbValue(AEXP_GLOBAL_ENDDATE);
	if (nNow > nLastdate) then
		Say("<#>�콱�����ѹ����޷���ȡ���γ��й����õ��Ľ�����", 0);
		SetTask(1074,0);
		return 0
	end
	
	--�ж���ҵ����ʱ��
	if (GetJoinTongTime() < AEXP_PLAYERTONG_LIMIT * 24 * 60) then
		Say("<#>�����ʱ�䲻��<color=red>"..AEXP_PLAYERTONG_LIMIT.."<color>��,�޷���ȡ������", 0);
		return 0
	end
	
	--�ж�������һ�ε��콱����
	local today = tonumber(date("%Y%m%d"))
	local nLastAdward = GetTask(AEXP_TASK_ADWARDDATE)
	if (today == nLastAdward) then
		Say("<#>����Ľ������Ѿ���ȡ�������ٴ���ȡඡ�", 0);
		return 0
	end
	
	--�������������������ô���뽱��
	if(GetTask(1074) ~= 1) then
		Say("<#>�㲻���ύ������Ϊ��������ף�������ȡ������",0);
		return 0
	end
	giveprize();
	return 1
end

--������ɹ���ô������ҽ���
function giveprize()
	--����(�ɲ�¶�Ľ���)
	--�漴�γɽ���
	local iRand = random(1,1)
	if (iRand == 1) then
		local nExpRate = 0--GetNpcExpRate()
		if (nExpRate == nil) then
			nExpRate = 1
		end
		if (nExpRate <= 100) then
			AddSkillState(440, 1, 1, AEXP_ADWARD_TIME * FRAME2TIME * 60 * 60);
			SetTask(1074,0);
			Say("��ϲ�㣬��������"..AEXP_ADWARD_TIME.."Сʱ�ھ���˫���Ľ���", 0)
		else
			Say("<#>�Բ���Ŀǰ��ʱ�޷����㾭��ӱ���", 0)
			return 1
		end
	else
		--��������ӱ�Ľ����� 	
	end
	
	--��λ����õ����ﻹ��ǰ�棿
	--�����������콱����
	WriteLog( "["..date("%Y-%m-%d %X").."] ���й����ۼƵ�һ���޶ȡ����"..GetAccount().."("..GetName()..")��ȡ�˽���(Current OnlineTime: "..GetGameTime().." sec)" );	
	
	-- �����ϴ��콱������
	local today = tonumber(date("%Y%m%d"))
	SetTask(AEXP_TASK_ADWARDDATE, today)
end

function onchecknum()
	--�õ�������ڰ��ռ����е�����
	--���С��1��ô��ʾ��ҵİ��û��ռ�����
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1 ) then
		Say("<#>��û�м�������������ڵİ��û��ռ����У�û�г��й������ۡ�", 0);
		return 
	end
	
	--�õ���Ұ��ռ����е�����������
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	Say("<#>���ǰ��ռ�����Ϊ<color=red>"..arraycityindextoname[nCityIndex].."<color>,���й���Ϊ:<color=red>"..nNum.."<color>", 0);
end

function oncancel()
	return
end

function onhelp()
	Talk(2, "continuefun_help","<#>���Ʒ���ϵͳ����:��ҿ�����50�����ϵ�ͼ,��ֵ���õ�������ͷ�����.7�����ռ����ɵĳ�Ա�ɵ���������ʹ[Ů]�ύ������,Ϊ����ĳ��л�����Ӧ���Ĺ���.", "������ҿ��Ե����ݷ���ʹ���У�ʹ�÷�����ͷ��������.ÿ����Ҷ�ĳ�����ύһ��������,��ó��е��������ۻ���������ȥһ��.");
end

function continuefun_help()
	Talk(3, "", "��ĳ�����л��۵Ĺ����ﵽһ������,�������ʱ����ڣ�����Ϊ����ύ��������ĵĳ�Ա,������һ����콱ʱ���ڻ�ã�Сʱ����˫�������⽱��,�����������е���������������.","ע��:<color=red>�ڴ��ڼ��벻Ҫʹ���ɲ�¶,����һ������˫������ʧЧ.<color> ���콱�ڼ�,�����������й����ٴδﵽ��������,��ʼΪ�µİ��ɷ���,��ǰδ�콱Ʒ�İ��ڽ����ܵõ��κν���.", "����ģ��������蹦���Ĺ�ϵ:����<=300,����9999;300<����<=600,����19999;600<����<=900,����29999;900<����<=1500,����39999;1500<����,����49999.");
end