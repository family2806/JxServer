Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");

function InitMission()
    --Msg2Player("Õ½ÊÂ½ô¼±£¬´óÕ½Ò»´¥¼´·¢.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--ÔÊĞí±¨ÃûÁË
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
HideNpc("ÄÏËÎ½«¾ü",1000000);
HideNpc("½ğ¹ú´ó½«",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
local str1 = "<#>ChiÕn tr­êng Tèng Kim ®ang b­íc vµo giai ®o¹n b¸o danh, c¸c nh©n sÜ h·y ®Õn T­¬ng D­¬ng hoÆc Chu TiÕn TrÊn ®Ó ®¨ng kİ tham gia trËn chiÕn, thêi gian cßn l¹i:"..RestMin.."<#>¬hót"..RestSec.."<#>gi©y".."<#>§iÒu kiÖn tham gia: cÊp ®é lín h¬n 40, lÖ phİ ®¨ng kİ 3000 l­îng!";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
HideNpc("ÄÏËÎ½«¾ü",1000000);
HideNpc("½ğ¹ú´ó½«",1000000);
HideNpc("ËÎ¾ü¾üÒ½",1000000);
HideNpc("½ğ¹ú¾üÒ½",1000000);
    idx = 0;
    
    for i = 1 , 500 do
    	idx, pidx = GetNextPlayer(1,idx, 0);
    	
    	if (idx == 0) then
    		break
    	end;
    	
    	if (pidx > 0) then
    		PlayerIndex = pidx;
    		SetFightState(1);
    	end;

    	--´ËÊ±ÎªGM·¢²¼ÃüÁî£¬ÕıÊ½´òÏìÕ½¶·
PutMessage("KÎ thï ®· ho¹t ®éng phİa tr­íc, h·y dòng c¶m tiªu diÖt bän chóng!");
    end;
    
    StartMissionTimer(1,5, TIMER_2);
end;

function EndMission()

    for i = 1, 20 do 
    SetMissionV(i , 0);
    end;

    StopMissionTimer(1,4);
    StopMissionTimer(1,5);
    GameOver();
end;

function OnLeave(RoleIndex)
    PlayerIndex = RoleIndex;
str2 = GetName().." rêi khái chiÕn tr­êng ";
    -- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
