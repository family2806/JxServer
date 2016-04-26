--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--唐门秘籍，作用80级以上的唐门弟子使用之后，可以加1点技能点
--包括出师，不包括转门派以前的
--该物品最多只能使用15次
--任务变量80低4位表示使用该物品的次数
function main(sel)
	times = mod(GetTask(80),16)
	party = GetLastAddFaction()
	str={
		"你拿着《唐门秘籍》钻研了半天，结果什么也没有领悟到。",
		"你拿着《唐门秘籍》钻研了半天，结果领悟甚少，没什么效果。",
		"你拿着《唐门秘籍》钻研了半天，结果获得了一些关于武功的心得。",
		"你已经把《唐门秘籍》钻研透彻，从中再也得不到任何心得。"
		}
	if(party ~= "tangmen") then     -- 不是唐门
		Msg2Player(str[1])
		return 1
	elseif (GetLevel()<80) then    -- 是唐门，但等级小于80
		Msg2Player(str[2])
		return 1
	elseif(times > 14) then        -- 使用次数已达到上限
			Msg2Player(str[4])
		return 1
	else
		AddMagicPoint(1)            -- 加技能点1
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end