-- Ï´PK¼ÆÊ±Æ÷.lua
-- Update: Dan_Deng(2003-11-27)
-- Timer: 9

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	local Uworld96	= GetTask(96)
	local PK_value	= GetPK();
	local nMapId	= GetWorldPos();
	StopTimer();
	
	if (nMapId == 208) then			-- Ö»ÓĞÔÚÀÎ·¿ÖĞ²ÅÔÊĞí¼õPKÖµ
		if (PK_value > 1) then		-- ÉĞÎ´Ï´ÍêPKÖµ
			Msg2Player("Th«ng qua tÜnh t©m hèi c·i , téi cña ng­¬i nghiÖt gi¶m bít . ")
			SetPK(PK_value - 1)
			SetTask(96,100 + (PK_value - 1));
			SetTimer(12 * CTime * FramePerSec, 9)						--ÖØĞÂ¿ªÊ¼¼ÆÊ±£¨12¸öÊ±³½==120·ÖÖÓ£©
		else							-- Ï´ÍêPKÁË
			Msg2Player(" ë kh¾c s©u tØnh l¹i tù th©n téi sau , ng­¬i rèt côc röa s¹ch téi lçi cña m×nh . ")
			SetPK(0)
			SetTask(96,100)
		end
	end
end;
