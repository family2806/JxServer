--幸运种子使用后可以call出一个幸运圣诞树
--renbin


IncludeLib("SETTING"); --载入SETTING脚本指令库
Include("\\script\\global\\forbidmap.lua")

function main()
	
	if ( GetFightState() == 1 ) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("这里的土壤不适合培育种子，还是带它去野外吧！")
			return 1
		end
		local posx = x*32
		local posy = y*32
		bossid = 603
		bosslvl = 1
		i = random (1,5) - 1
		AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."的幸运圣诞树",1)
--		CallNpc(i,603 + i,10,GetName().."的幸运圣诞树",0,1)
		Msg2Player("你种植了一棵幸运圣诞树,赶快摇宝贝吧")
		return 0
	else
		Msg2Player("谢谢你培育我，不过我只能在野外生长哦，快带我去吧！")
		return 1
	end
		
end