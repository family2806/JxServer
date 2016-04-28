--zero 20070712 ÁîÅÆÖÆÔì

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\pay.lua");

function main()
	if(tonumber(GetLocalDate("%Y%m%d"))>=20070728 and tonumber(GetLocalDate("%Y%m%d"))<=20070813) then
		CreateTaskSay({"<dec><npc>Hoan nghªnh ®Õn víi ho¹t ®éng 'TriÖu Håi M·nh T­íng' diÔn ra tõ 28-07-2007 ®Õn 24:00 13-08-2007. Trong thêi gian ho¹t ®éng, ng­êi ch¬i cÊp 90 trë lªn (bao gåm cÊp 90) ®· n¹p thÎ cã thÓ tham gia chÕ t¹o lÖnh bµi. Xem néi dung chi tiÕt trªn trang chñ.",
			"Ta muèn chÕ t¹o Méc Bµi/#lingpaizhizao_do(1)",
			"Ta muèn chÕ t¹o §ång Bµi/#lingpaizhizao_do(2)",
			"Ta muèn chÕ t¹o Ng©n Bµi/#lingpaizhizao_do(3)",
			"Ta muèn chÕ t¹o Kim Bµi/#lingpaizhizao_do(4)",
			"Ta muèn chÕ t¹o Ngäc Bµi/#lingpaizhizao_do(5)",
			"C¸ch chÕ t¹o lÖnh bµi/lingbaizhizao_content",
			"Hñy bá /OnCancel"});	
	else
		Say("Ho¹t ®éng 'TriÖu Håi M·nh T­íng' diÔn ra tõ 28-07-2007 ®Õn 24:00 13-08-2007. Trong thêi gian ho¹t ®éng, ng­êi ch¬i cÊp 90 trë lªn (bao gåm cÊp 90) ®· n¹p thÎ cã thÓ tham gia chÕ t¹o lÖnh bµi.",0)
	end
	
end


lingpai_id={1477,1478,1479,1480,1481}
lingpai_success_rate={30,25,50,90,100};
lingpai_pay={5000,10000,20000,30000,1000000};
lingpai_name={"Méc Bµi","§ång Bµi","Ng©n Bµi","Kim Bµi","Ngäc Bµi"};
function lingpaizhizao_do(lingpai_level)
	if( IsCharged() == 0) then --³äÖµ
		Say("Ö»ÓĞ90¼¶ÒÔÉÏ£¨º¬90¼¶£©µÄ³äÖµÍæ¼Ò²Å¿ÉÒÔ²Î¼ÓÖÆÔìKim Bµi.",0);
		return 
	end
	if( GetLevel() <90) then --µÈ¼¶
		Say("Ng­¬i h·y cßn nhá l¾m, ch­a ®ñ søc ®Ó tham gia nhiÖm vô nguy hiÓm nµy. §¹t ®Õn cÊp 90 råi h·y ®Õn t×m ta!",0);
		return 
	end
	
	if( CalcFreeItemCellCount() < 1) then -- ¿Õ¼ä
		Say("Hµnh trang ®· ®Çy, h·y s¾p xÕp l¹i cho ng¨n n¾p.",0);
		return 
	end
	
	if( CalcEquiproomItemCount(6,1,lingpai_id[lingpai_level],-1) < 5) then --²ÄÁÏ
		Say("Nguyªn liÖu mang theo kh«ng ®ñ!",0);
		return 
	end
		
	if( Pay(lingpai_pay[lingpai_level]) == 0) then  -- È¥µôÇ®
			Say("ThËt ®¸ng tiÕc, ng©n l­îng mang theo kh«ng ®ñ!",0);
		return 
	end
	
	for i=1,4 do ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1);	end --È¥µô4¸ö²ÄÁÏ
	if(random(1,100)<=lingpai_success_rate[lingpai_level]) then --³É¹¦µÄ»°
		ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1); --È¥µôÒ»¸ö²ÄÁÏ
		AddItem(6,1,lingpai_id[lingpai_level]+1,1,0,0);
		Say(format("Chóc mõng b¹n ®· nhËn ®­îc 1 %s.",lingpai_name[lingpai_level]),0);
		WriteLog(format("[TriÖu håi m·nh t­íng]\t%s\tAccount:%s\tName:%s\t ChÕ t¹o %s thµnh c«ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			lingpai_name[lingpai_level]));
	else
		Say("ThËt ®¸ng tiÕc, chÕ t¹o thÊt b¹i, hao tæn nguyªn liÖu vµ ng©n l­îng!",0);
	end
end

function lingbaizhizao_content()
	CreateTaskSay({"<dec><npc><enter>ÖÆÔìMéc BµiĞèÒª5·İÎäÁÖÃÜ¼şºÍ5000Á½£¬Èç¹ûÖÆÔìÊ§°Ü½«ËğºÄ4·İÎäÁÖÃÜ¼şºÍ5000Á½.<enter><enter>ÖÆÔì§ång BµiÒª5¸öMéc BµiºÍ1ÍòÁ½£¬Èç¹ûÖÆÔìÊ§°Ü½«ËğÊ§4¸öMéc BµiºÍ1ÍòÁ½.<enter><enter>ÖÆÔìNg©n BµiÒª5¸ö§ång BµiºÍ2ÍòÁ½£¬Èç¹ûÖÆÔìÊ§°Ü½«»áËğÊ§4¸ö§ång BµiºÍ2ÍòÁ½.<enter><enter>ÖÆÔìKim BµiÒª5¸öNg©n BµiºÍ3ÍòÁ½£¬Èç¹ûÊ§°ÜµÄ»°»áËğÊ§4¸öNg©n BµiºÍ3ÍòÁ½.<enter><enter>ÖÆÔìNgäc BµiÒª5¸öKim BµiºÍ100ÍòÁ½. ÖÆÔìNgäc BµiµÄ³É¹¦ÂÊÊÇ100%.",
		"Trë l¹i/main",
		"BiÕt råi/OnCancel"
		});
end
function OnCancel()
end