--中原北区 宋金战场 宋方储物箱
-- lixin 2004-10-13

function main(sel)
if (GetCurCamp() == 1) then    --判断如果属于宋方阵营
	OpenBox();		--弹出储物箱物品框和玩家物品框，以便于玩家进行物品和金钱的存取
else
	Talk(1,"","看你贼眉鼠眼，一定是金国间谍，来人，抓了他!")
end;
end;