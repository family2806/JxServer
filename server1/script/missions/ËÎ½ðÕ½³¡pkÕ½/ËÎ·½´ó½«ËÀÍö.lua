Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then
	if (random(100) > 60) then
	return
	end;
	AddEventItem(195);
	Msg2Player("B¹n nhËn ®­îc Nh¹c V­¬ng KiÕm!");
end;

--Õâ¾äÊÇ¸øËùÓĞ²Î¼Ó´óÕ½µÄÍæ¼Ò·¢µÄĞÅÏ¢
str1 = "<#>KÕt qu¶ phe Tèng: binh sÜ "..GetName().."<#> tiªu diÖt t­íng phe Tèng, phe Kim giµnh chiÕn th¾ng!";

--ÏÂÃæÕâ¾äÊÇ¸ø»ñÊ¤·½·¢µÄĞÅÏ¢£¬»¶Çì¹ÄÎèµÄ»°Óï!
str = "<#>Chóc mõng ["..GetName().."<#>] ®· tiªu diÖt phe Tèng, gióp chóng ta th¾ng tr¹n nµy!";

Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 2);
resultstr = WinBonus(2, 1);
str1 = str1..resultstr;
SetMissionV(2,1);
SetMissionV(MS_STATE,3);
AddGlobalCountNews(str1, 3);
CloseMission(1);
end;

