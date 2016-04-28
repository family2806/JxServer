--Óë×ÓÙÉÀÏ¿¨

--by yfeng
Include ("\\script\\event\\chinesenewyear\\eventhead.lua")

NUMPERMIN = 0  --·ÖÖÓÄÚÊ°È¡µÄ¿¨ÊıÁ¿
LASTTIME = 0 --ÉÏÒ»´ÎÊ°È¡Ê±µÄÊ±¼ä

TID_VALIDATION = 500
TID_CARDNUMBER = 502
GETBYTE = 1

function ComputeTime()
	 return tonumber((((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M"))
end

function main(idx)
	return 1
end

function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end

function PickUp( nItemIndex, nPlayerIndex )
	if(not CHINESENEWYEAR) then
		return 0
	end
	local oldPlyIdx = PlayerIndex
	PlayerIndex = nPlayerIndex
	local size = GetTeamSize()
	local myName = GetName()
	local mySex = GetSex()
	local myCode = GetTask(TID_VALIDATION)
	local myNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	local myLevel = GetLevel()
	if(size < 2) then --
		Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o, nh­ng kÎ c« ®¬n nh­ b¹n kh«ng thÓ më c«ng n¨ng cña thÎ nµy!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(size > 2) then
		Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o, nh­ng nhiÒu ng­êi thÕ, biÕt cïng ai ®Ó më c«ng n¨ng cña thÎ nµy!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	local otherIndex = GetTeamMember(1)
	if( otherIndex == nPlayerIndex) then
		otherIndex = GetTeamMember(2)
	end
	PlayerIndex = otherIndex
	otherName = GetName()
	otherSex = GetSex()
	otherCode = GetTask(TID_VALIDATION)
	otherNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	otherLevel = GetLevel()
	PlayerIndex = nPlayerIndex
	if(otherSex == mySex) then
		Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o, nh­ng kh«ng thÓ më c«ng n¨ng cña thÎ cho hai b¹n cïng giíi!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(myCode == otherCode and myCode ~=0) then  --ÑéÖ¤ÂëÏàÍ¬
		if(myNum == otherNum) then --ÓĞÇéÈË£¬¿¨µÄÊıÁ¿Ò»Ñù¡£
			myNum = myNum + 1  --¿¨Æ¬ÊıÁ¿ÀÛ¼Ó
			otherNum = myNum
			Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o, gióp cho duyªn phËn cña b¹n vµ     "..otherName.."thªm gÇn nhau h¬n. HiÖn nay, b¹n ®· tİch lòy"..myNum.."tÊm thiÖp giai l·o.")
			AddOwnExp(myLevel * (20+0.1*myLevel)-10)
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --»ØĞ´ĞÅÏ¢
			PlayerIndex = otherIndex
			Msg2Player(myName.."µÃµ½Ò»ÕÅÓë×ÓÙÉÀÏ¿¨£¬°ÑÄãÃÇthªm gÇn nhau h¬n. HiÖn nay, b¹n ®· tİch lòy"..otherNum.."tÊm thiÖp giai l·o.")
			AddOwnExp(otherLevel * (10+0.07*otherLevel))
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --»ØĞ´ĞÅÏ¢
			if(myNum > 98) then --´ïµ½99¸ö£¬Óë×ÓÙÉÀÏÀ²
				myNum = 0
				PlayerIndex = nPlayerIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B¹n ®· tİch lòy ®­îc 99 tÊm thiÖp giai l·o! B¹n vµ "..otherName.."cïng më c«ng n¨ng cña thiÖp nµy. B¹n nhËn ®­îc nh©n ®«i ®iÓm kinh nghiÖm trong 2 giê.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --»ØĞ´ĞÅÏ¢
				PlayerIndex = otherIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B¹n ®· tİch lòy ®­îc 99 tÊm thiÖp giai l·o! B¹n vµ "..myName.."cïng më c«ng n¨ng cña thiÖp nµy. B¹n nhËn ®­îc nh©n ®«i ®iÓm kinh nghiÖm trong 2 giê.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --»ØĞ´ĞÅÏ¢
			end
			PlayerIndex = oldPlyIdx
			return 0
		end
		--ÒÆÇé±ğÁµµÄÒ»¶Ô
		if(myNum > otherNum) then --ÎÒ±ÈËı¿¨¶à
			myNum = myNum - 1
			if(myNum ~= otherNum) then --ËğÊ§ÁË£¬»¹²»µÈ£¬Ã»Ôµ·İ°¡
				otherNum = otherNum + 1  --ÄãÃÇµÄÔµ·ÖÔÙ½üÒ»µã¡£ :)
			end
		else  --Ëı±ÈÎÒ¿¨¶à
			myNum = myNum + 1  --¼ÓÒ»¸ö
			if(myNum ~=otherNum) then
				otherNum = otherNum - 1
			end
		end
		PlayerIndex = nPlayerIndex
		Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o! B¹n vµ "..otherName.."duyªn phËn thªm gÇn nhau h¬n. B¹n hiÖn ®· tİch lòy ®­îc"..myNum.."tÊm thiÖp giai l·o.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --»ØĞ´ĞÅÏ¢
		PlayerIndex = otherIndex
		Msg2Player(myName.."µÃµ½Ò»ÕÅÓë×ÓÙÉÀÏ¿¨£¬ÓëÄãduyªn phËn thªm gÇn nhau h¬n. B¹n hiÖn ®· tİch lòy ®­îc"..otherNum.."tÊm thiÖp giai l·o.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,otherNum)) --»ØĞ´ĞÅÏ¢
		PlayerIndex = oldPlyIdx
		return 0
	end
	--ÑéÖ¤Âë²»Í¬£¬»òÕß¶¼ÊÇ0
	local code = GetValidateCode(nPlayerIndex)
	Msg2Player("B¹n ®­îc 1 tÊm ThiÖp Giai L·o, ®ång thêi cïng "..otherName.."b¾t ®Çu b¾t ®Çu cuéc t×nh duyªn. ")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = otherIndex
	Msg2Player(myName.."µÃµ½Ò»ÕÅÓë×ÓÙÉÀÏ¿¨£¬²¢ÇÒºÍÄãb¾t ®Çu b¾t ®Çu cuéc t×nh duyªn. ")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = oldPlyIdx
	return 0
end

function GetValidateCode(plyIdx)
	local oPID = PlayerIndex
	PlayerIndex = plyIdx
	local mid = GetWorldPos()
	PlayerIndex = oPID
	local time = ComputeTime() --(((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M")
	
	if(time == LASTTIME) then
		NUMPERMIN = NUMPERMIN + 1
	---+----------------+---------+-------+
	---|   LASTTIME     |  MAPID  |NUM/MIN|
	---+----------------+---------+-------+
	---|    16 BIT      |  9 BIT  |  7BIT |
	---+----------------+---------+-------+
	---|     65535      |   511   |  127  |
	---+----------------+---------+-------+
		return LASTTIME * 65536 + mid*128 + NUMPERMIN
	end
	LASTTIME = time
	NUMPERMIN = 0
	return LASTTIME * 65536 + mid*128 + NUMPERMIN
end
