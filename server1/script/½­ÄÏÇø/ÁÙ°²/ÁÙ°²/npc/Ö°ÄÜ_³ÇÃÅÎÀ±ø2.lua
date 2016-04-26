-- 临安　职能　城门卫兵B
-- by：Dan_Deng(2003-09-16)

Include("\\script\\global\\map_helper.lua")
npc_name = "<#>城门卫兵"

function default_talk()
	Talk(1,"",npc_name.."<#>: 这京城的安危非同一般，咱们可得精神点儿，倘若出了什么岔子，咱们可担待不起，多少个脑袋也不够砍哪！")
end;
