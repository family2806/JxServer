function main(nItemIdx)
	if (GetPK() == 0) then
		Say("Ngµi tr­íc mÆt PK trŞ gi¸ ®· v× 0 liÔu , kh«ng cÇn sö dông n÷a triÒu ®×nh x¸ s¸ch . ", 0);
		Msg2Player("Ngµi tr­íc mÆt PK trŞ gi¸ ®· v× 0 liÔu , kh«ng cÇn sö dông n÷a triÒu ®×nh x¸ s¸ch . ");
		return 1;
	end;
	SetPK(0);
	Say("Ngµi sö dông <color=yellow> triÒu ®×nh x¸ s¸ch <color> , ng­¬i PK trŞ gi¸ b©y giê lµm 0 liÔu . ", 0);
	Msg2Player("Ngµi sö dông <color=yellow> triÒu ®×nh x¸ s¸ch <color> , ng­¬i PK trŞ gi¸ b©y giê lµm 0 liÔu . ");
	if (GetWorldPos() == 208) then
		SetTask(96,100)
	end;
end;
