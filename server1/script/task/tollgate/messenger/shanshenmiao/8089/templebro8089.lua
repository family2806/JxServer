-------------------------------------------------------------------------
-- FileName		:	templebro8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 15:09:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄµ¶ÑıĞÖµÜËÀÍö½Å±¾[80-89¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

TEMREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,6 ,"shuachu_exp"))  --Ğ¡¹Ö¾­Ñé
TEMREFRESH_MAPID= 391  --É½ÉñÃíµÄµØÍ¼id
TEMREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,6 ,"shuachu_jifen"))  --Ğ¡¹Ö¾­Ñé


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --bossÉí±ßË¢¹ÖµÄ´ò¹Ö¿ª¹Ø
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	--elseif ( Uworld1215 == 0 ) then  --Ã»ÓĞË¢¹ÖµÄÈÎÎñ
		--Msg2Player("Õâ¸ö¼Ò»ïÒÑ¾­±»±ğÈË°üÁË£¬Äã´òËûÊÇ²»»áÓĞÈÎºÎ½±ÀøµÃ¡£")
		--return
	else
		temple_killrefresh()
	end
end