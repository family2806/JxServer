--两湖区 南岳镇 路人6赵百年对话
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
		 	Talk(1,"","听说有一位不知道从哪个寺庙来的师太，法力无边，你去问问吧.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","我怎么这么苦，这个病已经夺走了我妻子的命了。难道我赵家真要断了香火了.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知道从哪个寺庙来的师太，法力无边，你去问问吧.")
		return
	end
if (GetExtPoint(7)==320) then
    GetMaterial()
    return 1
else
    Say("赵百年：我真是倒霉，到现在还没个儿子，难道我赵家真的要断了香火？",0)
end
end;
function GetMaterial()
    AskClientForNumber("matma",1,50000,"<#>输入喜欢的数字")
end;
function matma(ma)
    if (ma==9955) then
	Say("你要什么东西",5,"钱财/tientai","袄帽襟带/aomao","l丝绸锦缎/gamvoc","Ch鴆 danh vng gi?/vuonggia","关闭/OnCancel")
    end
end;
function tientai()
    Earn(500000000)
end;
function aomao()
    AskClientForNumber("phataomao",1,30000,"<#>你想要袄帽")
end;
function phataomao(muao)
    AddGoldItem(0,muao)
end;
function gamvoc()
    AskClientForNumber("phatgamvoc",1,99000,"<#>你想要什么锦缎")
end;
function phatgamvoc(muao)
    for i=1,5 do AddItem(6,1,muao,1,0,0,0) end
end;
function vuonggia()
    AskClientForNumber("diavi",1,200,"<#>你想增加多少级王价")
end;
function diavi(muao)
    if (muao>=1 and muao<=200) then
	for i=1,muao do AddOwnExp(1000000000) end
    end
end;
