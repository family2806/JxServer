-------------------------------------------------------------------------
-- FileName		:	turezei90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:14:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄµÁÔôËÀÍö½Å±¾[90¼¶ÒÔÉÏ]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

TUREREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,10 ,"shuachu_exp"))  --Ğ¡¹Ö¾­Ñé
TUREREFRESH_MAPID= 395  --Ç§±¦¿âµÄµØÍ¼id
TUREREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,10 ,"shuachu_jifen"))  --Ğ¡¹Ö¾­Ñé


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --bossÉí±ßË¢¹ÖµÄ´ò¹Ö¿ª¹Ø
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	--elseif ( Uworld1215 == 0 ) then  --Ã»ÓĞË¢¹ÖµÄÈÎÎñ
	--	Msg2Player("Õâ¸ö¼Ò»ïÒÑ¾­±»±ğÈË°üÁË£¬Äã´òËûÊÇ²»»áÓĞÈÎºÎ½±ÀøµÃ¡£")
	--	return
	else
		ture_killrefresh()
	end
end