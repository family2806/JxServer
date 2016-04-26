--Ë®ÔôµÄ±¦Ïä
--Ïş±¦ 2014.2.14

function main(sel)
	p=random(1,100);
	if(p <= 10)then
		AddItem(6,1,2311,1,0,0,0)  -----Óñ¹Ş
	elseif(p >= 50)then
		Earn(66666+22222*random(0,1))
	else
		Earn(6666+2222*random(0,1))
	end

	p=random(1,100);
	if(p <= 5)then
		num=2
	elseif((p > 5)and(p <= 20))then
		num=2
	elseif((p > 20)and(p <= 30))then
		num=1
	elseif((p > 30)and(p <= 50))then
		num=1
	elseif((p > 50)and(p <= 60))then
		num=1
	else
		num=1
	end
	
	gift(num);
	
	for i=1,random(1,20) do
		AddItem(6,1,2280,1,0,0,0)  ----Ëæ»úËÍ¾«Á¶Ê¯
	end
	return 0
end

function gift(num)

for i=1,num do
	p=random(1,14);
	if(p == 1)then --Óñ¹Ş
		AddItem(6,1,2311,1,0,0,0)
	elseif(p == 2)then --Óñ¹Ş
		AddItem(6,1,2311,1,0,0,0)
	elseif(p == 3)then --Óñ¹Ş
		AddItem(6,1,2311,1,0,0,0)
	elseif(p == 4)then --»ìÔªÁéÂ¶
		AddItem(6,1,2312,1,0,0,0)
	elseif(p == 5)then --ÁéÂ¶
		AddItem(6,1,2312,1,0,0,0)
	elseif(p == 6)then --ÁéÂ¶
		AddItem(6,1,2312,1,0,0,0)
	elseif(p == 7)then --´óÁ¦Íè°ü
		AddItem(6,1,2517,1,0,0,0)
	elseif(p == 8)then --´óÁ¦Íè°ü
		AddItem(6,1,2312,1,0,0,0)
	elseif(p == 9)then --´óÁ¦Íè°ü
		AddItem(6,1,2312,1,0,0,0)
	elseif(p == 10)then --Ñ×µÛÁî
		AddItem(6,1,1617,1,0,0,0)
	elseif(p == 11)then --½ğÎÚ
		AddItem(6,1,2349,1,0,0,0)
	elseif(p == 12)then --¾ÅÌì
		AddItem(6,1,2379,1,0,0)
	elseif(p == 13)then --¾ÅÌì
		AddItem(6,1,2379,1,0,0)
	else --¾ÅÌì
		AddItem(6,1,2379,1,0,0)
	end
end

end