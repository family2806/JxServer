Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua"), nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng--¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--danh, nhËn ®­îc phÇn th­ëng´ÎµÄÎÄ×ÖÃèÊö
TB_STORM_LADDERNAME, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{"Qu¸n, nhËn ®­îc phÇn th­ëngqu©n",, nhËn ®­îc phÇn th­ëng"¸, nhËn ®­îc phÇn th­ëngqu©n",, nhËn ®­îc phÇn th­ëng"H¹ng, nhËn ®­îc phÇn th­ëng3",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng4",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng5",
	"H¹ng, nhËn ®­îc phÇn th­ëng6",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng7",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng8",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng9",, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëngH¹ng, nhËn ®­îc phÇn th­ëng10",, nhËn ®­îc phÇn th­ëng"kh«ng, nhËn ®­îc phÇn th­ëngcã, nhËn ®­îc phÇn th­ëngtrong, nhËn ®­îc phÇn th­ëngb¶ng, nhËn ®­îc phÇn th­ëngxÕp, nhËn ®­îc phÇn th­ëngh¹ng",, nhËn ®­îc phÇn th­ëng"Kh«ng, nhËn ®­îc phÇn th­ëngcã, nhËn ®­îc phÇn th­ëngxÕp, nhËn ®­îc phÇn th­ëngh¹ng"}

--ÎäÁÖÃË´«ÈË	
STORM_WLMCR, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>Vâ, nhËn ®­îc phÇn th­ëngl©m, nhËn ®­îc phÇn th­ëngtruyÒn, nhËn ®­îc phÇn th­ëngnh©n<link>"

--¼ì²éÖ¸¶¨µÄawardtype
--awardid, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil	·µ»Ø£º»ıphót+/-ÅÅĞĞ	¿ÉÒÔl·nhÈ¡µÄËùÓĞ½±Àø
--awardid, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0		·µ»Ø£ºnil²»¿ÉÒÔl·nhÈ¡	·ñÔò·µ»Ø»ıphót+/-ÅÅĞĞ
function, nhËn ®­îc phÇn th­ëngstorm_checkaward(awardtype,, nhËn ®­îc phÇn th­ëngawardid)
	storm_anotherday()
	
	if, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil, nhËn ®­îc phÇn th­ëngor, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
		return, nhËn ®­îc phÇn th­ëngnil
	end
	
	if, nhËn ®­îc phÇn th­ëng(GetTask(TB_STORM_AWARD[awardtype][3]), nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
		Say("Xin, nhËn ®­îc phÇn th­ënglçi!, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][1].."phÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngcña, nhËn ®­îc phÇn th­ëngng­¬i, nhËn ®­îc phÇn th­ëng®·, nhËn ®­îc phÇn th­ëngnhËn, nhËn ®­îc phÇn th­ëngqua, nhËn ®­îc phÇn th­ëngråi!",, nhËn ®­îc phÇn th­ëng0)
		return, nhËn ®­îc phÇn th­ëngnil
	end
	
	local, nhËn ®­îc phÇn th­ëngawardvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng0
	if, nhËn ®­îc phÇn th­ëng(TB_STORM_AWARD[awardtype][2], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen
		awardvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng-storm_getrank(awardtype)	--ÓÃ¸ºÊı×÷±È½Ï¸ü·½±ã
	else
		awardvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngGetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if, nhËn ®­îc phÇn th­ëng(awardid, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
		local, nhËn ®­îc phÇn th­ëngtb_award, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
		local, nhËn ®­îc phÇn th­ëngawardlevel, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardvalue
		for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ënggetn(TB_STORM_AWARD[awardtype][5]), nhËn ®­îc phÇn th­ëngdo
			if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][i][1]), nhËn ®­îc phÇn th­ëngthen
				if, nhËn ®­îc phÇn th­ëng(awardlevel, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][i][1], nhËn ®­îc phÇn th­ëngor, nhËn ®­îc phÇn th­ënggetn(tb_award), nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen	--²»ÄÜl·nhµÍ¼¶½±Àø
					awardlevel, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngi
				end
			end
		end
		return, nhËn ®­îc phÇn th­ëngawardvalue,, nhËn ®­îc phÇn th­ëngtb_award
	else
		if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng<, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][awardid][1]), nhËn ®­îc phÇn th­ëngthen
			Say("Vâ, nhËn ®­îc phÇn th­ëngl©m, nhËn ®­îc phÇn th­ëngtruyÒn, nhËn ®­îc phÇn th­ëngnh©n:, nhËn ®­îc phÇn th­ëngH×nh, nhËn ®­îc phÇn th­ëngnh­, nhËn ®­îc phÇn th­ëngng­¬i, nhËn ®­îc phÇn th­ëngkh«ng, nhËn ®­îc phÇn th­ëngthÓ, nhËn ®­îc phÇn th­ëngnhËn, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngnµy!",, nhËn ®­îc phÇn th­ëng0)
			return, nhËn ®­îc phÇn th­ëngnil
		else
			return, nhËn ®­îc phÇn th­ëngawardvalue
		end
	end
end

