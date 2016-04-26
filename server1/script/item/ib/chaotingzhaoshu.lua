function main(nItemIdx)
	if (GetPK() == 0) then
		Say("您当前PK值已经为0了，不用再使用朝廷赦书了。", 0);
		Msg2Player("您当前PK值已经为0了，不用再使用朝廷赦书了。");
		return 1;
	end;
	SetPK(0);
	Say("您使用了<color=yellow>朝廷赦书<color>，你的PK值现在为0了。", 0);
	Msg2Player("您使用了<color=yellow>朝廷赦书<color>，你的PK值现在为0了。");
	if (GetWorldPos() == 208) then
		SetTask(96,100)
	end;
end;
