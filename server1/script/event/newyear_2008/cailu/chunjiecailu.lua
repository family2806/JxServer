--ĞÂÄê²ÉLéc
--2008.1.21
--Ğ¡ÀË¶à¶à

Include( "\\script\\task\\system\\task_string.lua" );
NewYear2008_cailu = {}
NewYear2008_cailu.tbdate = 
{
	nstart = 80202,
	nend = 80302,
	ndate = { 
		nstart = 80205,
		nend = 80211,
		common =
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		}
	},
	nweek = {
		common = {
			{10,11},
			{22,23}
		},
		Satweek = 
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		},
		Sunweek =
		{
			{10,11},
			{14,15},
			{22,23},
		},
	}
}
NewYear2008_cailu.ntaskday = 1877
NewYear2008_cailu.ntask = 1874
NewYear2008_cailu.ntaskcount=1873
NewYear2008_cailu.ntasksum = 20
NewYear2008_cailu.LIMIT_LEVEL = 50
NewYear2008_cailu.handcash = 9999
NewYear2008_cailu.mareial = 
{
	{G=6,D=1,P=1657,szname="Phóc"},
	{G=6,D=1,P=1658,szname="Léc"},
	{G=6,D=1,P=1659,szname="Thä"},
}
NewYear2008_cailu.randomitem = 
{
	ntotialprop = 100,
	nitem =
	{
		{G=6,D=1,P=123,szname="PhócÔµÂ¶(ÖĞ) ",prop=75},
		{G=6,D=1,P=124,szname="PhócÔµÂ¶(´ó) ",prop=20},
		{G=6,D=1,P=71,szname="Tiªn Th¶o Lé ",prop=5},		
	}
}
NewYear2008_cailu.randomnexp = 
{
	ntotialprop = 100,
	nexp = 
	{
		{nexp = 500000,prop=35},
		{nexp = 1000000,prop=30},
		{nexp = 1500000,prop=25},
		{nexp = 2000000,prop=10},
	}
	
}
function main()
	local nsign = NewYear2008_cailu:checkdate()
	if nsign == 2 then
		Say("ĞÂÄê²ÉLéc»î¶¯½áÊøÁË£¬¶àĞ»¸÷Î»´óÏÀµÄ²ÎÓë.",0) 	
		return
	end
	local arytalk = {"ĞÂÄê²ÉLéc»î¶¯¿ªÊ¼£¬ÔÚÖ¸¶¨Ê±¼äÄÚ£¬Íæ¼Òµ½7´ó³ÇÊĞ¡¢ĞÂÊÖ´åµÄÌÒÊ÷£¬Ã·Ê÷Ç°³ÏĞÄĞíÔ¸¾Í»áµÃµ½ĞÂÄêÀñÎï. ´ËÍâ£¬¸÷Î»»¹¿ÉÒÔ¹ÒÉÏÓĞPhócLécThäÈı¸ö×ÖµÄ´ºÁªÁìÈ¡ÒâÏë²»µ½µÄ½±Æ·¡£"}
	arytalk[getn(arytalk)+1] = "ÎÒÒª¹ÒPhócLécThäµÄ´ºÁªÀ´Ó­ĞÂÄê./#NewYear2008_cailu:onhandwish(1)"
	if nsign == 1 then
		arytalk[getn(arytalk)+1] = "Ta ®Õn thµnh t©m cÇu nguyÖn./#NewYear2008_cailu:ongivewish(1)"
	end
	arytalk[getn(arytalk)+1] = "Ta chØ muèn d¹o ch¬i/#NewYear2008_cailu:onCancel(1)"
	CreateTaskSay(arytalk)
end