--Ö÷¶Ô»°
function, nhËn ®­îc phÇn th­ëngstorm_main()
	if, nhËn ®­îc phÇn th­ëng(GetTask(STORM_TASKID_LETTER), nhËn ®­îc phÇn th­ëng~=, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen
		Describe(STORM_WLMCR.."<#>, nhËn ®­îc phÇn th­ëngKiÕp, nhËn ®­îc phÇn th­ënggiang, nhËn ®­îc phÇn th­ënghå, nhËn ®­îc phÇn th­ënglÊy, nhËn ®­îc phÇn th­ëngs«ng, nhËn ®­îc phÇn th­ëngnói, nhËn ®­îc phÇn th­ënglµ, nhËn ®­îc phÇn th­ëngnhµ!, nhËn ®­îc phÇn th­ëngNgÈng, nhËn ®­îc phÇn th­ëngmÆt, nhËn ®­îc phÇn th­ëngnh×n, nhËn ®­îc phÇn th­ëngtr¨ng,, nhËn ®­îc phÇn th­ëngcuèi, nhËn ®­îc phÇn th­ëng®Çu, nhËn ®­îc phÇn th­ëngmh×n, nhËn ®­îc phÇn th­ëngn­íc!, nhËn ®­îc phÇn th­ëngChît, nhËn ®­îc phÇn th­ëngnghÜ, nhËn ®­îc phÇn th­ëng®Õn, nhËn ®­îc phÇn th­ëngc©u, nhËn ®­îc phÇn th­ëngth¬:, nhËn ®­îc phÇn th­ëngVİ, nhËn ®­îc phÇn th­ëngthö, nhËn ®­îc phÇn th­ëng®­êng, nhËn ®­îc phÇn th­ëng®êi, nhËn ®­îc phÇn th­ëngb»ng, nhËn ®­îc phÇn th­ëngph¼ng, nhËn ®­îc phÇn th­ëngm·i,, nhËn ®­îc phÇn th­ënganh, nhËn ®­îc phÇn th­ënghïng, nhËn ®­îc phÇn th­ënghµo, nhËn ®­îc phÇn th­ëngkiÖt, nhËn ®­îc phÇn th­ëngcã, nhËn ®­îc phÇn th­ëngh¬n, nhËn ®­îc phÇn th­ëngai!",, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëng"B¾t, nhËn ®­îc phÇn th­ëng®Çu, nhËn ®­îc phÇn th­ëngho¹t, nhËn ®­îc phÇn th­ëng®éng, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngba, nhËn ®­îc phÇn th­ëngth¸ng, nhËn ®­îc phÇn th­ëng9/storm_main")
		Msg2Player("B¹n, nhËn ®­îc phÇn th­ëngnhËn, nhËn ®­îc phÇn th­ëng®­îc, nhËn ®­îc phÇn th­ëngb¶n, nhËn ®­îc phÇn th­ëngth¶o, nhËn ®­îc phÇn th­ëngthÇn, nhËn ®­îc phÇn th­ëngbİ, nhËn ®­îc phÇn th­ëngcña, nhËn ®­îc phÇn th­ëngThÈm, nhËn ®­îc phÇn th­ëngThiÖu, nhËn ®­îc phÇn th­ëngViÔn")
		AddItem(6,, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëng898,, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëng0, nhËn ®­îc phÇn th­ëng,0)
		SetTask(STORM_TASKID_LETTER,, nhËn ®­îc phÇn th­ëng2)
	else
		local, nhËn ®­îc phÇn th­ëngtb_option, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngmuèn, nhËn ®­îc phÇn th­ëngl·nh, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngh«m, nhËn ®­îc phÇn th­ëngnay/#storm_award(1)"
		if, nhËn ®­îc phÇn th­ëng(GetTask(STORM_TASKID_DAY_LASTAWARD), nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
			tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngmuèn, nhËn ®­îc phÇn th­ëngl·nh, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngh«m, nhËn ®­îc phÇn th­ëngqua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngmuèn, nhËn ®­îc phÇn th­ëngl·nh, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngtuÇn, nhËn ®­îc phÇn th­ëngtr­íc/#storm_award(2)"
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngmuèn, nhËn ®­îc phÇn th­ëngl·nh, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngth¸ng, nhËn ®­îc phÇn th­ëngtr­íc/#storm_award(3)"
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"T×m, nhËn ®­îc phÇn th­ënghiÓu, nhËn ®­îc phÇn th­ëng®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngcña, nhËn ®­îc phÇn th­ëngta/#storm_query(0)"
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"T×m, nhËn ®­îc phÇn th­ënghiÓu, nhËn ®­îc phÇn th­ëngho¹t, nhËn ®­îc phÇn th­ëng®éng, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa/storm_help"
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Kh«ng, nhËn ®­îc phÇn th­ëngcÇn!/OnCancel"
		Describe(STORM_WLMCR.."<#>, nhËn ®­îc phÇn th­ëngXin, nhËn ®­îc phÇn th­ëngxem, nhËn ®­îc phÇn th­ëngth«ng, nhËn ®­îc phÇn th­ëngtin, nhËn ®­îc phÇn th­ëngchi, nhËn ®­îc phÇn th­ëngtiÕt, nhËn ®­îc phÇn th­ëngho¹t, nhËn ®­îc phÇn th­ëng®éng, nhËn ®­îc phÇn th­ëngtrªn, nhËn ®­îc phÇn th­ëngtrang, nhËn ®­îc phÇn th­ëngchñ, nhËn ®­îc phÇn th­ëng",, nhËn ®­îc phÇn th­ënggetn(tb_option),, nhËn ®­îc phÇn th­ëngtb_option)
	end
	storm_anotherday()
end

--l·nhÈ¡½±Àø£¨²é¿´½±Àø£©
function, nhËn ®­îc phÇn th­ëngstorm_award(awardtype)
	local, nhËn ®­îc phÇn th­ëngawardvalue,, nhËn ®­îc phÇn th­ëngtb_award, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstorm_checkaward(awardtype)
	if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
		return
	end
	
	local, nhËn ®­îc phÇn th­ëngstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng""
	if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"B¹n, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][1].."tİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa, nhËn ®­îc phÇn th­ënglµ:"..storm_point2str(awardvalue)
	elseif, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng-12), nhËn ®­îc phÇn th­ëngthen
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][1].."kh«ng, nhËn ®­îc phÇn th­ëngcã, nhËn ®­îc phÇn th­ëngtrong, nhËn ®­îc phÇn th­ëngb¶ng, nhËn ®­îc phÇn th­ëngxÕp, nhËn ®­îc phÇn th­ëngh¹ng"
	elseif, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng-11), nhËn ®­îc phÇn th­ëngthen
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"B¹n, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][1].."kh«ng, nhËn ®­îc phÇn th­ëngcã, nhËn ®­îc phÇn th­ëngtrong, nhËn ®­îc phÇn th­ëngb¶ng, nhËn ®­îc phÇn th­ëngxÕp, nhËn ®­îc phÇn th­ëngh¹ng"
	elseif, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng-3), nhËn ®­îc phÇn th­ëngthen
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"B¹n, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][1].."trong, nhËn ®­îc phÇn th­ëngho¹t, nhËn ®­îc phÇn th­ëng®éng, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngba, nhËn ®­îc phÇn th­ëngth¸ng, nhËn ®­îc phÇn th­ëng9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"B¹n, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][1].."trong, nhËn ®­îc phÇn th­ëngho¹t, nhËn ®­îc phÇn th­ëng®éng, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngba, nhËn ®­îc phÇn th­ëngth¸ng, nhËn ®­îc phÇn th­ëng9ÅÅdanh, nhËn ®­îc phÇn th­ëng"..storm_point2str(-awardvalue).."danh, nhËn ®­îc phÇn th­ëng"
	end
	
	local, nhËn ®­îc phÇn th­ëngawardcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ënggetn(tb_award)
	if, nhËn ®­îc phÇn th­ëng(awardcount, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
		local, nhËn ®­îc phÇn th­ëngtb_option, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
		if, nhËn ®­îc phÇn th­ëng(awardcount, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr..",, nhËn ®­îc phÇn th­ëngB¹n, nhËn ®­îc phÇn th­ëng¿ÉÒÔl·nhÈ¡½±Æ·:, nhËn ®­îc phÇn th­ëng<enter>"
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<enter>,, nhËn ®­îc phÇn th­ëngnhËn, nhËn ®­îc phÇn th­ëngb©y, nhËn ®­îc phÇn th­ënggiê, nhËn ®­îc phÇn th­ëngchø?"
			Say("Vâ, nhËn ®­îc phÇn th­ëngl©m, nhËn ®­îc phÇn th­ëngtruyÒn, nhËn ®­îc phÇn th­ëngnh©n:"..str,, nhËn ®­îc phÇn th­ëng2,, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngmuèn, nhËn ®­îc phÇn th­ëngnhËn, nhËn ®­îc phÇn th­ëngphÇn, nhËn ®­îc phÇn th­ëngth­ëng/#storm_getaward("..awardtype..","..tb_award[1]..",0)",, nhËn ®­îc phÇn th­ëng"§Ó, nhËn ®­îc phÇn th­ëngta, nhËn ®­îc phÇn th­ëngsuy, nhËn ®­îc phÇn th­ëngnghÜ, nhËn ®­îc phÇn th­ëngl¹i/OnCancel")
		else
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr..",, nhËn ®­îc phÇn th­ëngB¹n, nhËn ®­îc phÇn th­ëng¿ÉÒÔT¹iÒÔÏÂ½±ÆphótĞÈÎÑ¡Ò»¸ö:, nhËn ®­îc phÇn th­ëng<enter>"
			for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ënggetn(tb_award), nhËn ®­îc phÇn th­ëngdo
				if, nhËn ®­îc phÇn th­ëng(i, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen
					str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."hoÆc, nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng"
				end
				local, nhËn ®­îc phÇn th­ëngawardname, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"l·nh"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<enter>, nhËn ®­îc phÇn th­ëngQuyÕt, nhËn ®­îc phÇn th­ëng®Şnh, nhËn ®­îc phÇn th­ëngxong, nhËn ®­îc phÇn th­ëngch­a?"
			tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Kh«ng, nhËn ®­îc phÇn th­ëngcÇn!/OnCancel"
			Say("Vâ, nhËn ®­îc phÇn th­ëngl©m, nhËn ®­îc phÇn th­ëngtruyÒn, nhËn ®­îc phÇn th­ëngnh©n:"..str,, nhËn ®­îc phÇn th­ënggetn(tb_option),, nhËn ®­îc phÇn th­ëngtb_option)
		end
	else
		Say("Vâ, nhËn ®­îc phÇn th­ëngl©m, nhËn ®­îc phÇn th­ëngtruyÒn, nhËn ®­îc phÇn th­ëngnh©n:"..str..",, nhËn ®­îc phÇn th­ëngB¹n, nhËn ®­îc phÇn th­ëngÎŞ·¨l·nh½±",, nhËn ®­îc phÇn th­ëng0)
		return
	end
end

--l·nhÈ¡Ö¸¶¨½±Æ·
function, nhËn ®­îc phÇn th­ëngstorm_getaward(awardtype,, nhËn ®­îc phÇn th­ëngawardid,, nhËn ®­îc phÇn th­ëngsure)
	local, nhËn ®­îc phÇn th­ëngawardvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstorm_checkaward(awardtype,, nhËn ®­îc phÇn th­ëngawardid)
	if, nhËn ®­îc phÇn th­ëng(not, nhËn ®­îc phÇn th­ëngstorm_checkaward(awardtype,, nhËn ®­îc phÇn th­ëngawardid)), nhËn ®­îc phÇn th­ëngthen
		return
	end

	if, nhËn ®­îc phÇn th­ëng(sure, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen
		Say("l·nh½±Ç°ÕûÀí±³°ü!",, nhËn ®­îc phÇn th­ëng2,, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëng®·, nhËn ®­îc phÇn th­ëngs½n, nhËn ®­îc phÇn th­ëngsµng!/#storm_getaward("..awardtype..","..awardid..",2)",, nhËn ®­îc phÇn th­ëng"Ta, nhËn ®­îc phÇn th­ëngcßn, nhËn ®­îc phÇn th­ëngph¶i, nhËn ®­îc phÇn th­ëngs¾p, nhËn ®­îc phÇn th­ëngxÕp, nhËn ®­îc phÇn th­ëngl¹i, nhËn ®­îc phÇn th­ënghµnh, nhËn ®­îc phÇn th­ëngtrang/OnCancel")
	elseif, nhËn ®­îc phÇn th­ëng(sure, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen
		if, nhËn ®­îc phÇn th­ëng(CalcFreeItemCellCount(), nhËn ®­îc phÇn th­ëng<, nhËn ®­îc phÇn th­ëngstorm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])), nhËn ®­îc phÇn th­ëngthen
			Say("B¹n, nhËn ®­îc phÇn th­ëngµÄ±³°üÃ»ÓĞ¿Õ¼ä£¬ÕûÀíÒ»ÏÂ!",, nhËn ®­îc phÇn th­ëng0)
		else
			if, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1, nhËn ®­îc phÇn th­ëngor, nhËn ®­îc phÇn th­ëngawardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng4), nhËn ®­îc phÇn th­ëngthen
				local, nhËn ®­îc phÇn th­ëngmapid, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngtostring(SubWorldIdx2ID(SubWorld))
				local, nhËn ®­îc phÇn th­ëngplcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngGetGlbValue(46), nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëng1
				SetGlbValue(46,, nhËn ®­îc phÇn th­ëngplcount)
				Ladder_NewLadder(10195,, nhËn ®­îc phÇn th­ëngmapid,, nhËn ®­îc phÇn th­ëngplcount,, nhËn ®­îc phÇn th­ëng1)
			end
			local, nhËn ®­îc phÇn th­ëngstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"NhËn, nhËn ®­îc phÇn th­ëng®­îc"..TB_STORM_AWARD[awardtype][1].."PhÇn, nhËn ®­îc phÇn th­ëngth­ëng, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa, nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3],, nhËn ®­îc phÇn th­ëng1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
				str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardvalue.."®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa"
			else
				str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"XÕp, nhËn ®­îc phÇn th­ëngh¹ng, nhËn ®­îc phÇn th­ëngthø, nhËn ®­îc phÇn th­ëng"..(-awardvalue).."danh, nhËn ®­îc phÇn th­ëng"
			end
			if, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2, nhËn ®­îc phÇn th­ëngor, nhËn ®­îc phÇn th­ëngawardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng3, nhËn ®­îc phÇn th­ëngor, nhËn ®­îc phÇn th­ëngawardid, nhËn ®­îc phÇn th­ëng<=, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen	--´ó½±·¢²¼¹«¸æ
				AddGlobalNews(GetName().."T¹i"..TB_STORM_AWARD[awardtype][1].."·ç±©»î¶¯ÖĞNhËn, nhËn ®­îc phÇn th­ëng®­îc"..TB_STORM_AWARD[awardtype][5][awardid][2]..", nhËn ®­îc phÇn th­ëng")
			end
		end
	else
		Say("B¹n, nhËn ®­îc phÇn th­ëngÈ·¶¨l·nhÈ¡<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color>, nhËn ®­îc phÇn th­ëngÊÇÂğ?, nhËn ®­îc phÇn th­ëngl·nhÍêÖ®ºó²»ÄÜl·nhÁË"..TB_STORM_AWARD[awardtype][1].."phÇn th­ëng kh¸c n÷a!",, nhËn ®­îc phÇn th­ëng2,, nhËn ®­îc phÇn th­ëng"ÖªµÀÁË!, nhËn ®­îc phÇn th­ëngÎÒÖ»l·nhÕâ¸öËãÁË£¡/#storm_getaward("..awardtype..","..awardid..",1)",, nhËn ®­îc phÇn th­ëng"Kh«ng, nhËn ®­îc phÇn th­ëngcÇn!/OnCancel")
	end
end

--²éÑ¯¸öÈË®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBaÇé¿ö
function, nhËn ®­îc phÇn th­ëngstorm_query(querytype)
	storm_anotherday()
	
	local, nhËn ®­îc phÇn th­ëngstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng""
	local, nhËn ®­îc phÇn th­ëngtb_sheet, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
	local, nhËn ®­îc phÇn th­ëngvar_width,, nhËn ®­îc phÇn th­ëngvar_align
	if, nhËn ®­îc phÇn th­ëng(querytype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen
		if, nhËn ®­îc phÇn th­ëng(GetTask(STORM_TASKID_DAY), nhËn ®­îc phÇn th­ëng<=, nhËn ®­îc phÇn th­ëngSTORM_END_DAY), nhËn ®­îc phÇn th­ëngthen
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"B¹n, nhËn ®­îc phÇn th­ëng½ñnhËt µÄ®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBaÈçÏÂ:, nhËn ®­îc phÇn th­ëng<enter>%½ñnhËt ×Ü»ıphótÊÇ:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{12,8,8,10}
			var_align, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng2
			tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{"»î¶¯danh, nhËn ®­îc phÇn th­ëng",, nhËn ®­îc phÇn th­ëng"Sè lÇn",, nhËn ®­îc phÇn th­ëng"Tr¹ng th¸i ",, nhËn ®­îc phÇn th­ëng"§iÓm tİch lòy cao nhÊt"}
			for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëngSTORM_GAMEID_MAX, nhËn ®­îc phÇn th­ëngdo
				if, nhËn ®­îc phÇn th­ëng(TB_STORM_TASKID[i], nhËn ®­îc phÇn th­ëng~=, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
					local, nhËn ®­îc phÇn th­ëngtrycount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngGetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local, nhËn ®­îc phÇn th­ëngstate, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng""
					if, nhËn ®­îc phÇn th­ëngstorm_valid_game(i), nhËn ®­îc phÇn th­ëngthen
						state, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"<color=red>ÕıT¹i½øĞĞ<color>"
					elseif, nhËn ®­îc phÇn th­ëng(trycount, nhËn ®­îc phÇn th­ëng<=, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
						state, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"<color=blue>Ch­a tiÕn hµnh<color>"
					elseif, nhËn ®­îc phÇn th­ëng(trycount, nhËn ®­îc phÇn th­ëng<, nhËn ®­îc phÇn th­ëngTB_STORM_TRYTIMES[i]), nhËn ®­îc phÇn th­ëngthen
						state, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"<color=green>§· tiÕn hµnh<color>"
					else
						state, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"<color=8947848>§· kÕt thóc<color>"
					end
					tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"ho¹t ®éng <color=red>Phong ba th¸ng 9<color> ®· kÕt thóc!"
		end
	elseif, nhËn ®­îc phÇn th­ëng(querytype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng", nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëngB¹n, nhËn ®­îc phÇn th­ëng×î½üµÄtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa, nhËn ®­îc phÇn th­ënglµ:<enter>%s"
		var_width, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{8,10,6,8,10}
		var_align, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng2
		tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{
			"§iÓm tİch lòy h«m nay",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_DAY_POINT)),, nhËn ®­îc phÇn th­ëng"",
			"§iÓm tİch lòy h«m qua",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{
			"§iÓm tİch lòy tuÇn nµy",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_WEEK_POINT)),, nhËn ®­îc phÇn th­ëng"",
			"§iÓm tİch lòy tuÇn tr­íc",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{
			"§iÓm tİch lòy th¸ng nµy",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_MONTH_POINT)),, nhËn ®­îc phÇn th­ëng"",
			"§iÓm tİch lòy th¸ng tr­íc",, nhËn ®­îc phÇn th­ëngstorm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{
			"ÉÏTuÇnÅÅdanh, nhËn ®­îc phÇn th­ëng",, nhËn ®­îc phÇn th­ëng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>",, nhËn ®­îc phÇn th­ëng"",
			"ÉÏnguyÖt ÅÅdanh, nhËn ®­îc phÇn th­ëng",, nhËn ®­îc phÇn th­ëng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("B¹n, nhËn ®­îc phÇn th­ëngÏëÁË½âÊ²Ã´ÎÊÌâ?",, nhËn ®­îc phÇn th­ëng3,, nhËn ®­îc phÇn th­ëng"ÎÒ½ñÌìµÄ®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa/#storm_query(1)",, nhËn ®­îc phÇn th­ëng"ÎÒ×î½üµÄ®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa/#storm_query(2)",, nhËn ®­îc phÇn th­ëng"Kh«ng cã chuyÖn g× ®©u!/OnCancel")
		return
	end
	str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngformat(str,, nhËn ®­îc phÇn th­ëngmaketable(tb_sheet,, nhËn ®­îc phÇn th­ëngvar_width,, nhËn ®­îc phÇn th­ëngvar_align))
	Say(str,, nhËn ®­îc phÇn th­ëng2,, nhËn ®­îc phÇn th­ëng"TiÕp tôc t×m hiÓu/#storm_query(0)",, nhËn ®­îc phÇn th­ëng"Kh«ng cã g×, c¸m ¬n!/OnCancel")
end

--»î¶¯ËµÃ÷¡ª¡ª×Ü
function, nhËn ®­îc phÇn th­ëngstorm_help()
	local, nhËn ®­îc phÇn th­ëngtb_option, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
	for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëngSTORM_GAMEID_MAX, nhËn ®­îc phÇn th­ëngdo
		if, nhËn ®­îc phÇn th­ëng(TB_STORM_TASKID[i], nhËn ®­îc phÇn th­ëng~=, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
			tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Liªn quan ho¹t ®éng Phong Ba-"..TB_STORM_DESCRIBE[i].."gióp ®ì/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Liªn quan phÇn th­ëng ho¹t ®éng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Ta biÕt råi!/OnCancel"
	Say(", nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng·ç±©»î¶¯´Ó8/9/®Õn2/10,, nhËn ®­îc phÇn th­ëng°üÀ¨ËÎ½ğÕ½³¡,, nhËn ®­îc phÇn th­ëngÒ°ÛÅÈÎÎñÁ´,, nhËn ®­îc phÇn th­ëngÉ±ÊÖÊÔÁ¶ÈÎÎñ., nhËn ®­îc phÇn th­ëngÃ¿Ìì½«»á¸ù¾İÏµÍ³ÖĞµÄ³É¼¨¸ø³ö<color=yellow>®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa<color>, nhËn ®­îc phÇn th­ëng(²Î¼ÓÌõ¼ş:, nhËn ®­îc phÇn th­ëng50¼¶ÒÔÉÏÍæ¼Ò), nhËn ®­îc phÇn th­ëng.Ã¿nhËt mÊyphót½«T¹i<color=red>24:00Ö®ºóÇåÁã<color>,, nhËn ®­îc phÇn th­ëngÇëT¹i24:00Ç°l·nh½±.<enter>., nhËn ®­îc phÇn th­ëngÃ¿Ìì, nhËn ®­îc phÇn th­ëng<color=red>23:30<color>, nhËn ®­îc phÇn th­ëngËÎ½ğÕ½³¡¿ªÊ¼,, nhËn ®­îc phÇn th­ëng³É¼¨²»¼ÇÂ¼½ø®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa.",, nhËn ®­îc phÇn th­ënggetn(tb_option),, nhËn ®­îc phÇn th­ëngtb_option)
end

--»î¶¯ËµÃ÷¡ª¡ªÌôÕ½
function, nhËn ®­îc phÇn th­ëngstorm_help_game(gameid)
	local, nhËn ®­îc phÇn th­ëngstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngTB_STORM_HELP[gameid]
	if, nhËn ®­îc phÇn th­ëng(gameid, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen	--ËÎ½ğĞèÒª²¹³äËµÃ÷phótÊıÉÏÏŞ
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngformat(str,, nhËn ®­îc phÇn th­ëng"¸ß¼¶ËÎ½ğÕ½³¡,, nhËn ®­îc phÇn th­ëngÃ¿ÈËÃ¿Ìì×î¶àÖ»ÄÜl·nhÈ¡µÄ®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBaÊÇ<color=yellow>100<color>, nhËn ®­îc phÇn th­ëngµã., nhËn ®­îc phÇn th­ëng³õÖĞ¼¶ËÎ½ğÕ½³¡×î¶àphót±ğNhËn, nhËn ®­îc phÇn th­ëng®­îc<color=yellow>80<color>,, nhËn ®­îc phÇn th­ëng<color=yellow>90<color>, nhËn ®­îc phÇn th­ëngµã.")
	end
	Say(str,, nhËn ®­îc phÇn th­ëng2,, nhËn ®­îc phÇn th­ëng"Muèn t×m hiÓu nh÷ng thø kh¸c/storm_help",, nhËn ®­îc phÇn th­ëng"Ta biÕt råi!/OnCancel")
end

--»î¶¯ËµÃ÷¡ª¡ª½±Àø
function, nhËn ®­îc phÇn th­ëngstorm_help_award(awardtype,start)
	if, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
		Say(", nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëngÃ¿ÌìÍæ¼Ò¿ÉÒÔ®ÕnÎäÁÖ´«ÈË´¦,, nhËn ®­îc phÇn th­ëng¸ù¾İ<color=red>®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa<color>, nhËn ®­îc phÇn th­ëng¿ÉÒÔl·nhÈ¡ÏàÓ¦µÄ½±Àø,, nhËn ®­îc phÇn th­ëngÍ¬Ê±£¬Ã¿TuÇn£¬Ã¿nguyÖt ¶¼ÓĞÏàÓ¦µÄ®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBaÅÅĞĞ<color=red>ÅÅdanh, nhËn ®­îc phÇn th­ëngÇ°Ê®<color>¿ÉÒÔT¹iµ±nguyÖt µÄµÚ¶ş¸öĞÇÆÚ®ÕnÎäÁÖ´«ÈË´¦l·nh½±",, nhËn ®­îc phÇn th­ëng4,
			"Xem phÇn th­ëng ngµy/#storm_help_award(1)",
			"Xem phÇn th­ëng tuÇn/#storm_help_award(2)",
			"Xem phÇn th­ëng th¸ng/#storm_help_award(3)",
			"Ta biÕt råi!/OnCancel")
		return
	end
	
	local, nhËn ®­îc phÇn th­ëngtb_awardstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{"nhËt ",, nhËn ®­îc phÇn th­ëng"TuÇn",, nhËn ®­îc phÇn th­ëng"nguyÖt "}
	local, nhËn ®­îc phÇn th­ëngstr, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"®iÓm, nhËn ®­îc phÇn th­ëngtİch, nhËn ®­îc phÇn th­ënglòy, nhËn ®­îc phÇn th­ëngPhong, nhËn ®­îc phÇn th­ëngBa"..tb_awardstr[awardtype].."PhÇn th­ëng nh­ sau:"
	if, nhËn ®­îc phÇn th­ëng(not, nhËn ®­îc phÇn th­ëngstart), nhËn ®­îc phÇn th­ëngthen
		start, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1
	end
	local, nhËn ®­îc phÇn th­ënglastvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngnil
	local, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng0
	local, nhËn ®­îc phÇn th­ëngPERPAGE, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng4
	for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstart,, nhËn ®­îc phÇn th­ënggetn(TB_STORM_AWARD[awardtype][5]), nhËn ®­îc phÇn th­ëngdo
		if, nhËn ®­îc phÇn th­ëng(count, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëngPERPAGE), nhËn ®­îc phÇn th­ëngthen	--PERPAGEÏîÒ»Ò³
			break
		end
		count, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëng1
		
		local, nhËn ®­îc phÇn th­ëngawardvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngTB_STORM_AWARD[awardtype][5][i][1]
		if, nhËn ®­îc phÇn th­ëng(lastvalue, nhËn ®­îc phÇn th­ëng~=, nhËn ®­îc phÇn th­ëngawardvalue), nhËn ®­îc phÇn th­ëngthen
			if, nhËn ®­îc phÇn th­ëng(awardvalue, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngthen
				str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<enter>".."Tİch lòy"..storm_point2str(awardvalue,3).."phót"
			else
				if, nhËn ®­îc phÇn th­ëng(lastvalue), nhËn ®­îc phÇn th­ëngthen
					str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<enter>"..tb_awardstr[awardtype].."ÅÅT¹iµÚ"..storm_point2str(1-lastvalue).."®Õn"..storm_point2str(-awardvalue).."mÊy"
				else
					str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<enter>"..tb_awardstr[awardtype].."ÅÅT¹iµÚ"..storm_point2str(-awardvalue).."mÊy"
				end
			end
			lastvalue, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardvalue
		else
			str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."hoÆc, nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng, nhËn ®­îc phÇn th­ëng"
		end
		str, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngstr.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local, nhËn ®­îc phÇn th­ëngtb_option, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng{}
	if, nhËn ®­îc phÇn th­ëng(start, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Trang tr­íc/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if, nhËn ®­îc phÇn th­ëng(start, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng<, nhËn ®­îc phÇn th­ënggetn(TB_STORM_AWARD[awardtype][5])), nhËn ®­îc phÇn th­ëngthen
		tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"Trang kÕ /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"ÏëMuèn t×m hiÓu nh÷ng thø kh¸c/storm_help"
	tb_option[getn(tb_option)+1], nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng"ÎÒTa biÕt råi!/OnCancel"
	Say(str,, nhËn ®­îc phÇn th­ënggetn(tb_option),, nhËn ®­îc phÇn th­ëngtb_option)
end

--NhËn, nhËn ®­îc phÇn th­ëng®­îc¸ÃÍæ¼ÒT¹iÖ¸¶¨ÅÅĞĞÖĞµÄdanh, nhËn ®­îc phÇn th­ëng´Î
function, nhËn ®­îc phÇn th­ëngstorm_getrank(laddertype)
	local, nhËn ®­îc phÇn th­ëngladderid, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngnil
	if, nhËn ®­îc phÇn th­ëng(laddertype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen	--nhËt ÅÅĞĞ£¬ÔİÎŞ
		return, nhËn ®­îc phÇn th­ëng12
	elseif, nhËn ®­îc phÇn th­ëng(laddertype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen	--TuÇnÅÅĞĞ
		local, nhËn ®­îc phÇn th­ëngweekid, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngGetTask(STORM_TASKID_WEEK), nhËn ®­îc phÇn th­ëng-, nhËn ®­îc phÇn th­ëngSTORM_LADDER_WEEK
		if(weekid, nhËn ®­îc phÇn th­ëng>=, nhËn ®­îc phÇn th­ëng1, nhËn ®­îc phÇn th­ëngand, nhËn ®­îc phÇn th­ëngweekid, nhËn ®­îc phÇn th­ëng<=, nhËn ®­îc phÇn th­ëng4), nhËn ®­îc phÇn th­ëngthen, nhËn ®­îc phÇn th­ëng	--Ö»ÓĞ2¡¢3¡¢4¡¢5TuÇnÓĞÉÏTuÇn
			ladderid, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngSTORM_LADDERID_WEEK1, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëngweekid, nhËn ®­îc phÇn th­ëng-, nhËn ®­îc phÇn th­ëng1
		end
	elseif, nhËn ®­îc phÇn th­ëng(laddertype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng3), nhËn ®­îc phÇn th­ëngthen	--nguyÖt ÅÅĞĞ
		if, nhËn ®­îc phÇn th­ëng(GetTask(STORM_TASKID_MONTH), nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng10), nhËn ®­îc phÇn th­ëngthen	--Ö»ÓĞ10nguyÖt ÓĞÉÏTuÇn
			ladderid, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngSTORM_LADDERID_MONTH
		end
	else
		return, nhËn ®­îc phÇn th­ëng12
	end
	
	if, nhËn ®­îc phÇn th­ëng(ladderid, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
		return, nhËn ®­îc phÇn th­ëng12
	end
	
	local, nhËn ®­îc phÇn th­ëngplayername, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngGetName()
	for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ëng10, nhËn ®­îc phÇn th­ëngdo
		if, nhËn ®­îc phÇn th­ëng(playername, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngLadder_GetLadderInfo(ladderid,, nhËn ®­îc phÇn th­ëngi)), nhËn ®­îc phÇn th­ëngthen
			return, nhËn ®­îc phÇn th­ëngi
		end
	end
	return, nhËn ®­îc phÇn th­ëng11
end

--¿ÉÉı¼¶µÄ¼Ó¾­Ñé
function, nhËn ®­îc phÇn th­ëngstorm_addownexp(, nhËn ®­îc phÇn th­ëngawardexp, nhËn ®­îc phÇn th­ëng)
	tl_addPlayerExp(awardexp)
end

--¸øÓëÈ«²¿½±Àø
function, nhËn ®­îc phÇn th­ëngstorm_giveallaward(tb_awards)
	for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ënggetn(tb_awards), nhËn ®­îc phÇn th­ëngdo
		storm_giveoneaward(tb_awards[i])
	end
end

--¸øÓëÒ»¸ö½±Àø
function, nhËn ®­îc phÇn th­ëngstorm_giveoneaward(tb_award)
	local, nhËn ®­îc phÇn th­ëngawardtype, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngtb_award[1]
	local, nhËn ®­îc phÇn th­ëngawardcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngtb_award[3]
	if, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen	--ÆÕÍ¨ÎïÆ·
		while, nhËn ®­îc phÇn th­ëng(awardcount, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardcount, nhËn ®­îc phÇn th­ëng-, nhËn ®­îc phÇn th­ëng1
		end
	elseif, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen	--»Æ½ğÎïÆ·
		while, nhËn ®­îc phÇn th­ëng(awardcount, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardcount, nhËn ®­îc phÇn th­ëng-, nhËn ®­îc phÇn th­ëng1
		end
	elseif, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng3), nhËn ®­îc phÇn th­ëngthen	--·ÇÎïÆ·
		if, nhËn ®­îc phÇn th­ëng(tb_award[2], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen	--¾­Ñé
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--Áô×÷À©Õ¹
			WriteLog("storm_giveoneaward, nhËn ®­îc phÇn th­ëng:, nhËn ®­îc phÇn th­ëngerror, nhËn ®­îc phÇn th­ëngtb_award[2]")
		end
	elseif, nhËn ®­îc phÇn th­ëng(awardtype, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng4), nhËn ®­îc phÇn th­ëngthen	--Ëæ»úÎïÆ·
		while, nhËn ®­îc phÇn th­ëng(awardcount, nhËn ®­îc phÇn th­ëng>, nhËn ®­îc phÇn th­ëng0), nhËn ®­îc phÇn th­ëngdo
			local, nhËn ®­îc phÇn th­ënggiveindex, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngrandom(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngawardcount, nhËn ®­îc phÇn th­ëng-, nhËn ®­îc phÇn th­ëng1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward, nhËn ®­îc phÇn th­ëng:, nhËn ®­îc phÇn th­ëngerror, nhËn ®­îc phÇn th­ëngawardtype")
	end
end

--¹ÀËãÈ«²¿½±ÀøÎïÆ·ÊıÁ¿
function, nhËn ®­îc phÇn th­ëngstorm_countallaward(tb_awards)
	local, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng0
	for, nhËn ®­îc phÇn th­ëngi, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1,, nhËn ®­îc phÇn th­ënggetn(tb_awards), nhËn ®­îc phÇn th­ëngdo
		if, nhËn ®­îc phÇn th­ëng(tb_awards[i][1], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng1), nhËn ®­îc phÇn th­ëngthen	--ÆÕÍ¨ÎïÆ·
			count, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëngtb_awards[i][3]
		elseif, nhËn ®­îc phÇn th­ëng(tb_awards[i][1], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng2), nhËn ®­îc phÇn th­ëngthen	--»Æ½ğÎïÆ·
			count, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëngtb_awards[i][3]*2
		elseif, nhËn ®­îc phÇn th­ëng(tb_awards[i][1], nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëng4), nhËn ®­îc phÇn th­ëngthen	--Ëæ»úÎïÆ·
			count, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëngcount, nhËn ®­îc phÇn th­ëng+, nhËn ®­îc phÇn th­ëngtb_awards[i][3]*2
		end
	end
	return, nhËn ®­îc phÇn th­ëngcount
end

--½«Êı×é²ğ¿ª
function, nhËn ®­îc phÇn th­ëngstorm_splittb(tb,, nhËn ®­îc phÇn th­ëngn)
	if, nhËn ®­îc phÇn th­ëng(n, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ëngnil), nhËn ®­îc phÇn th­ëngthen
		n, nhËn ®­îc phÇn th­ëng=, nhËn ®­îc phÇn th­ëng1
	end
	if, nhËn ®­îc phÇn th­ëng(n, nhËn ®­îc phÇn th­ëng==, nhËn ®­îc phÇn th­ënggetn(tb)), nhËn ®­îc phÇn th­ëngthen
		return, nhËn ®­îc phÇn th­ëngtb[n]
	end
	return, nhËn ®­îc phÇn th­ëngtb[n],, nhËn ®­îc phÇn th­ëngstorm_splittb(tb,n+1)
end
