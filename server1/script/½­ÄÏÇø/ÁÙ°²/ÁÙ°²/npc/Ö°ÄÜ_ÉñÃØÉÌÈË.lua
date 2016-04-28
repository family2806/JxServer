-- ÁÙ°²¡¡Ö°ÄÜ¡¡ÉñÃØÉÌÈË
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--°×½ğ×°±¸
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--ÖØÖı°×½ğ×°±¸
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	
	local tbDecOpp =
	{
		"<dec><npc>Ta tõ T©y Vùc xa x«i ®Õn Trung Nguyªn ®Ó thu thËp Thñy Tinh, Kim Nguyªn B¶o vµ Ng©n phiÕu. Ta s½n sµng ®æi c¸c b¶o vËt ®Ó ®­îc nh÷ng thø ®ã! Kh¸ch quan cã g× ®æi kh«ng?",
		
		--Change request 04/06/2011,¹Ø±ÕÖıÔì°×½ğ×°±¸ - Modified by DinhHQ - 20110605
		--"Ta muèn th¨ng cÊp cho trang bŞ B¹ch Kim nµy/upgrade_paltinaequip",
		--"Ta muèn chÕ t¹o trang bŞ Hoµng Kim thµnh trang bŞ B¹ch Kim/upgrade_goldformplatina",
		
		--"Ta muèn mêi/xin ng­¬i ®óc l¹i b¹ch kim trang bŞ/recoin_platina_main",
		--"Trao ®æi §å phæ vò khİ/get1",
		--"Mua Kú tr©n dŞ b¶o/get2",
		--"Xö lı <trang bŞ tæn h¹i>/deal_brokenequip",
		--"Ta muèn hiÓu râ b¹ch kim trang bŞ hãa gi¶i/unweave_paltinaequip",
		--"Ta muèn ®æi b¶o r­¬ng/BaiBaoXiang_Give_UI",
		"Ta xem thö tr­íc ®·!/no",
		
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
	CreateTaskSay(tbDecOpp);
end;

function no()
end;