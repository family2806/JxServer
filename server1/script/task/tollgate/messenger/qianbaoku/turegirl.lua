-------------------------------------------------------------------------
-- FileName		:	enemy_turegirl.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:16:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ±»Â°ÉÙÅ®½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\task\\tollgate\\killbosshead.lua") --µ÷ÓÃ¶¨ÒåÍ·ÏñµÄÍ·ÎÄ¼ş
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	if ( GetSex() == 0 ) then
		Describe(DescLink_BeiKunShaoNv..": Anh hïng cuèi cïng còng xuÊt hiÖn. Ta bŞ bän Thñ Hé Gi¶ b¾t cãc, xin h·y cøu ta!",2,"§­¬ng nhiªn lµ ®­îc! Theo ta!/offcouseido","Kh«ng ®­îc! Ta cßn chuyÖn kh¸c ph¶i lµm!/no")
	else
		Describe(DescLink_BeiKunShaoNv..": Anh hïng cuèi cïng còng xuÊt hiÖn. Ta bŞ bän Thñ Hé Gi¶ b¾t cãc, xin h·y cøu ta!",2,"§­¬ng nhiªn lµ ®­îc! Theo ta!/offcouseido","Kh«ng ®­îc! Ta cßn chuyÖn kh¸c ph¶i lµm!/no")
	end
end

function offcouseido()
	local Uworld1214 = nt_getTask(1214)
	local Npcindex = GetLastDiagNpc()
	nt_setTask(1214,Uworld1214+1)   --ÉèÖÃ±»¾ÈÉÙÅ®ÊıÁ¿
	Msg2Player("B¹n ®· cøu ®­îc mét thiÕu n÷ bŞ bän Thñ Hé Gi¶ giam gi÷, nÕu an toµn hé tèng c« ta ra khái ¶i, b¹n sÏ nhËn ®­îc phÇn th­ëng xøng ®¸ng.")
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 6);
	tongaward_message(30);	--by Ğ¡É½£¨°ï»áÖÜÄ¿±ê¹±Ï×¶È£¬Ã¿¸öÉÙÅ®3000µã£©
	DelNpc(Npcindex)
end

function no()
end