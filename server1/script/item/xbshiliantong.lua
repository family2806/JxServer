--ÊÔÁ¶ÃØ±¦£¨Í­£©
--Ïş±¦ 2014.2.14

function main(sel)
	p=random(1,100);
	if(p <= 5)then
		AddItem(6,1,2311,1,0,0,0)  -----Óñ¹Ş
	elseif(p >= 50)then
		Earn(66666+22222*random(0,1))
	else
		Earn(6666+2222*random(0,1))
	end
	
	for i=1,random(1,5) do
		AddItem(6,1,2280,1,0,0,0)  ----Ëæ»úËÍ¾«Á¶Ê¯
	end
	return 0
end
