--Ω”»ŒŒÒµƒNpc
--°§≤Œ”ÎµƒÕÊº“µ»º∂±ÿ–Î¥Û”⁄40º∂£ª
--°§ÀŒ∑ΩµƒÕÊº“±ÿ–Î“™µΩ∫‚…Ω∂¿π¬Ω£¥¶±®√˚£ª
--°§Ω∑ΩµƒÕÊº“±ÿ–Î“™µΩ„Íæ©—√√≈ø⁄Ωπ˙Œ‰Ω´¥¶±®√˚£ª
--°§±®√˚ ±–Ë“™Ωªƒ…“ª∂®µƒΩ«Æ£ª
-- Update by Dan_Deng(2003-10-23) Õ®π˝∂‘ª∞«–ªªµΩ’Ω≥°Õ‚µƒ£¨–Ë“™∏¸∏ƒ’Ω∂∑◊¥Ã¨Œ™1

Include("\\script\\missions\\ÀŒΩ’Ω≥°PK’Ω\\ÀŒΩ’Ω≥°Õ∑Œƒº˛.lua");


function main()


local State = GetMissionV(1) 

--Œ¥ø™ º
if (State == 0 ) then 
	Say("Xin h∑y nghÿ ng¨i vµ chÍ th´ng b∏o!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--“Ï≥£«Èøˆ÷±Ω”ÕÀ≥ˆ
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--»Áπ˚∏√ÕÊº“ «“—æ≠±®√˚π˝µƒ£¨∂œœﬂ÷ÿ¡¨Ω¯¿¥µƒ£¨‘Ú»”Ω¯»•
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--¥Àæ‰ª∞ «µ–∑ΩÕÊº“”Î∂‘∑Ωµƒ±®√˚Npcµƒ∂‘ª∞
	--±»»Á ƒ„√«’‚–©ÀŒπ˙µƒ≤›√Ò!Œ“√«¥ÛΩπ˙Ω´ ø√«∏˜∏˜…∆’Ω÷«”¬,Ã˙∆Ô◊›∫·......µ»£¨”–µ√ «—€…´ø¥
	Say("Kim quËc chÛng t´i, ai cÚng dÚng c∂m vµ quy’t li÷t, lµm th’ nµo ng≠Íi c„ th” x¯ng Æ∏ng lµm ÆËi thÒ?!",0)
end

--±®√˚ ±∆⁄
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--¥Àæ‰ª∞ «±æ∑Ω“—±®√˚µƒÕÊº“”Î±®√˚Npcµƒ∂‘ª∞
    		Say("C„ ch’t cÚng trung thµnh vÌi Kim quËc!",0)
  		else
    		Say("Kim quËc chÛng t´i, ai cÚng dÚng c∂m vµ quy’t li÷t, lµm th’ nµo ng≠Íi c„ th” x¯ng Æ∏ng lµm ÆËi thÒ?!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Hi÷n tπi qu©n l˘c Æ∑ ÆÒ Æ” ti™u di÷t qu©n TËng, binh s‹ h∑y vui lﬂng chÍ ÆÓt ti’p theo!", 0)
	return
	end;
	
	--±»»Á,ƒø«∞ÀŒπ˙π˙¡¶≤ª’Ò£¨ÀŒπ˙∞Ÿ–’…˙¡ÈÕøÃø£¨Œ“√«¥ÛΩπ˙°£°£°£°£
	Say("TËng qu©n sœ thua cuÈc, chÿ lµ v n Æ“ thÍi gian, ng≠Íi c„ muËn cÔng ta h≠Îng vinh quang?!",2, "T´i Æ∑ tham d˘. /Yes", "H∑y Æ” t´i ngh‹!/No");
end;

--Ωª’Ω ±∆⁄
if (State == 2) then 
	--¥ÀŒ™‘⁄’Ω∂∑’˝ Ω¥ÚœÏ÷Æ∫Û£¨∆‰À¸Œ¥±®√˚ÕÊº“”Î±®√˚Npcµƒ∂‘ª∞
	Say("Bπn vui lﬂng t◊m mÈt n¨i Æ” chËn tho∏t",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Chµo mıng bπn tham gia chi’n tr≠Íng!");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("Bπn ch≠a Æπt c p 40 ho∆c kh´ng ÆÒ ti“n",0);
end;

function No()
Say("H∑y suy nghÿ lπi Æi! thÍi gian c„ hπn!",0);
end;

