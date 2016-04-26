--========�ļ�����==================================--
--�ļ�����convertgift.lua
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-2-1
--����������
--	���ڻ���ü����������ﻻȡ��������������
--��һ�������԰������ļ������������������ڶ������ü�
--���������ﻻȡ��Ʒ��
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--

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
		self.__gifttabfile = new(KTabFile,"/settings/event/chinesenewyear/giftslvlup.txt","GIFT")
		self.__bonustabfile = new(KTabFile,"/settings/event/chinesenewyear/bonuslist.txt","BONUS")
		self.__crystaltabfile = new(KTabFile,"/settings/event/chinesenewyear/crystal.txt","CRYSTAL")
		self.__giftWorth = new(WorthAnalyse,80)
		self.__bonusWorth = new(WorthAnalyse,60)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		for i=1,self.__bonustabfile:getRow() do
			self.__bonusWorth:addWorth(i,tonumber(self.__bonustabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		self.__bonusWorth:makeBaseP()
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
	
--========��������==================================--
--����ԭ�Σ�:convert(worth)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�ɼ�ֵ��worth�������ҽ�Ҫ�ĵ��Ľ�����š�
--������
--	worth����������ļ�ֵ��֮�͡�
--����ֵ��
--	����ɹ����򷵻����õ�����������������Ϊnil
--������
--
--==================================================--
	convert = function(self,worth)
		self.__bonusWorth:makeWorthP(worth)
		return self.__bonusWorth:getFromWorth()
	end,
	 
}

TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --����5000������ˢˮ��
GOLD_LASTDATE = tonumber(date("%d"))  --��һ�η��߼�ֵ����Ʒ�����ӣ�ֻ��¼����
GOLD_WORTH = 0  --�ѷ���Ʒ�ļ�ֵ��,����100000����
MAXWORTHPERDAY = 100000 --5����ֵ��ߵĻƽ�װ��
GOLD_PRICE_LIMIT = 10000000	--����10000000�Ľ����㱦�

MAXGIVENUM = 20  --���Ը�������������
TF_GIFT_WORTH = 3  --giftlvl.txt��worth�������
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8

TF_BONUS_TYPE = 2
TF_BONUS_TYPENAME = 3
TF_BONUS_NAME = 4
TF_BONUS_WORTH = 5
TF_BONUS_P1 = 6
TF_BONUS_P2 = 7
TF_BONUS_P3 = 8
TF_BONUS_P4 = 9
TF_BONUS_MESSAGE = 18
TF_BONUS_ANNOUNCE = 19

TF_CRYSTAL_WORTH = 2

--eg.
Convert:loadSettings()
--randomseed(date("%S"))
--for i=1,20 do
--	r = random(20000,150000000)
--	local idx = Convert:convert(r)
--	if(idx) then
--		print(r..":"..idx.."["..Convert.__bonustabfile:getCell("Worth",idx).."]="..r..Convert.__bonustabfile:getCell("Worth",idx).."->"..Convert.__bonusWorth.__worthP[idx])
--	end
--end

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
		Talk(1,"","<#> �����ϲ: ���Ҵ���ʲô����?'","������ͷ: '����! ��������! '")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --�������
			Talk(2,"","<#>�����ü: ���Ҵ���ʲô�ֶ���?' ","<#> ��������ͷ: '��! ���ٴ�����!' ")
			return nil
		end
		if(d > 467 and d < 487) then -- ˮ��
			crystal = crystal + GetItemStackCount(itemIdx)*Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467))
		else --��������
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ����̫��
					Talk(2,"","<#> �����ͷ: ������˼! ����ʹ��ۻ���!' ","<#> ��һ��������ٵ�ƨ��")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local lvl = d - 508
				if(lvl ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl)
				end
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --��ֵ������5000w������ˢˮ��
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1,"","<#> ������˼! ����Ҫ��һ�ݼ�������!")
		return nil
	end
	return worth + crystal
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
		WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					"�ںϳɼ��������ʱ��, ����ʹ��ˮ������5000���. ������������Account")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					"��ʹ��"..GetTask(TID_CLONECRYSTAL).."��, ����ˢˮ��. ��GMע��!")
		end
		--˵����ô���أ��Ի�һ��
		Say("<#> ���ʧ����˵: '��! ʧ����! Ҫ��Ҫ����һ��?' ",2,"�õ�! ��������һ��!/GiveUIForGift","����! ��Ҫ��ƭ����!/onCancel")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#> ���ҡҡͷ: ��ô����ʧ����?")
		return
	end
	if(idx == 1) then
		Say("<#> ���ʧ����˵: '��! ʧ����! �㻹Ҫ������?' ",2,"�õ�! ��������һ��!/GiveUIForGift","����! ����ƭ����!/onCancel")
		return
	end
	AddItem(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P2,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P3,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P4,idx),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					", ʹ��"..worth.."�����������������, �ϳ�"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."��������ļ�ֵ��, ϵͳ�ɽ��� "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."��ֵ����ʣ��.")
	Say("<#> �ϳ�һ��������Ǳ�ʵļ�������:"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."�㻹������?",
			2,
			"�����⣡��������һ��/GiveUIForGift","������! ������!/onCancel")
	return
end

