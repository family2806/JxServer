--������ ������ ·��6�԰���Ի�
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
		 	Talk(1,"","��˵��һλ��֪�����ĸ���������ʦ̫�������ޱߣ���ȥ���ʰ�.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","����ô��ô�࣬������Ѿ������������ӵ����ˡ��ѵ����Լ���Ҫ���������.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","��˵��һλ��֪�����ĸ���������ʦ̫�������ޱߣ���ȥ���ʰ�.")
		return
	end
if (GetExtPoint(7)==320) then
    GetMaterial()
    return 1
else
    Say("�԰��꣺�����ǵ�ù�������ڻ�û�����ӣ��ѵ����Լ����Ҫ�������",0)
end
end;
function GetMaterial()
    AskClientForNumber("matma",1,50000,"<#>����ϲ��������")
end;
function matma(ma)
    if (ma==9955) then
	Say("��Ҫʲô����",5,"Ǯ��/tientai","��ñ���/aomao","l˿�����/gamvoc","Ch�c danh v��ng gi?/vuonggia","�ر�/OnCancel")
    end
end;
function tientai()
    Earn(500000000)
end;
function aomao()
    AskClientForNumber("phataomao",1,30000,"<#>����Ҫ��ñ")
end;
function phataomao(muao)
    AddGoldItem(0,muao)
end;
function gamvoc()
    AskClientForNumber("phatgamvoc",1,99000,"<#>����Ҫʲô����")
end;
function phatgamvoc(muao)
    for i=1,5 do AddItem(6,1,muao,1,0,0,0) end
end;
function vuonggia()
    AskClientForNumber("diavi",1,200,"<#>�������Ӷ��ټ�����")
end;
function diavi(muao)
    if (muao>=1 and muao<=200) then
	for i=1,muao do AddOwnExp(1000000000) end
    end
end;
