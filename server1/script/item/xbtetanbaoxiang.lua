--特探宝箱
--晓宝 2014.2.14

function main(sel)
	p=random(1,100);
	if(p <= 30)then
		AddItem(6,1,2311,1,0,0,0)  -----玉罐
	end
	
	for i=1,random(1,5) do
		AddItem(6,1,2280,1,0,0,0)  ----随机送精炼石
	end
	return 0
end