--ÊÔÁ¶ÃØ±¦£¨Òø£©
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
		num=2
	elseif((p > 30)and(p <= 50))then
		num=1
	elseif((p > 50)and(p <= 60))then
		num=1
	else
		num=1
	end
	
	gift(num);
	
	for i=1,random(1,10) do
		AddItem(6,1,2280,1,0,0,0)  ----Ëæ»úËÍ¾«Á¶Ê¯
	end
	return 0
end

function gift(num)

for i=1,num do
	p=random(1,14);
	if(p == 1)then --ĞşÔ³Áî
		AddItem(6,1,2351,1,0,0,0)
	elseif(p == 2)then --¼ÓÅÜÍè
		AddItem(6,0,2,1,0,0,0)
	elseif(p == 3)then --·ÉËÙÍè
		AddItem(6,0,6,1,0,0,0)
	elseif(p == 4)then --³¤ÃüÍè
		AddItem(6,0,1,1,0,0,0)
	elseif(p == 5)then --ËÄº£åĞÒ£µ¤
		AddItem(6,1,2378,1,0,0,0)
	elseif(p == 6)then --´óÁ¦Íè
		AddItem(6,0,3,1,0,0,0)
	elseif(p == 7)then --¸ßÉÁÍè
		AddItem(6,0,4,1,0,0,0)
	elseif(p == 8)then --¸ßÖĞÍè
		AddItem(6,0,5,1,0,0,0)
	elseif(p == 9)then --ĞşÔ³Áî
		AddItem(6,1,2351,1,0,0,0)
	elseif(p == 10)then --±ù·ÀÍè
		AddItem(6,0,7,1,0,0,0)
	elseif(p == 11)then --À×·ÀÍè
		AddItem(6,0,8,1,0,0,0)
	elseif(p == 12)then --»ğ·ÀÍè
		AddItem(6,0,9,1,0,0,0)
	elseif(p == 13)then --ÎåÖŞÁè¿Õµ¤
		AddItem(6,1,2397,1,0,0,0)
	else --¶¾·ÀÍè
		AddItem(6,0,10,1,0,0,0)
	end
end

end