-- 梦境 路人_药贩.lua  商人NPC

function main()
	Say("行走江湖，需买一些药品做防备!",2,"交易/buy_yes","不交易/no")	
end

function buy_yes()
	Sale(42)
end

function no()
end
