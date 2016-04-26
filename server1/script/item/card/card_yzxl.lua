--�������Ͽ�

--by yfeng
Include ("\\script\\event\\chinesenewyear\\eventhead.lua")

NUMPERMIN = 0  --������ʰȡ�Ŀ�����
LASTTIME = 0 --��һ��ʰȡʱ��ʱ��

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
		Msg2Player("��õ�һ���������Ͽ���������Ȼһ������޷������˿���������")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(size > 2) then
		Msg2Player("��õ�һ���������Ͽ���������ô���ˣ��㲻֪����˭���ܿ����˿���������")
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
		Msg2Player("��õ�һ���������Ͽ��������޷���ͬ����ҿ����˿���������")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(myCode == otherCode and myCode ~=0) then  --��֤����ͬ
		if(myNum == otherNum) then --�����ˣ���������һ����
			myNum = myNum + 1  --��Ƭ�����ۼ�
			otherNum = myNum
			Msg2Player("��õ�һ���������Ͽ��������"..otherName.."��Ե�����ø����ˣ���ĿǰΪֹ���������"..myNum.."���������Ͽ���")
			AddOwnExp(myLevel * (20+0.1*myLevel)-10)
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			PlayerIndex = otherIndex
			Msg2Player(myName.."�õ�һ���������Ͽ��������ǵ�Ե�����ø����ˣ���ĿǰΪֹ���������"..otherNum.."���������Ͽ���")
			AddOwnExp(otherLevel * (10+0.07*otherLevel))
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			if(myNum > 98) then --�ﵽ99��������������
				myNum = 0
				PlayerIndex = nPlayerIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("����������Ͽ��Ѿ�������99��������"..otherName.."��ͬ�����˴˿���������������2��Сʱ�ľ��鷭����")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
				PlayerIndex = otherIndex
				AddSkillState(531,10,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("����������Ͽ��Ѿ�������99��������"..myName.."��ͬ�����˴˿���������������2��Сʱ�ľ��鷭����")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			end
			PlayerIndex = oldPlyIdx
			return 0
		end
		--���������һ��
		if(myNum > otherNum) then --�ұ�������
			myNum = myNum - 1
			if(myNum ~= otherNum) then --��ʧ�ˣ������ȣ�ûԵ�ݰ�
				otherNum = otherNum + 1  --���ǵ�Ե���ٽ�һ�㡣 :)
			end
		else  --�����ҿ���
			myNum = myNum + 1  --��һ��
			if(myNum ~=otherNum) then
				otherNum = otherNum - 1
			end
		end
		PlayerIndex = nPlayerIndex
		Msg2Player("��õ�һ���������Ͽ�����"..otherName.."��Ե�ݸ����ˣ������ڻ�����"..myNum.."���������Ͽ�Ƭ��")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
		PlayerIndex = otherIndex
		Msg2Player(myName.."�õ�һ���������Ͽ��������Ե�ݸ����ˣ������ڻ�����"..otherNum.."���������Ͽ�Ƭ��")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,otherNum)) --��д��Ϣ
		PlayerIndex = oldPlyIdx
		return 0
	end
	--��֤�벻ͬ�����߶���0
	local code = GetValidateCode(nPlayerIndex)
	Msg2Player("��õ�һ���������Ͽ������Һ�"..otherName.."��ʼ����Ե��")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = otherIndex
	Msg2Player(myName.."�õ�һ���������Ͽ������Һ��㿪ʼ����Ե��")
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
