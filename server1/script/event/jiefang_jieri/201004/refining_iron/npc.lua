-- Á¶½ğ»î¶¯ Npc¶Ô»°
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc¶Ô»°
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>Trong thêi gian ho¹t ®éng, c¸c vŞ ®¹i hiÖp cã thÓ ®Õn ®©y n©ng cÊp thĞp tinh luyÖn. ThĞp tinh luyÖn cÊp thÊp cã thÓ th«ng qua c¸c ho¹t ®éng phong l¨ng ®é vµ ¸o chiÕn sÜ nhËn ®­îc, hoÆc cã thÓ mua vËt phÈm nµy t¹i Kú Tr©n C¸c. GhĞp 2 thĞp cÊp thÊp cã thÓ nhËn ®­îc 1 thĞp tinh luyÖn cÊp cao h¬n",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("Ta muèn luyÖn thĞp tinh luyÖn cÊp %d/#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "Hñy bá /Cancel");
	CreateTaskSay(tbTaskSay);
end

-- Éı¼¶Ìú
function tbRefiningIron:UpdataIron(nLevel)
	
	-- Î´¾ÙĞĞ
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- ±³°ü¿Õ¼ä
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang!",  "§­îc råi./Cancel",});
		return 
	end	
		
	-- Ô­ÁÏ²»×ã
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>Xin h·y chuÈn bŞ 2 thĞp tinh luyÖn cÊp %d!",nLevel - 1),  "§­îc råi./Cancel",});
		return
	end
	
	-- ¿Û³ıÊ§°Ü
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("KhÊu trõ thĞp tinh luyÖn thÊt b¹i");
		return
	end
	
	-- ºÏ³ÉÊ§°Ü
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="ThĞp Tinh LuyÖn", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "ThĞp Tinh LuyÖnºÏ³ÉÊ§°Ü£¬ÍË»ØThĞp Tinh LuyÖn.");
		CreateTaskSay({"<dec><npc>ThËt ®¸ng tiÕc, luyÖn thĞp ®· thÊt b¹i! Ta nghÜ lÇn sau sÏ thµnh c«ng ®ã!",  "§­îc råi./Cancel",});
		return	
	end
	
	-- ºÏ³É³É¹¦
	local tbAwardItem = 
	{
		szName="ThĞp Tinh LuyÖn", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "ºÏ³ÉThĞp Tinh LuyÖn");
	
	-- ¸ßÆ·ÖÊÌáÊ¾
	if nLevel >= 7 then
		local szmsg = format("¹§Ï²¸ßÊÖ %s ÒÑ¾­µÃµ½ %d¼¶ThĞp Tinh LuyÖn. Ï£ÍûÄãÓĞ¸ü¶àµÄĞÒÔË!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end
