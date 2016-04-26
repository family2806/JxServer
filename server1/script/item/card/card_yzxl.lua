--与子偕老卡

--by yfeng
Include ("\\script\\event\\chinesenewyear\\eventhead.lua")

NUMPERMIN = 0  --分钟内拾取的卡数量
LASTTIME = 0 --上一次拾取时的时间

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
		Msg2Player("你得到一张与子偕老卡，但是孑然一身的你无法开启此卡的能力。")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(size > 2) then
		Msg2Player("你得到一张与子偕老卡，但是这么多人，你不知道和谁才能开启此卡的能力。")
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
		Msg2Player("你得到一张与子偕老卡，但是无法与同性玩家开启此卡的能力。")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(myCode == otherCode and myCode ~=0) then  --验证码相同
		if(myNum == otherNum) then --有情人，卡的数量一样。
			myNum = myNum + 1  --卡片数量累加
			otherNum = myNum
			Msg2Player("你得到一张与子偕老卡，把你和"..otherName.."的缘份拉得更近了，到目前为止，你积累了"..myNum.."张与子偕老卡。")
			AddOwnExp(myLevel * (20+0.1*myLevel)-10)
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			PlayerIndex = otherIndex
			Msg2Player(myName.."得到一张与子偕老卡，把你们的缘份拉得更近了，到目前为止，你积累了"..otherNum.."张与子偕老卡。")
			AddOwnExp(otherLevel * (10+0.07*otherLevel))
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			if(myNum > 98) then --达到99个，与子偕老啦
				myNum = 0
				PlayerIndex = nPlayerIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("你的与子偕老卡已经积累了99个，你与"..otherName.."共同开启了此卡的能力。你获得了2个小时的经验翻倍。")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
				PlayerIndex = otherIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("你的与子偕老卡已经积累了99个，你与"..myName.."共同开启了此卡的能力。你获得了2个小时的经验翻倍。")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
			end
			PlayerIndex = oldPlyIdx
			return 0
		end
		--移情别恋的一对
		if(myNum > otherNum) then --我比她卡多
			myNum = myNum - 1
			if(myNum ~= otherNum) then --损失了，还不等，没缘份啊
				otherNum = otherNum + 1  --你们的缘分再近一点。 :)
			end
		else  --她比我卡多
			myNum = myNum + 1  --加一个
			if(myNum ~=otherNum) then
				otherNum = otherNum - 1
			end
		end
		PlayerIndex = nPlayerIndex
		Msg2Player("你得到一张与子偕老卡，与"..otherName.."的缘份更近了，你现在积累了"..myNum.."张与子偕老卡片。")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --回写信息
		PlayerIndex = otherIndex
		Msg2Player(myName.."得到一张与子偕老卡，与你的缘份更近了，你现在积累了"..otherNum.."张与子偕老卡片。")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,otherNum)) --回写信息
		PlayerIndex = oldPlyIdx
		return 0
	end
	--验证码不同，或者都是0
	local code = GetValidateCode(nPlayerIndex)
	Msg2Player("你得到一张与子偕老卡，并且和"..otherName.."开始了情缘。")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = otherIndex
	Msg2Player(myName.."得到一张与子偕老卡，并且和你开始了情缘。")
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
