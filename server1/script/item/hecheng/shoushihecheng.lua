/*
if not AMULET then
	Include ("\\script\\item\\hecheng\\amulet.lua")
end

if not PENDANT then
	Include ("\\script\\item\\hecheng\\pendant.lua")
end

if not RING then
	Include ("\\script\\item\\hecheng\\ring.lua")
end
if not SHOSHI then
	SHOUSHI = 1
end
*/

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
	Include ("\\script\\item\\hecheng\\worthanalyse.lua")
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
		self.__ringtabfile = new(KTabFile,"/settings/event/juanzhouhecheng/ringlist.txt","RING")
		self.__amulettabfile = new(KTabFile,"/settings/event/juanzhouhecheng/amuletlist.txt","AMULET")
		self.__pendanttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/pendantlist.txt","PENDANT")
		self.__pendantWorth = new(WorthAnalyse,80)
		self.__amuletWorth = new(WorthAnalyse,80)
		self.__ringWorth = new(WorthAnalyse,80)
		return
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
	convertring = function(self,worth,mark)
		for i=1,self.__ringtabfile:getRow() do
			if (tonumber(self.__ringtabfile:getCell("����",i)) == mark or tonumber(self.__ringtabfile:getCell("����",i)) == 9) then
				self.__ringWorth:addWorth(i, tonumber(self.__ringtabfile:getCell("Worth",i)), tonumber(self.__ringtabfile:getCell("mID",i)))
			else
				self.__ringWorth:addWorth(i, 0, tonumber(self.__ringtabfile:getCell("mID",i)))
			end
		end
		self.__ringWorth:makeBaseP()
		self.__ringWorth:makeWorthP(worth)
		return self.__ringWorth:getFromWorth()
	end,
	convertpendant = function(self,worth, mark)
		for i=1,self.__pendanttabfile:getRow() do
			if (tonumber(self.__pendanttabfile:getCell("����",i)) == mark or tonumber(self.__pendanttabfile:getCell("����",i)) == 9) then
				self.__pendantWorth:addWorth(i, tonumber(self.__pendanttabfile:getCell("Worth",i)), tonumber(self.__pendanttabfile:getCell("mID",i)))
			else
				self.__pendantWorth:addWorth(i, 0, tonumber(self.__pendanttabfile:getCell("mID",i)))
			end
		end
		self.__pendantWorth:makeBaseP()
		self.__pendantWorth:makeWorthP(worth)
		return self.__pendantWorth:getFromWorth()
	end,
	convertamulet = function(self,worth, mark)		
		for i=1,self.__amulettabfile:getRow() do
			if (tonumber(self.__amulettabfile:getCell("����",i)) == mark or tonumber(self.__amulettabfile:getCell("����",i)) == 9) then
				self.__amuletWorth:addWorth(i, tonumber(self.__amulettabfile:getCell("Worth",i)), tonumber(self.__amulettabfile:getCell("mID",i)))
			else
				self.__amuletWorth:addWorth(i, 0, tonumber(self.__amulettabfile:getCell("mID",i)))
			end
		end
		self.__amuletWorth:makeBaseP()
		self.__amuletWorth:makeWorthP(worth)
		return self.__amuletWorth:getFromWorth()
	end	 
}

--eg.
Convert:loadSettings()
ringmsg = 
	{
		"�����ָ",
		"���ʯ��ָ",
		"ܽ��ʯ��ָ",
		"����ָ",
		"����ʯ��ָ",
		"��ĸ�̽�ָ",
		"������ʯ��ָ",
		"�챦ʯ��ָ",
		"����ʯ��ָ",
		"��ʯ��ָ"
	}

pendantmsg = 
	{
		{"Ѭ������","��������","��������","��������","�ϻ�����","��������","��̴����","��������","�������","��������"},
		{"��������","��������","�һ�����","÷������","��ɫ����","��������","��������","ī������","��������","��֬����"}
	}
	
amuletmsg = 
	{
		{"ͭ����","������","������","�׽�����","��������","����ʯ����","ˮ������","��ȸʯ����","��������","��ʯ����"},
		{"����ʯ�����","ɺ�������","è�ۻ����","���������","ˮ�������","���껤���","����令���","����令���","����令���","����令���"}
	}

MAXGIVENUM = 20  --���Ը�������������
TF_GIFT_WORTH = 3  --giftlvl.txt��worth�������

TF_BONUS_WORTH = 3 
TF_BONUS_SEED = 4
TF_BONUS_P1 = 5
TF_BONUS_P2 = 6
TF_BONUS_P3 = 7
TF_BONUS_P4 = 8
TF_BONUS_P5 = 9
TF_BONUS_P6 = 10
TF_BONUS_P7 = 11
TF_BONUS_F = 12



function main()
	Talk(1, "GiveUIForThing", "�ϳɽ�ָ��ÿ��������<color=yellow>20<color>���������������һ����ɫ��<color=yellow>����װ��<color>�����Ժϳɳ�������Ӧ�ȼ����������Ե����Ρ�����ļ������������Ǳ��Խ�ߣ���ָ�����Ծ�Խ�á�<enter>�һ���������������ָ��������Ь�ӻ���׹���·���������������")
end

function GiveUIForThing()
	GiveItemUI("���κϳɽ���","���������Ʒ����������20���������������һ������װ����", "ConvertThing", "onCancel" );
end

function ConvertThing(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0
	local thindex = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#>ɶ�������������ɶѽ��")
		return nil
	end
	for i=1,nCount do
		itemIdx = GetGiveItemUnit( i )
		g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 and d ~= 2 and d ~= 5 and d ~= 6 and d ~= 7 ))) then --�������  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#>�������Ϻ�׶���ѽ��զ������࿣�")
			return nil
		end
		if(g == 0 ) then -- ����װ��
		magictype = GetItemMagicAttrib(itemIdx, 1)
			if (not magictype) then
				Talk(1, "GiveUIForThing", "<#>����ҵı�����һ������ɫ���Ե�����װ����")
				return
			end
		if (magictype == 0 ) then
			Talk(1, "GiveUIForThing", "<#>����ҵı�����һ������ɫ���Ե�����װ����")
			return
		end	
			wnum = wnum + 1
			thindex = itemIdx
		else --��������

		end
	end
	if (wnum > 1) then	--ֻ�ܷ�һ��װ��
		Talk(1, "GiveUIForThing", "<#>��ô��װ�����Ҳ�������Ͱ��������������ô�࡭��")
		return nil
	end	
	if (wnum < 1) then
		Talk(1, "GiveUIForThing", "<#>���������ʲô����װ�������ţ���Ҫ�һ�����������")
		return
	end
	gg, dd = GetItemProp(thindex)
	if(gg == 0 and (dd == 0 or dd == 1)) then -- ��ָ
		ConvertRing(nCount)
	elseif (gg == 0 and (dd == 2 or dd == 6)) then --����
		ConvertAmulet(nCount)
	elseif (gg == 0 and (dd == 7 or dd == 5)) then --��׹
		ConvertPendant(nCount)
	end
end

function onCancel()
end