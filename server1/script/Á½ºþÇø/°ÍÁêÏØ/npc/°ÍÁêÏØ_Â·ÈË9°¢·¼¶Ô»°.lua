--巴陵县 新人请点击NPC

function main(sel)

if (GetLevel() <= 20) then
Say("现在是测试阶段,你可以很牛B的快速升到190级并找礼官转生",3,"新手礼包/shengji10");
function shengji10()
for i=1,10 do  AddOwnExp(500000000) end
    AddItem(0,13,4479,10,1,1000)
    AddItem(0,14,3889,10,1,1000)
    AddItem(0,12,3475,10,1,1000)
    Msg2Player("恭喜您！获得新手礼包!")
end;	


   
else
Say("你已经190级了,变成超人吧！",6,"获得玄晶令/jwl","获得大福缘露/zml","获得两亿/jb","获得1000点技能/jn","取消/no");
end
end;


function jwl()		
	AddItem(6,1,147,10,0,0) --玄晶
        Msg2Player("恭喜您！获得玄晶")		
        end;	

function zml()		
	AddItem(6,1,124,1,0,0) --大福缘露
        Msg2Player("恭喜您！获得大福缘露")		
        end;
		
function jb()		
	Earn(200000000)           --两亿
        Msg2Player("恭喜您!获得两亿")
        end;
		

function jn()		
	AddMagicPoint(1000)
	Msg2Player(str[3])
	Msg2Player("恭喜您!获得1000点技能")
	return 0
	end

		
function no()					
end



