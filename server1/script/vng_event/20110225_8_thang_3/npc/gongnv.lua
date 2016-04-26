--Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_GongNV = {}

function tbVNGWD2011_GongNV:addDialog(tbDialog)	
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= 20110321 or now < 20110307) then
		return
	end	
	tbDialog:AddOptEntry("���ʸ�Ů�ڻ",tbVNGWD2011_GongNV.main,{tbVNGWD2011_GongNV})				
end

function tbVNGWD2011_GongNV:main()	
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	if tbVNG_WomenDay2011:IsActive() == 1 then
		tbMainDialog:AddOptEntry("���ܻ", tbVNGWD2011_GongNV.description, {tbVNGWD2011_GongNV})
		tbMainDialog:AddOptEntry("��õ�廨��", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "��õ�廨��"})
		tbMainDialog:AddOptEntry("����ɫ����", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "��ͬ��ɫ����"})
	end
	tbMainDialog:AddOptEntry("��ȡ���佱��", tbVNGWD2011_GongNV.GetExtraAward, {tbVNGWD2011_GongNV})
	tbMainDialog:Show()			
end

function tbVNGWD2011_GongNV:description()	
	local tbDescDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDescDialog.szTitleMsg = "��ʱ����������ף���ʸ�Ů�ڻ���뵽��Ϸ��ҳ�˽�����."
	tbDescDialog:AddOptEntry("����", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDescDialog:Show()
end

function tbVNGWD2011_GongNV:GetExtraAward()
	local tbDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDialog.szTitleMsg = "��ѡ����"
	
	local tbTSK, tbTSK_FLAG = {}
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("��õ�廨������100��", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("��õ�廨������200��", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("ʹ��100 ����н���", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("ʹ��200 ����н���", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("ʹ��300 ����н���", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 300})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("ʹ��400 ����н���", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 400})
	end
	
	tbDialog:AddOptEntry("����", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDialog:Show()
end

function tbVNGWD2011_GongNV:ExtraRoseAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
		tbAward = {szName = "�i����ֵ", nExp=20000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
		tbAward = {szName = "�i����ֵ", nExp=40000000}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][�������� %d��]", nRank))
end

function tbVNGWD2011_GongNV:ExtraGiftAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
		tbAward = {szName = "�i����ֵ", nExp=25000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
		tbAward = {szName = "�i����ֵ", nExp=50000000}
	elseif nRank == 300 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
		tbAward = {szName = "�i����ֵ", nExp=75000000}
	elseif nRank == 400 then
		if (CalcFreeItemCellCount() < 2) then
			Talk(1, "", format("Ϊ�����Ʋ��������� <color=red>%d<color> װ����λ������콱!", 2))
			return
		end
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
		tbAward = 
			{
				{szName="����ӡ (ǿ��)",tbProp={0,3209},nCount=1,nQuality = 1,nExpiredTime = 43200},
				{szName="����ӡ (����)",tbProp={0,3219},nCount=1,nQuality = 1,nExpiredTime = 43200},
			}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][ʹ��%d ��н���", nRank))
end

function tbVNGWD2011_GongNV:onCancel()
end