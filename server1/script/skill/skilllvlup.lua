SOSkillLevelUp={}
MESSAGES={
	"ÓÉÓÚÄã¡º%s¡»µÄ»ù´¡ÐÞÎªÌ«µÍ£¬ÏÞÖÆÁË¡º%s¡»µÄÐÞÁ¶¡£",
	"ÓÉÓÚÄã¡º%s¡»µÄÐÞÎªÌ«µÍ£¬ÏÞÖÆÁË¡º%s¡»µÄÌáÉý¡£",
	"Äã¡º%s¡»µÄÐÞÎªÒÑ¾­´ïµ½¶¥¼¶ÁË£¬ÎÞ·¨ÔÙµÃµ½¸ü¸ßµÄÌáÉý¡£"
}

--¶ëáÒÆÕ¶ÉÖÚÉúÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Pudu_zhongsheng()
	local perSkills={{93,"´Èº½ÆÕ¶É"},{89,"ÃÎµû"},{86,"Á÷Ë®"},{92,"·ðÐÄ´ÈÓÓ"},{282,"ÇåÒôèó³ª"}}
	local mainSkill = {332,"ÆÕ¶ÉÖÚÉú"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌÆÃÅÂÒ»·»÷Éý¼¶ÏÞÖÆ
function SOSkillLevelUp.Luanhuan_ji()
	local perSkills={{347,"µØÑæ»ð"},{303,"¶¾´Ì¹Ç"},{343,"´©ÐÄ´Ì"},{345,"º®±ù´Ì"},{349,"À×»÷Êõ"}}
	local mainSkill = {351,"ÂÒ»·»÷"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌÆÃÅÅùö¨ÂÒ»·»÷Éý¼¶ÏÞÖÆ
function SOSkillLevelUp.Pililuanhuan_ji()
	local perSkills={{45,"Åùö¨µ¯"},{351,"ÂÒ»·»÷"}}
	local mainSkill = {1110,"Åùö¨ÂÒ»·»÷"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--Îå¶¾¶Ï½î¸¯¹ÇÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Duanjin_fugu()
	local perSkills={{67,"¾ÅÌì¿ñÀ×"},{70,"³àÑæÊ´Ìì"},{64,"±ùÀ¶Ðþ¾§"},{356,"´©ÒÂÆÆ¼×"},{72,"´©ÐÄ¶¾´Ì"}}
	local mainSkill = {390,"¶Ï½î¸¯¹Ç"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌìÈÌÉã»êÂÒÐÄÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Shehun_luanxin()
	local perSkills={{136,"»ð·ÙÁ«»ª"},{137,"»ÃÓ°·Éºü"},{140,"·ÉºèÎÞ¼£"},{364,"±¯ËÖÇå·ç"},{143,"À÷Ä§¶á»ê"}}
	local mainSkill = {391,"Éã»êÂÒÐÄ"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--À¥ÂØ×íÏÉ´í¹ÇÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Zuixian_cuogu()
	local perSkills={{392,"Êø¸¿Öä"},{174,"î¿°í·û"},{393,"±±Ú¤µ½º£"},{175,"ÆÛº®°ÁÑ©"},{90,"ÃÔ×Ù»ÃÓ°"}}
	local mainSkill = {394,"×íÏÉ´í¹Ç"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end
