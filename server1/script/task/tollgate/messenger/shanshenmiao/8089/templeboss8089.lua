-------------------------------------------------------------------------
-- FileName		:	templeboss8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄ±êÖ¾boss½Å±¾[80-89¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊÂ¼şÖĞ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶şÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊıÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊı×Ö   
TEMBOSS_RELIVE=120        --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_exp"))  --Ğ¡¹Ö¾­Ñé
TEMBOSS_MAPID=391        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼·çÖ®ÆïµÄµØÍ¼±àºÅ£¿£¿ÊÇ¶àÉÙ£¿£¿
TEMBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_jifen"))  --Ğ¡¹Ö¾­Ñé

templeboss2=
{
--µ¶ÑıĞÖµÜ80-89¼¶
{837,85,391,1520,2625,1,"µ¶ÑıĞÖµÜÂ³ÀÏ¼â",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",1},
{837,85,391,1519,2718,1,"µ¶ÑıĞÖµÜ»î¹ÇÈÌ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",2},
{837,85,391,1465,2795,1,"µ¶ÑıĞÖµÜÈı¼âµ¶",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",3},
{837,85,391,1436,2955,1,"µ¶ÑıĞÖµÜ¸ÇÁ¦ÎÄ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",4},
{837,85,391,1379,3056,1,"µ¶ÑıĞÖµÜÒ¦Àî²Ø",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",5},
{837,85,391,1412,3091,1,"µ¶ÑıĞÖµÜÁÖÇ¹",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",6},
{837,85,391,1499,2996,1,"µ¶ÑıĞÖµÜÂæµ¶±ú",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",7},
{837,85,391,1530,2836,1,"µ¶ÑıĞÖµÜÁõÀ©×Ó",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",8},
{837,85,391,1581,2701,1,"µ¶ÑıĞÖµÜÁº²»Æ½",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",9},
{837,85,391,1360,2979,1,"µ¶ÑıĞÖµÜÍõÆğÒÆ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",10},
{837,85,391,1404,2810,1,"µ¶ÑıĞÖµÜÀî¾§¾§",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",11},
{837,85,391,1404,2688,1,"µ¶ÑıĞÖµÜÁÉá¯Õæ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",12},
{837,85,391,1463,2706,1,"µ¶ÑıĞÖµÜÕÔĞ¡ÎÄ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",13},
{837,85,391,1465,3136,1,"µ¶ÑıĞÖµÜĞ¦É¹",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",14},
{837,85,391,1558,3151,1,"µ¶ÑıĞÖµÜĞ¦´¿Ñô",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",15},
{837,85,391,1572,3000,1,"µ¶ÑıĞÖµÜ¹ù´ïÂ·",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",16},
{837,85,391,1572,2843,1,"µ¶ÑıĞÖµÜ³ÂÅä",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",17},
{837,85,391,1333,2774,1,"µ¶ÑıĞÖµÜÖìË«",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",18},
{837,85,391,1344,2669,1,"µ¶ÑıĞÖµÜÀî½ğ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",19},
{837,85,391,1485,2625,1,"µ¶ÑıĞÖµÜÂíÀ¥",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",20},

}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("§¹i hiÖp ®· tiªu diÖt ®­îc %d tªn §ao Yªu", GetTask(Task_KillNPC)))
		else
		Msg2Player("§¹i hiÖp ®· hoµn thµnh nhiÖm vô tiªu diÖt §ao Yªu, H·y ®Õn ChiÕn t©m T«n Gi¶ hoµn thµnh nhiÖm vô")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		Msg2Player("B¹n thµnh c«ng h¹ tªn §ao Yªu.")
		messenger_templego(NpcIndex)
	end
end