--========��������==================================--
--����ԭ�Σ�ConvertBonus(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�ü�����������һ���Ʒ���˺�������������ȷ����ť
--�ص���
--������
--	nCount����������е���Ʒ����
--����ֵ��
--	��
--������
--	��
--==================================================--
function ConvertBonus(nCount)
	if(GOLD_LASTDATE ~= date("%d")) then --�µ�һ�쿪ʼ��
		GOLD_LASTDATE = date("%d")
		GOLD_WORTH = 0
	end
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ�Ľ���
	if(worth < 0) then
		--����ˢˮ�����۵�������Ʒ������¼��־
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					"����ȡ�´�����ʱ��, ������ʹ��ˮ������500���. ������������Account")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					"��ʹ��"..GetTask(TID_CLONECRYSTAL).."��, ����ˢˮ��. ��GMע��!")
		end
		--˵����ô���أ��Ի�һ��
		Talk(1,"","<#> ��ϲ�����, ��ʲô���ò���")
		return
	end
	local idx = Convert:convert(worth)
	if(not idx) then --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#> ���ҡҡͷ: ��ô����ʧ����?")
		return
	end
		
	local bonusWorth = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx))
	if(bonusWorth > GOLD_PRICE_LIMIT) then  --��ʼ��ע
		if((bonusWorth/100000 + GOLD_WORTH) > MAXWORTHPERDAY) then --��˹��ص���Ʒ���ܷ����ﵽÿ�췢�߼�����������
			Talk(1,"","<#> ����������Ѿ�������! ����������!")
			return
		else
			GOLD_WORTH = GOLD_WORTH + bonusWorth/100000
		end
	end
	for i=1,nCount do  --�۳����е���
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
					", ʹ��"..worth.."�������ﹻ��, ���Զһ�"..
					Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx).."�´�������Ŀ, ϵͳ�Ѿ�������"..
					tostring(worth-Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx)).."��ֵ����ʣ��.")
	return PayBonus(idx)
end

--========��������==================================--
--����ԭ�Σ�PayBonus(bonusIdx)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	����ҷ���settings/event/chinesenewyear/bonuslist.txt
--�е�bonusIdx��Ľ�Ʒ
--������
--	bonusIdx����Ʒ���ţ���tabfile�е�����-1
--����ֵ��
--	��
--������
--	��
--==================================================--
function PayBonus(bonusIdx)
	local _type = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_TYPE,bonusIdx))
	if(not _type) then return end --error.
	local msg = Convert.__bonustabfile:getCell(TF_BONUS_MESSAGE,bonusIdx)
	msg = replace(msg,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
	Msg2Player(msg)
	if(_type == 1) then --�ƽ�װ��
		AddGoldItem(0,Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	elseif(_type == 2) then --��ͨ����
		AddItem(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx),0,0,0,0,0,0,0,0)
	elseif(_type == 3) then --��ʱ״̬
		AddSkillState(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx))
	elseif(_type == 4) then --����ֵ
		AddOwnExp(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	else --Ī������
		print("pay bonus error.")
	end
	WriteLog(date("%H%M%S")..": �˻�"..GetAccount()..", ����"..GetName()..
			"���Զһ�"..Convert.__bonustabfile:getCell(TF_BONUS_TYPENAME,bonusIdx).."--"..
			Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx)..", ��ֵ��:"..
			Convert.__bonustabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	local announce = Convert.__bonustabfile:getCell(TF_BONUS_ANNOUNCE,bonusIdx)
	if(strlen(announce)>0) then
		announce = replace(announce,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
		announce = replace(announce,"<player>",GetName())
		AddGlobalNews(announce)
	end
	return
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
	GiveItemUI("�ϳɼ�������","����20�ݼ��������1������, �ҽ�������������!", "GiftLevelUp", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�GiveUIForBonus()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�򿪸�����棬���ڶһ��´�����������ٵĶԻ����á�
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function GiveUIForBonus()
	GiveItemUI("�����´�����","����20�ݼ��������1�������һ��´�����.", "ConvertBonus", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�EventHappyNewYear()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�´������ٶԻ��ӽ��档
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function EventHappyNewYear()
	local buttons = {
		"��������´�����/GiveUIForBonus",
		"����������������/GiveUIForGift",
		"�˽�˴λ/AboutNewYearEvent",
		"ȫ���Ǻ�С����. �Ҳ�����!/onCancel"
	}
	local talk = "<#> ��ӭ�μӻ<color=red>�´�����<color>.��ڼ�, �㽫������ <color=yellow>��������<color>. �������� <color=yellow>��������<color>, ���Դ�ȥ�һ��´�����"
	Say(talk,getn(buttons),buttons)
	return
end

--========��������==================================--
--����ԭ�Σ�AboutNewYearEvent()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	����˽Ȿ�λ֮�󣬳��ֵĶԻ����ݡ�
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function AboutNewYearEvent()
	Talk(2,"",
		"<#> ��ӭ�μ��´������. ��ڼ�, ����������ֵõ���������, ����������, ���Դ���<color=red>����- ���<color>�һ�����!","<#> ��ν����ܷḻ, ����: �ƽ�װ��, ������, ����, ���, ����, ����ֵ. ֻ����۹�һ�������ļ�������Ϳ������Ҷһ�����. �ҵ�����������������������ļ�ֵ����")
	return
end
