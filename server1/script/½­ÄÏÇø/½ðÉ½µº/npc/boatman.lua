-- 西山屿船夫

function main()
	Say("你想坐船去扬州? 500两!", 2, "好!走!/toyangzhou", "不坐船了/no");
end

function toyangzhou()
	if( GetCash() >= 500 ) then
		NewWorld( 80,1369,3369 );
		DisabledUseTownP(0)	-- 不限制其离开西山屿返回扬州后使用回城符
		SetFightState(1);
		Pay( 500 );
	else
		Talk( 1,"","不交钱不能上船!");
	end
end

function no()
end