function NewYear2008_cailu:onhandwish()
	if self:checkdate() == 2 then
		Say("ĞÂÄê²ÉLéc»î¶¯½áÊøÁË£¬¶àĞ»¸÷Î»´óÏÀµÄ²ÎÓë¡£",0) 
		return	
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin lçi, ®¼ng cÊp c¸c h¹ kh«ng ®ñ, xin luyÖn tËp thªm ®ång thêi n¹p thÎ råi míi quay l¹i nhËn th­ëng.",0)
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Say("Kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.",0)
		return
	end
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	if GetTask(self.ntaskday) ~= ndate then
		SetTask(self.ntaskday,ndate)
		SetTask(self.ntaskcount,0)
	end
	if GetTask(self.ntaskcount) >= self.ntasksum then
		Say("B¹n ®· treo liÔn h¬n 20 bé råi, c©y kh«ng cßn chç cho b¹n treo n÷a råi, xin h·y giµnh c¬ héi cho ng­êi ch¬i kh¸c. §a t¹ ®· tham gia ho¹t ®éng.",0)
		return
	end
	for ni,nitem in self.mareial do
		if CalcEquiproomItemCount(nitem.G,nitem.D,nitem.P,-1) < 1 then
			Say("PhócLécThä¶ÔÁª²»¹»£¬ÇëÔÙËÑ¼¯Ò»Ğ©ÔÙÀ´¹Ò.",0)
			return
		end
	end
	if GetCash() < self.handcash then
			Say("TiÒn trong ng­êi kh«ng ®ñ xin ®õng treo liÔn.",0)
			return		
	end
	for ni,nitem in self.mareial do
		ConsumeEquiproomItem(1,nitem.G,nitem.D,nitem.P,-1)
	end
	SetTask(self.ntaskcount,(GetTask(self.ntaskcount)+1) )
	Pay(self.handcash)
	self:award()
end

function NewYear2008_cailu:ongivewish()
	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if self:checkdate() == 0 then
		Say("²ÉLécÇóÔË»î¶¯½áÊøÁË£¬¶àĞ»¸÷Î»´óÏÀµÄ²ÎÓë.",0) 
		return
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin lçi, ®¼ng cÊp c¸c h¹ kh«ng ®ñ, xin luyÖn tËp thªm ®ång thêi n¹p thÎ råi míi quay l¹i nhËn th­ëng.",0)
		return
	end
	
	local ntaskdate = GetTask(self.ntask)
	if ntaskdate == ndate then
		Say("ÄãÒÑµÃµ½ĞÂÄê×£Phóc£¬ÏÂ´ÎÔÙÀ´°É¡£",0) 
		return
	end
	SetTask(self.ntask,ndate)
	self:award()
end

function NewYear2008_cailu:award()
	local ntotialprop = self.randomitem.ntotialprop * 100
	local np = random(1,ntotialprop)
	local nsum = 0
	local szstrsay = ""
	for ni,nitem in self.randomitem.nitem do
		nsum = nsum + (nitem.prop) * (self.randomitem.ntotialprop)
		if nsum >= np then
			AddItem(nitem.G,nitem.D,nitem.P,1,0,0)
			local szstr = format("Chóc mõng b¹n ®· nhËn ®­îc 1 c¸i <color=yellow>%s<color>",nitem.szname)
			szstrsay = szstr
			Msg2Player(szstr)
			self:sdl_writelog("ĞÂ´º²ÉLéc",szstr)
			break
		end
	end

	ntotialprop = self.randomnexp.ntotialprop * 100
	np = random(1,ntotialprop)
	nsum = 0
	for ni,nitem in self.randomnexp.nexp do
		nsum = nsum + (nitem.prop) * (self.randomnexp.ntotialprop)
		if nsum >= np then
			AddOwnExp(nitem.nexp)
			local szstr = format("Chóc mõng b¹n nhËn ®­îc <color=yellow>%s<color> kinh nghiÖm",nitem.nexp)
			szstrsay = format("%s\n%s",szstrsay,szstr)
			Msg2Player(szstr)			
			self:sdl_writelog("ĞÂ´º²ÉLéc",szstr)
			break
		end
	end
	Say(szstrsay,0)
end

function NewYear2008_cailu:sdl_writelog(sztitle,szevent)	--¼ÇÂ¼,sztitle=ÊÂ¼şÃû,szevent=ÊÂ¼şÄÚÈİ
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function NewYear2008_cailu:onCancel()
end

function NewYear2008_cailu:check_level()		--ÅĞ¶ÏµÈ¼¶
	if GetLevel() < self.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:check_pay()		--ÅĞ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:checkdate()
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	local nhour = tonumber(GetLocalDate("%H"))
	local nweek = tonumber(GetLocalDate("%w"))
	if ndate < NewYear2008_cailu.tbdate.nstart or ndate > NewYear2008_cailu.tbdate.nend then
		return 2
	end
	local tbspdate =  NewYear2008_cailu.tbdate.ndate
	if ndate >= tbspdate.nstart and ndate <= tbspdate.nend then
		for ni,nitem in tbspdate.common do
			if nhour == nitem[1] then
					return 1
			end
		end
	else
		local tbdate
		if nweek == 6 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Satweek
		elseif nweek == 0 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Sunweek
		else
			tbdate = NewYear2008_cailu.tbdate.nweek.common
		end 
		for ni,nitem in tbdate do
			if nhour == nitem[1] then
					return 1
			end		
		end
	end
	return 0
end