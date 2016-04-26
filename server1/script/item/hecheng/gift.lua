
--========�ඨ��====================================--
--������Convert
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	������㼦����������������ϵ�ļ�ֵ�����ü�������
--����һ���Ʒ�ļ�ֵ�����Լ�ѡ��Ʒ��
--
--��Ա������
--	__gifttabfile�����������ֵ��tabfile
--	__bonustabfile����Ʒ��tabfile
--	__giftWorth���������������ļ�ֵ����
--	__bonusWorth����Ʒ�ļ�ֵ����
--��Ա������
--	:loadSettings()�������ֵ���趨�ļ���
--	:giftLevelup(worth)��������������
--	:convert(worth)����worth��ȡ��Ʒ
--
--������
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\class\\worthanalyse.lua")
end

Convert = {
--========��������==================================--
--����ԭ�Σ�:loadSettings()
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���������ļ������м�ֵ���ļ��㡣�ú�����������
--settings/event/chinesenewyear/giftlvlup.txt��
--settings/event/chinesenewyear/bounslist.txt�ļ���
--Ȼ������������ļ��ֱ�����������������ļ�ֵ�����
--��������һ���Ʒ�ļ�ֵ����
--������
--	��
--����ֵ��
--	��
--������
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__crystaltabfile = new(KTabFile,"/settings/event/juanzhouhecheng/crystal.txt","CRYSTAL")		
		self.__giftWorth = new(WorthAnalyse,80)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		return
	end,
	
--========��������==================================--
--����ԭ�Σ�:giftLevelup(worth)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�ɼ�ֵ��worthѡ����Ҫ�����õ�����������������š�
--������
--	worth����ֵ���������Ǵ�����ύ�����������������
--��ֵ���ܺ͡�
--����ֵ��
--	�ɹ��򷵻ؽ�Ҫ�����õ���������������������Ϊnil
--������
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
	end,
}



TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --����5000������ˢˮ��

MAXGIVENUM = 20  --���Ը�������������
TF_GIFT_WORTH = 3  --giftlvl.txt��worth�������
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8
TF_CRYSTAL_WORTH = 2

Convert:loadSettings()


--========��������==================================--
--����ԭ�Σ�ComputeWorth(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ݸ���������Ʒ����������ֵ����
--������
--	nCount��������������������
--����ֵ��
--	�ɹ��򷵻ؼ�ֵ�������򷵻�nil
--������
--	��
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--�����ֵ��
	local crystal = 0	--ˮ����ֵ��
	local maxCount = 0	--���������
	
	if(nCount == 0) then
		Talk(1, "GiveUIForGift", "<#>ɶ�������������ɶѽ��")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)

		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --�������
			Talk(1,"GiveUIForGift","<#>�������Ϻ�׶���ѽ��զ������࿣�")
			return nil
		end
		if(d > 467 and d < 487) then -- ����
			crystal = crystal + GetItemStackCount(itemIdx)* tonumber(Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467)))
		else --��������
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ����̫��
					Talk(1, "GiveUIForGift", "<#>����Ķ���̫�࣬�����尡��")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				if (d == 518) then
					Say("�����ļ���������������10���ļ��������������ܻᵼ�ºϳ�ʧ�ܣ�Ҫ��Ҫ���ºϳɣ�", 2, "�õģ����ºϳ�/GiveUIForGift", "���ˣ��´ΰ�/onCancel")
					return nil
				end
				maxCount = maxCount + num
				local lvl = d - 507
				worth = worth + num * tonumber(Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl))
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --��ֵ������5000w������ˢ����
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1, "GiveUIForGift", "<#>�Բ���������Ҫһ�������������")
		return nil
	end

	return worth + crystal
end
--========��������==================================--
--����ԭ�Σ�GiveUIForGift()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�򿪸�����棬���ںϳɼ��������������ٵĶԻ�
--���á�
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function GiveUIForGift()
	GiveItemUI("������������ϳ�","��������20��������������Ͷ��ʥ���ʱʣ�µı�����", "GiftLevelUp", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�GiftLevelUp(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ѡ������������Ʒ֮�󣬵���������棬�˺���Ϊ
--�ø��������ȷ����ť֮��Ļص�������
--������
--	��������е�����Ʒ����������������������ӵ�������
--����ֵ��
--	��
--������
--	��
--==================================================--
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ��������������
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--����ˢˮ�����۵�������Ʒ������¼��־
		WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
					"�ںϳ����������ʱ��ʹ���˳���5000���ֵ���ı���������ˢ��������ϸ���󣬿��Ƕ�����ʺš�")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
					"�Ѿ���"..GetTask(TID_CLONECRYSTAL).."��ʹ�ü�ֵ���ĳ���������临�Ʊ����Ŀ����Էǳ��󣬽�����������")
		end
		--˵����ô���أ��Ի�һ��
		Talk(1,"","<#>�ף�ʧ���ˣ�զ���°�����զ��զ��ѽ����")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#>�ף�ʧ���ˣ�զ���°�����զ��զ��ѽ����")
		return
	end
	if (idx == 1) then
		Talk(1,"","<#>�ף�ʧ���ˣ�զ���°�����զ��զ��ѽ����")
		return
	end

	AddItem(tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P2,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P3,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P4,idx)),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
					"������"..worth.."��ֵ������������ϳɵõ�"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."��ֵ�����������ϵͳ�õ�"..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."ʣ���ֵ����")
	Talk(1, "","<#>��ϳɳ���һ��Ǳ��Ϊ"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."�ļ�����������")
	Msg2Player("������һ��������������")
	return
end

function main()
	Talk(1, "GiveUIForGift", "�ϳɼ����������ֻ�ܷ������20��<color=yellow>������������<color>���Ϳ��ܺϳɸ��߼��ļ�����������������ʥ���ʱʣ�µ�<color=yellow>����<color>Ҳ���Է�������ߺϳɵļ��ʡ�")
end

function onCancel()
end