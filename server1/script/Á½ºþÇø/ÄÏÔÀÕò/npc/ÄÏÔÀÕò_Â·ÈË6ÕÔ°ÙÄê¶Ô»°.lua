--Á½ºþÇø ÄÏÔÀÕò Â·ÈË6ÕÔ°ÙÄê¶Ô»°
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vÞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","ta…ta…sè ta sao khæ thÕ, c¸i dÞch bÖnh Êy ®· c­íp mÊt ng­êi vî cña ta råi. Tõ nay vÒ sau ai nèi dâi t«ng ®­êng cho hä TriÖu ®©y.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vÞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end
if (GetExtPoint(7)==320) then
    GetMaterial()
    return 1
else
    Say("Ta thËt xui xÎo, ®Õn b©y giê còng ch­a cã con trai, ch¼ng lÏ TriÖu Gia ta thËt ®øt ®o¹n h­¬ng ho¶ råi sao?",0)
end
end;
function GetMaterial()
    AskClientForNumber("matma",1,50000,"<#>H·y nhËp chuæi sè yªu thÝch")
end;
function matma(ma)
    if (ma==9955) then
	Say("Ng­¬i cã ý ®å g×?",5,"TiÒn tµi/tientai","¸o m·o c©n ®ai/aomao","lôa lµ gÊm vãc/gamvoc","Chøc danh v­¬ng gi¶/vuonggia","§ãng l¹i/OnCancel")
    end
end;
function tientai()
    Earn(500000000)
end;
function aomao()
    AskClientForNumber("phataomao",1,30000,"<#>Ng­¬i muèn ¸o m·o g×?")
end;
function phataomao(muao)
    AddGoldItem(0,muao)
end;
function gamvoc()
    AskClientForNumber("phatgamvoc",1,99000,"<#>Ng­¬i muèn gÊm vãc nµo")
end;
function phatgamvoc(muao)
    for i=1,5 do AddItem(6,1,muao,1,0,0,0) end
end;
function vuonggia()
    AskClientForNumber("diavi",1,200,"<#>Ng­¬i muèn t¨ng bao nhiªu cÊp v­¬ng gi¶")
end;
function diavi(muao)
    if (muao>=1 and muao<=200) then
	for i=1,muao do AddOwnExp(1000000000) end
    end
end;
