Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbVnHuyenVu = 
{
	nStartDate = 201205240000,
	nEndDate = 201207232400,
	nExtPointID = 3,
	nExtPointBit = 9,--��web��������code
	nExtPointID2 = 3,
	nExtPointBit2= 10, --check gamer ����ȡ����
	--HVL 2
	nExtPointID3 = 3,
	nExtPointBit3= 11,--��web��������code

	nExtPointID4 = 3,
	nExtPointBit4= 12,--check gamer ����ȡ����
	
	nTittleID = 3002,
	nTittleExpiredTime = 30 * 24 * 60 * 60 * 18,
}

function tbVnHuyenVu:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbVnHuyenVu:AddDialog(tbDialog)
	if not self:IsActive() then
		return
	end
	tinsert(tbDialog, "���������/#tbVnHuyenVu:main()")
end

function tbVnHuyenVu:main()
	if (self:IsActive() ~= 1) then
		Talk(1,"","��ѽ���!")
		return
	end	
	if PlayerFunLib:CheckTotalLevel(150, "default", ">=") ~= 1 then
		return
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID3, self.nExtPointBit3) ~= 1) then
 		Talk(1,"","��Ǹ!���޷���ȡ�˽���.")
 		return
 	end
	if (GetExtPoint(self.nExtPointID2) < 0) or (GetExtPoint(self.nExtPointID3) < 0) then
		Talk(1,"","���޷���ȡ�˽���,  ����ϵ����ίԱ�����Խ��")
		return
	end	
	
	 if (tbExtPointLib:GetBitValue(self.nExtPointID4, self.nExtPointBit4) ~= 0 ) then
 		Talk(1,"","������ȡ����")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValue(self.nExtPointID4, self.nExtPointBit4, 1) ~= 1) then
	 	return
	 end
	local nIsLastEvent = tbExtPointLib:GetBitValue(self.nExtPointID2, self.nExtPointBit2)
	local nServerTime = GetCurServerTime()+ 2592000; --30*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000
	SetTask(TASK_ACTIVE_TITLE, self.nTittleID);
	Title_AddTitle(self.nTittleID, 2, nTime);
	Title_ActiveTitle(self.nTittleID);
	local sz_title = Title_GetTitleName(self.nTittleID);		
	Msg2Player(format("��ϲ����ô˳ƺ� <color=yellow>%s<color>", sz_title));
	if nIsLastEvent == 1 then
	 	local tbAward = {
		 	{szName = "����ֵ", nExp_tl = 200000000},
		 	{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=2,nExpiredTime = 43200, nBindState = -2},
		 	{szName="�������",tbProp={6,1,30194,1,0,0},nCount=2,nExpiredTime = 10080,},
		 	{szName="���- Ӣ��ս��",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60, nBindState = -2},
		 	{szName = "��ṱ�׵�", nVngContribute=20000,nCount=1,},
		 }
	 	tbAwardTemplet:Give(tbAward, 1,{"������2","�콱����2"})	 
	else				
		 local tbAward = {
		 	{szName = "����ֵ", nExp_tl = 100000000},
		 	{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nExpiredTime = 43200, nBindState = -2},
		 }
	 	tbAwardTemplet:Give(tbAward, 1,{"������2","�콱����1"})	 	
	end	
end
