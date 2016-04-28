-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - ¶à´Î×ªÉúÍ·ÎÄ¼þ
-- ÎÄ¼þÃû¡¡£ºtask_func.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-02-04 16:21:20

-- ======================================================

IncludeLib("LEAGUE");
IncludeLib("SETTING");
IncludeLib("FILESYS");
IncludeLib("ITEM");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\metempsychosis\\task_head.lua")

-- ¼ÇÂ¼ÔÚµÚ n_transcount ´Î×ªÉúÊ± µÄµÈ¼¶ ºÍËùÑ¡¿¹ÐÔ
function zhuansheng_set_gre(n_transcount, n_level, n_resist)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte, n_level);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte+1, n_resist);
	SetTask(n_taskid, n_taskvalue);
	--WriteLog(format("zhuansheng_set_gre:%d,%d,%d,byte:%d,id:%d", n_transcount, n_level, n_resist,n_taskbyte, n_taskid))
	return 1;
end

-- ·µ»ØµÚn_transcount´Î×ªÉú µÈ¼¶ºÍËùÑ¡¿¹ÐÔ
function zhuansheng_get_gre(n_transcount)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	
	return GetByte(n_taskvalue, n_taskbyte),GetByte(n_taskvalue, n_taskbyte+1)
end

-- ×ªÉúÏ´µôËùÓÐ¼¼ÄÜµã£¬²¢Ôö¼Ó×ªÉú»ñµÃµÄ¶îÍâ npoint ¼¼ÄÜµã
function zhuansheng_clear_skill(nlevel, npoint)
	local nskill1 = HaveMagic(210);	--±£ÁôÇá¹¦
	local nskill2 = HaveMagic(400);	--±£Áô¡°½Ù¸»¼ÃÆ¶¡±
	local nallskill = RollbackSkill();	-- Çå³ýÍ¶µã¼¼ÄÜ£¬²»·µ»Ø¼¼ÄÜµã
	if (nskill1 ~= -1) then			--·µ»ØÇá¹¦
		nallskill = nallskill - nskill1;
		AddMagic(210, nskill1);
	end
	
	if (nskill2 ~= -1) then			--·µ»Ø¡°½Ù¸»¼ÃÆ¶¡±
		nallskill = nallskill - nskill2;
		AddMagic(400, nskill2);
	end
	--nallskill = nallskill - (nlevel -1)	--×ªÉúÖ»¿ÛµôÉý¼¶Ê±¸øÓëµÄ¼¼ÄÜµã
	AddMagicPoint(npoint + nallskill);
end

-- ×ªÉúÏ´µôËùÓÐÇ±ÄÜµã£¬²¢Ôö¼Ó×ªÉú»ñµÃµÄ¶îÍâ npoint Ç±ÄÜµã
function zhuansheng_clear_prop(nlevel, npoint, nseries)
	if (not nseries) then
		nseries = GetSeries();
	end
	
	nseries = nseries + 1;
	local Utask88 = GetTask(88)-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖÐÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
	AddProp(100)			-- Îª±ÜÃâÃ»ÓÐÎ´·ÖÅäÇ±ÄÜµã¿É¹©ÐÞ¸´µÄ¼«¶ËÇé¿ö£¬ÔÝÊ±¡°½è¡±¸øËû100µã

	AddStrg(TB_BASE_STRG[nseries] - GetStrg(1) + GetByte(Utask88,1));
	AddDex(TB_BASE_DEX[nseries] - GetDex(1) + GetByte(Utask88,2));
	AddVit(TB_BASE_VIT[nseries] - GetVit(1) + GetByte(Utask88,3));
	AddEng(TB_BASE_ENG[nseries] - GetEng(1) + GetByte(Utask88,4));
	local nallprop = GetProp();
	--nallprop = nallprop - (nlevel - 1) * 5;	--×ªÉúÖ»¿ÛµôÉý¼¶Ê±¸øÓëµÄÇ±ÄÜµã
	AddProp(npoint-100);
end


-- ¼ì²éÊÇ·ñ»¹ÓÐÕ½¶Ó¹ØÏµ
function check_zhuansheng_league(ntype)
	local nlg_idx = LG_GetLeagueObjByRole(ntype,GetName());
	if (nlg_idx ~= nil and nlg_idx ~= 0) then
		return 1;			--ÓÐÕ½¶Ó¹ØÏµ
	else
		return 0;			--ÎÞÕ½¶Ó¹ØÏµ
	end
end

-- ¼ì²éµ±Ç°×ªÉú´ÎºÍµÈ¼¶ÊÇ·ñÄÜ¹»ÔÙ×ªÉú
function check_zhuansheng_level()
	local nlevel = GetLevel();
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount >= 5) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[7], "§­îc råi./OnCancel"});
		return 0;
	end
	
	
	if (not TB_LEVEL_REMAIN_PROP[nlevel] or not TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[5], "§­îc råi./OnCancel"});
		return
	end
	
	if (nlevel < TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({"<dec><npc>"..format("T¹i lÇn chuyÓn sinh thø (%d), ®¼ng cÊp chÝ Ýt còng ph¶i %d!", (ntranscount + 1), TB_LEVEL_LIMIT[ntranscount + 1]), "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	
	return 1;
end

function OnCancel()
end
