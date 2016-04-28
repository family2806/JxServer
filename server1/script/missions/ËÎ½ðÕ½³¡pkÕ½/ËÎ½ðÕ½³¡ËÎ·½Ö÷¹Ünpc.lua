--Ω”»ŒŒÒµƒNpc
--°§≤Œ”ÎµƒÕÊº“µ»º∂±ÿ–Î¥Û”⁄40º∂£ª
--°§ÀŒ∑ΩµƒÕÊº“±ÿ–Î“™µΩ∫‚…Ω∂¿π¬Ω£¥¶±®√˚£ª
--°§Ω∑ΩµƒÕÊº“±ÿ–Î“™µΩ„Íæ©—√√≈ø⁄Ωπ˙Œ‰Ω´¥¶±®√˚£ª
--°§±®√˚ ±–Ë“™Ωªƒ…“ª∂®µƒΩ«Æ£ª

Include("\\script\\missions\\ÀŒΩ’Ω≥°PK’Ω\\ÀŒΩ’Ω≥°Õ∑Œƒº˛.lua");

function main()

local State = GetMissionV(1) 

--Œ¥ø™ º
if (State == 0 ) then 
	Say("Xin h∑y nghÿ ng¨i vµ chÍ th´ng b∏o!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--“Ï≥£«Èøˆ÷±Ω”ÕÀ≥ˆ
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--»Áπ˚∏√ÕÊº“ «“—æ≠±®√˚π˝µƒ£¨∂œœﬂ÷ÿ¡¨Ω¯¿¥µƒ£¨‘Ú»”Ω¯»•
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--¥Àæ‰ª∞ «µ–∑ΩÕÊº“”Î∂‘∑Ωµƒ±®√˚Npcµƒ∂‘ª∞
	Say("Ng≠¨i Æ∑ x©m chi’m n≠Ìc ta, gi’t ch’t ÆÂng bµo ta, ta th“ sœ Æ” ng≠¨i ch’t trong cay Ææng!",0)
end


--±®√˚ ±∆⁄
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("T∏t c∂ chÛng ta Æ“u ph∂i c„ tr∏ch nhi÷m cho d©n tÈc, b©y giÍ lµ lÛc ta phÙc vÙ cho qu™ h≠¨ng!",0)
  		else
    		Say("Ng≠¨i Æ∑ x©m chi’m n≠Ìc ta, gi’t ch’t ÆÂng bµo ta, ta th“ sœ Æ” ng≠¨i ch’t trong cay Ææng!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("Hi÷n tπi qu©n l˘c Æ∑ ÆÒ Æ” ti™u di÷t qu©n Kim, binh s‹ h∑y vui lﬂng chÍ ÆÓt ti’p theo!", 0)
	return
	end;
	
	Say("Hi÷n tπi qu©n l˘c Æ∑ ÆÒ Æ” ti™u di÷t qu©n Kim, binh s‹ h∑y vui lﬂng chÍ ÆÓt ti’p theo!",2, "T´i Æ∑ tham d˘. /Yes", "H∑y Æ” t´i ngh‹!/No");
end;

--Ωª’Ω ±∆⁄
if (State == 2) then 
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
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
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
